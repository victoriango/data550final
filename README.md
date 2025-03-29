# DATA 550 final project

> **UNICEF Adolescent HIV Prevention Survey Data, 1999 - 2023**
>
> Author: Victoria Ngo

## Table of contents

-   [General Info](#general-info)
-   [Usage](#usage)
-   [Repository Contents](#repository-contents)
-   [Data Source](#data-source)
-   [Version](#version)

## General Info

The base dataset, compiled by UNICEF, describes key indicators in global adolescent HIV prevention from 1999-2023. The data was sourced from nationally representative population-based surveys, such as the AIDS Indicator Survey, Demographic and Health Survey, Multiple Indicator Cluster Survey, and others. Each line of data is a percentage of young persons' knowledge on comprehensive HIV prevention, condom use in high-risk sexual behavior, and HIV testing grouped by sex, age, marital status, urbanicity, and UNICEF designated geographic region where available. The percentile data is grouped by country, data source, year, and demographic.

## Usage

Please run the "make" command in the RStudio terminal to generate the rendered report (ngo_report.html) and its associated components.

## Repository Contents 

### *Final Report*

The final report (ngo_report.Rmd) can be found in the root directory. An HTML report file (ngo_report.html) will be **generated after running the "make" command in RStudio's terminal console**.

The report contains a table of country characteristics of by sex, age, marital status, urabanicity, and geographic region. Additionally, this report contains a figure visualizing a time distribution of martial status data collection by the South Asia region.

### *Code*

Code for data cleaning, data filtering, generating the report table, generating the report figure, and rendering the .Rmd report can be found in the "Code" subdirectory.

### *Data*

The original data from [**UNICEF**](https://data.unicef.org/resources/dataset/hiv-aids-statistical-tables/) can be found in the "Data" subdirectory. After running the data cleaning and filtering codes found in the "Code" subdirectory, "cleaned_data.xlsx" and "filtered_data.xlsx" will appear in the "Data" subdirectory.

### *Output*

Once the codes for generating the table and figure are run, the outputs will appear in the "Output" subdirectory.

## Data Source

More information on the original dataset can be found [**here**](https://data.unicef.org/resources/dataset/hiv-aids-statistical-tables/) on the UNICEF website by downloading the "Key Indicators in adolescent HIV prevention, 2000-2023" file.

## Version

This report was generated using RStudio 2024.12.1+563, Rtools 4.4, and R for Windows 4.4.3.
