-- =============================================
-- Author:		David Speight
-- Date:		20170825
-- =============================================
CREATE PROCEDURE [dbo].[EventViewerGet]
@MachineName varchar(255), 
@LogName varchar(255), 
@LevelDisplayName varchar(255),
@Start datetime,
@end datetime
AS
BEGIN

	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	select top 2500 LEFT(MachineName, CHARINDEX('.', MachineName) - 1) AS MachineName, 
					LogName, 
					RecordID, 
					TimeCreated, 
					ProviderName, 
					LevelDisplayName, 
					Message
	from		WindowsEventLog
	where			(CHARINDEX('.', MachineName) > 0)
				and	(@MachineName = '--- All ---' or MachineName LIKE @MachineName+'%')
				and	(@LogName = '--- All ---' or LogName = @LogName)
				and (@LevelDisplayName = '--- All ---' or LevelDisplayName = @LevelDisplayName)
				and (TimeCreated between @Start and @End)
	order by		MachineName, 
					TimeCreated;

END