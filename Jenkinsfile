pipeline {
    agent any

    options {
        // Option 1: Enables retrying the entire pipeline once if it fails (good for transient errors)
        // retry(1) 
    }

    stages {
        
        stage('Clone Repository') {
            steps {
                // FIX 1: Places cleanWs() here to fix the "corrupted .git repository" error.
                cleanWs() 
                
                // FIX 2: Uses your correct GitHub URL and 'main' branch
                git url: 'https://github.com/konudulajasmitha/week-2.git', branch: 'main'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                // Builds the registration image from the Dockerfile in the workspace
                bat 'docker build -t registration:v1 .'
            }
        }
        
        stage('Run Docker Container') {
            steps {
                // Stops and removes the container to prevent the "port is already allocated" error
                bat 'docker rm -f registration-container || exit 0' 
                
                // Runs the container and maps the internal app port (5000) to the host port (5000)
                bat 'docker run -d -p 5000:5000 --name registration-container registration:v1'
                
                // Note: If you want to use the 'week-2' tag, replace 'registration:v1' 
                // in the two lines above with 'week-2'.
            }
        }
    }
}
