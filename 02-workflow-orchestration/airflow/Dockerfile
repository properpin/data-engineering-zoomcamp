# First-time build can take upto 10 mins.

FROM apache/airflow:3.0.1

ENV AIRFLOW_HOME=/opt/airflow

# 以root身份執行
USER root

# 安裝vim編輯器
RUN apt-get update -qq && apt-get install vim -qqq
# git gcc g++ -qqq

# 安裝 Google Cloud SDK, 為了能夠使用 gcloud 命令
ARG CLOUD_SDK_VERSION=523.0.0
ENV GCLOUD_HOME=/opt/google-cloud-sdk
ENV PATH="${GCLOUD_HOME}/bin/:${PATH}"

RUN DOWNLOAD_URL="https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz" \
    && TMP_DIR="$(mktemp -d)" \
    && curl -fL "${DOWNLOAD_URL}" --output "${TMP_DIR}/google-cloud-sdk.tar.gz" \
    && mkdir -p "${GCLOUD_HOME}" \
    && tar xzf "${TMP_DIR}/google-cloud-sdk.tar.gz" -C "${GCLOUD_HOME}" --strip-components=1 \
    && "${GCLOUD_HOME}/install.sh" \
       --bash-completion=false \
       --path-update=false \
       --usage-reporting=false \
       --quiet \
    && rm -rf "${TMP_DIR}" \
    && gcloud --version

# 跑python scripts
COPY scripts scripts
RUN chmod +x scripts

# 以 airflow 用戶身份，因為 Airflow版本已經不允許以 root 用戶身份執行pip，安裝requirements.txt中的python package
USER airflow
COPY requirements.txt .
ARG AIRFLOW_VERSION=3.0.1
ENV AIRFLOW_VERSION=$AIRFLOW_VERSION
RUN pip install --no-cache-dir "apache-airflow==${AIRFLOW_VERSION}" -r requirements.txt

# Ref: https://airflow.apache.org/docs/docker-stack/recipes.html

SHELL ["/bin/bash", "-o", "pipefail", "-e", "-u", "-x", "-c"]


WORKDIR $AIRFLOW_HOME


USER $AIRFLOW_UID
