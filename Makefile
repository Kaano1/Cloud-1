RM = rm -f
ZIP = zip -r
FILE = ./webapp
ZIP_FILE = webapp.zip

all:
	$(RM) $(ZIP_FILE)
	mkdir -p ./webapp/src/certbot/conf
	mkdir -p ./webapp/src/certbot/data
	mkdir -p ./webapp/src/certbot/logs
	mkdir -p ./webapp/src/wordpress
	$(ZIP) $(ZIP_FILE) $(FILE)
	ansible-playbook -i hosts.ini run.yml --private-key /home/myComputer.pem

connect:
	ssh -i /home/myComputer.pem ec2-user@16.171.54.208

.PHONY: all