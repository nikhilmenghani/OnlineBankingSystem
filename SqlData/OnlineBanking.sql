USE [master]
GO
/****** Object:  Database [obs]    Script Date: 12/22/2014 03:59:58 ******/
CREATE DATABASE [obs] ON  PRIMARY 
( NAME = N'obs', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\obs.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'obs_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\obs_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [obs] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [obs].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [obs] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [obs] SET ANSI_NULLS OFF
GO
ALTER DATABASE [obs] SET ANSI_PADDING OFF
GO
ALTER DATABASE [obs] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [obs] SET ARITHABORT OFF
GO
ALTER DATABASE [obs] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [obs] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [obs] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [obs] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [obs] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [obs] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [obs] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [obs] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [obs] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [obs] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [obs] SET  DISABLE_BROKER
GO
ALTER DATABASE [obs] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [obs] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [obs] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [obs] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [obs] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [obs] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [obs] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [obs] SET  READ_WRITE
GO
ALTER DATABASE [obs] SET RECOVERY SIMPLE
GO
ALTER DATABASE [obs] SET  MULTI_USER
GO
ALTER DATABASE [obs] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [obs] SET DB_CHAINING OFF
GO
USE [obs]
GO
/****** Object:  Table [dbo].[tblTransactions]    Script Date: 12/22/2014 04:00:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTransactions](
	[pk_transaction_id] [int] IDENTITY(1,1) NOT NULL,
	[amount] [float] NULL,
	[transaction_date] [varchar](50) NULL,
	[transaction_type] [nvarchar](50) NULL,
	[to_account] [bigint] NULL,
	[from_account] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[pk_transaction_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblRenewal]    Script Date: 12/22/2014 04:00:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRenewal](
	[pk_renewal_id] [int] IDENTITY(1,1) NOT NULL,
	[i_id] [int] NOT NULL,
	[date_of_start] [varchar](50) NULL,
	[date_of_end] [varchar](50) NULL,
	[cover] [float] NOT NULL,
	[premium] [float] NOT NULL,
 CONSTRAINT [PK__tblRenew__F5E060E31DE57479] PRIMARY KEY CLUSTERED 
(
	[pk_renewal_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblQuotation]    Script Date: 12/22/2014 04:00:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblQuotation](
	[pk_quotation_id] [int] IDENTITY(1,1) NOT NULL,
	[crn] [int] NULL,
	[v_type] [varchar](50) NOT NULL,
	[brand] [varchar](50) NOT NULL,
	[model] [varchar](50) NULL,
	[chassiss_no] [varchar](50) NULL,
	[engine_no] [int] NULL,
	[exshowroom_price] [float] NULL,
	[cover] [float] NOT NULL,
	[premium] [float] NOT NULL,
 CONSTRAINT [PK__tblQuota__3BBA4C551A14E395] PRIMARY KEY CLUSTERED 
(
	[pk_quotation_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblManager]    Script Date: 12/22/2014 04:00:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblManager](
	[pk_manager_id] [int] IDENTITY(1,1) NOT NULL,
	[f_name] [nvarchar](50) NULL,
	[l_name] [nvarchar](50) NULL,
	[contact_no] [int] NULL,
	[ifsc] [nvarchar](50) NULL,
	[pwd] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[pk_manager_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLogin_details]    Script Date: 12/22/2014 04:00:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLogin_details](
	[transaction_pwd] [nvarchar](50) NULL,
	[pk_crn] [int] IDENTITY(1,1) NOT NULL,
	[pwd] [nvarchar](50) NULL,
	[application_status] [bit] NULL,
	[answer] [nvarchar](50) NULL,
	[login_id] [nvarchar](50) NULL,
	[security_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[pk_crn] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLoan_application]    Script Date: 12/22/2014 04:00:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLoan_application](
	[account_no] [bigint] NULL,
	[request_id] [int] NULL,
	[crn] [int] NULL,
	[amount] [float] NULL,
	[statuss] [nvarchar](50) NULL,
	[tenure] [int] NULL,
	[rate] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLoan]    Script Date: 12/22/2014 04:00:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLoan](
	[pk_loan_id] [int] NOT NULL,
	[crn] [int] NULL,
	[interest] [float] NULL,
	[principal] [float] NULL,
	[outstanding_amount] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[pk_loan_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblKit]    Script Date: 12/22/2014 04:00:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblKit](
	[pk_kit_no] [int] NOT NULL,
	[crn] [int] NULL,
	[account_no] [bigint] NULL,
	[pwd] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[pk_kit_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblInsurance_application]    Script Date: 12/22/2014 04:00:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblInsurance_application](
	[pk_i_id] [int] IDENTITY(1,1) NOT NULL,
	[crn] [int] NULL,
	[q_id] [int] NOT NULL,
	[apply_date] [varchar](50) NOT NULL,
	[status] [varchar](50) NOT NULL,
 CONSTRAINT [PK__tblInsur__CF893D3E31EC6D26] PRIMARY KEY CLUSTERED 
(
	[pk_i_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblInsurance]    Script Date: 12/22/2014 04:00:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblInsurance](
	[pk_i_id] [int] NOT NULL,
	[date_of_start] [varchar](50) NOT NULL,
	[date_of_end] [varchar](50) NOT NULL,
	[premium] [float] NOT NULL,
	[cover] [float] NOT NULL,
	[exshowroom_price] [float] NOT NULL,
	[p_type] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblInsurance] PRIMARY KEY CLUSTERED 
(
	[pk_i_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblExtended_bank]    Script Date: 12/22/2014 04:00:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblExtended_bank](
	[bank_name] [nvarchar](50) NULL,
	[account_no] [bigint] NULL,
	[pk_ifsc] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[pk_ifsc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmi]    Script Date: 12/22/2014 04:00:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblEmi](
	[crn] [int] NULL,
	[amount] [float] NULL,
	[transaction_id] [int] NULL,
	[loan_id] [int] NULL,
	[duration] [varchar](10) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCustomer]    Script Date: 12/22/2014 04:00:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCustomer](
	[pk_crn] [int] NOT NULL,
	[fname] [nvarchar](50) NULL,
	[lname] [nvarchar](50) NULL,
	[date_of_birth] [date] NULL,
	[gender] [nvarchar](5) NULL,
	[ifsc] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[contact_no] [int] NULL,
	[pan_card] [nvarchar](50) NULL,
	[address1] [nvarchar](50) NULL,
	[address2] [nvarchar](50) NULL,
	[city] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[pk_crn] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblClaim]    Script Date: 12/22/2014 04:00:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblClaim](
	[i_id] [int] NOT NULL,
	[claim_amount] [float] NULL,
	[actual_amount] [float] NULL,
	[claim_date] [varchar](50) NULL,
	[claim_status] [varchar](50) NULL,
 CONSTRAINT [PK_tblClaim] PRIMARY KEY CLUSTERED 
(
	[i_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblBranch]    Script Date: 12/22/2014 04:00:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBranch](
	[pk_ifsc] [nvarchar](50) NOT NULL,
	[city] [nvarchar](50) NULL,
	[account_no] [bigint] NULL,
	[balance] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[pk_ifsc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBeneficiary]    Script Date: 12/22/2014 04:00:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBeneficiary](
	[pk_beneficiary_id] [int] IDENTITY(1,1) NOT NULL,
	[bank_name] [nvarchar](50) NULL,
	[crn] [int] NULL,
	[nickname] [nvarchar](50) NULL,
	[ifsc] [nvarchar](50) NULL,
	[account_no] [bigint] NULL,
	[type_of_bank] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[pk_beneficiary_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAccounts]    Script Date: 12/22/2014 04:00:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccounts](
	[pk_account_no] [bigint] NOT NULL,
	[crn] [int] NULL,
	[balance] [float] NULL,
	[statuss] [bit] NULL,
	[ifsc] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[pk_account_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dblSecurity_question]    Script Date: 12/22/2014 04:00:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dblSecurity_question](
	[crn] [int] NULL,
	[pk_security_id] [int] IDENTITY(1,1) NOT NULL,
	[questions] [nvarchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[pk_security_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[View_Quotation]    Script Date: 12/22/2014 04:00:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[View_Quotation](@Q_id int, @CRN int out, @v_type varchar(50) out,@brand varchar(50) out, @model varchar(50) out, @exshowroom_price money out, @cover money out, @premium money out)
as
select * from tblQuotation where pk_quotation_id=@Q_id
GO
/****** Object:  StoredProcedure [dbo].[View_Insurance_status]    Script Date: 12/22/2014 04:00:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[View_Insurance_status](@crn int, @q_id int, @status varchar(50) out)
as
select status from tblInsurance_application where crn=@crn and q_id=@q_id
GO
/****** Object:  StoredProcedure [dbo].[ApproveInsuranceApplication]    Script Date: 12/22/2014 04:00:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ApproveInsuranceApplication] @CRN int, @QID int
  as
  begin
  
  declare @insurance_id int
  select @insurance_id = pk_i_id
  from dbo.tblInsurance_application
  where crn = @CRN and q_id = @QID
  
  update dbo.tblInsurance_application 
  set status = 'approved' 
  where pk_i_id = @insurance_id
  
  declare @premium float
  declare @cover float
  declare @price float
  
  select @premium = premium, @cover = cover, @price = exshowroom_price
  from dbo.tblQuotation
  where pk_quotation_id = @QID
  
  insert into dbo.tblInsurance 
  values (@insurance_id, 'temp start date', 'temp end date', @premium, @cover, @price, 'temp policy')
  
  insert into dbo.tblClaim
  values (@insurance_id, @cover, @cover, 'temp claim date', 'temp claim status')
  return @@rowcount
  end
GO
/****** Object:  StoredProcedure [dbo].[Add_Quotation]    Script Date: 12/22/2014 04:00:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Add_Quotation](@CRN int, @v_type varchar(50), @brand varchar(50),@model varchar(50),@chassiss_no varchar(50),
@engine_no int, @exshowroom_price float)
  as
  insert into dbo.tblQuotation 
  values (@CRN,@v_type,@brand,@model,@chassiss_no, @engine_no, @exshowroom_price,((0.8)*@exshowroom_price),((0.125*(.0275)*@exshowroom_price)));
  --Finding Quotation Id
  declare @qid int
  select @qid = pk_quotation_id 
  from dbo.tblQuotation 
  where crn = @CRN and v_type = @v_type and model = @model and chassiss_no = @chassiss_no and engine_no = @engine_no
  --Insert into Insurance Application with status as pending.
  insert into dbo.tblInsurance_application
  values (@CRN, @qid, 'temp date', 'pending')
  return @@rowcount
  
  truncate table dbo.tblQuotation
  select * from dbo.tblQuotation
GO
/****** Object:  StoredProcedure [dbo].[Activate_Insurance]    Script Date: 12/22/2014 04:00:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Activate_Insurance](@pk_i_id varchar(50), @crn int, @q_id int , @apply_date date ,@chassiss_no varchar(50), @engine_no int)
as
insert into tblInsurance_application values(@pk_i_id,@crn,@q_id,@apply_date,@chassiss_no,@engine_no,'pending')
  return @@rowcount
GO
/****** Object:  StoredProcedure [dbo].[RenewInsuranceApplication]    Script Date: 12/22/2014 04:00:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[RenewInsuranceApplication] @CRN int, @QID int
as
begin

declare @insurance_id int
select @insurance_id = pk_i_id
from dbo.tblInsurance_application
where crn = @CRN and q_id = @QID

declare @cover float

if not exists (select i_id from dbo.tblRenewal)
	begin
	select @cover = cover
	from dbo.tblInsurance
	where pk_i_id = @insurance_id
	end
else
	begin
	select @cover = MIN(cover)
	from dbo.tblRenewal
	where i_id = @insurance_id
	end
	
set @cover = 0.8 * @cover
insert into dbo.tblRenewal
values (@insurance_id, 'temp start date', 'temp end date' ,@cover, @cover)

update dbo.tblClaim
set claim_amount = @cover, actual_amount = @cover
where i_id = @insurance_id

return @@rowcount
end
GO
/****** Object:  StoredProcedure [dbo].[Get_Renew_Count]    Script Date: 12/22/2014 04:00:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Get_Renew_Count](@pk_i_id int, @count int out)
as
select @count=COUNT (*) from tblInsurance_application where @pk_i_id=@pk_i_id and status='renewed'
GO
