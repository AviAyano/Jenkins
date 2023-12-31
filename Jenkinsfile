pipeline {
    agent  
    { docker { 
        label 'docker'
        image 'liatrio/jenkins-alpine'
        } 
    }

    stages {

        stage ('Clone') {
            when { anyOf { expression { env.BRANCH_NAME == 'origin/master' || env.BRANCH_NAME == 'origin/test' } } }
            steps {
                sh "printenv"
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/AviAyano/Jenkins']])
           }
        }

        stage('Build') {
            steps {
                echo "Building with agent ..."
                sh "printenv"
                // sh '''
                // sudo podman build -t 1.0 .
                // sudo podman tag 1.0 localhost:8082/1.0
                // '''
                
            }
        }

        stage('Test') {
            steps {
                echo "Testing... "
                sh '''
                printenv
                node --version
                docker --version
                podman --version
                git --version
                curl --version
                '''
                // curl http://localhost:3007 || echo "Failed to open the 3007 port."
                
                // sh '''
                // podman run 1.0 
                // curl http://localhost:3007 || echo "Failed."
                // '''
            }
        }

        stage('Uploading to Nexus') {
            steps {
                echo "Uploading to Nexus ..."
                sh "printenv"
                // sh """
                //     podman login -u admin -p bezeq2108 localhost:8082
                //     podman push localhost:8082/1.0
                // """
            }
        }

        stage ('Uploading to S3') {
            steps {
                // s3Upload consoleLogLevel: 'INFO', dontSetBuildResultOnFailure: false, dontWaitForConcurrentBuildCompletion: false, entries: [[bucket: 'bezeq', excludedFile: '', flatten: false, gzipFiles: false, keepForever: false, managedArtifacts: false, noUploadOnFailure: false, selectedRegion: 'us-east-1', showDirectlyInBrowser: false, sourceFile: '**/*', storageClass: 'STANDARD', uploadFromSlave: false, useServerSideEncryption: false]], pluginFailureResultConstraint: 'FAILURE', profileName: 'cicd-poc-test', userMetadata: [] 
                echo "Push to S3 reposetory"
            }
        }

        stage('Deploy to Minikube') {
            steps {
                echo 'Deploy to Minikube ...'
            //    sh '''
            //     kubectl apply --file-name deployment.yaml
            //     '''
            }
        }
    }
}
