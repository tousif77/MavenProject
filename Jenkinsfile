pipeline {
    agent any
    tools {
        maven 'Maven_Home'
        jdk 'JAVA_HOME'
    }
    stages {
         stage ('Clone') {
            steps {
                git branch: 'master', url: "https://github.com/ChiragMakkar13/FirstDemo.git"
            }
        }
       stage('Build') {
      // Run the maven build
      if (isUnix()) {
         sh "'${mvnHome}/bin/mvn' -Dmaven.test.failure.ignore clean package"
      } else {
         bat(/"${mvnHome}\bin\mvn" -Dmaven.test.failure.ignore clean package/)
      }
   }
   stage('Results') {
      junit '**/target/surefire-reports/TEST-*.xml'
      archive 'target/*.jar'
   }
 }
}
