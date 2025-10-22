pipeline {
    agent any // Run on any available Jenkins agent

    stages {
        // Stage 1: Build the Docker image [cite: 13]
        stage('Build') {
            steps {
                echo 'Building the Docker image...'
                sh 'docker build -t task2-app .'
            }
        }

        // Stage 2: A simple test [cite: 13]
        stage('Test') {
            steps {
                echo 'Testing the image...'
                // This test just checks if the html file exists inside the image
                sh 'docker run --rm task2-app ls /usr/share/nginx/html/index.html'
            }
        }

        // Stage 3: Deploy the application [cite: 13]
        stage('Deploy') {
            steps {
                echo 'Deploying the application...'
                // Remove any old container named 'task2-web-app'
                sh 'docker stop task2-web-app || true'
                sh 'docker rm task2-web-app || true'

                // Run the new image as a detached container
                sh 'docker run -d -p 8081:80 --name task2-web-app task2-app'
                echo 'Application deployed! Access it at http://localhost:8081'
            }
        }
    }
}
