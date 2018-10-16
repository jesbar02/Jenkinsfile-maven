pipeline {
    agent any

    parameters {
         string(name: 'tomcat_dev', defaultValue: '192.168.56.60', description: 'Staging Server')
         string(name: 'tomcat_prod', defaultValue: '192.168.56.60', description: 'Production Server')
    }

    triggers {
         pollSCM('* * * * *')
     }

stages{
        stage('Build'){
            steps {
                sh '/usr/local/src/apache-maven/bin/mvn clean package'
            }
            post {
                success {
                    echo 'Now Archiving...'
                    archiveArtifacts artifacts: '**/target/*.war'
                }
            }
        }

        stage ('Deployments'){
            parallel{
                stage ('Deploy to Staging'){
                    steps {
                        sh "scp -o StrictHostKeyChecking=no /var/lib/jenkins/workspace/FullyAutomatedPipeline/webapp/target/webapp.war jesbar02@${params.tomcat_dev}:/opt/tomcat/webapps"
                    }
                }

                stage ("Deploy to Production"){
                    steps {
                        sh "scp -o StrictHostKeyChecking=no /var/lib/jenkins/workspace/FullyAutomatedPipeline/webapp/target/webapp.war jesbar02@${params.tomcat_prod}:/opt/tomcat-production/webapps"
                    }
                }
            }
        }
    }
}
