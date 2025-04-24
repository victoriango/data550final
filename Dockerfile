#installing rpackages
#setup file paths for the image
#code
#entry point

FROM rocker/tidyverse

RUN apt-get update && apt-get install -y pandoc

RUN mkdir /project
WORKDIR /project

RUN mkdir code
RUN mkdir output
RUN mkdir data
COPY code code
COPY Makefile .
COPY ngo_report.Rmd .
COPY README.md .
COPY data data
COPY .gitignore .

COPY .Rprofile .
COPY renv.lock .
RUN mkdir renv
COPY renv/activate.R renv
COPY renv/settings.json renv

RUN Rscript -e "renv::restore(prompt = FALSE)"

RUN mkdir report

CMD make && mv ngo_report.html report