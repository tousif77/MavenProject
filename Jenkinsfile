pipeline {
    agent any
    tools {
        maven 'Maven 3.3.9'
        jdk 'jdk8'
    }
    stages {
         stage ('Clone') {
            steps {
                git branch: 'master', url: "https://github.com/ChiragMakkar13/FirstDemo.git"
            }
        }
        stage ('Initialize') {
            steps {
                sh '''
                    echo "JAVA_HOME = ${JAVA_HOME}"
                    echo "Maven_Home = ${Maven_Home}"
                '''
            }
        }

        stage ('Build') {
            steps {
                sh 'mvn clean compile test package' 
            }
            post {
                success {
                    junit 'target/surefire-reports/**/*.xml' 
                }
            }
        }
    }
}
