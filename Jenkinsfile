  pipeline {
    agent none
    stages {
      stage('Build'){
        parallel {
          stage("Build for AMD64 platform") {
              agent {
                 kubernetes {
                   yamlFile 'Jenkins-dind-ds-pod-amd64.yaml'
                 }
              }
              steps {
                container('awscli') {
                  sh 'aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin 899578970796.dkr.ecr.ap-southeast-1.amazonaws.com'
                  sh 'docker images'
                }
              }
            }
        }
      }
    }
}
