node {
  stage('Prep') {
    git 'https://github.com/OpenKMIP/PyKMIP'
  }
  stage('SonarQube analysis') {

    def scannerHome = tool 'SonarQ';
    withSonarQubeEnv('SonarQ') { // If you have configured more than one global server connection, you can specify its name
        sh "${scannerHome}/bin/sonar-scanner -Dsonar.sources=. -Dsonar.projectKey=test_pipeline"
    }
  }
  stage('Initialize'){
        def dockerHome = tool 'docker'
        env.PATH = "${dockerHome}/bin:${env.PATH}"
    }

  stage('Build docker image'){
    git 'https://github.com/icyguy64/jenkins'
    def testImage = docker.build("test-image", "Dockerfile") 

  }
  stage('Deploy'){
  
  
  
  }
}
