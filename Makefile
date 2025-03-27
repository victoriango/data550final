#! add a rule for rendering the report
ngo_report.html: ngo_report.Rmd \
	output/table1.rds output/figure1.png
	Rscript code/03_render_report.R
	
output/table1.rds: code/01_make_table1.R \
	data/cleaned_data.xlsx
	Rscript code/01_make_table1.R
  
output/figure1.png: code/02_make_figure1.R \
	data/filtered_data.xlsx 
	Rscript code/02_make_figure1.R
  
data/filtered_data.xlsx: code/00_filter_data.R \
	data/cleaned_data.xlsx
	Rscript code/00_filter_data.R
  
data/cleaned_data.xlsx: code/00_clean_data.R \
	data/Adolescent_HIV_550.xlsx
	Rscript code/00_clean_data.R