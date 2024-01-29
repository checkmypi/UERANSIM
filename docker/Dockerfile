FROM ubuntu:bionic as base

RUN apt-get update -y && \
    apt-get upgrade -y &&\
    apt install iproute2 wget vim iperf3 tcpdump net-tools iputils-ping libsctp1 tmux -y

FROM base as build
RUN apt install make g++ git libsctp-dev lksctp-tools -y
RUN wget -qO- "https://cmake.org/files/v3.19/cmake-3.19.0-Linux-x86_64.tar.gz" | tar --strip-components=1 -xz -C /usr/local

RUN apt-get update && \
    apt-get upgrade -y

#Clone and build UERANSIM
RUN git clone https://github.com/aligungr/UERANSIM.git
WORKDIR /UERANSIM
RUN make 

FROM base as final
RUN mkdir /UERANSIM
COPY custom-gnb.yaml custom-ue.yaml /UERANSIM/
COPY start_ueransim.sh /UERANSIM/
COPY start_gnb.sh /UERANSIM/
COPY --from=build /UERANSIM/build/ /UERANSIM/
COPY --from=build /UERANSIM/config/ /UERANSIM/config/
WORKDIR /UERANSIM
CMD /UERANSIM/start_ueransim.sh --allow-root


