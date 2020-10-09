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
        sh "docker build --tag pykmip:1.0 ."
  }
  stage('Deploy'){
        sh "docker run --publish 8000:8080 --detach --name pypp pykmip:1.0"
  
  
  }
}
