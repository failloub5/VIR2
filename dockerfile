FROM kalilinux/kali-rolling

RUN apt -y update && apt -y upgrade
RUN apt-get -y install lynx w3m w3m-img xterm

RUN useradd cpnv
USER cpnv
