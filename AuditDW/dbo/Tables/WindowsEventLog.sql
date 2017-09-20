CREATE TABLE [dbo].[WindowsEventLog] (
    [ID]               INT            IDENTITY (1, 1) NOT NULL,
    [MachineName]      VARCHAR (255)  NULL,
    [LogName]          VARCHAR (255)  NULL,
    [RecordID]         INT            NULL,
    [TimeCreated]      DATETIME       NULL,
    [ProviderName]     VARCHAR (255)  NULL,
    [LevelDisplayName] VARCHAR (255)  NULL,
    [Message]          VARCHAR (2500) NULL,
    CONSTRAINT [PK_WindowsEventLog] PRIMARY KEY CLUSTERED ([ID] ASC)
);

