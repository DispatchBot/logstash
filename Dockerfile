FROM logstash:5.1.1

RUN wget https://s3.amazonaws.com/dispatchbot-devops/ca-chain.cert.pem && \
  mv ca-chain.cert.pem /usr/local/share/ca-certificates/dispatchbot-ca-chain.cert.crt && \
  update-ca-certificates

RUN logstash-plugin install --version 3.1.12 logstash-input-beats

RUN logstash-plugin install --version 6.2.0 logstash-output-elasticsearch

RUN logstash-plugin install --version 3.0.2 logstash-input-graphite
