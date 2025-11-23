pipeline {
    agent any

    environment {
        ANSIBLE_FORCE_COLOR = 'true'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Deploy via Ansible') {
            steps {
                sh '''
                  ansible-playbook -i inventory.ini nginx_deploy.yml
                '''
            }
        }
    }

    post {
        success {
            echo 'Deployment successful.'
        }
        failure {
            echo 'Deployment failed. Check logs.'
        }
    }
}
