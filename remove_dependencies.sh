#! /bin/bash
for image in $(cat docker_images)
do
	docker rmi $image
done

for file in $(cat bin_files)
do
	rm /usr/local/bin/$file
done

sudo rm -rf .demoreqs
