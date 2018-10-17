pipeline {
	agent any
	stages{
		stage('Build'){
			steps{
				sh "/usr/local/src/apache-maven/bin/mvn clean package"
				sh "docker build . -t tomcatwebapp:${(env.BUILD_ID)}"	
			}
		}
	}
}
