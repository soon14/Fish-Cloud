#!/usr/bin/env bash

# 更新本地代码
git pull
mvn clean
mvn package

# 停止并清除旧的Docker容器及镜像
docker-compose stop
docker-compose rm -f
docker-compose build
docker rmi $(docker images -f "dangling=true" -q)

# 运行服务
docker-compose up -d