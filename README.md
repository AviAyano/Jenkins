# Jenkins
  **ci/cd pipeline using Jenkins**

 1. You will need to have Docker installed on your local system.
 2. Install Jenkins as a container.
 3. In a terminal, run the following commands:

		docker --version
		docker pull jenkins/jenkins:lts
		docker run -d -p 8080:8080 -p 50000:50000 --volume jenkins_home:/var/jenkins_home --name poc jenkins/jenkins:lts
  
 4.	Initial Admin Password -
 		Run the following command and copy the output:

	  	docker exec poc cat /var/jenkins_home/secrets/initialAdminPassword

  	Open a browser to localhost:8080 and enter the initial admin password.
5. To forward traffic from Jenkins to Docker Desktop on the host machine, use the Alpine/Socat container.

	StackOverflow: https://stackoverflow.com/questions/47709208/how-to-find-docker-host-uri-to-be-used-in-jenkins-dock

   		docker run -d --restart=always -p 127.0.0.1:2376:2375 -v /var/run/docker.sock:/var/run/docker.sock alpine/socat tcp-listen:2375,fork,reuseaddr unix-connect:/var/run/docker.sock
   
7. Install Nexus Repository as a container.
8.	Sonatype Nexus Repository Docker: sonatype/nexus3
   
		  docker pull sonatype/nexus3
		  docker run -d -p 8081:8081 --name nexus sonatype/nexus3
    
9. 	Initial Admin Password -
 		Run the following command and copy the output:

   		  docker exec nexus cat /nexus-data/admin.password

  	Open a browser to localhost:8081 and enter the initial admin password.
