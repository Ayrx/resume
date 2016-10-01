FROM ubuntu:latest
MAINTAINER Terry Chia <terrycwk1994@gmail.com>

RUN apt-get update && apt-get install -y \
	zlib1g-dev \
	fontconfig \
	libfreetype6-dev \
	xorg \
	wget \
	xz-utils

COPY resume.md /resume/resume.md
COPY style.css /resume/style.css

WORKDIR /resume

RUN wget https://github.com/jgm/pandoc/releases/download/1.17.2/pandoc-1.17.2-1-amd64.deb && \
	dpkg -i pandoc-1.17.2-1-amd64.deb

RUN wget http://download.gna.org/wkhtmltopdf/0.12/0.12.3/wkhtmltox-0.12.3_linux-generic-amd64.tar.xz && \
	tar xvf wkhtmltox-0.12.3_linux-generic-amd64.tar.xz

ENTRYPOINT pandoc --standalone -c style.css --from markdown --to html -o resume.html resume.md && \
	/resume/wkhtmltox/bin/wkhtmltopdf resume.html /opt/output/resume.pdf
