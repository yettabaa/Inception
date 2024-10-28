all:
	-docker rm -f $$(docker ps -qa)
	docker-compose -f srcs/docker-compose.yml up --build

mkdir:
	sudo rm -rf $(HOME)/data
	mkdir -p $(HOME)/data/wordpress $(HOME)/data/mariadb
# sudo chown -R 1000:1000 $(HOME)/data/wordpress $(HOME)/data/mariadb
# sudo chmod -R 755 $(HOME)/data/wordpress $(HOME)/data/mariadb
status:
	docker ps

down:
	docker stop $$(docker ps -qa)

clean:
	-docker rm -f $$(docker ps -qa)
	-docker rmi -f $$(docker images -qa)
	-docker volume rm $$(docker volume ls -q)
	docker network rm $$(docker network ls --filter type=custom -q)

fclean: clean
	sudo rm -rf $(HOME)/data

cache:
	docker builder prune -f
	

