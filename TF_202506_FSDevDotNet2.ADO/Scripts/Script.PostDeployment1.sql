/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

USE [$(DatabaseName)];


-- Activer l'insertion manuel de l'ID
SET IDENTITY_INSERT [dbo].[User] ON;

INSERT INTO [dbo].[User] (Id, UserName, Email, PasswordHash, LastName, FirstName)
VALUES
    (1, 'Admin', 'admin@admin.be', HASHBYTES('SHA2_256', 'Test1234='), 'Admin', 'Admin'),
    (2, 'Quentin', 'quentin.geerts@bstorm.be', HASHBYTES('SHA2_256', 'Test1234='), 'Geerts', 'Quentin');

-- Désactiver l'insertion manuel de l'ID
SET IDENTITY_INSERT [dbo].[User] OFF;


SET IDENTITY_INSERT [dbo].[Task] ON;

INSERT INTO [dbo].[Task] (Id, UserId, Title, Description, Status)
VALUES 
    (1, 1, 'Aller travailler', 'Oui oui, il faut bien gagner sa croutte', 'In Progress'),
    (2, 1, 'Faire les courses', 'Acheter du lait et des cigarettes', 'In Progress'),
    (3, 2, 'Laver la voiture', 'Les routes sont très sales', 'Completed'),
    (4, 2, 'Ranger la maison', 'Manger sur le bureau, tout est en bordel', 'Completed'),
    (5, 1, 'Changer la litière', 'Ca commence à puer', 'In Progress');

SET IDENTITY_INSERT [dbo].[Task] OFF;