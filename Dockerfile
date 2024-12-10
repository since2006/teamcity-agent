ARG TEAMCITY_VERSION=2024.12-linux-sudo
ARG jdkLinuxComponent='https://corretto.aws/downloads/resources/8.432.06.1/amazon-corretto-8.432.06.1-linux-x64.tar.gz'
ARG jdkLinuxComponentMD5SUM='6fb237cb31a9c4474bf5f79798d94943'

FROM jetbrains/teamcity-agent:${TEAMCITY_VERSION}

USER root

# 安装 JDK 8
RUN set -eux; \
    curl -LfsSo /tmp/openjdk8.tar.gz ${jdkLinuxComponent}; \
    echo "${jdkLinuxComponentMD5SUM} */tmp/openjdk8.tar.gz" | md5sum -c -; \
    mkdir -p /opt/java/openjdk8; \
    cd /opt/java/openjdk8; \
    tar -xf /tmp/openjdk8.tar.gz --strip-components=1; \
    chown -R root:root /opt/java/openjdk8; \
    rm -rf /tmp/openjdk8.tar.gz;

ENV JAVA_HOME=/opt/java/openjdk8 \
    JDK_HOME=/opt/java/openjdk8 \
    PATH="/opt/java/openjdk8/bin:$PATH"

RUN update-alternatives --install /usr/bin/java java ${JDK_HOME}/bin/java 1 && \
    update-alternatives --set java ${JDK_HOME}/bin/java && \
    update-alternatives --install /usr/bin/javac javac ${JDK_HOME}/bin/javac 1 && \
    update-alternatives --set javac ${JDK_HOME}/bin/javac

USER buildagent
