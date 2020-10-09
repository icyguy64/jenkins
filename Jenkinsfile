node {
  stage('Prep') {
    git 'https://github.com/OpenKMIP/PyKMIP.git'
    
  }
  stage('Initialize'){
    def dockerHome = tool 'docker'
    env.PATH = "${dockerHome}/bin:${env.PATH}"
  }
  stage('jenkins and docker file') {
    sh "echo ${USER}"
    sh "wget https://github.com/icyguy64/jenkins/blob/main/Dockerfile >> Dockerfile"
  }
  stage('Build docker image'){
    sh "docker build --tag pykmip:1.0 ."  
  }
  stage('run docker image'){
    sh "docker run --publish 8000:8080 --detach --name pypp my-image:${env.BUILD_ID}"
  }
}
