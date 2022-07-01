create database Manufacturer;


create SCHEMA cho;

CREATE TABLE [cho].[Product](
	[Prod_id] [int] PRIMARY KEY NOT NULL,
	[Prod_Name] [nvarchar](50) NOT NULL,
	[quantity] INT NOT NULL
	);

select * 
from cho.Product


CREATE TABLE [cho].[Supplier](
	[Supp_ID] [int] PRIMARY KEY NOT NULL,
	[Supp_Name] [nvarchar](50) NOT NULL,
    [Supp_location] [nvarchar](50) NOT NULL,
    [Supp_country] [nvarchar](50) NOT NULL,
	[is_active] [BIT] NOT NULL
	);

select * 
from cho.Supplier

CREATE TABLE [cho].[Component](
	[comp_id] [int] PRIMARY KEY NOT NULL,
	[comp_Name] [nvarchar](50) NOT NULL,
    [Description] [nvarchar](50) NOT NULL,
    [quantity_comp] [int]  NOT NULL
	);

select * 
from cho.Component

CREATE TABLE [cho].[Prod_Comp](
	[Prod_id] [int] NOT NULL,
	[comp_id] [int] NOT NULL,
	PRIMARY KEY([Prod_id],[comp_id])
)

alter table [cho].[Prod_Comp]
add quantity_comp int not null;

alter table cho.Prod_Comp
add CONSTRAINT fk1
foreign key (Prod_id)
REFERENCES cho.product (Prod_id)

alter table cho.Prod_Comp
add CONSTRAINT fk2
foreign key (comp_id)
REFERENCES cho.Component (comp_id)

CREATE TABLE [cho].[Comp_Supp](
	[supp_id] [int] NOT NULL,
	[comp_id] [int] NOT NULL,
	[order_date] [date] NOT NULL,
	[quantity] [int] not null,
	PRIMARY KEY([supp_id],[comp_id])
)

alter table [cho].[Comp_Supp]
add constraint fk01
FOREIGN key (supp_id)
REFERENCES	cho.Supplier (supp_id)

alter table [cho].[Comp_Supp]
add constraint fk02
FOREIGN key (comp_id)
REFERENCES	cho.Component (comp_id)
