pipeline{

	agent any

	tools {
    		maven 'maven-3-8-2'
    		'org.jenkinsci.plugins.docker.commons.tools.DockerTool' 'docker'
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
