  pipeline {
    agent none
    stages {
      stage('Build'){
        parallel {
          stage("Build for AMD64 platform") {
              agent {
                 kubernetes {
                   yaml 'Jenkins-dind-ds-pod-amd64.yaml'
                 }
              }
              steps {
                container('docker') {
                  sh 'ls'
                }
              }
            }
            
          stage("Build for ARM64 platform") {
              agent {
                 kubernetes {
                   yaml 'Jenkins-dind-ds-pod-arm64.yaml'
                 }
              }
              steps {
                container('docker') {
                  sh 'ls'
                }
              }
            }
        }
      }
    }
}
