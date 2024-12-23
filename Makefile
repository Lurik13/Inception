all:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

up:
	@docker compose -f ./srcs/docker-compose.yml up -d

down:
	@docker compose -f ./srcs/docker-compose.yml down

fclean: down
	@docker system prune -fa --volumes
	@sudo sh -c "rm -rf /home/lribette/data/mariadb/*"
	@sudo sh -c "rm -rf /home/lribette/data/wordpress/*"

re: fclean all

.PHONY: up down fclean re
