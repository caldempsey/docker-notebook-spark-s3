FROM adoptopenjdk/openjdk11:alpine

ENV MAVEN_VERSION=3.8.3
ENV MAVEN_HOME=/opt/maven
ENV PATH=${MAVEN_HOME}/bin:${PATH}
RUN wget -qO- "https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz" | tar -xz -C /opt/ \
    && ln -s /opt/apache-maven-${MAVEN_VERSION} ${MAVEN_HOME}

ENV SCALA_VERSION=2.12.15
ENV SCALA_HOME=/usr/local/scala
ENV PATH=${SCALA_HOME}/bin:${PATH}
RUN wget -qO- "https://downloads.lightbend.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz" | tar -xz -C /usr/local/ \
    && ln -s /usr/local/scala-${SCALA_VERSION} ${SCALA_HOME}

RUN apk --no-cache add curl

CMD ["bash"]
