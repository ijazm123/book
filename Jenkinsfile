pipeline{
    agent any
    stages{
        stage("git checkout"){
            steps{
                git 'https://github.com/ijazm123/book.git'
            }}
            stage("maven compile"){
                steps{
                    sh "mvn compile"
                }
            }
            stage("maven test"){
                steps{
                    sh "mvn test"
                }
            }
            stage("maven package"){
                steps{
                    sh "mvn clean package"
                }
            }
            stage("docker image"){
               steps{
                   sh "sudo docker build -t ijazu/addbok ."
            }}
           stage("docker run"){
              steps{
                sh "sudo docker run -itd -p 8088:8088 --name abook ijazu/adbook"
}}}}
