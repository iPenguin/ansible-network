NAME := nfs
TAG := latest
IMAGE_NAME := $(NAME)

.PHONY: help build clean

help:
	@printf "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\1 - \2/' | column -c2 -t -s :)\n"

build: ## Builds docker image latest
	docker build --pull -t $(IMAGE_NAME):latest .

clean: ## Remove built images
	docker rmi $(IMAGE_NAME):latest || true
	docker rmi $(IMAGE_NAME):$(TAG) || true
 
