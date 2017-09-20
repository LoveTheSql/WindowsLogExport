-- =============================================
-- Author:		DSPEIGHT
-- Create date: 20170914
-- =============================================
CREATE PROCEDURE [dbo].[EventArchiving]
@DaysToKeep int
AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @CutOffDate DATE = DATEADD(day,0-@DaysToKeep,(getdate()))

	INSERT INTO dbo.WindowsEventLogArchived
	(ID, MachineName, LogName, RecordID, TimeCreated, ProviderName, LevelDisplayName, Message)
	SELECT
	ID, MachineName, LogName, RecordID, TimeCreated, ProviderName, LevelDisplayName, Message
	FROM [dbo].[WindowsEventLog]
	WHERE TimeCreated < @CutOffDate;

	DELETE 
	FROM [dbo].[WindowsEventLog]
	WHERE TimeCreated < @CutOffDate;


END