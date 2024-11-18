all: up

up:
	docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker-compose -f ./srcs/docker-compose.yml down

fclean:
	# @if [ $(shell docker images -qa) ]; then \
	# 	# docker stop $$(shelldocker ps -q); \
	# 	docker rm $(shell docker ps -qa); \
	# 	docker rmi $(shell docker images -qa); \
	# fi
	# @echo $(shell docker images -qa);
	@docker volume prune -fa
	@docker network prune -f
	@docker system prune -fa

.PHONY: up down fclean
