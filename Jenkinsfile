pipeline {
    agent any

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
