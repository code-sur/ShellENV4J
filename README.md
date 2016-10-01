# ShellENV4J - Shell environment for java projects
[![Build Status](https://travis-ci.org/code-sur/ShellENV4J.svg?branch=master)](https://travis-ci.org/code-sur/ShellENV4J)


## Usage example
```bash
  $ cd project_basedir
  $ java -version  # no java in PATH
The program 'java' is currently not installed.
  $ mvn -version  # # no maven in PATH
The program 'mvn' is currently not installed.
```

```bash
  $ . ENV.sh  # that's all
```
```bash
  $ java -version  # project's java is now in PATH!
java version "1.8.0_101"
Java(TM) SE Runtime Environment (build 1.8.0_101-b13)
Java HotSpot(TM) 64-Bit Server VM (build 25.101-b13, mixed mode)
  $ mvn -version  # project's maven is now in PATH!
Apache Maven 3.3.9 (bb52d8502b132ec0a5a3f4c09453c07478323dc5; 2015-11-10T13:41:47-03:00)
Maven home: /home/code/tutoriales/maven_getting_started/maven
```


## Install

```bash
cd your_project_basedir
wget https://goo.gl/kYnxxZ -o ENV.sh
```

Congratulations, setup is done!
