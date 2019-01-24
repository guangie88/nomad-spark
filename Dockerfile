FROM openjdk:8-jre-alpine

RUN set -euo pipefail; \
    mkdir -p /opt/; \
    cd /opt/; \
    wget https://github.com/hashicorp/nomad-spark/releases/download/v2.4.0-nomad-0.8.6-20181220/spark-2.4.0-bin-nomad-0.8.6-20181220.tgz; \
    tar xvf spark-2.4.0-bin-nomad-0.8.6-20181220.tgz; \
    rm spark-2.4.0-bin-nomad-0.8.6-20181220.tgz; \
    ln -s /opt/spark-2.4.0-bin-nomad-0.8.6-20181220 /opt/spark; \
    apk add --no-cache bash; \
    :
ENV SPARK_HOME /opt/spark
ENV PATH="${SPARK_HOME}/bin/:${PATH}"
