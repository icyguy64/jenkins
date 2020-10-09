node {
  stage('Prep') {
    git 'https://github.com/OpenKMIP/PyKMIP.git'
    
  }
  stage('Initialize'){
    def dockerHome = tool 'docker'
    env.PATH = "${dockerHome}/bin:${env.PATH}"
  }
  stage('jenkins and docker file') {
    sh "pwd"
    sh "wget https://github.com/icyguy64/jenkins/blob/main/Dockerfile"
  }
  stage('Build docker image'){
    def dockerfile = 'Dockerfile'
    def customImage = docker.build("my-image:${env.BUILD_ID}", "-f ${dockerfile} .") 
  }
  stage('run docker image'){
    sh "docker run --publish 8000:8080 --detach --name pypp my-image:${env.BUILD_ID}"
  }
}
