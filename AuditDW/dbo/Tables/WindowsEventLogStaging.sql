CREATE TABLE [dbo].[WindowsEventLogStaging] (
    [MachineName]      VARCHAR (255)  NULL,
    [LogName]          VARCHAR (255)  NULL,
    [RecordID]         INT            NULL,
    [TimeCreated]      DATETIME       NULL,
    [ProviderName]     VARCHAR (255)  NULL,
    [LevelDisplayName] VARCHAR (255)  NULL,
    [Message]          VARCHAR (2500) NULL
);

