pipeline {
    // This is the main change.
    // We are now running the pipeline inside a container
    // that is built from the 'docker:latest' image.
    agent {
        docker {
            image 'docker:latest'
            // This is CRITICAL. It maps the host's Docker socket (the engine)
            // into this new agent container, allowing it to run Docker commands.
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

    stages {
        // Stage 1: Build the Docker image
        stage('Build') {
            steps {
                echo 'Building the Docker image...'
                // This 'sh' command now runs inside the 'docker:latest'
                // container and will succeed.
                sh 'docker build -t task2-app .'
            }
        }

        // Stage 2: A simple test
        stage('Test') {
            steps {
                echo 'Testing the image...'
                sh 'docker run --rm task2-app ls /usr/share/nginx/html/index.html'
            }
        }

        // Stage 3: Deploy the application
        stage('Deploy') {
            steps {
                echo 'Deploying the application...'
                // These commands will also work now.
                sh 'docker stop task2-web-app || true'
                sh 'docker rm task2-web-app || true'
                sh 'docker run -d -p 8081:80 --name task2-web-app task2-app'
                echo 'Application deployed! Access it at http://localhost:8081'
            }
        }
    }
}
