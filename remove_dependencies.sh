#! /bin/bash
for container in $(cat docker_containers)
do
	docker kill $container
	docker rm $container
done

for image in $(cat docker_images)
do
	docker rmi $image
done

for file in $(cat bin_files)
do
	rm /usr/local/bin/$file
done

sudo pkill docker

sudo rm -rf *
