
all:
	-docker rm -f $$(docker ps -qa)
	docker-compose -f srcs/docker-compose.yml up --build

mkdir:
	sudo rm -rf $(HOME)/data
	mkdir -p $(HOME)/data/wordpress $(HOME)/data/mariadb && sudo chown -R 1000:1000 $(HOME)/data/wordpress $(HOME)/data/mariadb && sudo chmod -R 755 $(HOME)/data/wordpress $(HOME)/data/mariadb



clean:
	-docker rm -f $$(docker ps -qa)
	-docker rmi -f $$(docker images -qa)
	-docker volume rm $$(docker volume ls -q)
	docker network rm $$(docker network ls --filter type=custom -q)
cache:
	docker builder prune -f
	
db:
	-docker build -t dbi srcs/requirements/mariadb/ 
	-docker stop test_db ;docker rm test_db  
	docker run -it --name test_db --network wz3lqlawi -v mariadb:/var/lib/mysql dbi 

wp:
	-docker build -t mywp srcs/requirements/wordpress/
	-docker rm wp_test
	docker run -it --name wp_test --network wz3lqlawi mywp

ftp:
	-docker build -t ftp_beta srcs/requirements/bonus/ftp
	-docker rm -f ftp_beta
	docker run -it --name ftp_beta --network Inception -v wordpress:/var/www/html -p 21:21 -p 20:20 -p 40000-40005:40000-40005 ftp_beta

