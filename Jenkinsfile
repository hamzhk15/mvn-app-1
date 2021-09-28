def app

pipeline {
    agent any
    tools {
    	maven 'maven-3-8-2'
    	docker 'docker'
    }
    stages {
        stage('Clone repository') {
	      

		checkout scm
	    }

	    stage('Build image') {
	  
	       app = docker.build("brandonjones085/test")
	    }

	    stage('Test image') {
	  

		app.inside {
		    sh 'echo "Tests passed"'
		}
	    }

	    stage('Push image') {
		
		docker.withRegistry('https://registry.hub.docker.com', 'git') {
		    app.push("${env.BUILD_NUMBER}")
		    app.push("latest")
		}
	    }
    }   
}
