CREATE TABLE [dbo].[DimAuditExcel] (
    [AuditKey]                INT              IDENTITY (1, 1) NOT NULL,
    [ParentAuditKey]          INT              NOT NULL,
    [TableName]               VARCHAR (50)     CONSTRAINT [DF__DimAuditExcel__TableN] DEFAULT ('Unknown') NOT NULL,
    [PkgName]                 VARCHAR (50)     CONSTRAINT [DF__DimAuditExcel__PkgNam] DEFAULT ('Unknown') NOT NULL,
    [PkgGUID]                 UNIQUEIDENTIFIER NULL,
    [PkgVersionGUID]          UNIQUEIDENTIFIER NULL,
    [PkgVersionMajor]         SMALLINT         NULL,
    [PkgVersionMinor]         SMALLINT         NULL,
    [ExecStartDT]             DATETIME         CONSTRAINT [DF__DimAuditExcel__ExecSt] DEFAULT (getdate()) NOT NULL,
    [ExecStopDT]              DATETIME         NULL,
    [ExecutionInstanceGUID]   UNIQUEIDENTIFIER NULL,
    [ExtractRowCnt]           BIGINT           NULL,
    [InsertRowCnt]            BIGINT           NULL,
    [UpdateRowCnt]            BIGINT           NULL,
    [ErrorRowCnt]             BIGINT           NULL,
    [TableInitialRowCnt]      BIGINT           NULL,
    [TableFinalRowCnt]        BIGINT           NULL,
    [TableMaxDateTime]        DATETIME         NULL,
    [SuccessfulProcessingInd] CHAR (1)         CONSTRAINT [DF__DimAuditExcel__Succes] DEFAULT ('N') NOT NULL,
    CONSTRAINT [PK_dbo.DimAuditExcel] PRIMARY KEY CLUSTERED ([AuditKey] ASC),
    CONSTRAINT [FK_dbo_DimAuditExcel_ParentAuditKey] FOREIGN KEY ([ParentAuditKey]) REFERENCES [dbo].[DimAuditExcel] ([AuditKey])
);

