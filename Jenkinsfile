pipeline {
    agent any
    // agent { 
    //     node {
    //         label 'jenkins-agent-python'
    //         }
    //   }
    //   triggers {
    //     pollSCM '* * * * *'
    //        }
           
    environment {
            imageName = "myapp"
            dockerImage = ''
           }
    stages {

        stage ('Clone') {
            // when { anyOf { branch 'master'; branch 'test' } }
            steps {
                sh "printenv"
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/AviAyano/Jenkins']])
           }
        }

        stage('Build') {
            steps {
                echo "Building.."
                sh '''
                sudo podman build -t 1.0 .
                sudo podman tag 1.0 localhost:8082/1.0
                sudo podman login -u admin -p bezeq2108 localhost:8082
                sudo podman push localhost:8082/1.0
                '''
            }
        }

        stage('Test') {
            steps {
                echo "Testing.."
                sh '''
                sudo podman run 1.0
                curl http://localhost:3007 || echo "failed-error!"
                cd myapp
                python3 hello.py
                '''
                // dockerImage = docker.build dockerimagename
            }
        }

        stage('Uploading to Nexus') {
            // environment {
            //    registryCredential = 'dockerhub-credentials'
            //    registry = "http://nexus:8081/"
            //     }
            steps {
                echo "Uploading to Nexus ..."
                // nexusArtifactUploader artifacts: [[artifactId: 'myapp', classifier: 'avi', file: 'myapp.zip', type: 'zip']], credentialsId: 'nexus-user', groupId: 'nexus-artifact-uploader', nexusUrl: 'nexus:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'avi-docker-repo', version: '2.14'
                
                // docker.withRegistry( registry, registryCredential ) {
                // dockerImage.push("latest")
                // }
            }
        }

        stage ('Uploading to S3') {
            steps {
                s3Upload consoleLogLevel: 'INFO', dontSetBuildResultOnFailure: false, dontWaitForConcurrentBuildCompletion: false, entries: [[bucket: 'bezeq', excludedFile: '', flatten: false, gzipFiles: false, keepForever: false, managedArtifacts: false, noUploadOnFailure: false, selectedRegion: 'us-east-1', showDirectlyInBrowser: false, sourceFile: '**/*', storageClass: 'STANDARD', uploadFromSlave: false, useServerSideEncryption: false]], pluginFailureResultConstraint: 'FAILURE', profileName: 'cicd-poc-test', userMetadata: [] 
                echo "Push to S3 reposetory"
            }
        }

        stage('Deploy to EKS') {
            steps {
                echo 'Deploy to Elastic Kubernetes Service ...'
               sh '''
                cd myapp
                python3 hello.py --name=avi
                '''
                // kubernetesDeploy(configs: "deployment.yaml", "service.yaml")
            }
        }
    }
}
