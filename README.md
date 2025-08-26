# InventoryManagementSystem

This is an Inventory Management System built in the form of a GUI desktop application developed in Java using **_MySQL_** as its database. The GUI was designed using 
**_Swing_** and the database connectivity was managed using **_JDBC API_**.

This application can be used by any small to mid-sized stores to easily maintain and manage an inventory of all their-

- Products
- Suppliers
- Users
- Transactions

## Features of the Application

- Users can manage inventory and stock of all the products available in their store.

- Users can manage all sales and purchase transactions made by the store.

- Supports two user types:
  * i. Administrator
  * ii. Employee

[Admins have the ability to manage all other personnel.]

- Any transaction made automatically handles the stock availability in the inventory.

- Each section includes a search feature to make it easier for users to view the data they want to see.

- Users only need to enter the product code while making a sale and all the relevant details will be retrieved from the database automatically.

- Maintains a time log of all the users using the application.

## Application Preview

### Login Page
The login page takes in the credentials entered by the user and verifies with the database.

![login](screenshots/LoginPage.png?raw=true)

### Dashboard/Welcome Page
The landing page of the application after a successful login.

![Homepage](screenshots/HomePage.png?raw=true)

### Product 
The products section allows the user to add, edit and delete products from the store's inventory.

![Product](screenshots/ProductPage.png?raw=true)

### Current Stocks
This section allows the user to check the availability of every item.

![Stocks](screenshots/CurrentStocks.png?raw=true)

### Suppliers
Here, the user can manage and manipulate the record of all the suppliers associated with the store.

![Supplier](screenshots/SupplierPage.png?raw=true)

### Sales
This section is where users can sell a product and manage all the sales transactions. The user only needs to enter the customer and product code and the software will handle the rest, showing all the necessary details like available stock and selling price of the product.

![Sales](screenshots/SalesPage.png?raw=true)

### Purchase 
This section is where users can view purchase logs and enter new purchase transactions. Similar to the sales section, this section only requires the user to enter the product code and the details that are already available in the database will immediately be displayed in the respective spaces.

![Sales](screenshots/SalesPage.png?raw=true)

### Users
This section is only available to ADMINISTRATORS. It allows them to view, add and delete any users.

![Users](screenshots/UsersPage.png?raw=true)

### User Logs
Stores and shows the administrator a log of all the users that have previously logged in, including their login time and logout time.

![Userlogs](screenshots/UsersLogs.png?raw=true)

## Technologies Used
The following are the technologies that have been used in the development of this project. All of them are free to use.

* Apache NetBeans IDE (for the GUI designer)
* MySQL Server and Workbench
* JDK 24

### Source Code
The software code has been divided into four different packages:

* Data Access Object (DAO): Contains the data access layer of the software that interacts directly with the database and its tables. Used for retrieval and modification of data.
* Data Transfer Object (DTO): Contains the data transfer layer that allows the data to be transferred between the data access layer and the UI layer.
* Database: Contains the ConnectionFactory class that retrieves the database connection and verifies user credentials for the application.
* User Interface (UI): Contains all the GUI classes making up the interface layer of the software.
Click here to skip directly to the source code.

### Work-in-Progress
This project is a work in progress and more features are yet to be added with new technologies.
