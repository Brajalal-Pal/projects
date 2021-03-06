USE [MantisDB]
GO
/****** Object:  StoredProcedure [dbo].[SaveIssueDetail]    Script Date: 08/16/2018 21:24:15 ******/
DROP PROCEDURE [dbo].[SaveIssueDetail]
GO
/****** Object:  StoredProcedure [dbo].[CreateUpdateApprover]    Script Date: 08/16/2018 21:24:15 ******/
DROP PROCEDURE [dbo].[CreateUpdateApprover]
GO
/****** Object:  StoredProcedure [dbo].[GetEstimateForRequest]    Script Date: 08/16/2018 21:24:15 ******/
DROP PROCEDURE [dbo].[GetEstimateForRequest]
GO
/****** Object:  StoredProcedure [dbo].[GetEstWorkCurrentStatus]    Script Date: 08/16/2018 21:24:15 ******/
DROP PROCEDURE [dbo].[GetEstWorkCurrentStatus]
GO
/****** Object:  StoredProcedure [dbo].[GetListofOpenRFC]    Script Date: 08/16/2018 21:24:15 ******/
DROP PROCEDURE [dbo].[GetListofOpenRFC]
GO
/****** Object:  UserDefinedFunction [dbo].[GetNextMantisID]    Script Date: 08/16/2018 21:24:21 ******/
DROP FUNCTION [dbo].[GetNextMantisID]
GO
/****** Object:  StoredProcedure [dbo].[GetTaskComplexityAndPriority]    Script Date: 08/16/2018 21:24:15 ******/
DROP PROCEDURE [dbo].[GetTaskComplexityAndPriority]
GO
/****** Object:  StoredProcedure [dbo].[GetTaskStatus]    Script Date: 08/16/2018 21:24:15 ******/
DROP PROCEDURE [dbo].[GetTaskStatus]
GO
/****** Object:  StoredProcedure [dbo].[GetTaskStatusWithEstimateDetail]    Script Date: 08/16/2018 21:24:15 ******/
DROP PROCEDURE [dbo].[GetTaskStatusWithEstimateDetail]
GO
/****** Object:  StoredProcedure [dbo].[GetUserAndApproverList]    Script Date: 08/16/2018 21:24:15 ******/
DROP PROCEDURE [dbo].[GetUserAndApproverList]
GO
/****** Object:  StoredProcedure [dbo].[SaveEstimate]    Script Date: 08/16/2018 21:24:15 ******/
DROP PROCEDURE [dbo].[SaveEstimate]
GO
/****** Object:  Table [dbo].[IssueDetail]    Script Date: 08/16/2018 21:24:19 ******/
DROP TABLE [dbo].[IssueDetail]
GO
/****** Object:  Table [dbo].[IssueDetailMaster]    Script Date: 08/16/2018 21:24:19 ******/
DROP TABLE [dbo].[IssueDetailMaster]
GO
/****** Object:  Table [dbo].[Estimate]    Script Date: 08/16/2018 21:24:19 ******/
ALTER TABLE [dbo].[Estimate] DROP CONSTRAINT [DF_Estimate_LastUpdatedDate]
GO
DROP TABLE [dbo].[Estimate]
GO
/****** Object:  Table [dbo].[EstimateApproval]    Script Date: 08/16/2018 21:24:19 ******/
ALTER TABLE [dbo].[EstimateApproval] DROP CONSTRAINT [DF_EstimateApproval_ApprovedDate]
GO
DROP TABLE [dbo].[EstimateApproval]
GO
/****** Object:  Table [dbo].[TaskAssigned]    Script Date: 08/16/2018 21:24:19 ******/
DROP TABLE [dbo].[TaskAssigned]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 08/16/2018 21:24:20 ******/
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF_Users_CreatedDate]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF_Users_Active]
GO
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[WorksDone]    Script Date: 08/16/2018 21:24:20 ******/
ALTER TABLE [dbo].[WorksDone] DROP CONSTRAINT [DF_WorksDone_UpdatedDate]
GO
DROP TABLE [dbo].[WorksDone]
GO
/****** Object:  Table [dbo].[Approver]    Script Date: 08/16/2018 21:24:19 ******/
ALTER TABLE [dbo].[Approver] DROP CONSTRAINT [DF_Approver_CreatedDateTime]
GO
ALTER TABLE [dbo].[Approver] DROP CONSTRAINT [DF_Approver_LastUpdateDateTime]
GO
ALTER TABLE [dbo].[Approver] DROP CONSTRAINT [DF_Approver_IsActive]
GO
DROP TABLE [dbo].[Approver]
GO
/****** Object:  Table [dbo].[AssingedToList]    Script Date: 08/16/2018 21:24:19 ******/
DROP TABLE [dbo].[AssingedToList]
GO
/****** Object:  Table [dbo].[AttachmentFile]    Script Date: 08/16/2018 21:24:19 ******/
DROP TABLE [dbo].[AttachmentFile]
GO
/****** Object:  Table [dbo].[ConfigSettings]    Script Date: 08/16/2018 21:24:19 ******/
ALTER TABLE [dbo].[ConfigSettings] DROP CONSTRAINT [DF_ConfigSettings_DateAdded]
GO
ALTER TABLE [dbo].[ConfigSettings] DROP CONSTRAINT [DF_ConfigSettings_LastUpdatedDate]
GO
ALTER TABLE [dbo].[ConfigSettings] DROP CONSTRAINT [DF_ConfigSettings_IsActive]
GO
DROP TABLE [dbo].[ConfigSettings]
GO
/****** Object:  Table [dbo].[ConfigSettings]    Script Date: 08/16/2018 21:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConfigSettings](
	[SettingID] [smallint] IDENTITY(1,1) NOT NULL,
	[SettingType] [varchar](50) NOT NULL,
	[SettingName] [varchar](50) NOT NULL,
	[SLNO] [smallint] NULL,
	[SettingValue] [nvarchar](100) NULL,
	[DateAdded] [datetime] NOT NULL CONSTRAINT [DF_ConfigSettings_DateAdded]  DEFAULT (getdate()),
	[AddedBy] [varchar](25) NOT NULL,
	[LastUpdatedBy] [varchar](25) NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL CONSTRAINT [DF_ConfigSettings_LastUpdatedDate]  DEFAULT (getdate()),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_ConfigSettings_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_ConfigSettings] PRIMARY KEY CLUSTERED 
(
	[SettingID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ConfigSettings] ON
INSERT [dbo].[ConfigSettings] ([SettingID], [SettingType], [SettingName], [SLNO], [SettingValue], [DateAdded], [AddedBy], [LastUpdatedBy], [LastUpdatedDate], [IsActive]) VALUES (1, N'Status', N'TypeOfWork', NULL, N'RFC', CAST(0x0000A916010CA570 AS DateTime), N'bpal', N'bpal', CAST(0x0000A916010CA570 AS DateTime), 1)
INSERT [dbo].[ConfigSettings] ([SettingID], [SettingType], [SettingName], [SLNO], [SettingValue], [DateAdded], [AddedBy], [LastUpdatedBy], [LastUpdatedDate], [IsActive]) VALUES (2, N'Status', N'TypeOfWork', NULL, N'User Request', CAST(0x0000A916010D094C AS DateTime), N'bpal', N'bpal', CAST(0x0000A916010D094C AS DateTime), 1)
INSERT [dbo].[ConfigSettings] ([SettingID], [SettingType], [SettingName], [SLNO], [SettingValue], [DateAdded], [AddedBy], [LastUpdatedBy], [LastUpdatedDate], [IsActive]) VALUES (3, N'Status', N'Priority', NULL, N'High', CAST(0x0000A916010D2D6B AS DateTime), N'bpal', N'bpal', CAST(0x0000A916010D2D6B AS DateTime), 1)
INSERT [dbo].[ConfigSettings] ([SettingID], [SettingType], [SettingName], [SLNO], [SettingValue], [DateAdded], [AddedBy], [LastUpdatedBy], [LastUpdatedDate], [IsActive]) VALUES (4, N'Status', N'Priority', NULL, N'Medium', CAST(0x0000A916010D6AAA AS DateTime), N'bpal', N'bpal', CAST(0x0000A916010D6AAA AS DateTime), 1)
INSERT [dbo].[ConfigSettings] ([SettingID], [SettingType], [SettingName], [SLNO], [SettingValue], [DateAdded], [AddedBy], [LastUpdatedBy], [LastUpdatedDate], [IsActive]) VALUES (5, N'Status', N'Priority', NULL, N'Low', CAST(0x0000A916010D8419 AS DateTime), N'bpal', N'bpal', CAST(0x0000A916010D8419 AS DateTime), 1)
INSERT [dbo].[ConfigSettings] ([SettingID], [SettingType], [SettingName], [SLNO], [SettingValue], [DateAdded], [AddedBy], [LastUpdatedBy], [LastUpdatedDate], [IsActive]) VALUES (6, N'Status', N'TaskStatus', NULL, N'Open', CAST(0x0000A916010DDDC3 AS DateTime), N'bpal', N'bpal', CAST(0x0000A916010DDDC3 AS DateTime), 1)
INSERT [dbo].[ConfigSettings] ([SettingID], [SettingType], [SettingName], [SLNO], [SettingValue], [DateAdded], [AddedBy], [LastUpdatedBy], [LastUpdatedDate], [IsActive]) VALUES (7, N'Status', N'TaskStatus', NULL, N'Close', CAST(0x0000A916010E04F1 AS DateTime), N'bpal', N'bpal', CAST(0x0000A916010E04F1 AS DateTime), 1)
INSERT [dbo].[ConfigSettings] ([SettingID], [SettingType], [SettingName], [SLNO], [SettingValue], [DateAdded], [AddedBy], [LastUpdatedBy], [LastUpdatedDate], [IsActive]) VALUES (8, N'Status', N'TaskSubStatus', NULL, N'Not Started', CAST(0x0000A916010E21AA AS DateTime), N'bpal', N'bpal', CAST(0x0000A916010E21AA AS DateTime), 1)
INSERT [dbo].[ConfigSettings] ([SettingID], [SettingType], [SettingName], [SLNO], [SettingValue], [DateAdded], [AddedBy], [LastUpdatedBy], [LastUpdatedDate], [IsActive]) VALUES (9, N'Status', N'TaskSubStatus', NULL, N'Work in progress', CAST(0x0000A916010E49D6 AS DateTime), N'bpal', N'bpal', CAST(0x0000A916010E49D6 AS DateTime), 1)
INSERT [dbo].[ConfigSettings] ([SettingID], [SettingType], [SettingName], [SLNO], [SettingValue], [DateAdded], [AddedBy], [LastUpdatedBy], [LastUpdatedDate], [IsActive]) VALUES (10, N'Status', N'TaskSubStatus', NULL, N'Communicated', CAST(0x0000A916010E8972 AS DateTime), N'bpal', N'bpal', CAST(0x0000A916010E8972 AS DateTime), 1)
INSERT [dbo].[ConfigSettings] ([SettingID], [SettingType], [SettingName], [SLNO], [SettingValue], [DateAdded], [AddedBy], [LastUpdatedBy], [LastUpdatedDate], [IsActive]) VALUES (11, N'Status', N'TaskSubStatus', NULL, N'Analysis in progress', CAST(0x0000A916010F1E7A AS DateTime), N'bpal', N'bpal', CAST(0x0000A916010F1E7A AS DateTime), 1)
INSERT [dbo].[ConfigSettings] ([SettingID], [SettingType], [SettingName], [SLNO], [SettingValue], [DateAdded], [AddedBy], [LastUpdatedBy], [LastUpdatedDate], [IsActive]) VALUES (12, N'Status', N'TaskSubStatus', NULL, N'Documenting', CAST(0x0000A916010F500E AS DateTime), N'bpal', N'bpal', CAST(0x0000A916010F500E AS DateTime), 1)
INSERT [dbo].[ConfigSettings] ([SettingID], [SettingType], [SettingName], [SLNO], [SettingValue], [DateAdded], [AddedBy], [LastUpdatedBy], [LastUpdatedDate], [IsActive]) VALUES (13, N'Status', N'TaskSubStatus', NULL, N'On hold', CAST(0x0000A916010F7BA8 AS DateTime), N'bpal', N'bpal', CAST(0x0000A916010F7BA8 AS DateTime), 1)
INSERT [dbo].[ConfigSettings] ([SettingID], [SettingType], [SettingName], [SLNO], [SettingValue], [DateAdded], [AddedBy], [LastUpdatedBy], [LastUpdatedDate], [IsActive]) VALUES (14, N'Status', N'TaskSubStatus', NULL, N'UAT in progress', CAST(0x0000A916010F955A AS DateTime), N'bpal', N'bpal', CAST(0x0000A916010F955A AS DateTime), 1)
INSERT [dbo].[ConfigSettings] ([SettingID], [SettingType], [SettingName], [SLNO], [SettingValue], [DateAdded], [AddedBy], [LastUpdatedBy], [LastUpdatedDate], [IsActive]) VALUES (15, N'Status', N'TaskSubStatus', NULL, N'Development completed', CAST(0x0000A916010FDA5D AS DateTime), N'bpal', N'bpal', CAST(0x0000A916010FDA5D AS DateTime), 1)
INSERT [dbo].[ConfigSettings] ([SettingID], [SettingType], [SettingName], [SLNO], [SettingValue], [DateAdded], [AddedBy], [LastUpdatedBy], [LastUpdatedDate], [IsActive]) VALUES (16, N'Status', N'TaskComplexity', NULL, N'Very complex', CAST(0x0000A9160110226F AS DateTime), N'bpal', N'bpal', CAST(0x0000A9160110226F AS DateTime), 1)
INSERT [dbo].[ConfigSettings] ([SettingID], [SettingType], [SettingName], [SLNO], [SettingValue], [DateAdded], [AddedBy], [LastUpdatedBy], [LastUpdatedDate], [IsActive]) VALUES (17, N'Status', N'TaskComplexity', NULL, N'Complex', CAST(0x0000A91601104C47 AS DateTime), N'bpal', N'bpal', CAST(0x0000A91601104C47 AS DateTime), 1)
INSERT [dbo].[ConfigSettings] ([SettingID], [SettingType], [SettingName], [SLNO], [SettingValue], [DateAdded], [AddedBy], [LastUpdatedBy], [LastUpdatedDate], [IsActive]) VALUES (18, N'Status', N'TaskComplexity', NULL, N'Medium', CAST(0x0000A91601107CA8 AS DateTime), N'bpal', N'bpal', CAST(0x0000A91601107CA8 AS DateTime), 1)
INSERT [dbo].[ConfigSettings] ([SettingID], [SettingType], [SettingName], [SLNO], [SettingValue], [DateAdded], [AddedBy], [LastUpdatedBy], [LastUpdatedDate], [IsActive]) VALUES (19, N'Status', N'TaskComplexity', NULL, N'Simple', CAST(0x0000A91601108F42 AS DateTime), N'bpal', N'bpal', CAST(0x0000A91601108F42 AS DateTime), 1)
INSERT [dbo].[ConfigSettings] ([SettingID], [SettingType], [SettingName], [SLNO], [SettingValue], [DateAdded], [AddedBy], [LastUpdatedBy], [LastUpdatedDate], [IsActive]) VALUES (20, N'Status', N'TaskSubStatus', NULL, N'Fixed/Resolved', CAST(0x0000A91601110BE6 AS DateTime), N'bpal', N'bpal', CAST(0x0000A91601110BE6 AS DateTime), 1)
INSERT [dbo].[ConfigSettings] ([SettingID], [SettingType], [SettingName], [SLNO], [SettingValue], [DateAdded], [AddedBy], [LastUpdatedBy], [LastUpdatedDate], [IsActive]) VALUES (21, N'Status', N'TypeOfWork', NULL, N'Bug', CAST(0x0000A9160111C12A AS DateTime), N'bpal', N'bpal', CAST(0x0000A9160111C12A AS DateTime), 1)
INSERT [dbo].[ConfigSettings] ([SettingID], [SettingType], [SettingName], [SLNO], [SettingValue], [DateAdded], [AddedBy], [LastUpdatedBy], [LastUpdatedDate], [IsActive]) VALUES (22, N'Status', N'TypeOfWork', NULL, N'Issue', CAST(0x0000A9160111D9AE AS DateTime), N'bpal', N'bpal', CAST(0x0000A9160111D9AE AS DateTime), 1)
INSERT [dbo].[ConfigSettings] ([SettingID], [SettingType], [SettingName], [SLNO], [SettingValue], [DateAdded], [AddedBy], [LastUpdatedBy], [LastUpdatedDate], [IsActive]) VALUES (23, N'Status', N'TaskSubStatus', NULL, N'Completed', CAST(0x0000A91601124FA8 AS DateTime), N'bpal', N'bpal', CAST(0x0000A91601124FA8 AS DateTime), 1)
INSERT [dbo].[ConfigSettings] ([SettingID], [SettingType], [SettingName], [SLNO], [SettingValue], [DateAdded], [AddedBy], [LastUpdatedBy], [LastUpdatedDate], [IsActive]) VALUES (24, N'UserType', N'A', NULL, N'Administrator', CAST(0x0000A9160185F770 AS DateTime), N'bpal', N'bpal', CAST(0x0000A9160185F770 AS DateTime), 1)
INSERT [dbo].[ConfigSettings] ([SettingID], [SettingType], [SettingName], [SLNO], [SettingValue], [DateAdded], [AddedBy], [LastUpdatedBy], [LastUpdatedDate], [IsActive]) VALUES (25, N'UserType', N'R', NULL, N'Requestor', CAST(0x0000A91601862710 AS DateTime), N'bpal', N'bpal', CAST(0x0000A91601862710 AS DateTime), 1)
INSERT [dbo].[ConfigSettings] ([SettingID], [SettingType], [SettingName], [SLNO], [SettingValue], [DateAdded], [AddedBy], [LastUpdatedBy], [LastUpdatedDate], [IsActive]) VALUES (26, N'UserType', N'C', NULL, N'Customer', CAST(0x0000A91601863DEC AS DateTime), N'bpal', N'bpal', CAST(0x0000A91601863DEC AS DateTime), 1)
INSERT [dbo].[ConfigSettings] ([SettingID], [SettingType], [SettingName], [SLNO], [SettingValue], [DateAdded], [AddedBy], [LastUpdatedBy], [LastUpdatedDate], [IsActive]) VALUES (27, N'UserType', N'X', NULL, N'System', CAST(0x0000A91601865230 AS DateTime), N'bpal', N'bpal', CAST(0x0000A91601865230 AS DateTime), 1)
INSERT [dbo].[ConfigSettings] ([SettingID], [SettingType], [SettingName], [SLNO], [SettingValue], [DateAdded], [AddedBy], [LastUpdatedBy], [LastUpdatedDate], [IsActive]) VALUES (28, N'UserType', N'V', NULL, N'Visitor', CAST(0x0000A9160186A476 AS DateTime), N'bpal', N'bpal', CAST(0x0000A9160186A476 AS DateTime), 1)
INSERT [dbo].[ConfigSettings] ([SettingID], [SettingType], [SettingName], [SLNO], [SettingValue], [DateAdded], [AddedBy], [LastUpdatedBy], [LastUpdatedDate], [IsActive]) VALUES (29, N'Status', N'Estimate', 1, N'Analysis', CAST(0x0000A91700C4D622 AS DateTime), N'bpal', N'bpal', CAST(0x0000A91700C4D622 AS DateTime), 1)
INSERT [dbo].[ConfigSettings] ([SettingID], [SettingType], [SettingName], [SLNO], [SettingValue], [DateAdded], [AddedBy], [LastUpdatedBy], [LastUpdatedDate], [IsActive]) VALUES (30, N'Status', N'Estimate', 2, N'Documentation', CAST(0x0000A91700C4F2CB AS DateTime), N'bpal', N'bpal', CAST(0x0000A91700C4F2CB AS DateTime), 1)
INSERT [dbo].[ConfigSettings] ([SettingID], [SettingType], [SettingName], [SLNO], [SettingValue], [DateAdded], [AddedBy], [LastUpdatedBy], [LastUpdatedDate], [IsActive]) VALUES (31, N'Status', N'Estimate', 3, N'Development', CAST(0x0000A91700C51699 AS DateTime), N'bpal', N'bpal', CAST(0x0000A91700C51699 AS DateTime), 1)
INSERT [dbo].[ConfigSettings] ([SettingID], [SettingType], [SettingName], [SLNO], [SettingValue], [DateAdded], [AddedBy], [LastUpdatedBy], [LastUpdatedDate], [IsActive]) VALUES (32, N'Status', N'Estimate', 4, N'Writting test case', CAST(0x0000A91700C55A67 AS DateTime), N'bpal', N'bpal', CAST(0x0000A91700C55A67 AS DateTime), 1)
INSERT [dbo].[ConfigSettings] ([SettingID], [SettingType], [SettingName], [SLNO], [SettingValue], [DateAdded], [AddedBy], [LastUpdatedBy], [LastUpdatedDate], [IsActive]) VALUES (33, N'Status', N'Estimate', 5, N'Testing', CAST(0x0000A91700C57FF6 AS DateTime), N'bpal', N'bpal', CAST(0x0000A91700C57FF6 AS DateTime), 1)
INSERT [dbo].[ConfigSettings] ([SettingID], [SettingType], [SettingName], [SLNO], [SettingValue], [DateAdded], [AddedBy], [LastUpdatedBy], [LastUpdatedDate], [IsActive]) VALUES (34, N'Status', N'Estimate', 6, N'Deployment', CAST(0x0000A91700C5ED4D AS DateTime), N'bpal', N'bpal', CAST(0x0000A91700C5ED4D AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[ConfigSettings] OFF
/****** Object:  Table [dbo].[AttachmentFile]    Script Date: 08/16/2018 21:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AttachmentFile](
	[MantisID] [bigint] NULL,
	[SLNO] [tinyint] NULL,
	[Sequence] [tinyint] NULL,
	[AttachmentFileName] [varchar](150) NULL,
	[AttachmentFileSavedAs] [varchar](75) NULL,
	[FileMimeType] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AssingedToList]    Script Date: 08/16/2018 21:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AssingedToList](
	[MantisID] [bigint] NOT NULL,
	[SLNO] [tinyint] NOT NULL,
	[AssingedTo] [varchar](75) NOT NULL,
	[Note] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_AssingedTo] ON [dbo].[AssingedToList] 
(
	[MantisID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[AssingedToList] ([MantisID], [SLNO], [AssingedTo], [Note]) VALUES (20170617001, 1, N'gmark@hotmail.com', N'Note')
INSERT [dbo].[AssingedToList] ([MantisID], [SLNO], [AssingedTo], [Note]) VALUES (20170617002, 1, N'mpalekar@gmail.com', NULL)
INSERT [dbo].[AssingedToList] ([MantisID], [SLNO], [AssingedTo], [Note]) VALUES (20170617002, 2, N'gmark@hotmail.com', NULL)
/****** Object:  Table [dbo].[Approver]    Script Date: 08/16/2018 21:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Approver](
	[UserId] [varchar](20) NOT NULL,
	[Priority] [tinyint] NOT NULL,
	[Approver] [varchar](20) NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL CONSTRAINT [DF_Approver_CreatedDateTime]  DEFAULT (getdate()),
	[LastUpdateDateTime] [datetime] NOT NULL CONSTRAINT [DF_Approver_LastUpdateDateTime]  DEFAULT (getdate()),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_Approver_IsActive]  DEFAULT ((1))
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Approver] ([UserId], [Priority], [Approver], [CreatedDateTime], [LastUpdateDateTime], [IsActive]) VALUES (N'bpal', 1, N'cqutenot', CAST(0x0000A91D00F21EAE AS DateTime), CAST(0x0000A91D00FA0DB6 AS DateTime), 1)
INSERT [dbo].[Approver] ([UserId], [Priority], [Approver], [CreatedDateTime], [LastUpdateDateTime], [IsActive]) VALUES (N'bpal', 2, N'kkelkar', CAST(0x0000A91D00F21EAE AS DateTime), CAST(0x0000A91D00FA0DB6 AS DateTime), 1)
INSERT [dbo].[Approver] ([UserId], [Priority], [Approver], [CreatedDateTime], [LastUpdateDateTime], [IsActive]) VALUES (N'bpal', 3, N'mdavda', CAST(0x0000A92501730143 AS DateTime), CAST(0x0000A92501730143 AS DateTime), 1)
INSERT [dbo].[Approver] ([UserId], [Priority], [Approver], [CreatedDateTime], [LastUpdateDateTime], [IsActive]) VALUES (N'upal', 1, N'bpal', CAST(0x0000A9250173A426 AS DateTime), CAST(0x0000A9250173A426 AS DateTime), 1)
INSERT [dbo].[Approver] ([UserId], [Priority], [Approver], [CreatedDateTime], [LastUpdateDateTime], [IsActive]) VALUES (N'jinman', 1, N'cqutenot', CAST(0x0000A9250173D106 AS DateTime), CAST(0x0000A9250173D106 AS DateTime), 1)
/****** Object:  Table [dbo].[WorksDone]    Script Date: 08/16/2018 21:24:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WorksDone](
	[MantisID] [bigint] NOT NULL,
	[SLNO] [tinyint] NOT NULL,
	[WorkDateFrom] [datetime] NOT NULL,
	[WorkDateTo] [datetime] NOT NULL,
	[WorkedByUser] [varchar](20) NULL,
	[HoursWorkDone] [smallint] NULL,
	[Status] [varchar](50) NULL,
	[SubStatus] [varchar](50) NULL,
	[UpdatedDate] [datetime] NULL CONSTRAINT [DF_WorksDone_UpdatedDate]  DEFAULT (getdate()),
	[UpdatedBy] [varchar](20) NULL,
	[ShortDescription] [varchar](100) NULL,
 CONSTRAINT [PK_WorksDone] PRIMARY KEY CLUSTERED 
(
	[MantisID] ASC,
	[SLNO] ASC,
	[WorkDateFrom] ASC,
	[WorkDateTo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[WorksDone] ([MantisID], [SLNO], [WorkDateFrom], [WorkDateTo], [WorkedByUser], [HoursWorkDone], [Status], [SubStatus], [UpdatedDate], [UpdatedBy], [ShortDescription]) VALUES (20170617001, 1, CAST(0x0000A91100000000 AS DateTime), CAST(0x0000A91100000000 AS DateTime), N'bpal', 2, N'Open', N'Work in progress', CAST(0x0000A91701233557 AS DateTime), N'bpal', NULL)
INSERT [dbo].[WorksDone] ([MantisID], [SLNO], [WorkDateFrom], [WorkDateTo], [WorkedByUser], [HoursWorkDone], [Status], [SubStatus], [UpdatedDate], [UpdatedBy], [ShortDescription]) VALUES (20170617002, 1, CAST(0x0000A91000C5C100 AS DateTime), CAST(0x0000A91000F73140 AS DateTime), N'bpal', 3, N'Open', N'Development', CAST(0x0000A91700CCF846 AS DateTime), N'bpal', NULL)
INSERT [dbo].[WorksDone] ([MantisID], [SLNO], [WorkDateFrom], [WorkDateTo], [WorkedByUser], [HoursWorkDone], [Status], [SubStatus], [UpdatedDate], [UpdatedBy], [ShortDescription]) VALUES (20170617002, 2, CAST(0x0000A91100000000 AS DateTime), CAST(0x0000A91100000000 AS DateTime), N'bpal', 4, N'Open', N'Work in progress', CAST(0x0000A9170122C929 AS DateTime), N'bpal', NULL)
/****** Object:  Table [dbo].[Users]    Script Date: 08/16/2018 21:24:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [varchar](20) NOT NULL,
	[Password] [varchar](15) NOT NULL,
	[FirstName] [varchar](30) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
	[EmailId] [varchar](100) NULL,
	[CreatedBy] [varchar](20) NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_Users_CreatedDate]  DEFAULT (getdate()),
	[Active] [bit] NOT NULL CONSTRAINT [DF_Users_Active]  DEFAULT ((1)),
	[UserType] [varchar](1) NULL,
	[Phone] [varchar](20) NULL,
	[Address1] [nvarchar](150) NULL,
	[Photo] [varchar](50) NULL,
	[DOB] [datetime] NULL,
	[Age] [tinyint] NULL,
	[Ethnic] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Users] ([UserId], [Password], [FirstName], [LastName], [EmailId], [CreatedBy], [CreatedDate], [Active], [UserType], [Phone], [Address1], [Photo], [DOB], [Age], [Ethnic], [Country]) VALUES (N'bpal', N'root123', N'Brajalal', N'Pal', N'bpal@medline.com', N'bpal', CAST(0x0000A90200000000 AS DateTime), 1, N'X', N'+91 9588431871', N'New Sangvi, Pune, India', N'bpal.jpg', NULL, 38, N'Indian', N'India')
INSERT [dbo].[Users] ([UserId], [Password], [FirstName], [LastName], [EmailId], [CreatedBy], [CreatedDate], [Active], [UserType], [Phone], [Address1], [Photo], [DOB], [Age], [Ethnic], [Country]) VALUES (N'cqutenot', N'cqutenot123', N'Cedric', N'Qutenot', N'cqutenot@medline.com', N'bpal', CAST(0x0000A9250171985E AS DateTime), 1, N'A', N'+33 6814526570', N'Paris, France', NULL, NULL, 0, N'French', N'France')
INSERT [dbo].[Users] ([UserId], [Password], [FirstName], [LastName], [EmailId], [CreatedBy], [CreatedDate], [Active], [UserType], [Phone], [Address1], [Photo], [DOB], [Age], [Ethnic], [Country]) VALUES (N'gmark', N'gmark999', N'Goerge', N'Mark', N'gmark@hotmail.com', N'bpal', CAST(0x0000A90201039BD9 AS DateTime), 1, N'R', N'+33 6814526570', N'Paris, France', NULL, NULL, 0, N'French', N'France')
INSERT [dbo].[Users] ([UserId], [Password], [FirstName], [LastName], [EmailId], [CreatedBy], [CreatedDate], [Active], [UserType], [Phone], [Address1], [Photo], [DOB], [Age], [Ethnic], [Country]) VALUES (N'jinman', N'jim123', N'Jim', N'Inman', N'jinman@medline.com', N'bpal', CAST(0x0000A9160147B51F AS DateTime), 1, N'R', N'+33 2540125460', N'Germany', NULL, NULL, 0, N'German', N'Germany')
INSERT [dbo].[Users] ([UserId], [Password], [FirstName], [LastName], [EmailId], [CreatedBy], [CreatedDate], [Active], [UserType], [Phone], [Address1], [Photo], [DOB], [Age], [Ethnic], [Country]) VALUES (N'jparkar', N'jparkar453', N'Josna', N'Parkar', N'jparkar@gmail.com', N'bpal', CAST(0x0000A916014A39B4 AS DateTime), 1, N'C', N'+33 2540125460', N' Vrije Universiteit Brussel, Belgium', NULL, NULL, 0, N'Belgiun', N'Belgium')
INSERT [dbo].[Users] ([UserId], [Password], [FirstName], [LastName], [EmailId], [CreatedBy], [CreatedDate], [Active], [UserType], [Phone], [Address1], [Photo], [DOB], [Age], [Ethnic], [Country]) VALUES (N'kkelkar', N'kkelkar457', N'Kedar', N'Kelkar', N'kkelkar@medline.com', N'bpal', CAST(0x0000A925017132F2 AS DateTime), 1, N'R', N'+91 9552565024', N'Pune, India', NULL, NULL, 38, N'Indian', N'India')
INSERT [dbo].[Users] ([UserId], [Password], [FirstName], [LastName], [EmailId], [CreatedBy], [CreatedDate], [Active], [UserType], [Phone], [Address1], [Photo], [DOB], [Age], [Ethnic], [Country]) VALUES (N'mdavda', N'mdavda109', N'Mitesh', N'Davda', N'mdavda@medline.com', N'bpal', CAST(0x0000A9250170AE3C AS DateTime), 1, N'R', N'+91 9819452652', N'Pune, India', NULL, NULL, 39, N'Indian', N'India')
INSERT [dbo].[Users] ([UserId], [Password], [FirstName], [LastName], [EmailId], [CreatedBy], [CreatedDate], [Active], [UserType], [Phone], [Address1], [Photo], [DOB], [Age], [Ethnic], [Country]) VALUES (N'mpalekar', N'manish', N'Manish', N'Palekar', N'mpalekar@gmail.com', N'bpal', CAST(0x0000A90200000000 AS DateTime), 1, N'C', N'+41 2356478012', N'Pune, India', NULL, NULL, 0, N'Indian', N'India')
INSERT [dbo].[Users] ([UserId], [Password], [FirstName], [LastName], [EmailId], [CreatedBy], [CreatedDate], [Active], [UserType], [Phone], [Address1], [Photo], [DOB], [Age], [Ethnic], [Country]) VALUES (N'rjones', N'rjones123', N'Robin', N'Jones', N'rjones@hotmail.com', N'bpal', CAST(0x0000A91601498005 AS DateTime), 1, N'R', N'+41 2356478012', N'Pune, India', NULL, NULL, 0, N'Indian', N'India')
INSERT [dbo].[Users] ([UserId], [Password], [FirstName], [LastName], [EmailId], [CreatedBy], [CreatedDate], [Active], [UserType], [Phone], [Address1], [Photo], [DOB], [Age], [Ethnic], [Country]) VALUES (N'upal', N'upal1234', N'Ujjayanta', N'Paul', N'upal@gmail.com', N'bpal', CAST(0x0000A9160147F6B1 AS DateTime), 1, N'R', N'+91 9588431871', N'Agartala, Tripura, India', NULL, NULL, 0, N'Indian', N'India')
/****** Object:  Table [dbo].[TaskAssigned]    Script Date: 08/16/2018 21:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaskAssigned](
	[MantisId] [bigint] NOT NULL,
	[TaskAssingedTo] [varchar](20) NOT NULL,
	[TaskAssingedBy] [varchar](20) NOT NULL,
	[TaskAssignedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Approver of the person who request for the task' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TaskAssigned', @level2type=N'COLUMN',@level2name=N'TaskAssingedBy'
GO
/****** Object:  Table [dbo].[EstimateApproval]    Script Date: 08/16/2018 21:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EstimateApproval](
	[MantisId] [bigint] NOT NULL,
	[ApprovedBy] [varchar](20) NOT NULL,
	[ApprovedDate] [datetime] NOT NULL CONSTRAINT [DF_EstimateApproval_ApprovedDate]  DEFAULT (getdate()),
	[ApprovedHours] [float] NOT NULL,
	[Comment] [nvarchar](100) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[EstimateApproval] ([MantisId], [ApprovedBy], [ApprovedDate], [ApprovedHours], [Comment]) VALUES (20170617002, N'gmark', CAST(0x0000A91D00EC0E21 AS DateTime), 48.5, N'Approved')
/****** Object:  Table [dbo].[Estimate]    Script Date: 08/16/2018 21:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Estimate](
	[MantisID] [bigint] NOT NULL,
	[SLNO] [tinyint] NOT NULL,
	[Estimate] [varchar](50) NOT NULL,
	[Hours] [float] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL CONSTRAINT [DF_Estimate_LastUpdatedDate]  DEFAULT (getdate()),
	[LastUpdatedBy] [varchar](200) NOT NULL,
	[Comments] [nvarchar](250) NULL,
 CONSTRAINT [PK_Estimate] PRIMARY KEY CLUSTERED 
(
	[MantisID] ASC,
	[SLNO] ASC,
	[Estimate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Estimate] ([MantisID], [SLNO], [Estimate], [Hours], [LastUpdatedDate], [LastUpdatedBy], [Comments]) VALUES (20170617002, 1, N'Analysis', 8, CAST(0x0000A90600000000 AS DateTime), N'bpal', NULL)
INSERT [dbo].[Estimate] ([MantisID], [SLNO], [Estimate], [Hours], [LastUpdatedDate], [LastUpdatedBy], [Comments]) VALUES (20170617002, 2, N'Documentation', 4, CAST(0x0000A90600000000 AS DateTime), N'bpal', NULL)
INSERT [dbo].[Estimate] ([MantisID], [SLNO], [Estimate], [Hours], [LastUpdatedDate], [LastUpdatedBy], [Comments]) VALUES (20170617002, 3, N'Development', 24, CAST(0x0000A90600000000 AS DateTime), N'bpal', NULL)
INSERT [dbo].[Estimate] ([MantisID], [SLNO], [Estimate], [Hours], [LastUpdatedDate], [LastUpdatedBy], [Comments]) VALUES (20170617002, 4, N'Writting test case', 2, CAST(0x0000A90600000000 AS DateTime), N'bpal', NULL)
INSERT [dbo].[Estimate] ([MantisID], [SLNO], [Estimate], [Hours], [LastUpdatedDate], [LastUpdatedBy], [Comments]) VALUES (20170617002, 5, N'Testing', 8, CAST(0x0000A90600000000 AS DateTime), N'bpal', NULL)
INSERT [dbo].[Estimate] ([MantisID], [SLNO], [Estimate], [Hours], [LastUpdatedDate], [LastUpdatedBy], [Comments]) VALUES (20170617002, 6, N'Deployment', 2.5, CAST(0x0000A90600000000 AS DateTime), N'bpal', NULL)
/****** Object:  Table [dbo].[IssueDetailMaster]    Script Date: 08/16/2018 21:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IssueDetailMaster](
	[MantisID] [bigint] NOT NULL,
	[StartDate] [datetime] NULL,
	[CurrentStatus] [nchar](10) NULL,
	[StatusDate] [datetime] NULL,
	[IssueTitle] [nvarchar](100) NULL,
	[TypeOfWork] [varchar](50) NULL,
	[Priority] [varchar](50) NULL,
	[TaskComplexity] [varchar](50) NULL,
 CONSTRAINT [PK_IssueDetailMaster] PRIMARY KEY CLUSTERED 
(
	[MantisID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[IssueDetailMaster] ([MantisID], [StartDate], [CurrentStatus], [StatusDate], [IssueTitle], [TypeOfWork], [Priority], [TaskComplexity]) VALUES (20170617001, CAST(0x0000A91000000000 AS DateTime), N'Open      ', CAST(0x0000A91500000000 AS DateTime), N'Java Front-end development - addin issue', N'Bug', N'Low', N'Complex')
INSERT [dbo].[IssueDetailMaster] ([MantisID], [StartDate], [CurrentStatus], [StatusDate], [IssueTitle], [TypeOfWork], [Priority], [TaskComplexity]) VALUES (20170617002, CAST(0x0000A91000000000 AS DateTime), N'Open      ', CAST(0x0000A91B00000000 AS DateTime), N'English Short/Long description not showing correctly', N'RFC', N'High', N'Very complex')
INSERT [dbo].[IssueDetailMaster] ([MantisID], [StartDate], [CurrentStatus], [StatusDate], [IssueTitle], [TypeOfWork], [Priority], [TaskComplexity]) VALUES (20180621001, CAST(0x0000A91000000000 AS DateTime), N'Close     ', CAST(0x0000A91700000000 AS DateTime), N'Translation to German from English', N'Bug', N'Medium', N'Simple')
INSERT [dbo].[IssueDetailMaster] ([MantisID], [StartDate], [CurrentStatus], [StatusDate], [IssueTitle], [TypeOfWork], [Priority], [TaskComplexity]) VALUES (20180627001, CAST(0x0000A91000000000 AS DateTime), N'Open      ', CAST(0x0000A91800000000 AS DateTime), N'Installation request', N'User Request', N'Medium', N'Complex')
INSERT [dbo].[IssueDetailMaster] ([MantisID], [StartDate], [CurrentStatus], [StatusDate], [IssueTitle], [TypeOfWork], [Priority], [TaskComplexity]) VALUES (20180707001, CAST(0x0000A91000000000 AS DateTime), N'Close     ', CAST(0x0000A91900000000 AS DateTime), N'Component not found', N'User Request', N'Low', N'Simple')
INSERT [dbo].[IssueDetailMaster] ([MantisID], [StartDate], [CurrentStatus], [StatusDate], [IssueTitle], [TypeOfWork], [Priority], [TaskComplexity]) VALUES (20180724001, CAST(0x0000A92700000000 AS DateTime), N'Open      ', CAST(0x0000A92700000000 AS DateTime), N'NetQuote Manager 1.0', N'RFC', N'High', N'Complex')
/****** Object:  Table [dbo].[IssueDetail]    Script Date: 08/16/2018 21:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IssueDetail](
	[MantisID] [bigint] NOT NULL,
	[SLNo] [tinyint] NOT NULL,
	[Summary] [nvarchar](250) NOT NULL,
	[AssingedBy] [varchar](75) NOT NULL,
	[ReportDate] [datetime] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Priority] [varchar](20) NULL,
	[TypeOfWork] [varchar](50) NULL,
	[TaskStatus] [varchar](50) NULL,
	[TaskSubStatus] [varchar](50) NULL,
	[TaskComplexity] [varchar](50) NULL,
 CONSTRAINT [PK_IssueDetail] PRIMARY KEY CLUSTERED 
(
	[MantisID] ASC,
	[SLNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[IssueDetail] ([MantisID], [SLNo], [Summary], [AssingedBy], [ReportDate], [Description], [Priority], [TypeOfWork], [TaskStatus], [TaskSubStatus], [TaskComplexity]) VALUES (20170617001, 1, N'Java Front-end development - addin issue', N'bpal@medline.com', CAST(0x0000A902011F3354 AS DateTime), N'Hello,

Add-in eclipse.org.Bundle plugin not working...

Regards
Brajalal', N'Low', N'Bug', N'Open', N'Not Started', N'Complex')
INSERT [dbo].[IssueDetail] ([MantisID], [SLNo], [Summary], [AssingedBy], [ReportDate], [Description], [Priority], [TypeOfWork], [TaskStatus], [TaskSubStatus], [TaskComplexity]) VALUES (20170617002, 1, N'Getting error file not found', N'bpal@medline.com', CAST(0x0000A9020125B160 AS DateTime), N'Getting file not found exception in www.myMantis.com/Home/CreateRequest?Id=200000', N'High', N'RFC', N'Open', N'Documenting', N'Very complex')
INSERT [dbo].[IssueDetail] ([MantisID], [SLNo], [Summary], [AssingedBy], [ReportDate], [Description], [Priority], [TypeOfWork], [TaskStatus], [TaskSubStatus], [TaskComplexity]) VALUES (20170617002, 2, N'Re:Getting error file not found', N'gmark@hotmail.com', CAST(0x0000A90200000000 AS DateTime), N'Getting file not found exception in www.myMantis.com/Home/CreateRequest?Id=200000. Fixed. Please check.', N'High', N'RFC', N'Open', N'Work in progress', N'Very complex')
INSERT [dbo].[IssueDetail] ([MantisID], [SLNo], [Summary], [AssingedBy], [ReportDate], [Description], [Priority], [TypeOfWork], [TaskStatus], [TaskSubStatus], [TaskComplexity]) VALUES (20170617002, 3, N'20170617002/2', N'bpal@medline.com', CAST(0x0000A90201341ADE AS DateTime), N'Getting file not found exception in www.myMantis.com/Home/CreateRequest?Id=200000. Fixed. Please check.', N'High', N'RFC', N'Open', N'Work in progress', N'Very complex')
INSERT [dbo].[IssueDetail] ([MantisID], [SLNo], [Summary], [AssingedBy], [ReportDate], [Description], [Priority], [TypeOfWork], [TaskStatus], [TaskSubStatus], [TaskComplexity]) VALUES (20170617002, 4, N'20170617002/2', N'bpal@medline.com', CAST(0x0000A9030027AA86 AS DateTime), N'Getting file not found exception in www.myMantis.com/Home/CreateRequest?Id=200000. Fixed. Please check.', N'High', N'RFC', N'Open', N'Work in progress', N'Very complex')
INSERT [dbo].[IssueDetail] ([MantisID], [SLNo], [Summary], [AssingedBy], [ReportDate], [Description], [Priority], [TypeOfWork], [TaskStatus], [TaskSubStatus], [TaskComplexity]) VALUES (20170617002, 5, N'20170617002/2', N'bpal@medline.com', CAST(0x0000A903002A2A92 AS DateTime), N'Getting file not found exception in www.myMantis.com/Home/CreateRequest?Id=200000. Fixed. Please check.', N'High', N'RFC', N'Open', N'Development completed', N'Very complex')
INSERT [dbo].[IssueDetail] ([MantisID], [SLNo], [Summary], [AssingedBy], [ReportDate], [Description], [Priority], [TypeOfWork], [TaskStatus], [TaskSubStatus], [TaskComplexity]) VALUES (20170617002, 6, N'File has been uploaded', N'bpal@medline.com', CAST(0x0000A90C01839461 AS DateTime), N'Hi Mark

File has been removed accidentally. don''t know the reason. File has been uploaded again. Please check if it is correct. 

Let me know if you have any concern.

Thanks
Sam', N'High', N'RFC', N'Open', N'UAT in progress', N'Very complex')
INSERT [dbo].[IssueDetail] ([MantisID], [SLNo], [Summary], [AssingedBy], [ReportDate], [Description], [Priority], [TypeOfWork], [TaskStatus], [TaskSubStatus], [TaskComplexity]) VALUES (20180621001, 1, N'Translation to German from English', N'bpal@medline.com', CAST(0x0000A90600028EEA AS DateTime), N'Translation to German from English is required in the current system. Let me know if any information required.', N'Medium', N'Bug', N'Close', N'Fixed/Resolved', N'Very complex')
INSERT [dbo].[IssueDetail] ([MantisID], [SLNo], [Summary], [AssingedBy], [ReportDate], [Description], [Priority], [TypeOfWork], [TaskStatus], [TaskSubStatus], [TaskComplexity]) VALUES (20180627001, 1, N'Installation request', N'bpal@medline.com', CAST(0x0000A90C01840B98 AS DateTime), N'Could you please install Excel on Test web server?', N'Medium', N'User Request', N'Open', N'Analysis in progress', N'Complex')
INSERT [dbo].[IssueDetail] ([MantisID], [SLNo], [Summary], [AssingedBy], [ReportDate], [Description], [Priority], [TypeOfWork], [TaskStatus], [TaskSubStatus], [TaskComplexity]) VALUES (20180707001, 1, N'Component not found', N'bpal@medline.com', CAST(0x0000A91601170BD9 AS DateTime), N'Component G013-BULK not found', N'Low', N'User Request', N'Close', N'Fixed/Resolved', N'Simple')
INSERT [dbo].[IssueDetail] ([MantisID], [SLNo], [Summary], [AssingedBy], [ReportDate], [Description], [Priority], [TypeOfWork], [TaskStatus], [TaskSubStatus], [TaskComplexity]) VALUES (20180724001, 1, N'NetQuote Manager 1.0', N'kkelkar@medline.com', CAST(0x0000A92700000000 AS DateTime), N'New application development request', N'High', N'RFC', N'Open', N'Not Started', N'Complex')
/****** Object:  StoredProcedure [dbo].[SaveEstimate]    Script Date: 08/16/2018 21:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SaveEstimate]
@MantisID bigint, @SLNO tinyint, @Estimate nvarchar(100), @Hours float, @LastUpdatedBy varchar(20)
as
BEGIN

IF exists(Select * from Estimate where MantisID = @MantisID and SLNO=@SLNO and Estimate=@Estimate)
	begin
		UPDATE Estimate set Hours = @Hours, LastUpdatedDate=GETDATE() where MantisID=@MantisID and SLNO=@SLNO and Estimate = @Estimate		
	end
if not  exists(Select * from Estimate where MantisID = @MantisID and SLNO=@SLNO and Estimate=@Estimate)
	begin
		INSERT INTO Estimate (MantisID, SLNO, Estimate, [Hours], LastUpdatedDate, LastUpdatedBy)
		VALUES (@MantisID, @SLNO, @Estimate, @Hours, GETDATE(), @LastUpdatedBy)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserAndApproverList]    Script Date: 08/16/2018 21:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------------------------------------------------------------------------------
--Get approver or user's approver list
--if @SearchBy = 'user' then seach a.UserId = @ID
--if @SearchBy = 'approver' then search a.Approver = @ID
--if @SearchBy = '' and @ID = '' then will show all approvers list
--Author: Brajalal Pal
--Created On: 14-Jul-2018
-------------------------------------------------------------------------------------------------
CREATE Procedure [dbo].[GetUserAndApproverList]
@SearchBy varchar(20) ='', @ID varchar(20) =''
as
begin
	if @SearchBy = '' and @ID ='' 
	begin
		SELECT a.UserId , b.LastName + ','+b.FirstName [UserName], b.EmailId [UserEmail], isnull(b.Phone,'Not found') [UserPhone], a.Priority, a.Approver, apprv.LastName+','+apprv.FirstName [ApproverName], apprv.EmailId [ApproverEmail], isnull(apprv.Phone,'Not found') [ApproverPhone],  a.IsActive
		  FROM Approver a inner join Users b on a.UserId = b.UserId
		  left join Users apprv on a.Approver = apprv.UserId
		  
		order by b.LastName, a.Priority
	end
	if @SearchBy <> '' and @ID <> '' 
	begin
		SELECT a.UserId , b.LastName + ','+b.FirstName [UserName], b.EmailId [UserEmail],isnull(b.Phone,'Not found') [UserPhone], a.Priority, a.Approver, apprv.LastName+','+apprv.FirstName [ApproverName],apprv.EmailId [ApproverEmail], isnull(apprv.Phone,'Not found') [ApproverPhone], a.IsActive
		  FROM Approver a inner join Users b on a.UserId = b.UserId
		  left join Users apprv on a.Approver = apprv.UserId
		where @ID = case when @SearchBy = 'user' then a.UserId else a.Approver end
		order by a.Priority
	end
end
GO
/****** Object:  StoredProcedure [dbo].[GetTaskStatusWithEstimateDetail]    Script Date: 08/16/2018 21:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[GetTaskStatusWithEstimateDetail]

as
begin
	select a.MantisID, a.StartDate [RequestDate], a.IssueTitle , a.TypeOfWork, a.Priority,a.TaskComplexity, a.CurrentStatus, a.StatusDate [AsOnDate],
	isnull(tbl1.Estimate,0) [EstimateSent], ISNULL(tbl2.Spent,0) [HoursSpent]  from IssueDetailMaster a left join 
	(select 20170617002 MantisId, isnull(SUM(isnull(Hours,0)),0) [Estimate] from Estimate where MantisID = 20170617002) tbl1 on a.MantisID = tbl1.MantisId
	Left join (select 20170617002 MantisId, isnull(SUM(isnull(HoursWorkDone,0)),0) [Spent] from WorksDone where MantisID = 20170617002) tbl2 on a.MantisID=tbl2.MantisId

end
GO
/****** Object:  StoredProcedure [dbo].[GetTaskStatus]    Script Date: 08/16/2018 21:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Brajalal Pal
-- Create date: <Create Date,,>
-- Description:	Get open/close/in-progress/other status types request count
-- =============================================
CREATE PROCEDURE [dbo].[GetTaskStatus]
	
AS
BEGIN	
	SET NOCOUNT ON;
	
	select a.TaskSubStatus status, COUNT(*) No from IssueDetail a 
	inner join (select MantisID, MAX(SLNo) sln from IssueDetail group by MantisID ) b 
	on a.MantisID = b.MantisID and a.SLNo = b.sln
	group by a.TaskSubStatus

	union all

	select a.TaskStatus status, COUNT(*) No from IssueDetail a 
	inner join (select MantisID, MAX(SLNo) sln from IssueDetail group by MantisID ) b 
	on a.MantisID = b.MantisID and a.SLNo = b.sln
	group by a.TaskStatus
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetTaskComplexityAndPriority]    Script Date: 08/16/2018 21:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Brajalal Pal
-- Create date: <Create Date,,>
-- Description:	Get status of request complexity and Priority count
-- =============================================
CREATE PROCEDURE [dbo].[GetTaskComplexityAndPriority]
AS
BEGIN
	SET NOCOUNT ON;
	select a.TaskComplexity status, COUNT(*) No from IssueDetail a 
	inner join (select MantisID, MAX(SLNo) sln from IssueDetail group by MantisID ) b 
	on a.MantisID = b.MantisID and a.SLNo = b.sln
	group by a.TaskComplexity

	union all

	select a.Priority status, COUNT(*) No from IssueDetail a 
	inner join (select MantisID, MAX(SLNo) sln from IssueDetail group by MantisID ) b 
	on a.MantisID = b.MantisID and a.SLNo = b.sln
	group by a.Priority
END
GO
/****** Object:  UserDefinedFunction [dbo].[GetNextMantisID]    Script Date: 08/16/2018 21:24:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetNextMantisID]()
RETURNS bigint
AS
BEGIN
	
	DECLARE @MantisID bigint, @Year1 int, @Month1 tinyint, @Day1 tinyint, @ID bigint 
	set @Year1 = Year(GetDate())
	set @Month1 = Month(GetDate())
	set @Day1 = Day(GetDate())
	set @MantisID = (@Year1 * 100) + @Month1
	set @MantisID = (@MantisID * 100) + @Day1
	
	select @ID = (ISNULL(MAX(MantisID),0) + 1) from IssueDetailMaster where left(MantisID,8) = @MantisID
	if(@ID < @MantisID)
	set @MantisID = (@MantisID * 1000) + @ID
	else
	set @MantisID = @ID
	
	--print @MantisID
	
	Return @MantisID
END
GO
/****** Object:  StoredProcedure [dbo].[GetListofOpenRFC]    Script Date: 08/16/2018 21:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =====================================================================================
-- Author:		Brajalal Pal
-- Create date: 24-Jul-2018
-- Description:	Get list of all open RFC which has not any estimate data
-- =====================================================================================
CREATE PROCEDURE [dbo].[GetListofOpenRFC]
AS
BEGIN
	select a.MantisID,a.IssueTitle, a.CurrentStatus, b.ReportDate, b.AssingedBy, a.Priority, a.TaskComplexity, b.Description from IssueDetailMaster a inner join IssueDetail b on a.MantisID=b.MantisID and b.SLNo=1 
	where a.CurrentStatus='Open' and a.TypeOfWork='RFC' and a.MantisID not in (select distinct MantisID from Estimate)

END
GO
/****** Object:  StoredProcedure [dbo].[GetEstWorkCurrentStatus]    Script Date: 08/16/2018 21:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------------------------------------------------------------------------------------
-- Get Estimate entered for a request 
-- + How much hours spent on each workType 
-- + Total hours spent 
-- + Remaining balance of working hours
-- Author: Brajalal Pal
-- Date: 14-Jul-2018
-------------------------------------------------------------------------------------------------------
CREATE Procedure [dbo].[GetEstWorkCurrentStatus]
 @MantisId bigint
 
 As
 Begin
  --Estimates for a given request
  select * from Estimate where MantisID =@MantisId
  
  --Get how much work done by date-wise for a selected Request
  Select a.MantisID, 
  convert(varchar(12), b.WorkDateFrom, 105) [Date], b.HoursWorkDone, b.SubStatus, b.ShortDescription 
  from IssueDetailMaster a left join WorksDone b on a.MantisID = b.MantisID
  where a.MantisID = @MantisId
  order by a.MantisID, b.WorkDateFrom, b.SLNO
  
  --Total work done in each type of work
  select  'Total Estimate' [Status], isnull(Sum(isnull(a.Hours,0)),0) [Hours] from Estimate a where a.MantisID =@MantisId
  union all
  
  --Hours spent on type of works
  Select 'Spent on ' + b.SubStatus [Status], 
  Sum(isnull(b.HoursWorkDone,0)) [Hours] 
  from WorksDone b 
  where b.MantisID = @MantisId
  group by b.SubStatus
  
  union all
  
  --Total hours spen
  Select 'Total spent' SubStatus, 
  isnull(Sum(isnull(b.HoursWorkDone,0)),0) TotalDone 
  from WorksDone b 
  where b.MantisID = @MantisId
    
  union all
  
  --No of hours work left
  select 'No of Hours work left' [Status], [Hours] = case when isnull((TotalEst.tbl1 - TotalDone.tbl2),0) <  0 then 0 else isnull((TotalEst.tbl1 - TotalDone.tbl2),0) end  from 
  (select sum(isnull(a.Hours,0)) tbl1 from Estimate a where a.MantisID = @MantisId) TotalEst, 
  (select sum(isnull(b.HoursWorkDone,0)) tbl2  from WorksDone b where b.MantisID =@MantisId) TotalDone
 End;
GO
/****** Object:  StoredProcedure [dbo].[GetEstimateForRequest]    Script Date: 08/16/2018 21:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetEstimateForRequest]
@MantisId bigint
as

BEGIN
	select tbl1.MantisId, tbl1.SLNO, tbl1.SettingValue EstimateType, tbl2.Hours, tbl2.LastUpdatedDate, tbl2.LastUpdatedBy from 
	(select @MantisId MantisId, a.SLNO, a.SettingValue from ConfigSettings a where a.SettingType='Status' and a.SettingName='Estimate') tbl1
	left join (select MantisID, Estimate, Hours, LastUpdatedDate, LastUpdatedBy from Estimate where MantisID=@MantisId) tbl2 on tbl1.MantisId = tbl2.MantisID and tbl1.SettingValue=tbl2.Estimate
END
GO
/****** Object:  StoredProcedure [dbo].[CreateUpdateApprover]    Script Date: 08/16/2018 21:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------------------------------------------------------------------------------------------
-- in case of adding new approver @CurrentPriority and @NextPriority will be same. but at the moment @CurrentPriority and NextPriority will be 0
-- in case of update of priority @CurrentPriority and @NextPriority will be different. Will be implemented in ui later
-- Author: Brajalal Pal
-- Created Date: 14-Jul-2018
--------------------------------------------------------------------------------------------------------------
CREATE Procedure [dbo].[CreateUpdateApprover]
@UserId varchar(20), @Approver varchar(20), @CurrentPriority tinyint = 0 , @NextPriority tinyint = 0, @IsActive bit = 1
as
begin
Declare @Priority tinyint

	IF (@CurrentPriority <> @NextPriority) --update priority will be implemented in ui later
	begin
		Update Approver set Priority = @NextPriority, LastUpdateDateTime = GETDATE() 
		where UserId = @UserId and Approver = @Approver and Priority=@CurrentPriority
	end 

	else
	begin
		select @Priority = Isnull(MAX(Priority),0) + 1 from Approver where UserId = @UserId		
		if @CurrentPriority > 0 
		begin
			insert into Approver (UserId, Priority, Approver, IsActive)
			values (@UserId, @CurrentPriority, @Approver, @IsActive)
		end
		
		if @CurrentPriority =  0 
		begin
			insert into Approver (UserId, Priority, Approver, IsActive)
			values (@UserId, @Priority, @Approver, @IsActive)
		end
	end
end
GO
/****** Object:  StoredProcedure [dbo].[SaveIssueDetail]    Script Date: 08/16/2018 21:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--In case of New Manits Request - MantisId = 0, SLNO = 1 
--In case of Reply of existing request - MantisId = <Value of Mantis id pass from .Net application>, SLNO = 0
--(only for super-user) In case of Update of existing request - MantisId = <Value of Mantis id pass from .Net application>, SLNO = <Value of slno pass from .Net application>
CREATE PROCEDURE [dbo].[SaveIssueDetail]
	@MantisID bigint = 0, @SLNO tinyint = 1 , @Summary nvarchar(250) ='', @AssingedBy varchar(75) ='', 
	@Description nvarchar(Max) = '', @Id bigint output 
AS
BEGIN
	declare @SLN smallint
	
	if (@MantisID=0)
		set @MantisID = dbo.GetNextMantisID()
	--if (@SLNO = 0)
		select @SLN = IsNull(MAX(SLNO),0) + 1 from IssueDetail where MantisId = @MantisID
		
	if not exists(select * from IssueDetailMaster where MantisID = @MantisID )
		Insert into IssueDetailMaster(MantisID, Status) values (@MantisID, 'Open')
	
	INSERT INTO IssueDetail (MantisID, SLNo, Summary, AssingedBy, ReportDate, [Description])
	VALUES (@MantisID, @SLN, @Summary, @AssingedBy, GETDATE(), @Description)

	set @Id = @MantisID
END
GO
