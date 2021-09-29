pipeline{

	agent all

    	environment {
		DOCKERHUB_CREDENTIALS=credentials('git')
	}

	stages {
	    
	    stage('gitclone') {

			steps {
				checkout scm
			}
		}

		stage('Build') {

			steps {
				sh 'docker build -t hamzhkoujan/ksa-lab:latest .'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker image push hamzhkoujan/ksa-lab:latest'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}
