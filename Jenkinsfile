pipeline {
  agent any
  stages {
    stage ('Build Image') {
      steps {
        sh 'sh bin/build-image.sh'
      }
    }
    stage ('Stop previous containers') {
      steps {
        sh 'sh bin/stop-previous-containers.sh'
      }
    }
    stage ('Run container') {
      steps {
        sh 'sh bin/run-container.sh'
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
