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

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'EditUser')
	DROP PROCEDURE EditUser;
GO

CREATE PROCEDURE EditUser
	@UserID			bigint,
	@Firstname		nvarchar(50),
	@Lastname		nvarchar(50),
	@Email			nvarchar(50),
	@Description	nvarchar(255)
AS
	UPDATE Users
		SET
			firstName = @Firstname,
			lastname = @Lastname,
			email = @Email,
			uDescription = @Description
		WHERE
			userID = @UserID;
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

	UPDATE
		Users
		SET lastConnection = GETDATE()
		WHERE username = @Username AND uPassword = @Password;
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
		ISNULL(uDescription, '') uDescription,
		ISNULL(profilePic, '') profilePic,
		email,
		uLevel,
		uType,
		accountState,
		regDate,
		ISNULL(lastConnection, GETDATE()) lastConnection
	FROM
		Users
	Where
		userID = @ID;
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'GetUserFullName')
	DROP PROCEDURE GetUserFullName;
GO

CREATE PROCEDURE GetUserFullName
	@UserId		bigint
AS
	SELECT
		CONCAT(firstName, ' ', lastname) as FullName
	FROM
		Users
	WHERE
		userID = @UserId;
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'SetUserDescription')
	DROP PROCEDURE SetUserDescription;
GO

CREATE PROCEDURE SetUserDescription
	@UserID			bigint,
	@Description	nvarchar(255)
AS
	UPDATE Users
		SET uDescription = @Description
		WHERE userID = @UserID;
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'SetUserProfilePic')
	DROP PROCEDURE SetUserProfilePic;
GO

CREATE PROCEDURE SetUserProfilePic
	@UserID			bigint,
	@Filename		nvarchar(255)
AS
	UPDATE Users
		SET profilePic = @Filename
		WHERE userID = @UserID;
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
	@State		char(1)
AS
	IF (@State = 'a')
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
				Articles
			WHERE
				aState = @State;
		END
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'GetTopArticles')
	DROP PROCEDURE GetTopArticles;
GO

CREATE PROCEDURE GetTopArticles

AS
	SELECT TOP 5
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
		aState = 'p'
	ORDER BY
		upVotes DESC;
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'GetArticleByID')
	DROP PROCEDURE GetArticleByID;
GO

CREATE PROCEDURE GetArticleByID
	@ArticleID		bigint
AS
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
		aID = @ArticleID;
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'SearchArticles')
	DROP PROCEDURE SearchArticles;
GO

CREATE PROCEDURE SearchArticles
	@Query		nvarchar(150)
AS
	SELECT
		A.aID,
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
	(SELECT
		A.aID AS aID
	FROM
		Articles AS A
		INNER JOIN ArticlesCategories AS AC ON AC.aID = A.aID
		INNER JOIN Categories AS C ON C.ctgID = AC.ctgID
	WHERE
		(@Query LIKE ('%' + C.ctgName + '%') OR @Query LIKE ('%' + A.title + '%')) AND aState = 'p'
	GROUP BY
		A.aID) AS sub
	INNER JOIN Articles AS A on A.aID = sub.aID;
		
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'GetArticlesByUser')
	DROP PROCEDURE GetArticlesByUser;
GO

CREATE PROCEDURE GetArticlesByUser
	@UserID		bigint,
	@State		char(1) = null
AS
	IF @State IS NOT NULL
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
				aState = @State AND author = @UserID;
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
				Articles
			WHERE
				author = @UserID AND aState <> 'd';
		END
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'GetRecentArticles')
	DROP PROCEDURE GetRecentArticles;
GO

CREATE PROCEDURE GetRecentArticles

AS
	SELECT TOP 5
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
		aState = 'p'
	ORDER BY
		aDate DESC;
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
	@ArticleID	bigint,
	@FileType	char(1) = null
AS
	IF @FileType IS NOT NULL
		BEGIN
			SELECT
				mtmID,
				fileType,
				filePath,
				uploadDate
			FROM
				Multimedia
			WHERE
				articleID = @ArticleID;
		END
	ELSE
		BEGIN
			SELECT
				mtmID,
				fileType,
				filePath,
				uploadDate
			FROM
				Multimedia
			WHERE
				articleID = @ArticleID AND fileType = @FileType;
		END
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'SetArticleState')
	DROP PROCEDURE SetArticleState;
GO

CREATE PROCEDURE SetArticleState
	@ArticleID	bigint,
	@State		char(1)
AS
	UPDATE Articles
		SET aState = @State
		WHERE aID = @ArticleID;
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

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'CreateComment')
	DROP PROCEDURE CreateComment;
GO

CREATE PROCEDURE CreateComment
	@ArticleID		bigint,
	@UserID			bigint,
	@Body			text,
	@Parent			bigint = null
