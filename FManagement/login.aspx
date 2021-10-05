<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="FManagement.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 30px;
            width: 129px;
        }
        .auto-style2 {
            width: 241px;
        }
        .auto-style3 {
            height: 30px;
            width: 241px;
        }
        .auto-style4 {
            width: 129px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
                <div>
                <table>
                    <tr>
                        <td colspan="2"><h1 style="font-family: Arial, Helvetica, sans-serif">User Login</h1>
                            <p>&nbsp;</p></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                    <td class="auto-style4" style="font-family: Arial">Unser Name</td>
                        <td class="auto-style2"><asp:TextBox ID="txtUserName" runat="server" BorderStyle="Solid"></asp:TextBox></td> 
                    </tr>
                    <tr>
                        <td class="auto-style4" style="font-family: Arial">Password</td>
                        <td class="auto-style2"><asp:TextBox ID="txtPassword" TextMode="Password" runat="server" BorderStyle="Solid"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style1"></td>
                        <td class="auto-style3">
                            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click1" BackColor="#00CC00" BorderStyle="None" ForeColor="White" Height="24px" Width="49px" />
                        </td>
                    </tr>
                </table>
                    <asp:CheckBox ID="chkBoxRememberMe" Text="Remember Me" runat="server" /> 
                    <br />
                    <br />
                    <a href="Registration/Register.aspx" style="font-family: Arial, Helvetica, sans-serif">Click here to Register</a>
        </div>
    </form>
</body>
</html>
