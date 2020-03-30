pipeline{
	agent any
	stages{
	 stage('Git checkout'){
	 steps{
	 git 'https://github.com/ijazm123/book.git'
	  }
	}
 stage('compile'){
	 steps{
             sh "mvn compile"
	  }
	}
	stage('Code Review'){
steps{
	script{
	   try{
            withMaven(maven:'Maven'){
             sh 'mvn pmd:pmd'
             }
           }
      finally{
         stage('Publish PMD'){
            pmd canComputeNew: false, defaultEncoding: '', healthy: '', pattern: 'target/pmd.xml', unHealthy: ''
          }} 
       }
   }
 }
stage('Code Testing'){
    steps{
        sh "mvn test"
             }
           }
       
stage('coverage check'){
    steps{
      script{
        try{
          withMaven(maven:'Maven'){
             sh 'mvn cobertura:cobertura -Dcobertura.report.format=xml'
          }
         }
       finally{
           cobertura autoUpdateHealth: false, autoUpdateStability: false, coberturaReportFile: 'target/site/cobertura/coverage.xml', conditionalCoverageTargets: '70, 0, 0', failUnhealthy: false, failUnstable: false, lineCoverageTargets: '80, 0, 0', maxNumberOfBuilds: 0, methodCoverageTargets: '80, 0, 0', onlyStable: false, sourceEncoding: 'ASCII', zoomCoverageChart: false
       }
      }
     }
   }
stage('packaging'){
   steps{
       sh "mvn package"
    }
   }
stage('Docker Image Build'){
  steps{
    sh label: '', script: '''cp /var/lib/jenkins/workspace/javaPackage/target/addressbook.war .
sudo docker build . -t ijazm/addressbook:$BUILD_NUMBER
sudo docker push balucc/addressbook:$BUILD_NUMBER
'''
     }
  }
 }
}
