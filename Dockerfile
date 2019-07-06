from openjdk:11
RUN wget https://www-eu.apache.org/dist/jena/binaries/apache-jena-3.12.0.tar.gz 
RUN tar xfvz apache-jena-3.12.0.tar.gz
RUN sed -i 's/WARN/INFO/g' ./apache-jena-3.12.0/jena-log4j.properties
RUN mkdir -p /workspace/LL
COPY build.sh /workspace/
COPY LL /workspace/LL
RUN chmod 777 /workspace/build.sh
ENTRYPOINT ["/workspace/build.sh"]