all: docker

docker: docker-build
	mkdir -p output
	docker run -v `pwd`/output:/opt/output --rm resume

docker-build:
	docker build -t resume .

clean:
	rm -rf output/
