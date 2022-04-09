include .env

create:
	yc serverless container create --name $(SERVERLESS_CONTAINER_NAME)
	yc serverless container allow-unauthenticated-invoke --name  $(SERVERLESS_CONTAINER_NAME)

build:
	docker build -t $(YC_IMAGE_NAME) .

push:
	docker push $(YC_IMAGE_NAME)

deploy:
	yc serverless container revision deploy --container-name $(SERVERLESS_CONTAINER_NAME) --image '$(YC_IMAGE_NAME):latest' --service-account-id $(SERVICE_ACCOUNT_ID)  --environment='TELEGRAM_APITOKEN=$(TELEGRAM_APITOKEN),SERVERLESS_CONTAINER_URL=$(SERVERLESS_CONTAINER_URL)' --core-fraction 5

all:
	 docker build -t $(YC_IMAGE_NAME) .
	 docker push $(YC_IMAGE_NAME)
	yc serverless container revision deploy --container-name $(SERVERLESS_CONTAINER_NAME) --image '$(YC_IMAGE_NAME):latest' --service-account-id $(SERVICE_ACCOUNT_ID)  --environment='TELEGRAM_APITOKEN=$(TELEGRAM_APITOKEN),SERVERLESS_CONTAINER_URL=$(SERVERLESS_CONTAINER_URL)' --core-fraction 5