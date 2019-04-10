
        sh "sudo docker build -t chiragmakkar13/mavendemo:Dockerfile ."

    
        def JENKIN_VERSION = sh returnStdout: true, script: "cat Dockerfile | head -n 1 | awk -F ':' '{print \$2}' | awk -F '-' '{print \$1}'"
        withCredentials([usernamePassword(
            credentialsId: "dockerhub",
            usernameVariable: "USER",
            passwordVariable: "PASS"
        )]) 
            sh "sudo docker login -u $USER -p $PASS"
        

        sh "sudo docker tag chiragmakkar13/mavendemo:latest chiragmakkar13/mavendemo:$BUILD_NUMBER"
        //sh "sudo docker tag chiragmakkar13/mavendemo:latest chiragmakkar13/mavendemo:$JENKINS_VERSION"
        sh "sudo docker push chiragmakkar13/mavendemo:latest"
        sh "sudo docker push chiragmakkar13/mavendemo:$BUILD_NUMBER"
    

