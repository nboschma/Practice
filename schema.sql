CREATE TABLE Students (
    sno CHAR(9) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    program VARCHAR(25)
);

CREATE TABLE Labs (
    bno CHAR(3),
    rno CHAR(4),
    program VARCHAR(25),
    capacity INTEGER,
    description VARCHAR(1024),
    PRIMARY KEY (bno, rno)
);

CREATE TABLE Locks (
    lid CHAR(10) PRIMARY KEY,
    bno CHAR(3),
    rno CHAR(4),
    status VARCHAR(10) NOT NULL,
    FOREIGN KEY (bno, rno) REFERENCES Labs
);

-- Only store the current ownership data
CREATE TABLE Cardkeys (
    cid CHAR(16) PRIMARY KEY,
    sno CHAR(9) REFERENCES Students
);

-- Only store the current authorization data
CREATE TABLE Authorization (
    cid CHAR(16) REFERENCES Cardkeys,
    bno CHAR(3),
    rno CHAR(4),
    expireDate DATE,
    PRIMARY KEY (cid, bno, rno),
    FOREIGN KEY (bno, rno) REFERENCES Labs
);

-- Only store the access records
-- that are consistent with current
-- ownership and authorization data
CREATE TABLE AccessRecord (
    cid CHAR(16) REFERENCES Cardkeys,
    lid CHAR(10) REFERENCES Locks,
    accessTime DATE,
    result VARCHAR(10) NOT NULL,
    PRIMARY KEY (cid, lid, accessTime)
);

insert into Students values (123123121, 'test', 'Computing Science');
insert into Students values (123123122, 'test', 'Biology');
insert into Students values (123123123, 'test', 'Computing Science');
insert into Students values (123123124, 'test', 'Computing Science');
insert into Students values (123123125, 'test', 'Computing Science');
insert into Students values (123123126, 'test', 'Chemistry');
insert into Students values (123123127, 'test', 'Computing Science');
insert into Students values (123123128, 'John Smith', 'Computing Science');

insert into Labs values ('315', '1150', 'Computing Science', 2525, 'computer lab');
insert into Labs values ('315', '1151', 'Computing Science', 25, 'computer lab');
insert into Labs values ('315', '1152', 'Computing Science', 25, 'computer lab');
insert into Labs values ('100', '1150', 'Biology', 25, 'computer lab');
insert into Labs values ('100', '1151', 'Biology', 25, 'computer lab');
insert into Labs values ('100', '1152', 'Biology', 25, 'computer lab');
insert into Labs values ('100', '1153', 'Biology', 25, 'computer lab');
insert into Labs values ('200', '1150', 'Chemistry', 25, 'computer lab');
insert into Labs values ('200', '1151', 'Chemistry', 25, 'computer lab');
insert into Labs values ('200', '1152', 'Chemistry', 25, 'computer lab');
insert into Labs values ('200', '1153', 'Chemistry', 25, 'computer lab');

insert into Locks values ('1231231231', '315', '1150', 'Good');
insert into Locks values ('1231231212', '315', '1150', 'Good');
insert into Locks values ('1231231232', '315', '1151', 'Good');
insert into Locks values ('1231231233', '315', '1152', 'Good');
insert into Locks values ('1231231234', '100', '1150', 'Good');
insert into Locks values ('1231231235', '100', '1151', 'Good');
insert into Locks values ('1231231236', '100', '1152', 'Good');
insert into Locks values ('1231231237', '100', '1153', 'Good');
insert into Locks values ('1231231238', '200', '1150', 'Good');
insert into Locks values ('1231231239', '200', '1151', 'Good');
insert into Locks values ('1231231210', '200', '1152', 'Good');
insert into Locks values ('1231231211', '200', '1153', 'Good');

insert into Cardkeys values ('AAAAAAAAAAAAAAAA', '123123121');
insert into Cardkeys values ('AAAAAAAAAAAAAAAB', '123123122');
insert into Cardkeys values ('AAAAAAAAAAAAAAAC', '123123123');
insert into Cardkeys values ('AAAAAAAAAAAAAAAD', '123123124');
insert into Cardkeys values ('AAAAAAAAAAAAAAAE', '123123125');
insert into Cardkeys values ('AAAAAAAAAAAAAAAF', '123123126');
insert into Cardkeys values ('AAAAAAAAAAAAAAAG', '123123127');
insert into Cardkeys values ('AAAAAAAAAAAAAAAH', '123123128');

insert into Authorization values ('AAAAAAAAAAAAAAAA', '315', '1150', '08-08-2017');
insert into Authorization values ('AAAAAAAAAAAAAAAB', '315', '1151', '08-08-2017');
insert into Authorization values ('AAAAAAAAAAAAAAAC', '315', '1152', '08-08-2017');
insert into Authorization values ('AAAAAAAAAAAAAAAD', '100', '1150', '08-08-2017');
insert into Authorization values ('AAAAAAAAAAAAAAAE', '100', '1151', '08-08-2017');
insert into Authorization values ('AAAAAAAAAAAAAAAF', '100', '1152', '08-08-2017');
insert into Authorization values ('AAAAAAAAAAAAAAAG', '200', '1150', '08-08-2017');
insert into Authorization values ('AAAAAAAAAAAAAAAH', '200', '1151', '08-08-2017');

insert into AccessRecord values ('AAAAAAAAAAAAAAAA', '1231231231', '07-07-2017', 'good');
insert into AccessRecord values ('AAAAAAAAAAAAAAAB', '1231231232', '07-07-2017', 'good');
insert into AccessRecord values ('AAAAAAAAAAAAAAAC', '1231231233', '07-07-2017', 'good');
insert into AccessRecord values ('AAAAAAAAAAAAAAAD', '1231231234', '07-07-2017', 'good');
insert into AccessRecord values ('AAAAAAAAAAAAAAAE', '1231231235', '07-07-2017', 'good');
insert into AccessRecord values ('AAAAAAAAAAAAAAAF', '1231231236', '07-07-2017', 'good');
insert into AccessRecord values ('AAAAAAAAAAAAAAAG', '1231231237', '07-07-2017', 'good');
insert into AccessRecord values ('AAAAAAAAAAAAAAAH', '1231231238', '07-07-2017', 'good');
insert into AccessRecord values ('AAAAAAAAAAAAAAAA', '1231231239', '07-07-2017', 'good');
insert into AccessRecord values ('AAAAAAAAAAAAAAAB', '1231231210', '07-07-2017', 'good');
