USE [obs]
GO
/****** Object:  Table [dbo].[tblTransactions]    Script Date: 12/23/2014 03:26:30 ******/
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
/****** Object:  Table [dbo].[tblRenewal]    Script Date: 12/23/2014 03:26:30 ******/
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
/****** Object:  Table [dbo].[tblQuotation_data]    Script Date: 12/23/2014 03:26:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuotation_data](
	[pk_id] [int] NOT NULL,
	[v_type] [nvarchar](50) NULL,
	[brand] [nvarchar](50) NULL,
	[exshowroom_price] [float] NULL,
	[model] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblQuotation_data] PRIMARY KEY CLUSTERED 
(
	[pk_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuotation]    Script Date: 12/23/2014 03:26:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblQuotation](
	[pk_quotation_id] [int] IDENTITY(1,1) NOT NULL,
	[v_type] [varchar](50) NOT NULL,
	[brand] [varchar](50) NOT NULL,
	[model] [varchar](50) NULL,
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
/****** Object:  Table [dbo].[tblManager]    Script Date: 12/23/2014 03:26:30 ******/
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
/****** Object:  Table [dbo].[tblLogin_details]    Script Date: 12/23/2014 03:26:30 ******/
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
/****** Object:  Table [dbo].[tblLoan_application]    Script Date: 12/23/2014 03:26:30 ******/
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
/****** Object:  Table [dbo].[tblLoan]    Script Date: 12/23/2014 03:26:30 ******/
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
/****** Object:  Table [dbo].[tblKit]    Script Date: 12/23/2014 03:26:30 ******/
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
/****** Object:  Table [dbo].[tblInsurance_application]    Script Date: 12/23/2014 03:26:30 ******/
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
	[engine_no] [int] NULL,
	[chassiss_no] [varchar](50) NULL,
 CONSTRAINT [PK__tblInsur__CF893D3E31EC6D26] PRIMARY KEY CLUSTERED 
(
	[pk_i_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblInsurance]    Script Date: 12/23/2014 03:26:30 ******/
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
/****** Object:  Table [dbo].[tblExtended_bank]    Script Date: 12/23/2014 03:26:30 ******/
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
/****** Object:  Table [dbo].[tblEmi]    Script Date: 12/23/2014 03:26:30 ******/
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
/****** Object:  Table [dbo].[tblCustomer]    Script Date: 12/23/2014 03:26:30 ******/
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
/****** Object:  Table [dbo].[tblClaim]    Script Date: 12/23/2014 03:26:30 ******/
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
/****** Object:  Table [dbo].[tblBranch]    Script Date: 12/23/2014 03:26:30 ******/
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
/****** Object:  Table [dbo].[tblBeneficiary]    Script Date: 12/23/2014 03:26:30 ******/
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
/****** Object:  Table [dbo].[tblAccounts]    Script Date: 12/23/2014 03:26:30 ******/
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
/****** Object:  Table [dbo].[dblSecurity_question]    Script Date: 12/23/2014 03:26:30 ******/
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
/****** Object:  StoredProcedure [dbo].[View_Quotation]    Script Date: 12/23/2014 03:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[View_Quotation](@Q_id int, @CRN int out, @v_type varchar(50) out,@brand varchar(50) out, @model varchar(50) out, @exshowroom_price money out, @cover money out, @premium money out)
as
select * from tblQuotation where pk_quotation_id=@Q_id
GO
/****** Object:  StoredProcedure [dbo].[View_Insurance_status]    Script Date: 12/23/2014 03:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[View_Insurance_status](@crn int, @q_id int, @status varchar(50) out)
as
select status from tblInsurance_application where crn=@crn and q_id=@q_id
GO
/****** Object:  StoredProcedure [dbo].[ApplyQuotation]    Script Date: 12/23/2014 03:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ApplyQuotation] @qid int, @chassiss_no varchar(50), @engine_no int
as
begin
insert into dbo.tblInsurance_application
values (1, @qid, 'temp date', 'pending', @engine_no, @chassiss_no)
end
GO
/****** Object:  StoredProcedure [dbo].[AddQuotation]    Script Date: 12/23/2014 03:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddQuotation] @v_type varchar(50), @brand varchar(50), @model varchar(50),@price float
as
begin
insert into dbo.tblQuotation values (@v_type, @brand, @model, @price, ((0.8)*@price),((0.125*(.0275)*@price)))
select pk_quotation_id, premium, cover 
from dbo.tblQuotation
where v_type = @v_type and brand = @brand and model = @model
end
GO
/****** Object:  StoredProcedure [dbo].[GetPrice]    Script Date: 12/23/2014 03:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetPrice] @v_type varchar(50), @brand varchar(50), @model varchar(50)
as
begin
select exshowroom_price from dbo.tblQuotation_data where v_type = @v_type and brand = @brand and model = @model
return @@rowcount
end
GO
/****** Object:  StoredProcedure [dbo].[GetModels]    Script Date: 12/23/2014 03:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetModels] @brand varchar(50)
as
begin
select pk_id,model from dbo.tblQuotation_data where brand = @brand
end
GO
/****** Object:  StoredProcedure [dbo].[GetBrands]    Script Date: 12/23/2014 03:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetBrands] @v_type varchar(50)
as
begin
select pk_id,brand from dbo.tblQuotation_data where v_type = @v_type
end
GO
/****** Object:  StoredProcedure [dbo].[Get_Renew_Count]    Script Date: 12/23/2014 03:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Get_Renew_Count](@pk_i_id int, @count int out)
as
select @count=COUNT (*) from tblInsurance_application where @pk_i_id=@pk_i_id and status='renewed'
GO
