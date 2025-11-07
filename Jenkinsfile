pipeline {
    agent none
    
    stages {
        stage('Maven Install') {
            agent {
                docker {
                    image 'maven:3.9-eclipse-temurin-21'
                    reuseNode true
                }
            }
            steps {
                sh 'mvn clean install'
            }
        }
        
        stage('Docker Build') {
            agent any
            steps {
                sh 'docker build -t joshhd01/spring-petclinic:latest .'
            }
        }
        
        stage('Docker Push') {
            agent any
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHub', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                    sh 'docker push joshhd01/spring-petclinic:latest'
                }
            }
        }
    }
}
