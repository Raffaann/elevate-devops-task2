# elevate-devops-task2
Task 2 for Elevate Labs DevOps Internship
Simple Jenkins CI/CD Pipeline Project
This project demonstrates a basic Continuous Integration and Continuous Deployment (CI/CD) pipeline using Jenkins and Docker. The pipeline automates the process of building, testing, and deploying a simple Python Flask web application.

Prerequisites
Before you begin, ensure you have the following installed and configured on your machine:

Docker: To build and run the containerized application. Install Docker

Jenkins: The automation server that will run our pipeline. Install Jenkins

Git: For version control.

Important: Make sure the Jenkins user has permission to run Docker commands. You can do this by adding the jenkins user to the docker group:

sudo usermod -aG docker jenkins

After running this command, you will need to restart Jenkins for the changes to take effect.

Project Files
app.py: A minimal "Hello, World" web application using the Flask framework.

Dockerfile: Instructions to build a Docker image for the Flask application.

Jenkinsfile: A pipeline script that defines the CI/CD stages (Build, Test, Deploy).

README.md: This setup guide.

How to Set Up and Run the Pipeline
Step 1: Push Project to a Git Repository
Create a new repository on a service like GitHub, GitLab, or Bitbucket.

Initialize a Git repository in your local project folder, commit the files, and push them to the remote repository.

git init
git add .
git commit -m "Initial commit with app, Dockerfile, and Jenkinsfile"
git remote add origin <your-repository-url>
git push -u origin master

Step 2: Create a New Jenkins Pipeline Job
Open your Jenkins dashboard in a web browser (usually http://localhost:8080).

Click on "New Item" on the left-hand side.

Enter an item name (e.g., simple-python-app-pipeline) and select "Pipeline". Click "OK".

On the configuration page, scroll down to the "Pipeline" section.

Change the "Definition" to "Pipeline script from SCM".

SCM: Select "Git".

Repository URL: Enter the URL of your Git repository.

Credentials: Add credentials if your repository is private. For a public GitHub repo, you can leave this as -none-.

Branch Specifier: Leave it as */master or */main depending on your branch name.

Script Path: This should be Jenkinsfile (which is the default).

Click "Save".

Step 3: Trigger the Pipeline
With the Jenkins job created, click on "Build Now" on the left panel of the job's page.

Jenkins will now clone your repository and execute the stages defined in your Jenkinsfile.

You can watch the progress in the "Build History" section. Click on the build number and then "Console Output" to see detailed logs.

Step 4: Verify the Deployment
Once the pipeline completes successfully, the "Deploy" stage will run a Docker container with your application.

Open your web browser and navigate to http://localhost:8081.

You should see the message: Hello, World! This is a simple Python app deployed via Jenkins CI/CD.

Step 5: Test the CI/CD Trigger (Optional)
To see the "Continuous" part in action, you can configure Jenkins to automatically start a build when you push a change to your repository.

In your Jenkins job configuration, under the "Build Triggers" section, select "GitHub hook trigger for GITScm polling" or a similar option for your Git provider.

In your GitHub repository settings, go to "Webhooks" and add a new webhook pointing to your Jenkins server URL (e.g., http://<your-jenkins-ip>:8080/github-webhook/).

Now, make a change to the app.py file, commit it, and push it to your repository. Jenkins will automatically detect the change and run the pipeline again.

You have now successfully created a basic CI/CD pipeline!
