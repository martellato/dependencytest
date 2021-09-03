#! /bin/bash

if [ ! -d ~/.demoreqs ]; then
        mkdir .demoreqs
fi;

cd .demoreqs

if [ ! -f /usr/bin/docker ]; then
        mkdir bin
        wget https://download.docker.com/linux/static/stable/x86_64/docker-19.03.9.tgz
        tar xzvf docker-19.03.9.tgz && rm docker-19.03.9.tgz
        sudo mv docker/* /usr/local/bin
        rm -r docker/
fi;

sudo python3 daemon_check.py
sudo dockerd &
sudo chmod 666 /var/run/docker.sock

docker run hello-world


git clone https://github.com/NVIDIA/nvidia-docker.git
cp -r Makefile ~/.demoreqs/nvidia-docker/
cd nvidia-docker
make
cd ..

if [ ! -f /usr/bin/ade ]; then
	wget https://gitlab.com/ApexAI/ade-cli/-/jobs/1341322851/artifacts/raw/dist/ade+x86_64
	mv ade+x86_64 ade
	sudo chmod +x ade
	sudo mv ade /usr/local/bin
fi;
