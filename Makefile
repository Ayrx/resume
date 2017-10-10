all: docker

docker:
	rm -rf output && mkdir -p output
	docker run -v `pwd`/output:/opt/output -v `pwd`:/opt/input --rm resume

docker-build:
	docker build -t resume .

clean:
	rm -rf output/
