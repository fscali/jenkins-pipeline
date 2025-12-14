pipeline {
    agent any

    parameters {
        string(name: 'TARGET_ENV', defaultValue: 'dev', description: 'Ambiente di deploy')
        booleanParam(name: 'RUN_TESTS', defaultValue: true, description: 'Eseguire i test?')
        choice(name: 'LOG_LEVEL', choices: ['INFO', 'DEBUG', 'WARN'], description: 'Livello di log')
    }

    environment {
        APP_NAME = 'demo-jenkins'
    }

    stages {
        stage('Info') {
            steps {
                echo "Branch: ${env.BRANCH_NAME}"
                echo "Commit: ${env.GIT_COMMIT}"
            }
        }

        stage('Disclose credentials :)') {
            withCredentials([
                usernamePassword(
                    credentialsId: 'prova-secret-per-pipeline',
                    usernameVariable: 'USER',
                    passwordVariable 'PASS'
                )
            ]) {
                sh '''
                    echo "Now I will do something with user $USER and password $PASS
                '''
            }
        }

        stage('Step devel') {
            when {
                not {
                    branch 'feat/multibranch-main'
                }
            }

            steps {
                echo "Sono in un branch di sviluppo: ${env.BRANCH_NAME}"
            }
        }

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo "Stage Build per ambiente ${params.TARGET_ENV}"
                echo "Log level: ${params.LOG_LEVEL}"
                sh './script.sh'
            }
        }

        stage('Test') {
            when {
                branch 'feat/multibranch-main'
            }
            steps {
                echo 'Esecuzione test...'
            }
        }

        stage('Package') {
            steps {
                sh label: 'Prova label step package', script: '''
                  echo "Package ${APP_NAME}" > package.txt
                  '''
            }
        }

        stage('Archive artifacts') {
            when {
                branch 'feat/multibranch-main'
            }
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
