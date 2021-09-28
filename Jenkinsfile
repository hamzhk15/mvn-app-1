pipeline{

	agent all

	tools {
    		maven 'maven-3-8-2'
    		docker 'docker'
    	}
    	environment {
		//DOCKERHUB_CREDENTIALS=credentials('dockerhub')
	}

	stages {
	    
	    stage('gitclone') {

			steps {
				checkout scm
			}
		}

		stage('Build') {

			steps {
				sh 'docker build -t 192.168.100.143/mvn-app-test:latest .'
			}
		}

		stage('Login') {

			steps {
				//sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker image push 192.168.100.143/mvn-app-test:latest'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}
