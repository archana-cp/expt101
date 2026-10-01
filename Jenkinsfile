pipeline{
    agent any
    environment{
        DOCKER_IMAGE="archanapatil2903/app-image"
    }
    stages{
        stage('Clone Repository'){
            steps{
                git 'https://github.com/archanapatil2903//https://github.com/archana-cp/expt101.git'
            }
        }
        stage('Build Docker Image'){
            steps{
                script{
                    docker.build("${DOCKER_IMAGE}:latest")
                }
            }
        }
        stage('Login to Docker Hub'){
            steps{
                withCredential([usernamePassword(
                     crendentialsId:'dockerhub-creds'
                usernameVariable:'DOCKER_USER'
                passwordVariable:'DOCKER_PASS'

                )]){
                    bat 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }

            }
        }
        stage('Push Docker Image'){
            step{
                script{
                    docker.withRegistry('','dockerhub-creds'){
                        docker.image("${Docker_Image}:latest").push()
                    }
                }
            }
        }
    }
    post{
        success{
            echo 'image successfully built and pushed to docker hub'
        }
        failure{
            echo 'Pipeline failed'
        }
    }
}
