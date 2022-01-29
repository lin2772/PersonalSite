build:
	rm -rf public
	hugo

sync:
	aws s3 sync --acl "public-read" public/ s3://hugo-demo-june27

build-deploy-local: build sync

all: build 