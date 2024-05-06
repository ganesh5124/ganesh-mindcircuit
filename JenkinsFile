pipeline {
    agent any
    
    tools {
      jdk 'JAVA8'
    }
    stages {
        stage('CLONE SCM') {
            steps {
                echo 'CLONING FROM GIT REPO'
                git branch: 'main', url: 'https://github.com/ganesh5124/ganesh-mindcircuit.git'
            }
        }
        stage('EXCUTE SHELL') {
            steps {
                echo 'EXECUTING SHELL COMMAND'
                sh 'mvn clean install'
            }
        }
        stage('EXCUTE SHELL FOR SONAR') {
            steps {
                echo 'EXECUTING SHELL COMMAND FOR SONAR'
                sh '''mvn sonar:sonar \\
                  -Dsonar.host.url=http://35.154.206.249:9000 \\
                  -Dsonar.login=9ae5023958a9a2eda6d0387949344df8da191944'''
            }
        }
        stage('EXCUTE SHELL FOR ARTIFACTORY') {
            steps {
                echo 'EXECUTING SHELL COMMAND FOR ARTIFACTORY'
                sh 'mvn clean deploy'
            }
        }
        
        stage('DEPLOY TO TOMCAT') {
            steps {
                echo 'DEPLOY TO TOMCAT'
                deploy adapters: [tomcat9(credentialsId: 'tomcat-id', path: '', url: 'http://3.110.92.81:8091')], contextPath: 'NEW-mc', war: '**/*.war'
            }
        }
    }
}
