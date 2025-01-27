install: 
	pip install --upgrade pip &&\
	pip install -r requirements.txt
		
format:
	black *.py
	
lint:
	pylint --disable=R,C main.py hello.py
		
build:
	rm -rf public
	hugo

sync:
	aws s3 sync --acl "public-read" public/ s3://hugo-demo-june27

build-deploy-local: build sync

clean:
	echo "deleting generated HTML"
	rm -rf public

all: install lint build 