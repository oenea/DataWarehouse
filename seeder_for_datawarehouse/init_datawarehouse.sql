CREATE DATABASE DataWarehouse
GO

USE DataWarehouse
GO


CREATE TABLE Junk
(
    junk_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    status_ varchar(255) NOT NULL,
    wasReturnedOnWarranty varchar(255) NOT NULL CHECK (wasReturnedOnWarranty IN (N'Yes', N'No'))
);

CREATE TABLE Material
(
	material_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
	material_name varchar(255) NOT NULL,
	material_type varchar(255) NOT NULL
);

CREATE TABLE Employee
(
    employee_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    name_ varchar(255) NOT NULL,
	career_stage varchar(255) NOT NULL,
    age integer NOT NULL
);

CREATE TABLE Date_
(
    date_ DATETIME PRIMARY KEY NOT NULL,
    year_ varchar(255) NOT NULL,
    month_ varchar(255) NOT NULL, --CHECK (month_ IN (N'January', N'February', N'March', N'April', N'May', N'June', N'July', N'August', N'September', N'October', N'November', N'December')),
    monthNumber integer NOT NULL,
    day_ integer NOT NULL,
    dayOfWeekNumber integer NOT NULL,
    dayOfWeek_ varchar(255) NOT NULL -- CHECK (dayOfWeek_ IN (N'Monday', N'Tuesday', N'Wednesday', N'Thursday', N'Friday', N'Saturday', N'Sunday'))
);

CREATE TABLE ProductCatalogue
(
    productCatalogue_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    name_ varchar(255) NOT NULL,
    material_id UNIQUEIDENTIFIER,
    product_line varchar(255) NOT NULL,
    category varchar(255) NOT NULL,
	introduction_date DATETIME,
	is_current varchar(255),
	FOREIGN KEY (material_id) REFERENCES Material (material_id),
    FOREIGN KEY (introduction_date) REFERENCES Date_ (date_),
);

CREATE TABLE Products
(
    products_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
	productCatalogue_id UNIQUEIDENTIFIER,
	serial_number UNIQUEIDENTIFIER,
    FOREIGN KEY (productCatalogue_id) REFERENCES ProductCatalogue (productCatalogue_id),
);


CREATE TABLE Returns_
(
    returns_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    company_cost decimal(18, 2) NOT NULL,
    processing_time_days integer NOT NULL,
	days_since_purchase integer NOT NULL,
	products_id UNIQUEIDENTIFIER,
	junk_id UNIQUEIDENTIFIER,
	processing_started_id DATETIME,
	processing_finished_id DATETIME,
    FOREIGN KEY (products_id) REFERENCES Products (products_id),
    FOREIGN KEY (junk_id) REFERENCES Junk (junk_id),
    FOREIGN KEY (processing_started_id) REFERENCES Date_ (date_),
    FOREIGN KEY (processing_finished_id) REFERENCES Date_ (date_)
);


CREATE TABLE ProductSales
(
    productSales_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
	products_id UNIQUEIDENTIFIER,
    price decimal NOT NULL,
    discount_applied integer NOT NULL,
	date_ DATETIME,
    FOREIGN KEY (date_) REFERENCES Date_ (date_),
	FOREIGN KEY (products_id) REFERENCES Products (products_id)
);


CREATE TABLE ReturnProcessing
(
	returnProcessing_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
	employee_id UNIQUEIDENTIFIER,
	returns_id UNIQUEIDENTIFIER,
    FOREIGN KEY (employee_id) REFERENCES Employee (employee_id),
    FOREIGN KEY (returns_id) REFERENCES Returns_ (returns_id)
);

