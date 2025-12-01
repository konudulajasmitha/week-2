pipeline {
    agent any

    options {
        // FIX: Add cleanWs() to ensure a clean workspace for every run
        cleanWs() 
    }

    stages {
        
        stage('Clone Repository') {
            steps {
                // FIX: Corrected the Git URL to your repository
                git url: 'https://github.com/konudulajasmitha/week-2.git', branch: 'main'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                bat 'docker build -t registration:v1 .'
            }
        }
        
        stage('Run Docker Container') {
            steps {
                // Stop/remove existing container to avoid port conflicts and ensure clean run
                bat 'docker rm -f registration-container || exit 0' 
                
                // Runs container and maps internal port 5000 to external host port 5000
                bat 'docker run -d -p 5000:5000 --name registration-container registration:v1'
            }
        }
    }
}
