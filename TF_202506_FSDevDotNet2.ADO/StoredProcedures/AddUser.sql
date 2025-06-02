CREATE PROCEDURE [dbo].[AddUser]
	@UserName NVARCHAR(50),
	@Email NVARCHAR(100),
	@Password NVARCHAR(255),
	@LastName NVARCHAR(50) = NULL,
	@FirstName NVARCHAR(50) = NULL
AS
	SET NOCOUNT ON;


	IF EXISTS (SELECT 1 FROM [dbo].[User] WHERE [UserName] = @UserName)
	BEGIN
		RAISERROR('UserName already taken.', 16, 1);
		RETURN -1;
	END

	IF EXISTS (SELECT 1 FROM [dbo].[User] WHERE [Email] = @Email)
	BEGIN
		RAISERROR('Email already taken.', 16, 1);
		RETURN -1;
	END

	INSERT INTO [dbo].[User] (UserName, Email, PasswordHash, LastName, FirstName)
	VALUES (@UserName, @Email, HASHBYTES('SHA2_256', @Password), @LastName, @FirstName);

	RETURN SCOPE_IDENTITY(); -- Permet de récupérer l'id créé suite à l'insertion

RETURN 0
