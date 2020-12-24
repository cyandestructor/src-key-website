CREATE DATABASE src_key_db_test;
USE src_key_db_test;

CREATE TABLE Users (
	userID		bigint not null identity,
	username	nvarchar(30) not null unique,
	email		nvarchar(50) not null unique,
	uPassword	nvarchar(20) not null,

	firstName nvarchar(50),
	lastname nvarchar(50),

	uLevel		int default 0,
	uType		char(1) default 'u',

	profilePic		nvarchar(255),
	uDescription	nvarchar(255),

	accountState	char(1) default 'g',
	regDate			datetime default GETDATE(),
	lastConnection	datetime

	CONSTRAINT PK_USER PRIMARY KEY (userID)
);

CREATE TABLE Articles (
	aID			bigint not null identity,
	title		nvarchar(80),
	aDate		datetime,
	aDesc		nvarchar(100),
	aBody		text,

	author			bigint not null,
	creationDate	datetime,

	upVotes		bigint default 0,
	downVotes	bigint default 0,

	aState		char(1)

	CONSTRAINT PK_ARTICLE PRIMARY KEY (aID),

	CONSTRAINT FK_AUTHOR FOREIGN KEY (author) REFERENCES Users (userID)
);

CREATE TABLE Comments (
	cID			bigint not null identity,
	cText		text,

	upVotes		bigint default 0,
	downVotes	bigint default 0,

	cParent		bigint,
	active		bit default 1,
	editor		bit default 0,

	CONSTRAINT PK_COMMENT PRIMARY KEY (cID),

	CONSTRAINT FK_PARENT_COMMENT FOREIGN KEY (cParent) REFERENCES Comments (cID)
);

CREATE TABLE Categories (
	ctgID		bigint not null identity,
	ctgName		nvarchar(30) not null

	CONSTRAINT PK_CATEGORY PRIMARY KEY (ctgID)
);

CREATE TABLE Multimedia (
	mtmID		bigint not null identity,
	fileType	char(1),
	filePath	nvarchar(255),

	articleID	bigint,
	uploadDate	datetime default GETDATE(),

	active		bit default 1

	CONSTRAINT PK_MULTIMEDIA PRIMARY KEY (mtmID),

	CONSTRAINT FK_ARTICLE_MULTIMEDIA FOREIGN KEY (articleID) REFERENCES Articles (aID)
);

-- RELATIONSHIP TABLES

CREATE TABLE UsersComments (
	ucID		bigint not null identity,
	userID		bigint,
	aID			bigint not null,
	cID			bigint not null,
	altUsername	varchar(30),

	CONSTRAINT PK_USERS_COMMENTS PRIMARY KEY (ucID),

	CONSTRAINT FK_USER_UC FOREIGN KEY (userID) REFERENCES Users (userID),
	CONSTRAINT FK_ARTICLE_UC FOREIGN KEY (aID) REFERENCES Articles (aID),
	CONSTRAINT FK_COMMENT_UC FOREIGN KEY (cID) REFERENCES Comments (cID)
);

CREATE TABLE Reports (
	rID			bigint not null identity,
	userRq		bigint not null,
	userTg		bigint not null

	CONSTRAINT PK_REPORT PRIMARY KEY (rID),

	CONSTRAINT FK_USER_RQ_R FOREIGN KEY (userRq) REFERENCES Users (userID),
	CONSTRAINT FK_USER_RP_R FOREIGN KEY (userTg) REFERENCES Users (userID)
);

CREATE TABLE Infractions (
	infID		bigint not null identity,
	infDesc		text,
	report		bigint not null,
	rDate		datetime

	CONSTRAINT PK_INFRACTION PRIMARY KEY (infID),

	CONSTRAINT FK_REPORT_INFRACTION FOREIGN KEY (report) REFERENCES Reports (rID)
);

CREATE TABLE ArticlesCategories (
	acID		bigint not null identity,
	aID			bigint not null,
	ctgID		bigint not null

	CONSTRAINT PK_ARTICLE_CATEGORY PRIMARY KEY (acID),

	CONSTRAINT FK_ARTICLE_AC FOREIGN KEY (aID) REFERENCES Articles (aID),
	CONSTRAINT FK_CATEGORY_AC FOREIGN KEY (ctgID) REFERENCES Categories (ctgID)
);

CREATE TABLE MarkedArticles (
	maID		bigint not null identity,
	aID			bigint not null,
	userID		bigint not null

	CONSTRAINT PK_MARKED_ARTICLE PRIMARY KEY (maID),

	CONSTRAINT FK_ARTICLE_MA FOREIGN KEY (aID) REFERENCES Articles (aID),
	CONSTRAINT FK_USER_MA FOREIGN KEY (userID) REFERENCES Users (userID)
);