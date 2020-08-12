VERSION="2.0.4"
AGENT_PATH="/svc/lib"
AGENT_ID="agent1"
APPLICATION_NAME="sample"

JAVA_OPTIONS="${JAVA_OPTIONS} -javaagent:${AGENT_PATH}/pinpoint-bootstrap-${VERSION}.jar"
JAVA_OPTIONS="${JAVA_OPTIONS} -Dpinpoint.agentId=${AGENT_ID}"
JAVA_OPTIONS="${JAVA_OPTIONS} -Dpinpoint.applicationName=${APPLICATION_NAME}"
export JAVA_OPTIONS
