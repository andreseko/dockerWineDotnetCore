FROM amake/wine:latest

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends procps xvfb wget gpg apt-transport-https software-properties-common zip curl g++ build-essential tar gzip libimage-exiftool-perl \
    && rm -rf /var/lib/apt/lists/*

RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg
RUN mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/
RUN wget -q https://packages.microsoft.com/config/debian/10/prod.list
RUN mv prod.list /etc/apt/sources.list.d/microsoft-prod.list
RUN chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg
RUN chown root:root /etc/apt/sources.list.d/microsoft-prod.list

RUN apt-get update && apt-get -y install dotnet-sdk-3.1

COPY ./scripts/* /opt/bin/
RUN chmod +x /opt/bin/*
ENV PATH $PATH:/opt/bin

# get at least error information from wine
ENV WINEDEBUG -all,err+all

# Run virtual X buffer on this port
ENV DISPLAY :99

USER xclient

# Install Inno Setup binaries
RUN curl -SL "http://files.jrsoftware.org/is/5/innosetup-5.6.1-unicode.exe" -o is.exe \
    && wine-x11-run wine is.exe /SP- /VERYSILENT \
    && rm is.exe


