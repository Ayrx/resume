all: pdf

html:
	pandoc --standalone -c style.css --from markdown --to html -o resume.html resume.md

pdf: html
	wkhtmltopdf resume.html resume.pdf

clean:
	rm -rf resume.html
	rm -rf resume.pdf
