pipeline{
    agent any
    environment {
        REGION = 'ap-northeast-2'
        ECR_REGISTRY_URL = '.dkr.ecr.ap-northeast-2.amazonaws.com'
        AWS_CREDENTIAL_ID = 'aws-credential'
        ECR_IMAGE='aws-tomcat'
    }

    stages('Clone Git Repository'){
        steps{
            script{
                checkout scm
            }
        }
    }
    stage('Build Image'){
        steps{
            docker.withRegistry("https://${env.USER_NUM}${ECR_REGISTRY_URL}", "ecr:${REGION}:${AWS_CREDENTIAL_ID}"){
                app = docker.build("${ECR_REGISTRY_URL}/${ECR_IMAGE}")
            }
        }
    }

    stage('Push Image to ECR'){
        steps{
            script{
                docker.withRegistry("https://${env.USER_NUM}${ECR_REGISTRY_URL}", "ecr:${REGION}:${AWS_CREDENTIAL_ID}"){
                    app.push("v0.${BUILD_NUMBER}")
                }
            }
        }
    }
}