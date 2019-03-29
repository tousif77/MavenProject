# MavenProject | DevOps
Sample Java code With Junit4 TestCase For Building on Jenkins

Download it and Build your Java Code in Eclipse after that build Maven Project on Jenkins & Make a Pipeline of it after that Publish Artifacts & Deploy that on docker container
Tasks which i Have Done With This Code
Create a Jenkins Pipeline with below stages:

-	Checkout code from SCM [git]                                  -> SCM CHECKOUT
-	Create Build File [war/dll etc.]                              -> BUILD STEP
-	Execute Unit Test Cases                                       -> UNIT TESTING
-	Run Sonar Analysis                                            -> CODE ANALYSIS
-	Move File to Artifactory/Nuget                                -> COPY ARTIFACT
-	Create Docker Image using Docker File                         -> DEPLOY ARTIFACT
            - Run container
-	Email notification on completion.                             -> NOTIFICATION
