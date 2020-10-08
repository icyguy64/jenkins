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
  stage('Build docker image'){
    
  
  
  }
  stage('Deploy'){
  
  
  
  }
}
