all: docker

docker:
	mkdir output
	docker run -v `pwd`/output:/opt/output --rm resume

clean:
	rm -rf output/
