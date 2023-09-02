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
                container('docker') {
                  sh 'sleep 300'
                }
              }
            }
        }
      }
    }
}
