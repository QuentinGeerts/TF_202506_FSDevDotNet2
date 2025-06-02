CREATE VIEW [dbo].[V_Active_User]
	AS SELECT [Id], [Email], [LastName], [FirstName] FROM [User] WHERE [IsActive] = 1;
