USE src_key_db_test;
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'RegisterUser')
	DROP PROCEDURE RegisterUser;
GO

CREATE PROCEDURE RegisterUser
	@Username		nvarchar(30),
	@FirstName		nvarchar(50),
	@LastName		nvarchar(50),
	@Email			nvarchar(50),
	@Password		nvarchar(20)
AS
	BEGIN TRAN

	INSERT INTO Users (
		username,
		firstName,
		lastname,
		email,
		uPassword
	)
	VALUES (
		@Username,
		@FirstName,
		@LastName,
		@Email,
		@Password
	);

	IF @@ERROR = 0
		COMMIT;
	ELSE
		ROLLBACK;
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'LogIn')
	DROP PROCEDURE LogIn;
GO

CREATE PROCEDURE LogIn
	@Username	nvarchar(30),
	@Password	nvarchar(20)
AS
	SELECT
		userID,
		username,
		firstname,
		lastname,
		uType,
		accountState
	FROM
		Users
	WHERE
		username = @Username AND uPassword = @Password;
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'GetUser')
	DROP PROCEDURE GetUser;
GO

CREATE PROCEDURE GetUser
	@ID		bigint
AS
	SELECT
		userID,
		username,
		firstName,
		lastname,
		uDescription,
		profilePic,
		email,
		uLevel,
		uType,
		accountState,
		regDate,
		lastConnection
	FROM
		Users
	Where
		userID = @ID;
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'SubmitArticle')
	DROP PROCEDURE SubmitArticle;
GO

CREATE PROCEDURE SubmitArticle
	@Title		nvarchar(80),
	@Desc		nvarchar(100),
	@Body		text,
	@Author		bigint
AS
	BEGIN TRAN;
	
	INSERT INTO Articles (
		title,
		aDesc,
		aBody,
		author,
		aDate,
		creationDate,
		aState
	)
	VALUES (
		@Title,
		@Desc,
		@Body,
		@Author,
		GETDATE(),
		GETDATE(),
		'u'
	);

	IF @@ERROR = 0
		BEGIN
			COMMIT;
			RETURN CONVERT(INT, IDENT_CURRENT('Articles'));
		END
	ELSE
		BEGIN
			ROLLBACK;
			RETURN -1;
		END
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'GetArticles')
	DROP PROCEDURE GetArticles;
GO

CREATE PROCEDURE GetArticles
	@PublishedOnly	bit
AS
	IF (@PublishedOnly = 1)
		BEGIN
			SELECT
				aID,
				title,
				aDate,
				aDesc,
				aBody,
				author,
				creationDate,
				upVotes,
				downVotes,
				aState
			FROM
				Articles
			WHERE
				aState = 'p';
		END
	ELSE
		BEGIN
			SELECT
				aID,
				title,
				aDate,
				aDesc,
				aBody,
				author,
				creationDate,
				upVotes,
				downVotes,
				aState
			FROM
				Articles;
		END
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'SetArticleCategory')
	DROP PROCEDURE SetArticleCategory;
GO

CREATE PROCEDURE SetArticleCategory
	@ArticleID	bigint,
	@CategoryID	bigint
AS
	INSERT INTO ArticlesCategories (
		aID,
		ctgID
	)
	VALUES (
		@ArticleID,
		@CategoryID
	);
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'SetArticleMultimedia')
	DROP PROCEDURE SetArticleMultimedia;
GO

CREATE PROCEDURE SetArticleMultimedia
	@ArticleID	bigint,
	@Filepath	nvarchar(255),
	@Filetype	char(1)
AS
	INSERT INTO Multimedia (
		filePath,
		fileType,
		articleID
	)
	VALUES (
		@Filepath,
		@Filetype,
		@ArticleID
	);
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'GetArticleMutimedia')
	DROP PROCEDURE GetArticleMutimedia;
GO

CREATE PROCEDURE GetArticleMutimedia
	@ArticleID	bigint
AS
	SELECT
		mtmID,
		fileType,
		filePath,
		uploadDate
	FROM
		Multimedia
	WHERE
		articleID = @ArticleID;
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'RegisterCategory')
	DROP PROCEDURE RegisterCategory;
GO

CREATE PROCEDURE RegisterCategory
	@CtgName	nvarchar(30)
AS
	BEGIN TRAN;
	
	DECLARE @CategoryID bigint;

	IF EXISTS (SELECT ctgID from Categories where ctgName = @CtgName)
		SET @CategoryID = (SELECT ctgID from Categories where ctgName = @CtgName);
	ELSE
		BEGIN
			INSERT INTO Categories (ctgName) VALUES (@CtgName);
			SET @CategoryID = IDENT_CURRENT('Categories');
		END

	IF @@ERROR = 0
		COMMIT;
	ELSE
		BEGIN
			ROLLBACK;
			RETURN -1;
		END

	RETURN CONVERT(INT, @CategoryID);
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'ProcedureE')
	DROP PROCEDURE ProcedureE;
GO

CREATE PROCEDURE ProcedureE

AS

GO

select * from users;
select @@servername