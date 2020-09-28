# Overview of the tools used
The european soccer sqlite database from Kaggle has been used to query out the results. I have used to two tools i.e., SQLite and SQLAlchemy ORM to answer few questions that I thought will help me summarise the information better. 

# Using the SQLite DB browser to query the database
I have answered the following questions by pure SQL querying using the SQL DB browser :- 
1. How to replace the team Ids with their names without using JOIN? I tried using the concept of correlated subquery to achieve this
2. How do you summarise the perfomances of all the 299 teams? 
3. Can you let me know which are the highest scoring matches in each season?
4. Can you let me know which team scored the the highest goals in its home ground for each season? (Same question answered for the overseas teams with a small tweak to the query).

# Using SQLAlchemy to query the database
As I have an intermediate knowledge of SQL concepts; switching to an ORM like SQLAlchemy was very smooth. The best advantage that an ORM like SQLAlchemy provides is:- 
1. The syntax is Pythonic.
2. Syntax and speed of execution is independent of the DBMS used in the background.
3. Each of the SQL statements are stored and executed as objects.
4. The output table can be readily converted to a DataFrame using Pandas and simultaneously visualized using MatPlotlib (I am currently preparing for it). Otherwise, such readily available visualizations can be made by integrating DBMS with a BI tool such as PowerBI or Tableau.

For the project I used Google Collab and tried to answer some few questions:
1. How to connect to a database using the SQLAlchemy connector and list all the tables in the database.
2. How does ORM executes the objects that store the SQL statements?
3. Season wise count for the total goals scored by teams in their home and overseas games.
4. Teams performing best before their home crowds.
5. Teams performing best before the overseas crowds.

This is the Kaggle link from where the Sqlite file has been downloaded: https://www.kaggle.com/hugomathien/soccer
