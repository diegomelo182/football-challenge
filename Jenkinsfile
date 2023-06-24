pipeline {
  agent any

  stages {
    stage("verifing tooling") {
      steps {
        sh 'docker version'
        sh 'docker compose version'
        sh 'curl --version'
      }
    }
  }
}
