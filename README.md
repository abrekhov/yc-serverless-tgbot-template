# yc-serverless-tgbot-template

Thie repo shows how to make simple telegram bot with webhook on Yandex Serverless Containers.

## Prerequisite

- Make installed
- yc installed and inited
- service account with at lease image.puller role
- Telegram bot is created and you have bot token

## Quickstart

- Clone repo

```bash
git clone https://github.com/abrekhov/yc-serverless-tgbot-template.git
cd yc-serverless-tgbot-template
```

- Create your registry

```bash
yc container registry create <your_registry_name>
```

- Insert your bot token, registry url, container name and so on in the .env file

```bash
cp .env.example .env
vi .env
```

- Create serverless container

```bash
make create
```

- Build and push your image

```bash
make build
make push
```

- Deploy to Yandex Cloud

```bash
make deploy
```
