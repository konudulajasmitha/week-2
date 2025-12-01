pipeline {
    agent any

    // The 'options' block is now removed or left empty if not needed
    
    stages {
        
        stage('Clone Repository') {
            steps {
                // FIX: cleanWs() is used as the very first step in the stage
                cleanWs() 
                
                // Now proceed with the checkout
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
                bat 'docker rm -f registration-container || exit 0' 
                bat 'docker run -d -p 5000:5000 --name registration-container registration:v1'
            }
        }
    }
}
