if [[ ! -e ./jdk ]]; then
  return 1
fi


# JAVA
JAVA_HOME=./jdk
PATH=$JAVA_HOME/bin:$PATH

# Maven
MAVEN_HOME=./maven
PATH=$MAVEN_HOME/bin:$PATH
