pipeline {
    agent any
    stages {

        stage ('Clone') {
            when { anyOf { expression { env.BRANCH_NAME == 'master' || env.BRANCH_NAME == 'test' } } }
            steps {
                sh "printenv"
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/AviAyano/Jenkins']])
           }
        }

        stage('Build') {
            steps {
                echo "Building.."
                sh '''
                sudo docker build -t 1.0 .
                sudo docker tag 1.0 localhost:8082/1.0
                '''
            }
        }

        stage('Test') {
            steps {
                echo "Testing.."
                sh '''
                sudo docker run 1.0
                curl http://localhost:80 || echo "Failed."
                '''
            }
        }

        stage('Uploading to Nexus') {
            steps {
                echo "Uploading to Nexus ..."
                sh """
                    sudo docker login -u admin -p bezeq2108 localhost:8082
                    sudo docker push localhost:8082/1.0
                """
            }
        }

        stage ('Uploading to S3') {
            steps {
                s3Upload consoleLogLevel: 'INFO', dontSetBuildResultOnFailure: false, dontWaitForConcurrentBuildCompletion: false, entries: [[bucket: 'bezeq', excludedFile: '', flatten: false, gzipFiles: false, keepForever: false, managedArtifacts: false, noUploadOnFailure: false, selectedRegion: 'us-east-1', showDirectlyInBrowser: false, sourceFile: '**/*', storageClass: 'STANDARD', uploadFromSlave: false, useServerSideEncryption: false]], pluginFailureResultConstraint: 'FAILURE', profileName: 'cicd-poc-test', userMetadata: [] 
                echo "Push to S3 reposetory"
            }
        }

        stage('Deploy to Minikube') {
            steps {
                echo 'Deploy to Minikube ...'
               sh '''
                kubectl apply --file-name deployment.yaml
                '''
            }
        }
    }
}
