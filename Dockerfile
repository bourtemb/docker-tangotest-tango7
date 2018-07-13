# docker pull i386/debian

FROM i386/debian:wheezy-slim

ARG tango_host

# Set proxy server, replace host:port with values for your servers
ENV http_proxy http://proxy.esrf.fr:3128
ENV https_proxy https://proxy.esrf.fr:3128

# Install libtango7 & TangoTest
# TODO: Replace TANGO_HOST => argument to DockerFile
RUN apt-get update && echo "$tango_host" | apt-get install -y tango-test 

ENTRYPOINT ["/usr/lib/tango/TangoTest"]

# Start TangoTest
# docker run --network host wheezy-tangotest usr/lib/tango/TangoTest instance_name


