RM = rm -f
ZIP = zip -r
FILE = ./webapp
ZIP_FILE = webapp.zip

all:
	$(RM) $(ZIP_FILE)
	$(ZIP) $(ZIP_FILE) $(FILE)
	ansible-playbook -i hosts.ini run.yml --private-key /home/kaan/myComputer.pem

connect:
	ssh -i /home/kaan/myComputer.pem ec2-user@#IP

.PHONY: all