# Mapping Baltimore's Vacancies

I am providing the code for the map that I and Kriston Capps described in the Atlantic Citylab's feature on May 27, 2015, [Mapping the Density of Baltimore's Vacant Housing Crisis](http://www.citylab.com/housing/2015/05/mapping-the-density-of-baltimores-vacant-housing-crisis/394196/). 

There is essentially one R file that requires the installation of the following packages:

- rgeos
- rgdal
- sp
- leafletR

And a source map in Shapefile format from the NHGIS, joined with data on the fraction of vacancies. The column of 'frac_vacan' was generated using QGIS GUI. Pretty easy to do with R directly as well. The Shapefile and the census data can be freely downloaded [here](https://www.nhgis.org/) by creating an account.

The map can easily be adjusted to depict vacancies in other core based statistical areas.

The output is available at [this address](http://www.ouazad.com/Maps/Baltimore_Vacancies/index.html).


