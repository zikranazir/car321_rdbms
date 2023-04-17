# **CAR321 - An Database Management System For Used Cars Sales**

## **Project Objective**
Building a Relationship Database Management System (RDBMS) for selling used cars that allow users to offer their used cars and potential buyers to search and buy them.

------

## **Project Flowchart**

![flowchart](/src/flowchart.png)

-----

## **Conceptual Model**
Conceptual model expain the entities and the attributes.
![conceptual](/src/conceptual.png)

-----

## Physical Model
Physical model explain the entities, atributes and also the relationship
![physical](/src/physical.png)

-----

## Create Table
This query use for create table:
![create](/src/inserting.png)

---

## **Populating table techniques**
    1. Create Python script for [scraping from olx](/script_dummy/scraper_indonesian_cities.py)  to collect [dummy location data](/dummy_data/city_locations.csv) , there are 517 cities name with latitude and longitude.

    2. Create Python Script to create dummy data for `users` table. You can check the python script [here](/script_dummy/dummy_user.py) and the dummy data [here](/dummy_data/users.csv).

    3. Create Python Script to scraping dummy data for `advertisements` table from Moladin (cars data). You can check the python script [here](/script_dummy/user_location_dict.py) and the dummy data [here](/dummy_data/dummy_advertisements.csv).

    4. Create Python Script to generates dummy data for `bids` table. You can check the python script [here](/script_dummy/dummy_bid.py) and the dummy data [here](/dummy_data/bids.csv).


## **Test Case and Report**
### Transactional Query 
Find cars based on the city and calculate the distance usign euclidean distance.
![trans](/src/transactional.png)

### Analytical Query
Ranking Cars Popularity based on total bids.
![analytical](/src/analytical.png)

### Full Report
You can check the full report for this project [here](/CAR321.pdf) or on [google slide](https://docs.google.com/presentation/d/1CESiB94CC_yoZqOshVlNAXXy-8rspaqON-o-kuhpjl0/edit?usp=sharing).


*last update 16 April 2023