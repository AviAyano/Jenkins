pipeline {
    agent any 
    // { docker { image 'mattermost/podman:1.8.0' } }

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
                echo "Building with agent ..."
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
                env
                node --version
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
