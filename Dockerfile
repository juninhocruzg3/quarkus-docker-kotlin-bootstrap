FROM centos:7.9.2009

ARG JAVA_CANDIDATE_VERSION=21.0.2-tem
ARG QUARKUS_CANDIDATE_VERSION=3.7.2
ARG USERID

# update the image
RUN yum -y upgrade

# install requirements, install and configure sdkman
# see https://sdkman.io/usage for configuration options
RUN yum -y install curl ca-certificates zip unzip openssl which findutils && \
    update-ca-trust

RUN adduser --create-home quarkus -u $USERID

USER quarkus

ENV SDKMAN_DIR=/home/quarkus/.sdkman

RUN curl -s "https://get.sdkman.io" | bash && \
    echo "sdkman_auto_answer=true" > $SDKMAN_DIR/etc/config && \
    echo "sdkman_auto_selfupdate=false" >> $SDKMAN_DIR/etc/config

# Source sdkman to make the sdk command available and install candidate
RUN bash -c "source $SDKMAN_DIR/bin/sdkman-init.sh && sdk install java $JAVA_CANDIDATE_VERSION"

# Add candidate path to $PATH environment variable
ENV JAVA_HOME="$SDKMAN_DIR/candidates/java/current"
ENV PATH="$JAVA_HOME/bin:$PATH"

RUN bash -c "source $SDKMAN_DIR/bin/sdkman-init.sh && sdk install quarkus $QUARKUS_CANDIDATE_VERSION"

WORKDIR /mnt/api

RUN mkdir -p /home/quarkus/.redhat && echo '{"disabled":true}' > ~/.redhat/io.quarkus.analytics.localconfig

# ENV M2_HOME=/mnt/api/.m2

# RUN mkdir -p ~/.m2
# RUN ls /home/quarkus/ -a
# COPY .m2/settings.xml /home/quarkus/.m2/settings.xml

ENTRYPOINT ["/bin/bash", "-c", "source $SDKMAN_DIR/bin/sdkman-init.sh && \"$@\"", "-s"]
# CMD ["sdk", "help"]