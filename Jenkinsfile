pipeline {
  agent { label 'elk' }
  stages {
    stage ('Build Image') {
      steps {
        sh 'sh bin/build-image.sh'
      }
    }
    stage ('Clean docker') {
      steps {
        sh 'sh bin/clean-docker.sh'
      }
    }
    stage('Clean workspace') {
      steps {
        cleanWs()
      }
    }
  }
}
