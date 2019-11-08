pipeline {
  environment {
    registry = "shaker242/minecraft-mv"
    registryCredential = "dockerhub"
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/dglib/minecraft.git'
      }
    }
    stage('Building image') {
      steps{
        script {
             dir("/var/jenkins_home/workspace/minecraft"){
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
          }
        }
      }
    }
    stage('Pushing Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
    stage('Deploy') {
      steps {
        sh "kubectl -n minecraft set image deployment/minecraft-dep minecraft=$registry:$BUILD_NUMBER"
      }
    }
  }
}