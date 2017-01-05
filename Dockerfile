FROM logstash:5.1.1-alpine

# Install root CA's with wget
RUN apk update && \
  apk add ca-certificates wget && \
  update-ca-certificates

RUN wget https://s3.amazonaws.com/dispatchbot-devops/ca-chain.cert.pem && \
  mv ca-chain.cert.pem /usr/local/share/ca-certificates/dispatchbot-ca-chain.cert.crt && \
  update-ca-certificates

RUN $LOGSTASH_PATH/logstash-plugin install --version 3.1.12 logstash-input-beats

RUN $LOGSTASH_PATH/logstash-plugin install --version 6.2.0 logstash-output-elasticsearch
