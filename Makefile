all: up

up:
	docker-compose -f ./srcs/docker-compose.yml up --build

down:
	docker-compose -f ./srcs/docker-compose.yml down

fclean:
	@if [ $(shell docker images -qa) ]; then \
		docker rm -f $(shell docker ps -qa); \
		docker rmi -f $(shell docker images -qa); \
	fi
	@docker volume prune -fa
	@docker network prune -f
	@docker system prune -fa

re: fclean all

.PHONY: up down fclean
