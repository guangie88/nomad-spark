ARG JAVA_MAJOR_VERSION=8
FROM openjdk:${JAVA_MAJOR_VERSION}-jre-alpine

# Unused for now
ARG HADOOP_MAJMIN_VERSION=2.7

# Used only because of direct release download
ARG SUFFIX

ARG SPARK_VERSION
ENV SPARK_VERSION ${SPARK_VERSION}

ARG NOMAD_VERSION
ENV NOMAD_VERSION ${NOMAD_VERSION}

RUN set -euo pipefail; \
    mkdir -p /opt/; \
    cd /opt/; \
    wget https://github.com/hashicorp/nomad-spark/releases/download/v${SPARK_VERSION}-nomad-${NOMAD_VERSION}-${SUFFIX}/spark-${SPARK_VERSION}-bin-nomad-${NOMAD_VERSION}-${SUFFIX}.tgz; \
    tar xvf spark-${SPARK_VERSION}-bin-nomad-${NOMAD_VERSION}-${SUFFIX}.tgz; \
    rm spark-${SPARK_VERSION}-bin-nomad-${NOMAD_VERSION}-${SUFFIX}.tgz; \
    ln -s /opt/spark-${SPARK_VERSION}-bin-nomad-${NOMAD_VERSION}-${SUFFIX} /opt/spark; \
    apk add --no-cache bash; \
    :

ENV SPARK_HOME /opt/spark
ENV PATH="${SPARK_HOME}/bin/:${PATH}"
