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
                  sh 'aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin 899578970796.dkr.ecr.ap-southeast-1.amazonaws.com'
                  sh 'docker build -t java-demo .'
                  sh 'docker tag java-demo:latest 899578970796.dkr.ecr.ap-southeast-1.amazonaws.com/java-demo:amd64'
                  sh 'docker push 899578970796.dkr.ecr.ap-southeast-1.amazonaws.com/java-demo:amd64'
                }
              }
            }
           stage("Build for ARM64 platform") {
              agent {
                 kubernetes {
                   yamlFile 'Jenkins-dind-ds-pod-arm64.yaml'
                 }
              }
              steps {
                container('docker') {
                  sh 'aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin 899578970796.dkr.ecr.ap-southeast-1.amazonaws.com'
                  sh 'docker build -t java-demo .'
                  sh 'docker tag java-demo:latest 899578970796.dkr.ecr.ap-southeast-1.amazonaws.com/java-demo:arm64'
                  sh 'docker push 899578970796.dkr.ecr.ap-southeast-1.amazonaws.com/java-demo:arm64'
                }
              }
          }
        }
      }
      stage('Manifest'){
        steps {
         sh 'docker manifest create 899578970796.dkr.ecr.ap-southeast-1.amazonaws.com/java-demo:latest --amend 899578970796.dkr.ecr.ap-southeast-1.amazonaws.com/java-demo:amd64 899578970796.dkr.ecr.ap-southeast-1.amazonaws.com/java-demo:arm64'
         sh 'docker manifest push 899578970796.dkr.ecr.ap-southeast-1.amazonaws.com/java-demo:latest'
         sh 'docker manifest inspect 899578970796.dkr.ecr.ap-southeast-1.amazonaws.com/java-demo:latest'
        }
      }
    }
}
