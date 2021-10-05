<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="FManagement.Registration.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    </head>
<body>
    <form id="form1" runat="server">
        <div>
                <table>
                    <tr>
                        <td colspan="2"><h1 style="font-family: Arial">User Registration</h1></td>
                    </tr>
                    <tr>
                    <td style="font-family: Arial">Unser Name</td>
                        <td><asp:TextBox ID="txtUserName" runat="server" BorderStyle="Solid"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="font-family: Arial">Password</td>
                        <td><asp:TextBox ID="txtPassword" TextMode="Password" runat="server" BorderStyle="Solid"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="font-family: Arial">Confirm Password</td>
                        <td><asp:TextBox ID="confirmPass" TextMode="Password" runat="server" BorderStyle="Solid"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" BackColor="#00CC00" BorderStyle="None" ForeColor="White" Height="27px" Width="71px" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                </table>
            <a href="../login.aspx" style="font-family: Arial, Helvetica, sans-serif">Go to Login Page</a>
        </div>
    </form>
</body>
</html>
