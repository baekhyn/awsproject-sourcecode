REGION = 'ap-northeast-2'
ECR_REGISTRY_URL = '133713477530.dkr.ecr.ap-northeast-2.amazonaws.com'
AWS_CREDENTIAL_ID = 'aws-credential'
ECR_IMAGE = 'aws-tomcat'

node{

    stage('Clone Git Repository'){
        checkout scm
    }

    stage('Docker Build'){
            sh"""
            sudo docker build -t ${ECR_IMAGE}:${BUILD_NUMBER} .
            """
    }

    stage('Push Image to ECR'){
            sh"""
            aws ecr get-login-password --region ${REGION} | sudo docker login --username AWS --password-stdin ${ECR_REGISTRY_URL}
            sudo docker tag ${ECR_IMAGE}:${BUILD_NUMBER} ${ECR_REGISTRY_URL}/${ECR_IMAGE}:${BUILD_NUMBER}
            sudo docker push ${ECR_REGISTRY_URL}/${ECR_IMAGE}:${BUILD_NUMBER}
            """
    }
}
