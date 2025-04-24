# DATA 550 Final Project

> **UNICEF Adolescent HIV Prevention Survey Data, 1999 - 2023**
>
> Author: Victoria Ngo

## Table of contents

-   [General Info](#general-info)
-   [Usage](#usage)
    -   [Report Generation *with* Docker](#report-generation-with-docker)
    -   [Report Generation *without* Docker](#report-generation-without-docker)
-   [Repository Contents](#repository-contents)
    -   [Final Report](#final-report)
    -   [Code](#code)
    -   [Data](#data)
    -   [Output](#output)
-   [Data Source](#data-source)
-   [Version](#version)

## General Info

The base dataset, compiled by UNICEF, describes key indicators in global adolescent HIV prevention from 1999-2023. The data was sourced from nationally representative population-based surveys, such as the AIDS Indicator Survey, Demographic and Health Survey, Multiple Indicator Cluster Survey, and others. Each line of data is a percentage of young persons' knowledge on comprehensive HIV prevention, condom use in high-risk sexual behavior, and HIV testing grouped by sex, age, marital status, urbanicity, and UNICEF designated geographic region where available. The percentile data is grouped by country, data source, year, and demographic.

## Usage

### **Report Generation *with* Docker**

Easy report generation using the `Dockerfile` and `Makefile`

#### 1. Building the Docker Image (pick one method)

-   **Option 1**: Use a `make` command

    ``` bash
    make project_image
    ```

-   **Option 2**: Pull from Docker Hub (<https://hub.docker.com/r/victoriango/final_project>)

    ``` bash
    docker pull victoriango/final_project
    ```

-   **Option 3**: Build manually

    ``` bash
    docker build -t victoriango/final_project .
    ```

#### 2. Generate the Report

-   **For Windows**

    ``` bash
    make docker-run
    ```

-   **For macOS / Linux**

    ``` bash
    make docker-run-m
    ```

#### 3. Output

The final report will be available in the `report/` folder.

------------------------------------------------------------------------

### **Report Generation *without* Docker**

If you have R and the required packages already installed, you can generate the report directly using `make`.

#### 1. Install packages via renv

To load and sync the RStudio packages used to create ngo_report.Rmd, please run the **"make install"** command inside the RStudio terminal. This will allow the user (you!) to have all of the necessary packages installed and ready to generate the ngo_report.HTML file.

``` bash
make install
```

#### 2. Generate the report

``` bash
make
```

#### 3. Output

The final report will be available in the main project folder.

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
