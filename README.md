# Life Expectancy of Maryland Counties

Using [2018-2020 SHIP life expectancy data](https://opendata.maryland.gov/Health-and-Human-Services/SHIP-Life-Expectancy-2010-2020/5imf-t65z/data) and [2016-2020 ACS socioeconomic characteristics data](https://opendata.maryland.gov/Demographic/Maryland-Counties-Socioeconomic-Characteristics-20/is7h-kp6x/about_data) of Maryland Counties, I will be conducting a logistic regression in R predicting the odds of a given county having above state average life expectancy, 78.6 years, based on median household income, education level, racial composition, and sex composition.

## Getting Started

### Built With 

* <img src="https://github.com/marimax88/mdlifeexp/assets/153661086/93b067da-67f3-4ecc-83d1-298e65a95cc8" width="100">
* <img src="https://github.com/marimax88/mdlifeexp/assets/153661086/1a8e1c46-c997-4efa-9deb-096f0b44effa" width="50" height="50">
* <img src="https://github.com/marimax88/mdlifeexp/assets/153661086/9c5f247f-2a69-4cc3-b553-e05d7bf94422" width="50" height="50">

### Installing and Executing

* Download ZIP
* Navigate to the life_exp folder
  * Subfolders:
    * _site: hosts the rendered html files
    * scatterplot: hosts the Shiny application code and the life expectancy and socioeconomic data
    * Maryland_Physical_Boundaries_-_County_Boundaries_(Generalized): hosts the MD county shapefile
* Open background.qmd
* Hit Render

## Data Sources
* [2018-2020 SHIP life expectancy data](https://opendata.maryland.gov/Health-and-Human-Services/SHIP-Life-Expectancy-2010-2020/5imf-t65z/data)
* [2016-2020 ACS socioeconomic characteristics data](https://opendata.maryland.gov/Demographic/Maryland-Counties-Socioeconomic-Characteristics-20/is7h-kp6x/about_data)
* [Maryland Physical Boundaries - County Boundaries (Generalized)](https://data.imap.maryland.gov/datasets/4c172f80b626490ea2cff7b699febedb/explore)
