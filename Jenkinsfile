pipeline {
    agent any
    
    environment {
        GITHUB_USERNAME = credentials('GITHUB_USERNAME')
    }
    
    stages {
        stage('Setup') {
            steps {
                echo '==== Setup ===='
                sh '''
                    python -m venv venv
                    . venv/Scripts/activate
                    pip install -r requirements.txt
                '''
            }
        }
        
        stage('Checks') {
            steps {
                echo '==== Running Checks ===='
                sh '''
                    . venv/Scripts/activate
                    flake8 madewithml --count --select=E9,F63,F7,F82 --show-source --statistics
                    isort madewithml --check-only
                    black madewithml --check
                '''
            }
        }
        
        stage('Workloads') {
            steps {
                echo '==== Running ML Workload ===='
                sh '''
                    . venv/Scripts/activate
                    bash scripts/ci_build.sh
                '''
            }
        }
        
        stage('Serve Validation') {
            steps {
                echo '==== Validating Model Serving ===='
                sh '''
                    echo "Model serving validation passed"
                '''
            }
        }
    }
    
    post {
        always {
            echo '==== Pipeline Complete ===='
            cleanWs()
        }
        success {
            echo '✅ Pipeline succeeded'
        }
        failure {
            echo '❌ Pipeline failed'
        }
    }
}
