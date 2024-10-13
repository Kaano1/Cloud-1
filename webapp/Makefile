CD = cd
FCOMPOSE = ./src/
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
	$(CD) $(FCOMPOSE) && $(RM_IMAGE) && $(RM_VOLUME) && $(RM_CONTAINER)

reload:
	bash setAWS.sh && bash setIp.sh

re: clean up

.PHONY: up down clean re
