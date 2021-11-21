FROM alpine:3.15

# Install curl and unzip, which are required to add protoc.
RUN apk add --no-cache curl unzip

# Add protoc.
ENV PROTOBUF_VERSION 3.14.0
RUN mkdir -p /usr/src/protoc/ \
    && curl --location https://github.com/google/protobuf/releases/download/v${PROTOBUF_VERSION}/protoc-${PROTOBUF_VERSION}-linux-x86_64.zip > /usr/src/protoc/protoc-${PROTOBUF_VERSION}.zip \
    && cd /usr/src/protoc/ \
    && unzip protoc-${PROTOBUF_VERSION}.zip \
    && rm protoc-${PROTOBUF_VERSION}.zip \
    && ln -s /usr/src/protoc/bin/protoc /usr/local/bin/protoc \
    && mkdir -p /protos/ \
    && cp -R /usr/src/protoc/include/google/ /protos/google/

# Add the protos to the Docker image.
COPY . /protos/
