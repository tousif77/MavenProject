pipeline {
    agent any
    stages {
        stage ('Clone') {
            steps {
                git branch: 'master', url: "https://github.com/ChiragMakkar13/FirstDemo.git"
            }
        }
       
         stage ('Exec Maven') {
            steps {
                rtMavenRun (
                    tool: Maven_Home, // Tool name from Jenkins configuration
                    pom: 'maven-example/pom.xml',
                    goals: 'clean install',
                    deployerId: "MAVEN_DEPLOYER",
                    resolverId: "MAVEN_RESOLVER"
                )
            }
        }
    }
} 
