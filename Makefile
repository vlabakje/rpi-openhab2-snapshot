DOCKER_IMAGE_VERSION=2.0-alpha
DOCKER_IMAGE_NAME=vlabakje/rpi-openhab2
DOCKER_IMAGE_TAGNAME=$(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_VERSION)

default: build

build:
	wget --continue https://openhab.ci.cloudbees.com/job/openHAB2/lastSuccessfulBuild/artifact/distribution/target/distribution-2.0.0-SNAPSHOT-runtime.zip
	docker build -t $(DOCKER_IMAGE_TAGNAME) .
	docker tag -f $(DOCKER_IMAGE_TAGNAME) $(DOCKER_IMAGE_NAME):latest

push:
	docker push $(DOCKER_IMAGE_NAME)

clean:
	rm -f *.zip
