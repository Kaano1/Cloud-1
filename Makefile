CD = cd
FCOMPOSE = ./srcs/wordpress/wp-project/
RM_VOLUME = docker volume prune -af
RM_IMAGE = docker image prune -af
RM_CONTAINER = docker container prune -f
UP = docker-compose up
DOWN = docker-compose down

up:
	$(CD) $(FCOMPOSE) && $(UP)

upd:
	$(CD) $(FCOMPOSE) && $(UP) -d

down:
	$(CD) $(FCOMPOSE) && $(DOWN)

clean: down
	$(CD) $(FCOMPOSE) && $(RM_IMAGE) && $(RM_VOLUME) && $(RM_CONTAINER) && docker volume rm cloud-1_db_data

reload:
	bash setIp.sh

re: clean up

.PHONY: up down clean re
