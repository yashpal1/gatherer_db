USE [GathererMaster]
GO
/****** Object:  Table [dbo].[tbl_Users]    Script Date: 5/13/2017 11:15:41 AM ******/
DROP TABLE [dbo].[tbl_Users]
GO
/****** Object:  Table [dbo].[tbl_Profile]    Script Date: 5/13/2017 11:15:41 AM ******/
DROP TABLE [dbo].[tbl_Profile]
GO
/****** Object:  Table [dbo].[tbl_Clients]    Script Date: 5/13/2017 11:15:41 AM ******/
DROP TABLE [dbo].[tbl_Clients]
GO
/****** Object:  StoredProcedure [dbo].[usp_login]    Script Date: 5/13/2017 11:15:41 AM ******/
DROP PROCEDURE [dbo].[usp_login]
GO
/****** Object:  StoredProcedure [dbo].[usp_addUsersMaster]    Script Date: 5/13/2017 11:15:41 AM ******/
DROP PROCEDURE [dbo].[usp_addUsersMaster]
GO
/****** Object:  StoredProcedure [dbo].[usp_addProfileMaster]    Script Date: 5/13/2017 11:15:41 AM ******/
DROP PROCEDURE [dbo].[usp_addProfileMaster]
GO
/****** Object:  StoredProcedure [dbo].[usp_addClientMaster]    Script Date: 5/13/2017 11:15:41 AM ******/
DROP PROCEDURE [dbo].[usp_addClientMaster]
GO
/****** Object:  StoredProcedure [dbo].[usp_addClientMaster]    Script Date: 5/13/2017 11:15:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_addClientMaster]
	@ClientName varchar(200),
	@Address varchar(500),
	@OfficeAddress varchar(500),
	@Email nvarchar(100),
	@ContactNo nvarchar(200),
	@PinCode bigint,
	@Redirection varchar(100),
	@Status int=0,
	@id bigint=0	
	AS
	BEGIN
	if(isnull(@id, 0) = 0) BEGIN  
	         INSERT INTO tbl_Clients(ClientName, Address, OfficeAddress, Email, ContactNo, PinCode, Redirection, Status, CreatedDate)
	         VALUES(@ClientName, @Address, @OfficeAddress, @Email, @ContactNo, @PinCode, @Redirection, @Status, GETDATE());
		     
    END 
	ELSE BEGIN
	      UPDATE tbl_Clients SET ClientName= @ClientName,Address= @Address, OfficeAddress= @OfficeAddress, Email= @Email, ContactNo= @ContactNo, PinCode= @PinCode, Redirection= @Redirection, Status= @Status, ModifiedDate= GETDATE() where id= @id;            
    END
		SELECT @@ROWCOUNT
    END;










GO
/****** Object:  StoredProcedure [dbo].[usp_addProfileMaster]    Script Date: 5/13/2017 11:15:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_addProfileMaster]
	@ProfileType varchar(100),
	@id bigint = 0	
AS
BEGIN
	if(isnull(@id, 0) = 0) BEGIN  
		INSERT INTO tbl_Profile(ProfileType,CreatedDate)
		VALUES(@ProfileType,GETDATE())
	END	
	ELSE BEGIN
		UPDATE tbl_Profile SET ProfileType=@ProfileType,ModifiedDate=GETDATE() where id=@id             
	END
	SELECT @@ROWCOUNT
END

--go
--exec usp_addProfileMaster
--	@ProfileType  = 'client'
		

GO
/****** Object:  StoredProcedure [dbo].[usp_addUsersMaster]    Script Date: 5/13/2017 11:15:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[usp_addUsersMaster]   
(  
	@UserId			varchar(100) ,          
	@Password		varchar(20),
	@Address		varchar(500),
	@UserName		varchar(200) ,          
	@ProfileId		int,
	@OfficeAddress	nvarchar(500),
	@Email			nvarchar(200),
	@ContactNo		nvarchar(400),
	@Status			int = 0,
    @PinCode		bigint,
    @ClientId		varchar(100)
)          
As          
          
BEGIN  
	if not exists (select * from tbl_Users where CONVERT(Varchar(max), DecryptByPassPhrase('Passpharase', UserId)) = @UserId) begin  
		Insert into tbl_Users (ProfileId, UserName,  Address, OfficeAddress, Email, ContactNo, PinCode, Password, userid, CreatedDate,Status,ClientId) 
		values(
			@ProfileId, @UserName, @Address, @OfficeAddress, @Email, @ContactNo, @PinCode, 
			EncryptbyPassPhrase('Passpharase', @Password),
			EncryptbyPassPhrase('Passpharase', @UserId),
			getdate(),
			@Status,
			@ClientId
		);
		 
		--SELECT ID, CONVERT(Varchar(max), DecryptByPassPhrase('Passpharase', LoginId)) as loginid, grp,CID,SID,Name,(select Name  from dbo.tbl_Softwares where ID =SID) as software FROM tbl_Users WHERE DS=1 AND CONVERT(Varchar(max), DecryptByPassPhrase('Passpharase', LoginId)) =CONVERT(VARBINARY(50),@LoginId)
	end  
END     
   
  --go
  --exec usp_addUsersMaster
  --@UserId		= 'bitsol',
  --@Password		= 'bitsol',
  --@Address		=  'Address',
  --@UserName		=  'bitsol',
  --@ProfileId	=  1,
  --@OfficeAddress=  'office Address',
  --@Email		=  'myemal@email.com',
  --@ContactNo	=  '998899889988',
  --@Status		=  0,
  --@PinCode		=  '101010',
  --@ClientId		=  1;

  
GO
/****** Object:  StoredProcedure [dbo].[usp_login]    Script Date: 5/13/2017 11:15:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_login]
	@UserId		varchar(100),
	@Password	varchar(100)
AS
BEGIN
	select CONVERT(Varchar(max), DecryptByPassPhrase('Passpharase', UserId )) UserId, UserName, Email from tbl_users 
	where 
		@USERID= CONVERT(Varchar(max), DecryptByPassPhrase('Passpharase', USERID )) 
		and @password = CONVERT(Varchar(max), DecryptByPassPhrase('Passpharase', Password));

end;

--go
--exec [usp_login]
--		@USERID	= 'bitsol',
--		@Password = 'bitsol';


GO
/****** Object:  Table [dbo].[tbl_Clients]    Script Date: 5/13/2017 11:15:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Clients](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ClientName] [varchar](200) NULL,
	[Address] [varchar](500) NULL,
	[OfficeAddress] [varchar](500) NULL,
	[Email] [nvarchar](100) NULL,
	[ContactNo] [nvarchar](200) NULL,
	[PinCode] [bigint] NULL,
	[Redirection] [varchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Status] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Profile]    Script Date: 5/13/2017 11:15:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Profile](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProfileType] [varchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Users]    Script Date: 5/13/2017 11:15:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Users](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProfileId] [bigint] NULL,
	[UserName] [varchar](200) NULL,
	[Address] [varchar](500) NULL,
	[OfficeAddress] [varchar](500) NULL,
	[Email] [nvarchar](100) NULL,
	[ContactNo] [nvarchar](200) NULL,
	[PinCode] [bigint] NULL,
	[UserId] [varbinary](100) NULL,
	[Password] [varbinary](250) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Status] [int] NULL,
	[ClientId] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Profile] ON 

GO
INSERT [dbo].[tbl_Profile] ([ID], [ProfileType], [CreatedDate], [ModifiedDate]) VALUES (1, N'bitsol', CAST(0x0000A77001290CA1 AS DateTime), NULL)
GO
INSERT [dbo].[tbl_Profile] ([ID], [ProfileType], [CreatedDate], [ModifiedDate]) VALUES (2, N'client', CAST(0x0000A77001294A37 AS DateTime), NULL)
GO
INSERT [dbo].[tbl_Profile] ([ID], [ProfileType], [CreatedDate], [ModifiedDate]) VALUES (3, N'Manager', CAST(0x0000A77100ACF863 AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[tbl_Profile] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Users] ON 

GO
INSERT [dbo].[tbl_Users] ([ID], [ProfileId], [UserName], [Address], [OfficeAddress], [Email], [ContactNo], [PinCode], [UserId], [Password], [CreatedDate], [ModifiedDate], [Status], [ClientId]) VALUES (1, 1, N'bitsol', N'Address', N'office Address', N'myemal@email.com', N'998899889988', 101010, 0x010000001F56648697779FC9F102C83374F7E7C597ADE502337CBFE0, 0x01000000D8FDF2C357E52AEC3E3485DBD5F5E6D34129FEA10063DF3A, CAST(0x0000A7700128FA13 AS DateTime), NULL, 0, N'1')
GO
SET IDENTITY_INSERT [dbo].[tbl_Users] OFF
GO
