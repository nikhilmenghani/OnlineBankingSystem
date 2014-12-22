<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddQuotation.aspx.cs" Inherits="AddQuotation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label2" runat="server" Text="Vehicle Type"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RadioButton ID="rbTwoWheeler" runat="server" AutoPostBack="true" OnCheckedChanged="updateVehicleType" Checked="True" 
            GroupName="VehicleType" Text="Two Wheeler" />
&nbsp;&nbsp;
        <asp:RadioButton ID="rbFourWheeler" runat="server" AutoPostBack="true" OnCheckedChanged="updateVehicleType" GroupName="VehicleType" 
            Text="Four Wheeler" />
        <br />
        <br />
        Brand&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddlBrand" runat="server" OnSelectedIndexChanged="PopupModels" AutoPostBack="True" OnCheckedChanged="updateVehicleType">
            <asp:ListItem Value="0">Select Brand</asp:ListItem>
        </asp:DropDownList>
        <br />
        Model&nbsp;&nbsp;
        <asp:DropDownList ID="ddlModel" runat="server" OnSelectedIndexChanged="DisplayPrice" AutoPostBack="True">
            <asp:ListItem Value="0">Select Model</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Exshowroom Price"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label4" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Submit" onclick="Button1_Click" />
        <br />
        <br />
        <asp:Label ID="Label5" runat="server" Text="Generated Quotation ID is"></asp:Label>
&nbsp;
        <asp:Label ID="Label6" runat="server"></asp:Label>
&nbsp;<br />
        Premium that you will need to pay is  
        <asp:Label ID="Label7" runat="server"></asp:Label>
        <br />
        Cover that we will provide is
        <asp:Label ID="Label8" runat="server"></asp:Label>
        <br />
        Would you like to apply? 
        <asp:Button ID="Button2" runat="server" Text="Continue" 
            onclick="Button2_Click" />
        <br />
    
    </div>
    </form>
</body>
</html>
