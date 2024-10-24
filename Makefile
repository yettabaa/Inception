
all:
	docker-compose -f srcs/docker-compose.yml down ; docker-compose -f srcs/docker-compose.yml up --build
mkdir:
	sudo rm -rf $(HOME)/data
	mkdir -p $(HOME)/data/wordpress $(HOME)/data/mariadb && sudo chown -R 1000:1000 $(HOME)/data/wordpress $(HOME)/data/mariadb && sudo chmod -R 755 $(HOME)/data/wordpress $(HOME)/data/mariadb

clean:
	docker-compose -f srcs/docker-compose.yml down

db:
	docker build -t mymdb_image srcs/requirements/mariadb/ ; docker stop mymdb_container ;docker rm mymdb_container ; docker run -d --name mymdb_container --network wz3lqlawi -v db_data:/var/lib/mysql mymdb_image 

wp:
	docker build -t mywp srcs/requirements/wordpress/ ; docker rm wp_test ; docker run -it --name wp_test --network wz3lqlawi mywp

