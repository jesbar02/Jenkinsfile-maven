pipeline {
	agent any

	stages{
		stage('Build'){
			steps{
				sh "/usr/local/src/apache-maven/bin/mvn clean package"
				sh "scp /var/lib/jenkins/workspace/TomcatWebApp/webapp/target/webapp.war jesbar02@$192.168.56.60:/home/jesbar02/jenkins_builds"
			}
		}
	}
}


