CREATE TABLE petPet (
	petName VARCHAR(20) NOT NULL,
	owner VARCHAR(45),
	species VARCHAR(45),
	gender CHAR(1),
	birth DATE,
	death DATE,
	PRIMARY KEY (petName)
);

CREATE TABLE petEvent (
	petname VARCHAR(20) NOT NULL,
    eventdate DATE NOT NULL,
    eventtype VARCHAR(255),
    remark VARCHAR(255),
    PRIMARY KEY (petname, eventdate),
    FOREIGN KEY (petname) REFERENCES petPet(petname)
);

