pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = "us-east-1"
        ANSIBLE_HOST_KEY_CHECKING = "False"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/karthikhastag/ansible_challenge.git'
            }
        }

        stage('Terraform Init & Apply') {
            steps {
                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                     credentialsId: 'aws']
                ]) {
                    sh '''
                      cd terraform
                      terraform init
                      terraform apply -auto-approve
                    '''
                }
            }
        }

        stage('Run Ansible Playbooks') {
            steps {
                sshagent(['Master']) {
                    sh '''
                      cd ansible
                      ansible-playbook -i inventory.ini common.yml
                      ansible-playbook -i inventory.ini backend.yml
                      ansible-playbook -i inventory.ini frontend.yml
                    '''
                }
            }
        }
    }

    post {
        success {
            echo "Deployment completed successfully"
        }
        failure {
            echo "Deployment failed"
        }
    }
}
