FROM alpine:3.8

# Add the protos to the Docker image.
ADD ./google /protos/google

# Add Bazel build data to the image.
ADD ./BUILD.bazel /protos/BUILD.bazel
ADD ./WORKSPACE /protos/WORKSPACE
