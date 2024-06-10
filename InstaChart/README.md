# InstaCart DB
## By Ifeoma Amadike
---
![](Images/logo.png)
---
## INTRODUCTION 
---
Instacart, an American company, provides grocery delivery and pick-up services in the United States and Canada. Customers can access these services through a website and a mobile app, enabling them to order groceries from participating retailers. Personal shoppers then handle the shopping on behalf of the customers. This project specifically focuses on the denormalization of the Instacart orders dataset, along with some basic data analysis.

---
# SKILLS DEMONSTRATED
---
I used advanced SQL functions to import and normalize the dataset. Subsequently, I performed basic data analysis by querying the database, all within the PostgreSQL environment.

I created four(4) Tables which are 

---
### DEPARTMENTS TABLE
![](Images/departments_query.png)
### RESULT
![](Images/departments_table.png)

---
### AISLES TABLE 
![](Images/aisles_query.png)
### RESULT
![](Images/aisles_table.png)

---
### PRODUCTS TABLE
![](Images/products_query.png)
### RESULTS
![](Images/products_table.png)

---
### ORDERS TABLE
![](Images/orders_query.png)
### RESULTS
![](Images/orders_table.png)

---
## DATA MODELLING
The result of the table created  can be seen in this data model(STAR SCHEMA);
DATA MODEL
![](Images/data_model.png)

---
## DATA ANALYSIS & VISUALIZATIONS
I'll be using this database to solve the business problems that the owner of Instacart is interested in understanding and addressing.
### BUSINESS PROBLEMS

---
* Q1 What are the top-selling products by revenue, and how much revenue have they generated?
  ### QUERY
  ![](Images/question1.png)
  RESULT
![](Images/question1_result.png)

INSIGHT:::The top-selling product is the "Vanilla, Tangerine & Shortbread Ice Cream" with a total revenue of $20,496.00.


---
* Q2 On which day of the week are chocolates mostly sold?
### QUERY
![](Images/question2.png)
### RESULT
![](Images/question2_result.png)

INSIGHT::: The Day of the Week Chocolate sold mostly is Sunday , 8572 chocalates was sold.

---
* Q3 Do we have any dept where we have made over $15m in revenue and what is the profit?
  ### QUERY
  ![](Images/question3.png)
  ### RESULT
  ![](Images/question3_result.png)

  INSIGHT::: We have seven(7) different deparment that made over $15m in revenue ,the highest department was Personal care Department
  with $3917531 revenue

  ---

*Q4 Is it true that customers buy more alcoholic products on Xmas day 2019?
### QUERY
![](Images/question4.png)
### RESULTS
![](Images/question4_result.png)

INSIGHT:::  A Customer bought 14 Coastal Chardonnay Wine on the Xmas day 2019 


---
* Q5. Which year did Instacart generate the most profit?

### QUERY
![](Images/question5.png)
### RESULTS
![](Images/question5_result.png)

INSIGHT::: Instacart generate the most profit of $3619153 in 2020 

---
* Q6.  How long has it been since the last cheese order?

### QUERY
![](Images/question6.png)
### RESULTS
![](Images/question6_result.png)

INSIGHT:::  It has been 30 days since the last order


---
* Q7. What time of the day do we sell alcohols the most?

### QUERY
![](Images/question7.png)
### RESULTS
![](Images/question7_result.png)


INSIGHT:::  The time of the day we sell alcohol most is 10am with total sales of 19748

---
* Q8.  What is the total revenue generated in Qtr. 2 & 3 of 2016 from breads?

### QUERY
![](Images/question8.png)
### RESULTS
![](Images/question8_result.png)

INSIGHT:::  The total revenue generated in Qtr. 2 & 3 of 2016 from breads $325498.00.

---

* Q9 Which 3  products do people buy at night(2020 - 2022)?

### QUERY
![](Images/question9.png)
### RESULTS
![](Images/question9_result.png)

INSIGHT:::  The 3 Products people buy at Night is Tangerine Immunity Defense Powder ,Ready Crust Shortbread 9 Inch Pie Crust and
Vegetable & Pepper Jack Cheese Flatbread Breakfast Sandwich.

---

* Q10. What is the total revenue generated from juice products?

### QUERY
![](Images/question10.png)
### RESULTS
![](Images/question10_result.png)

INSIGHT::: The total revenue generated from juice products is $5807518.00


  





