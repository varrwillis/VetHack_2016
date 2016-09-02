
/****** Object:  Table [dbo].[TestTableOne]    Script Date: 7/11/2016 11:58:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TestTableOne](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UId] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
	[Skills] [nvarchar](50) NULL,
	[Age] [int] NULL,
 CONSTRAINT [PK_TestTableOne] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[TestTable_Insert]    Script Date: 7/11/2016 11:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




Create proc [dbo].[TestTable_Insert]
		@FirstName nvarchar(50) 
		,@Last nvarchar(50) 
		,@Age nvarchar(50) 
		, @Email nvarchar(50) 
		, @Uid uniqueidentifier output

as

/*

Declare @FirstName nvarchar(50) = 'Sally'
		,@Last nvarchar(50) = 'Smith'
		,@Age nvarchar(50) = 87
		, @Email nvarchar(50) = 'sally.smith@mailinator.com'
		, @Uid uniqueidentifier

execute dbo.TestTable_Insert 
		@FirstName  
		,@Last 
		,@Age
		,@Email  
		,@Uid output

select *
From [dbo].[TestTableOne]
Where UID = @Uid

*/

BEGIN





SET @Uid = NewID()

INSERT INTO [dbo].[TestTableOne]
           ([FirstName]
		   , LastName
		   , Age
		   , Email
           ,[UId])
     VALUES
           (@FirstName
		   ,@Last
		   ,@Age
		   , @Email
		   , @Uid)


END

GO


/****** Object:  StoredProcedure [dbo].[TestTable_Select]    Script Date: 7/11/2016 11:57:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




Create proc [dbo].[TestTable_Select]

as
/*

	Execute [dbo].[TestTable_Select]

*/

BEGIN


Select Top 50
	t.FirstName 
		,t.LastName
		, t.Age
		
From dbo.TestTableOne t
Order by newid() -- this order by clause will essentially randomize which top 50 get returned

END





