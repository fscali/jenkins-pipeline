pipeline {
    agent any

    environment {
        APP_NAME = "demo-jenkins"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'Stage Build'
                sh './script.sh'
            }
        }

        stage('Test') {
            steps {
                echo 'Qui andranno i test'
            }
        }

        stage('Package') {
            steps {
                sh '''
                  echo "Package ${APP_NAME}" > package.txt
                  '''

            }
        }

        stage('Archive artifacts') {
            steps {
                echo 'Archiving build artifacts...'
                archiveArtifacts artifacts: 'package.txt', fingerprint: true
            }
        }


    }

    post {
        success {
            echo 'Pipeline completata con successo'
        }
        failure {
            echo 'Pipeline fallita'
        }
        always {
            echo 'Fine pipeline'
        }
    }
}
