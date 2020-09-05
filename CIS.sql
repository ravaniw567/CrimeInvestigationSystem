CREATE TABLE ADMIN(
ANAME VARCHAR(10),
APWD VARCHAR(10)
);

insert into admin values('admiin',123);

DROP TABLE ADMIN;
select * from admin;
commit;


CREATE TABLE OFFICER(

OID NUMBER(5) PRIMARY KEY,
PWD VARCHAR(10),
ONAME VARCHAR(10),
OPHN NUMBER(10),
OADDRESS VARCHAR(20),
OEMAIL VARCHAR(20) NOT NULL,
OAREA VARCHAR(10),
OIMG BLOB
);

DROP TABLE OFFICER;



CREATE TABLE EVIDENCE(
CASEID NUMBER(5) PRIMARY KEY,
ETYPE VARCHAR(10),
EVIDENCE VARCHAR(10),
SUSPECT VARCHAR(10),
NOTE VARCHAR(20),
POINTS VARCHAR(5),

CONSTRAINT ABC FOREIGN KEY(OID) REFERENCES OFFICER(OID)
);


DROP TABLE OFFICER;




CREATE TABLE CASEE(
CASEID NUMBER(5) PRIMARY KEY,
CNAME VARCHAR(10),
NOTE VARCHAR(10),

CONSTRAINT XYZ FOREIGN KEY(OID) REFERENCES OFFICER(OID),
CONSTRAINT PQR FOREIGN KEY(SNO) REFERENCES SUSPECT(SNO)
);

DROP TABLE CASEE;





CREATE TABLE SUSPECT(

SNO NUMBER(4) PRIMARY KEY,
SNAME VARCHAR(10),
IMPROSONMENT VARCHAR(10),
SADD VARCHAR(10),
REATION VARCHAR(4),
NOTE VARCHAR(10),
SHAIRS BLOB,
SEYES BLOB ,
SLIPS BLOB,
SNOSE BLOB,

CONSTRAINT STU FOREIGN KEY(CASEID) REFERENCES CASEE(CASEID)
);

DROP TABLE SUSPECT;






CREATE TABLE JAIL(
JNAME VARCHAR(10),
JAREA VARCHAR(10),
JPIN NUMBER(4),
JRANK NUMBER(4)
);

DROP TABLE JAIL;





CREATE TABLE POLICESTATION(
PNAME VARCHAR(10),
PAREA VARCHAR(10),
PIN NUMBER(4),
INCHARGE VARCHAR(10),

CONSTRAINT UVW FOREIGN KEY(SNO) REFERENCES SUSPECT(SNO)
);

DROP TABLE POLICESTATION;





CREATE TABLE RESULT(
);




create table report(
cid int primary key,
nam varchar(10)
);
drop table report;
create sequence cid minvalue 100 start with 100 cache 10;

drop sequence cid;

alter table report cid default cid.nextval; 
alter table report drop column cid;
alter table report cid default cid.nextval;

insert into report values(cid.nextval,'abc');

select * from report;




create table demo(
idd number generated always by default on null as identity start with 100 increment by 1,
desciption varchar(10) not null
);


desc  report;


@automatickeygenerator(cachesize="3",
name="mySqlServerID",
type=AutomaticKeyGeneration.AutomaticKeyGenerationType.IDENTITY)