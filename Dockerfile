FROM ubuntu:18.04
RUN apt-get update && apt-get install -y gnupg
RUN echo "deb http://ppa.launchpad.net/i2p-maintainers/i2p/ubuntu bionic main" | tee /etc/apt/sources.list.d/i2p.list
RUN echo "deb-src http://ppa.launchpad.net/i2p-maintainers/i2p/ubuntu bionic main" | tee /etc/apt/sources.list.d/i2p.list
RUN apt-key --keyring /etc/apt/trusted.gpg.d/i2p.gpg adv --keyserver hkp://keyserver.ubuntu.com --recv-keys 474BC46576FAE76E97C1A1A1AB9660B9EB2CC88B
RUN echo "deb http://ppa.launchpad.net/purplei2p/i2pd/ubuntu bionic main" | tee /etc/apt/sources.list.d/i2pd.list
RUN echo "deb-src http://ppa.launchpad.net/purplei2p/i2pd/ubuntu bionic main" | tee -a /etc/apt/sources.list.d/i2pd.list
RUN apt-key --keyring /etc/apt/trusted.gpg.d/i2pd.gpg adv --keyserver hkp://keyserver.ubuntu.com --recv-keys A0592679C89831BBC7E5D822625964081B0340BA
RUN apt-get update
RUN cat /var/lib/apt/lists/*InRelease | grep Origin
