# FE21-CR09-Philip
Requirements
We will create a database for the e-commerce site, Famazon. 

Famazon is a site where customers can browse through and purchase products. These products are supplied by different companies. Famazon is the platform from where these companies can sell their products, but Famazon itself does not produce any of the products sold on its site.

In order for a customer to purchase a product, they will need to create an account, containing their personal data(e.g. name, address, username, email). They would also have to supply a form of payment(e.g. creditcard, paypal etc.). Each payment will have its own invoice. 

Once the  payment has been successful, the product will need to be shipped off to the customer’s provided address. There might be one company used to ship off products or several companies used for this.


For this CodeReview you are expected to ensure that your database is in 3rd Normal Form. All elements in the task description must be covered in your database design. (hint: use draw.io/app.diagrams tool, but try to draw the purchasing process first on paper before creating any diagrams in digital form). The brainstorming process is vital in order to design a correct Database. There should be one folder for the diagrams with 4 different files. Each diagram must be in a separate file. There should be another folder for the database file and this folder should have 2 different SQL files (the DB file and the queries file).
- Use the 4 steps for a database development process:
* Define the purpose - Cloud diagram
* The Entity model - ER diagram
* The Unified Modeling Language - Classes Diagram
* Refine and Normalize the Design
- Recreate your database design in MySQL. Name your database as cr9_famazon_johndoe (use your name instead of "johndoe"). The name must be as the task requests. Export your database as cr9_famazon_johndoe.sql and then upload the .sql file with the project to GitHub. Please remember to use the option “add create database” in the custom options. 
- Insert test data into the database (insert some dummy data in your database, at least 3 sets of data per table)
- Create at least 6 different SQL queries to show the power of your database (save these queries to a  cr9_famazon_johndoe_queries.sql file and upload it to the project) Note: The use of JOINS is required for at least three queries). Examples of queries: 
* how many products were bought from a specific company
* who purchased products on this date
* what  products were sent between this and that date, 
* how many products were sent to a specific city etc. 


Bonus points:
- Expand initial specification with more than 10 tables
- Create at least 2 extra JOINS in your SQL queries that connect more than 3 tables
