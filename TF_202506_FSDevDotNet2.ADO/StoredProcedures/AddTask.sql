CREATE PROCEDURE [dbo].[AddTask]
	@Title NVARCHAR(50),
	@Description NVARCHAR(MAX) = NULL,
	@Status NVARCHAR(20),
	@UserId INT = NULL
AS
	SET NOCOUNT ON;

	IF @UserId IS NOT NULL AND NOT EXISTS (SELECT 1 FROM [dbo].[User] WHERE [Id] = @UserId AND [IsActive] = 1) 
	BEGIN
		RAISERROR('User does not exist', 16, 1);
		RETURN -1;
	END

	INSERT INTO [dbo].[Task] ([Title], [Description], [Status],[UserId])
	VALUES (@Title, @Description, @Status, @UserId);

	RETURN SCOPE_IDENTITY();

RETURN 0
