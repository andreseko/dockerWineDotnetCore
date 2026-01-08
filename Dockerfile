FROM amake/wine:bookworm

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends procps xvfb wget gpg apt-transport-https software-properties-common zip curl g++ build-essential tar gzip libimage-exiftool-perl \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && rm packages-microsoft-prod.deb

RUN apt-get update && apt-get -y install dotnet-sdk-10.0

COPY ./scripts/* /opt/bin/
RUN chmod +x /opt/bin/*
ENV PATH="$PATH:/opt/bin"

# get at least error information from wine
ENV WINEDEBUG="-all,err+all"

# Run virtual X buffer on this port
ENV DISPLAY=":99"

USER xclient

# Install Inno Setup binaries
RUN curl -SL "http://files.jrsoftware.org/is/5/innosetup-5.6.1-unicode.exe" -o is.exe \
    && wine-x11-run wine is.exe /SP- /VERYSILENT \
    && rm is.exe


