node {
  stage('Prep') {
    git 'https://github.com/OpenKMIP/PyKMIP.git'
    
  }
  stage('SonarQube analysis') {
    def scannerHome = tool 'SonarQ';
    withSonarQubeEnv('SonarQ') {
      sh "${scannerHome}/bin/sonar-scanner -Dsonar.sources=. -Dsonar.projectKey=test"
    }
  }
  stage('Initialize'){
    def dockerHome = tool 'docker'
    env.PATH = "${dockerHome}/bin:${env.PATH}"
  }
  stage('secrets'){
    sh "printf "This is a secret" | docker secret create MASTER_KEY -"
    sh "printf "This is a secret" | docker secret create HOST_KEY -"
  }
  stage('jenkins and docker file') {
    sh "echo ${USER}"
    sh "wget -O https://raw.githubusercontent.com/icyguy64/jenkins/main/Dockerfile"
  }
  stage('Build docker image'){
    sh "DOCKER_BUILDKIT=1 docker build --tag pykmip:1.0 ."  

  }
  stage('run docker image'){
    sh "docker run -p 80:8000 -p 443:4043 --detach --name pypp pykmip:1.0 -v ~/tmp:~/mnt"
    sh "docker service create --name="master" --secret="MASTER_KEY" pykmip:1.0"
    sh "docker service create --name="host" --secret="HOST_KEY" pykmip:1.0"
    

  }
}
