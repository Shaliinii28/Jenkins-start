FROM jenkins/jenkins:2.462-jdk11
USER root
RUN apt-get update && apt-get install -y lsb-release python3-pip
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.asc] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli
USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean:1.27.11 docker-workflow:563.vd5d2e5c4007f token-macro:400.v35420b_922dcb_ favorite:2.221.v19ca_666b_62f5 github:1.40.0 github-branch-source:1807.v50351eb_7dd13"