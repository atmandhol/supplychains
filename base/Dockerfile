# 0.1.88
FROM paketobuildpacks/build-jammy-base@sha256:211eab0323bed297c36e09baf94cc9486d5a6e41e67a9243a3ea15cbba2e52be

USER root
RUN apt-get update && apt-get install -y jq git && \
    rm -rf /var/lib/apt/lists/*

COPY bin/* /usr/local/bin/

USER cnb

