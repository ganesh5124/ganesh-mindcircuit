pipeline {
    agent any
    
    tools {
      jdk 'JAVA8'
    }
    stages {
        stage('CLONE SCM') {
            steps {
                echo 'CLONING FROM GIT REPO'
                git 'https://github.com/ganesh5124/java-jsp-diary.git'
            }
        }
        stage('EXCUTE SHELL') {
            steps {
                echo 'CLONING FROM GIT REPO'
                sh 'mvn clean install'
            }
        }
        stage('DEPLOY TO TOMCAT') {
            steps {
                echo 'DEPLOY TO TOMCAT'
                deploy adapters: [tomcat9(credentialsId: 'tomcat-id', path: '', url: 'http://13.201.74.48:8091')], contextPath: 'JAVA-APP', war: '**/*.war'
            }
        }
    }
}
