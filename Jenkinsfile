pipeline {
    agent any

    environment {
        GITHUB_USERNAME = "AbdelhamidRb"
    }

    stages {
        stage('Setup') {
            steps {
                echo '==== Setup ===='
                sh '''
                    . /opt/conda/etc/profile.d/conda.sh
                    conda activate mlopsfull
                    pip install setuptools==68.2.2 click==8.1.7
                    pip install -r requirements.txt
                '''
            }
        }

        stage('Checks') {
            steps {
                echo '==== Running Checks ===='
                sh '''
                    . /opt/conda/etc/profile.d/conda.sh
                    conda activate mlopsfull
                    flake8 madewithml --count --select=E9,F63,F7,F82 --show-source --statistics
                '''
            }
        }

        stage('Workloads') {
            steps {
                echo '==== Running ML Workload ===='
                sh '''
                    . /opt/conda/etc/profile.d/conda.sh
                    conda activate mlopsfull
                    export GITHUB_USERNAME=AbdelhamidRb
                    bash scripts/ci_build.sh
                '''
            }
        }
    }

    post {
        success {
            echo '✅ Pipeline succeeded'
        }
        failure {
            echo '❌ Pipeline failed'
        }
    }
}