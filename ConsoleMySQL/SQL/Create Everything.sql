DROP DATABASE IF EXISTS DevTools;

-- Create a new database
CREATE DATABASE DevTools;

-- Use the newly created database
USE DevTools;

CREATE TABLE MenuItemCategory (
    itemCategoryID varchar(3) not null,
    itemCategoryDescription varchar(20) not null,
    PRIMARY KEY (itemCategoryID)
);

CREATE TABLE MenuItem (
    itemID int not null,
    itemCategoryID varchar(3) not null,
    description varchar(80) not null,
    price int not null,
    vegetarian boolean not null,
    primary key (itemID),
    foreign key (itemCategoryID) references MenuItemCategory(itemCategoryID) on delete cascade
);

CREATE USER IF NOT EXISTS DevToolsUser IDENTIFIED BY 'DevTools';
-- GRANT must be after Tables are created
GRANT SELECT, INSERT, UPDATE, DELETE ON DevTools.* TO DevToolsUser;

INSERT INTO MenuItemCategory VALUES ('APP', 'Appetizer');
INSERT INTO MenuItemCategory VALUES ('BEV', 'Beverage');
INSERT INTO MenuItemCategory VALUES ('DES', 'Dessert');
INSERT INTO MenuItemCategory VALUES ('ENT', 'Entree');

-- MenuItem
INSERT INTO MenuItem VALUES(101,'APP','beet and orange salad',16,true);
INSERT INTO MenuItem VALUES(102,'APP','oysters rockefeller',20,false);
INSERT INTO MenuItem VALUES(103,'APP','pan seared foie gras',28,false);
INSERT INTO MenuItem VALUES(104,'APP','porchini and asparagus risotto',15,true);
INSERT INTO MenuItem VALUES(105,'APP','beef carpaccio',18,false);
INSERT INTO MenuItem VALUES(106,'APP','diver digby scallops three ways',22,false);
INSERT INTO MenuItem VALUES(107,'APP','ahi tuna',24,false);
INSERT INTO MenuItem VALUES(108,'APP','calamari',15,false);
INSERT INTO MenuItem VALUES(109,'APP','crab cake',13,false);
INSERT INTO MenuItem VALUES(110,'APP','caprese salad with pine nuts',16,true);
INSERT INTO MenuItem VALUES(111,'APP','braised rabbit canneloni',16,false);
INSERT INTO MenuItem VALUES(112,'APP','half moon river clams',20,false);
INSERT INTO MenuItem VALUES(113,'APP','black-eyed pea patty with tomato relish',15,false);
INSERT INTO MenuItem VALUES(114,'APP','french onion soup',15,true);
INSERT INTO MenuItem VALUES(201,'ENT','black cod',28,false);
INSERT INTO MenuItem VALUES(202,'ENT','seared digby scallops on leek fettuccine',30,false);
INSERT INTO MenuItem VALUES(203,'ENT','duck two ways',28,false);
INSERT INTO MenuItem VALUES(204,'ENT','herb crusted rack of lamb',32,false);
INSERT INTO MenuItem VALUES(205,'ENT','boneless quails stuffed with foie gras and truffles',32,false);
INSERT INTO MenuItem VALUES(206,'ENT','fresh pasta with arugula and cherry tomatoes',22,true);
INSERT INTO MenuItem VALUES(207,'ENT','lamb shank nehari',28,false);
INSERT INTO MenuItem VALUES(208,'ENT','beef tenderloin',38,false);
INSERT INTO MenuItem VALUES(209,'ENT','chicken valdostana',25,false);
INSERT INTO MenuItem VALUES(210,'ENT','char grilled AAA tenderloin with grilled shrimp',42,false);
INSERT INTO MenuItem VALUES(211,'ENT','ratatouille with garlic beans and saffron rice',27,true);
INSERT INTO MenuItem VALUES(212,'ENT','boeuf bourguignon',34,false);
INSERT INTO MenuItem VALUES(213,'ENT','sweet potato ravioli with apricot moustarda',30,true);
INSERT INTO MenuItem VALUES(214,'ENT','baked sage grits and vegetable hash',28,true);
INSERT INTO MenuItem VALUES(215,'ENT','parmesan dusted flounder with spiced quail',30,false);
INSERT INTO MenuItem VALUES(301,'DES','lemon tart',12,true);
INSERT INTO MenuItem VALUES(302,'DES','une meule',14,true);
INSERT INTO MenuItem VALUES(303,'DES','baked alaska',16,true);
INSERT INTO MenuItem VALUES(304,'DES','mignardises',9,true);
INSERT INTO MenuItem VALUES(305,'DES','house made gelato',9,true);
INSERT INTO MenuItem VALUES(306,'DES','creme brulee',13,true);
INSERT INTO MenuItem VALUES(307,'DES','seasonal berries with cream',11,true);
INSERT INTO MenuItem VALUES(308,'DES','rhubarb trifle with mascarpone',12,true);
INSERT INTO MenuItem VALUES(309,'DES','doughnut and jam sampler',13,true);
INSERT INTO MenuItem VALUES(310,'DES','chocolate mousse',12,true);