pipeline{
agent any
stages{
stage("Git clone"){
steps{
git 'https://github.com/ijazm123/book.git'
}}
stage("compile"){
steps{
sh "mvn compile"
}}}}
