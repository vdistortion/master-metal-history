!#/bin/sh
docker run -it --rm \
  -v $(pwd):/data \
  -w /data \
  frankywahl/latex pdflatex book.tex
