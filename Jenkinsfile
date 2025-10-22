pipeline {
    agent any // Run this pipeline on any available Jenkins agent

    environment {
        // Define a variable for the Docker image name and tag
        DOCKER_IMAGE_NAME = "my-simple-app"
        DOCKER_IMAGE_TAG = "latest"
    }

    stages {
        stage('Checkout') {
            steps {
                // This step is usually handled automatically by Jenkins when
                // you configure the pipeline to use a version control system like Git.
                // For clarity, we're showing what happens.
                echo 'Checking out source code from Version Control...'
                // git 'https://your-repo-url.git'
            }
        }

        stage('Build') {
            steps {
                script {
                    echo "Building the Docker image..."
                    // Build the Docker image using the Dockerfile in the current directory
                    // Use 'bat' for Windows agents
                    bat "docker build -t ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} ."
                }
            }
        }

        stage('Test') {
            steps {
                echo "Running tests..."
                // For this simple example, our "test" is just to ensure the container runs.
                // In a real-world scenario, you would run unit tests or integration tests here.
                script {
                    // Use 'bat' for Windows agents
                    bat "echo 'Tests would run here. For now, we are just verifying the build.'"
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    echo "Deploying the application..."
                    // Stop and remove any existing container with the same name to avoid conflicts
                    // Use 'bat' for Windows agents
                    bat "docker stop ${DOCKER_IMAGE_NAME} || exit 0"
                    bat "docker rm ${DOCKER_IMAGE_NAME} || exit 0"

                    // Run the newly built Docker container
                    // It will be detached (-d) and port 5000 of the container will be mapped to port 8081 on the host
                    bat "docker run -d --name ${DOCKER_IMAGE_NAME} -p 8081:5000 ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}"
                    echo "Application deployed successfully and is accessible at http://localhost:8081"
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished.'
            // Clean up old docker images to save space
            // This is good practice in a real environment
            // bat 'docker image prune -f'
        }
    }
}
