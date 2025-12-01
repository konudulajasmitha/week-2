pipeline {
agent any

stages {
stage('Clone Repository') {
steps {
git url: 'https://github.com/sriludone/Week-2.git', branch: 'main'
}
}

stage('Build Docker Image') {
steps {
bat 'docker build -t registration:v1 .'
}
}
stage('Push to Docker Hub') {
    steps {
        // --- 1. LOGIN TO DOCKER HUB ---
        // This assumes you have created a Jenkins credential named 'docker-hub-credentials'
        withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
            bat 'docker login -u %DOCKER_USERNAME% -p %DOCKER_PASSWORD%'
        }
        
        // --- 2. TAG THE IMAGE ---
        // You can run the tag command now
        bat 'docker tag registration:v1 jasmitahkonudula/registration:v1'
        
        // --- 3. PUSH THE IMAGE ---
        // The push command
        bat 'docker push jasmitahkonudula/registration:v1'
        
        // --- (Optional) LOGOUT ---
        bat 'docker logout'
    }
}
stage('Run Docker Container') {
steps {
bat 'docker rm -f registration-container || exit 0'
bat 'docker run -d -p 5000:5000 --name registration-container
registration:v1'
}
}
}
}
