pipeline {
  agent any
  environment {
    AWS_DEFAULT_OUTPUT='json'
    AWS_DEFAULT_REGION='eu-west-1'
    AWS_ACCESS_KEY_ID=credentials('aws_access_key_id')
    AWS_SECRET_ACCESS_KEY=credentials('aws_secret_access_key')
    COUCHBASE_USER='Administrator'
    COUCHBASE_PASSWORD=credentials('COUCHBASE_PASSWORD')
    PORT='3000'
    ASSISTANT_PASSWORD=credentials('ASSISTANT_PASSWORD')
    DIALOGFLOW_LANGUAGE='en-US'
    INTENT_RECOGNITION_SERVICE='dialogflow'
    SERVER_PORT='3000'
  }
  stages {
    stage ('Download curator repo') {
      steps {
        checkout([$class: 'GitSCM', 
	          branches: [[name: '*/master']], 
		  doGenerateSubmoduleConfigurations: false, 
		  extensions: [], 
		  submoduleCfg: [], 
		  userRemoteConfigs: [[credentialsId: 'github', url: 'git@github.com:elastic/curator.git']]])
      }
    }
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
