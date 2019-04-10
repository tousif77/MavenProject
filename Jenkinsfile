node {
	def server = Artifactory.server 'artifactory' 
    def rtMaven = Artifactory.newMavenBuild()
    def buildInfo
    def mvnHome
    jdk = tool name: 'JAVA8'
    env.JAVA_HOME = "${jdk}"
    
   stage ('Clone') {			
	git branch: 'master', url: "https://github.com/ChiragMakkar13/MavenProject.git"
		}
	stage ('Artifactory configuration') {
        mvnHome = tool 'mavenhome'
        rtMaven.tool = 'mavenhome' // Tool name from Jenkins configuration
        rtMaven.deployer releaseRepo: 'libs-release-local', snapshotRepo: 'libs-snapshot-local', server: server
        rtMaven.resolver releaseRepo: 'libs-release', snapshotRepo: 'libs-snapshot', server: server
        buildInfo = Artifactory.newBuildInfo()
        buildInfo.env.capture = true
    }		
	stage ('Maven Build') {
	    rtMaven.run pom: 'pom.xml', goals: 'clean install', buildInfo: buildInfo
    }
   
	stage('SonarQube analysis') {
        mvnHome = tool 'mavenhome'
		withSonarQubeEnv('sonar') {
        rtMaven.run pom: 'pom.xml', goals: '$SONAR_MAVEN_GOAL -Dsonar.host.url=$SONAR_HOST_URL', buildInfo: buildInfo
		}
	}
	stage('Results') {
      junit '**/target/surefire-reports/TEST-*.xml'
      archive 'target/*.jar'
   }	
 
	stage ('Publish Build') {
     server.publishBuildInfo buildInfo
    }
	//stage ('Docker Build & Push')
	//{
	//sh "sudo docker login -u chiragmakkar13 -p $PASS"
	  //docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
	//sh "docker login -u chiragmakkar13 -p $PASS"
        //def customImage = docker.build("chiragmakkar13/mavendemo:latest")

        /* Push the container to the custom Registry */
        //customImage.push(latest)
    //}	}
 	stage('Docker Image Build'){
	   sh "sudo docker build -t chiragmakkar13/mavendemo:Dockerfile ."
        //def customImage = docker.build("chiragmakkar13/mavendemo:latest")
    }

    stage('Push Image') {
        def JENKIN_VERSION = sh returnStdout: true, script: "cat Dockerfile | head -n 1 | awk -F ':' '{print \$2}' | awk -F '-' '{print \$1}'"
        withCredentials([usernamePassword(
            credentialsId: "dockerhub",
            usernameVariable: "USER",
            passwordVariable: "PASS"
        )]) {
            sh "sudo docker login -u $USER -p $PASS"
        }

        sh "sudo docker tag chiragmakkar13/mavendemo:latest chiragmakkar13/mavendemo:$BUILD_NUMBER"
        //sh "docker tag chiragmakkar13/mavendemo:latest chiragmakkar13/mavendemo:$JENKINS_VERSION"
        sh "sudo docker push chiragmakkar13/mavendemo:latest"
        sh "sudo docker push chiragmakkar13/mavendemo:$BUILD_NUMBER"
    } 
	
	
	
 }







