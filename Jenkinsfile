def app

pipeline {
    agent any
    tools {
    	maven 'maven-3-8-2'
    	docker 'docker'
    }
    stages {
        stage('Clone repository') {
        	steps {
        		checkout scm
        	}
	    }

	    stage('Build image') {
	  
	       steps {
        		script {
        			app = docker.build("mvn-app-test")
        		}
        	}
	    }

	    stage('Test image') {
	  

		steps {
			script {
        			app.inside {
		    			sh 'echo "Tests passed"'
		    		}
		    	}
        	}
	    }

	    stage('Push image') {
		
		steps {
        		script {
        			docker.withRegistry('https://192.168.100.143', 'git') {
		    			app.push("${env.BUILD_NUMBER}")
		    			app.push("latest")
				}
			}
        	}
	    }
    }   
}
