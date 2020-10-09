node {
  stage('Prep') {
    git 'https://github.com/OpenKMIP/PyKMIP.git'
    
  }
  stage('SonarQube analysis') {
    def scannerHome = tool 'SonarQ';
    withSonarQubeEnv('SonarQ') {
      sh "${scannerHome}/bin/sonar-scanner -Dsonar.sources=. -Dsonar.projectKey=test_pipeline"
    }
  }
  stage('Initialize'){
    def dockerHome = tool 'docker'
    env.PATH = "${dockerHome}/bin:${env.PATH}"
  }
  stage('jenkins and docker file') {
    sh "echo ${USER}"
    sh "wget -O https://raw.githubusercontent.com/icyguy64/jenkins/main/Dockerfile"
  }
  stage('Build docker image'){
    sh "docker build --tag pykmip:1.0 ."  
  }
  stage('run docker image'){
    sh "docker run --publish 8000:8080 --detach --name pypp pykmip:1.0"
  }
}
