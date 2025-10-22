pipeline {
    // This 'agent' block is provided by the Docker Pipeline plugin.
    // It tells Jenkins to run all stages in a 'docker:latest' container.
    agent {
        docker {
            image 'docker:latest'
            // This mounts the host's Docker socket into the container,
            // allowing this container to run "Docker-in-Docker" commands.
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    
    stages {
        stage('Build Docker Image') {
            steps {
                echo 'Building the image...'
                // This 'sh' command now runs inside the 'docker:latest' 
                // container, so the 'docker' command is available.
                sh 'docker build -t my-app:latest .'
            }
        }
        stage('Run Tests') {
            steps {
                echo 'Running tests...'
                sh 'docker run --rm my-app:latest npm test'
            }
        }
    }
}
