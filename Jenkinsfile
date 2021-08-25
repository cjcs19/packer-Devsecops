pipeline {
  agent {
    docker {
      image 'goforgold/build-container:latest'
    }
  }
  stages {
    stage('Build') {
      steps {
        sh 'npm install'
      }
    }
    stage('Create Packer AMI') {
        steps {
            withAWS(credentials: 'aws-service-devsecops'){
                sh 'packer build -var aws_access_key=${AWS_KEY} -var aws_secret_key=${AWS_SECRET} packer/ec2simple.json'
                sh 'AMILAST=`cat ./manifest.json | jq -r '.builds[-1].artifact_id' |  cut -d':' -f2`'
            }
      }
    }
    stage ('DEPLOY New AMI') {
        steps {
            sh 'echo $AMILAST'
        }
    }
  }
}