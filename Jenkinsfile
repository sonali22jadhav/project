4qgrweadsvx
pipeline {
             agent any

        stages {
		
		     stage ('MAVEN_BUILD')
			     {
		          steps {
						  sh "mvn clean package"
			
			            }
			      }
		
		     stage('Deploy') 
			     {
                  steps {
                        sh cp target/*.war /mnt/servers/apache-tomcat-10.1.59/webapps
                
                         }
                  }
	
	
	
	         }
		
  }
