FROM openjdk:8-jre-alpine

RUN set -euo pipefail; \
    SPARK_VERSION=2.3.2; \
    mkdir -p /opt/; \
    cd /opt/; \
    wget https://github.com/hashicorp/nomad-spark/releases/download/v${SPARK_VERSION}-nomad-0.8.6-20181220/spark-${SPARK_VERSION}-bin-nomad-0.8.6-20181220.tgz; \
    tar xvf spark-${SPARK_VERSION}-bin-nomad-0.8.6-20181220.tgz; \
    rm spark-${SPARK_VERSION}-bin-nomad-0.8.6-20181220.tgz; \
    ln -s /opt/spark-${SPARK_VERSION}-bin-nomad-0.8.6-20181220 /opt/spark; \
    apk add --no-cache bash; \
    :
ENV SPARK_HOME /opt/spark
ENV PATH="${SPARK_HOME}/bin/:${PATH}"
