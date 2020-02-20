VERSION=$(shell cat Version)
IMAGE=wiremock
IMAGE_TAG=$(IMAGE):$(VERSION)
IMAGE_LATEST=$(IMAGE):latest

ECR_IMAGE="dionefc/${IMAGE}"
ECR_IMAGE_VERSION="dionefc/${IMAGE_TAG}"

release:
	docker build --force-rm --compress --rm --file Dockerfile -t  $(IMAGE_LATEST) .
	docker build --force-rm --compress --rm --file Dockerfile -t  $(IMAGE_TAG) .
	docker tag $(IMAGE_LATEST) $(ECR_IMAGE):latest
	docker tag $(IMAGE_TAG) $(ECR_IMAGE_VERSION)
	docker push $(ECR_IMAGE_VERSION)
	docker push $(ECR_IMAGE):latest