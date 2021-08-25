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
        sh 'apt-get update'
        sh 'apt-get install jq'
      }
    }
    stage('Create Packer AMI') {
        steps {
            withAWS(credentials: 'aws-service-devsecops'){
                //sh 'rm -rf ./manifest.json'
                //sh 'packer build -var aws_access_key=${AWS_KEY} -var aws_secret_key=${AWS_SECRET} packer/ec2simple.json'
                sh 'ls -lrt'

            }
      }
    }
    stage ('DEPLOY New AMI') {
        steps {
            sh 'jq --version'
            sh script: """\
                foo='bar' \
                echo $foo \
                AMIID=$(jq -r ".builds[0].artifact_id" ./manifest.json| cut -d ":" -f2) \
                echo $AMIID \
            """, returnStdout: true

            /*sh 'AMIID=$(jq -r ".builds[0].artifact_id" ./manifest.json| cut -d ":" -f2) && export VARAMI=$AMIID'
            withCredentials(credentials: 'aws-service-devsecops') {
                sh 'https://github.com/cjcs19/terrafordevsecops.git'
                sh 'cd terrafordevsecops '
            */
        }
    }
  }
}