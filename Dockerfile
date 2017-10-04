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

ADD https://github.com/jgm/pandoc/releases/download/1.17.2/pandoc-1.17.2-1-amd64.deb /resume
RUN dpkg -i pandoc-1.17.2-1-amd64.deb

ADD https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz /resume
RUN tar xvf wkhtmltox-0.12.4_linux-generic-amd64.tar.xz

ENTRYPOINT pandoc --standalone -c style.css --from markdown --to html -o resume.html resume.md && \
	/resume/wkhtmltox/bin/wkhtmltopdf resume.html /opt/output/resume.pdf
