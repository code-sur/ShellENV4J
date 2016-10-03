JDK='./jdk'
if [[ ! -e $JDK ]]; then
  (>&2 echo "ERROR: jdk is not set")
  return 1
fi


# JAVA
JAVA_HOME=$JDK
PATH=$JAVA_HOME/bin:$PATH

# Maven
MAVEN_HOME=./maven
PATH=$MAVEN_HOME/bin:$PATH
