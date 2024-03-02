FROM adoptopenjdk/openjdk11:alpine

# Install Maven
ENV MAVEN_VERSION=3.8.3
ENV MAVEN_HOME=/opt/maven
ENV PATH=${MAVEN_HOME}/bin:${PATH}

# Download Maven
RUN wget -qO /opt/maven.tar.gz "https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz"

# Extract Maven
RUN tar -xzf /opt/maven.tar.gz -C /opt/

# Remove Maven archive
RUN rm /opt/maven.tar.gz

# Create symbolic link
RUN ln -s /opt/apache-maven-${MAVEN_VERSION} ${MAVEN_HOME}

# Install Scala
ENV SCALA_VERSION=2.12.15
ENV SCALA_HOME=/usr/local/scala
ENV PATH=${SCALA_HOME}/bin:${PATH}

# Download Scala
RUN wget -qO- "https://downloads.lightbend.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz" | tar -xz -C /usr/local/

# Create symbolic link for Scala
RUN ln -s /usr/local/scala-${SCALA_VERSION} ${SCALA_HOME}

# Install other dependencies
RUN apk --no-cache add curl

CMD ["bash"]
