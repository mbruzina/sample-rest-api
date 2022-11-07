# sample-rest-api
Really basic rest service with one `GET` endpoint, `/hello`

## Building
Make sure you have a JDK installed (see below)

This project uses Gradle for dependency/build management.

There are two types of artifacts you can build from this repository - war and executable jar:
* `./gradlew clean war` - creates `build/libs/spring-boot-rest.war`
* `./gradlew clean bootJar` - creates `build/libs/spring-boot-rest.jar` 
    * Run this jar using embedded Tomcat: `java -jar build/libs/spring-boot-rest.jar ` 
  
## Install JDK
You will need a JDK installed to build this project.  For OSX: https://formulae.brew.sh/cask/temurin

**Pro Tip**:  install multiple versions and add an alias to quickly switch JDKs

Installed:
```
$ brew list --casks --verbose --versions      
temurin8 8,302:b08
temurin11 11.0.12,7
temurin 16.0.2,7
```

Aliases in bash profile:
```
setJdk8='export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)'
setJdk11='export JAVA_HOME=$(/usr/libexec/java_home -v 11)'
setJdk16='export JAVA_HOME=$(/usr/libexec/java_home -v 16)'
```

In action:
```
$ setJdk8 && java -version 
openjdk version "1.8.0_302"
OpenJDK Runtime Environment (Temurin)(build 1.8.0_302-b08)
OpenJDK 64-Bit Server VM (Temurin)(build 25.302-b08, mixed mode)
```

```
$ setJdk11 && java -version
openjdk version "11.0.12" 2021-07-20
OpenJDK Runtime Environment Temurin-11.0.12+7 (build 11.0.12+7)
OpenJDK 64-Bit Server VM Temurin-11.0.12+7 (build 11.0.12+7, mixed mode)
```

```
$ setJdk16 && java -version
openjdk version "16.0.2" 2021-07-20
OpenJDK Runtime Environment Temurin-16.0.2+7 (build 16.0.2+7)
OpenJDK 64-Bit Server VM Temurin-16.0.2+7 (build 16.0.2+7, mixed mode, sharing)
```