AS
	BEGIN TRAN;

	IF @Parent IS NULL
		INSERT INTO Comments (cText) VALUES (@Body);
	ELSE
		INSERT INTO Comments (cText, cParent) VALUES (@Body, @Parent);

	DECLARE @LastCommentID bigint = IDENT_CURRENT('Comments');

	INSERT INTO UsersComments (userID, aID, cID) VALUES (@UserID, @ArticleID, @LastCommentID);

	IF @@ERROR = 0
		COMMIT;
	ELSE
		ROLLBACK;
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'GetArticleComments')
	DROP PROCEDURE GetArticleComments;
GO

CREATE PROCEDURE GetArticleComments
	@ArticleID		bigint
AS
	SELECT
		C.cID,
		C.cText,
		C.upVotes,
		C.downVotes,
		ISNULL(U.userID, 0) AS userID,
		ISNULL(U.username, UC.altUsername) AS username,
		ISNULL(C.cParent, 0) AS parent
	FROM
		Comments AS C
		INNER JOIN UsersComments AS UC ON UC.cID = C.cID
		LEFT JOIN Users AS U ON U.userID = UC.userID
	WHERE
		UC.aID = @ArticleID AND active = 1;
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'GetComment')
	DROP PROCEDURE GetComment;
GO

CREATE PROCEDURE GetComment
	@CommentID	bigint
AS
	SELECT
		C.cID,
		C.cText,
		C.upVotes,
		C.downVotes,
		ISNULL(U.userID, 0) AS userID,
		ISNULL(U.username, UC.altUsername) AS username,
		ISNULL(C.cParent, 0) AS parent
	FROM
		Comments AS C
		INNER JOIN UsersComments AS UC ON UC.cID = C.cID
		LEFT JOIN Users AS U ON U.userID = UC.userID
	WHERE
		C.cID = @CommentID;
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'GetChildrenComments')
	DROP PROCEDURE GetChildrenComments;
GO

CREATE PROCEDURE GetChildrenComments
	@CommentID		bigint
AS
	SELECT
		C.cID,
		C.cText,
		C.upVotes,
		C.downVotes,
		U.userID,
		U.username
	FROM
		Comments AS C
		INNER JOIN UsersComments AS UC ON UC.cID = C.cID
		LEFT JOIN Users AS U ON U.userID = UC.ucID
	WHERE
		C.cParent = @CommentID;
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'AddMarkedArticle')
	DROP PROCEDURE AddMarkedArticle;
GO

CREATE PROCEDURE AddMarkedArticle
	@UserID		bigint,
	@ArticleID	bigint
AS
	IF NOT EXISTS (SELECT maID FROM MarkedArticles WHERE userID = @UserID AND aID = @ArticleID)
		BEGIN
			INSERT INTO MarkedArticles (userID, aID) VALUES (@UserID, @ArticleID);
		END
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'GetMarkedArticles')
	DROP PROCEDURE GetMarkedArticles;
GO

CREATE PROCEDURE GetMarkedArticles
	@UserID		bigint
AS
	SELECT
		A.aID,
		A.title,
		A.aDate,
		A.aDesc,
		A.aBody,
		A.author,
		A.creationDate,
		A.upVotes,
		A.downVotes,
		A.aState
	FROM
		MarkedArticles AS MA
		INNER JOIN Articles AS A ON A.aID = MA.aID
	WHERE
		MA.userID = @UserID AND aState <> 'd';
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'VoteArticle')
	DROP PROCEDURE VoteArticle;
GO

CREATE PROCEDURE VoteArticle
	@ArticleID		bigint,
	@Upvote			bit,
	@Downvote		bit
AS
	IF @Upvote = 1
		BEGIN
			UPDATE Articles
				SET upVotes = upVotes + 1
				WHERE aID = @ArticleID;
		END
	ELSE IF @Downvote = 1
		BEGIN
			UPDATE Articles
				SET downVotes = downVotes + 1
				WHERE aID = @ArticleID;
		END
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'VoteComment')
	DROP PROCEDURE VoteComment;
GO

CREATE PROCEDURE VoteComment
	@CommentID		bigint,
	@Upvote			bit,
	@Downvote		bit
AS
	IF @Upvote = 1
		BEGIN
			UPDATE Comments
				SET upvotes = upvotes + 1
				WHERE cID = @CommentID;
		END
	ELSE IF @Downvote = 1
		BEGIN
			UPDATE Comments
				SET downVotes = downVotes + 1
				WHERE cID = @CommentID;
		END
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'ProcedureE')
	DROP PROCEDURE ProcedureE;
GO

CREATE PROCEDURE ProcedureE

AS

GO

select * from users;
select * from MarkedArticles;
select * from Articles;
select * from Multimedia;
select * from UsersComments;
select * from Comments;
select * from ArticlesCategories;
select * from Categories;
select @@servername