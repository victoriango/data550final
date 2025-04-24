# build final report
ngo_report.html: ngo_report.Rmd \
	output/table1.rds output/figure1.png
	Rscript code/03_render_report.R
	
# build table 1
output/table1.rds: code/01_make_table1.R \
	data/cleaned_data.xlsx
	Rscript code/01_make_table1.R
  
# build figure 1
output/figure1.png: code/02_make_figure1.R \
	data/filtered_data.xlsx 
	Rscript code/02_make_figure1.R

# create filtered data  
data/filtered_data.xlsx: code/00_filter_data.R \
	data/cleaned_data.xlsx
	Rscript code/00_filter_data.R
 
# create cleaned data
data/cleaned_data.xlsx: code/00_clean_data.R \
	data/Adolescent_HIV_550.xlsx
	Rscript code/00_clean_data.R
	
# make rule to sync packages
.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"
	
# make rule to clean files before pushing
.PHONY: clean
clean:
	rm -f output*.rds && rm -f output/*.png && rm -f ngo_report.html
	
# Docker files
PROJECTFILES = \
  ngo_report.Rmd \
  code/00_clean_data.R \
  code/00_filter_data.R \
  code/01_make_table1.R \
  code/02_make_figure1.R \
  code/03_render_report.R \
  data/Adolescent_HIV_550.xlsx \
  Makefile \
  README.md \
  .gitignore
RENVFILES = \
  renv.lock \
  renv/activate.R \
  renv/settings.json \
  .Rprofile

# project image
final_project: Dockerfile $(PROJECTFILES) $(RENVFILES)
	docker build -t victoriango/final_project
	touch $@
	
# Windows users
docker-run:
	docker run -v "/$$(pwd)"/report:/project/report victoriango/final_project
	
# Mac users
docker-run-m:
	docker run -v "$$(pwd)"/report:/project/report victoriango/final_project