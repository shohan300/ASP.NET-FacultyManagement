<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FacultyUserControl.ascx.cs" Inherits="FManagement.FacultyUserControl" %>
<style type="text/css">
    .auto-style1 {
        width: 100%;
    }
    .auto-style3 {
        width: 306px;
    }
    .auto-style5 {
        width: 306px;
        height: 26px;
    }
    .auto-style6 {
        height: 26px;
        width: 601px;
    }
    .newStyle1 {
        font-family: Arial, Helvetica, sans-serif;
    }
    .auto-style7 {
        width: 123px;
    }
    .auto-style8 {
        width: 123px;
        height: 26px;
    }
    .auto-style9 {
        text-align: center;
        font-size: x-large;
    }
    .auto-style10 {
        width: 136%;
    }
    .auto-style13 {
        text-align: right;
        font-size: x-large;
    }
    .auto-style14 {
        width: 87px;
    }
    .img{
        height:70px;
        width: 70px;
    }
    .auto-style15 {
        margin-left: 0px;
    }
    .auto-style16 {
        width: 601px;
    }
    .auto-style17 {
        width: 87px;
        height: 52px;
    }
    .auto-style18 {
        height: 52px;
    }
    </style>
<asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server"></asp:ScriptManagerProxy>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table class="auto-style1">
    <asp:HiddenField ID="HiddenImageName" runat="server" />
    <asp:HiddenField ID="HiddenImageUrl" runat="server" />
    <tr>
        <td class="auto-style9" style="font-family: Arial">Insert (Course-Department-Hire) Info</td>
        <td colspan="2" class="auto-style13" style="font-family: Arial">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2">
            <table class="auto-style10">
                <tr>
                    <td class="auto-style17" style="font-family: Arial">Course</td>
                    <td class="auto-style18">
            <asp:TextBox ID="txtCourse" runat="server" Width="123px" BorderStyle="Dotted"></asp:TextBox>
            &nbsp;&nbsp;<asp:Button ID="btnCourseSave" runat="server" Text="Save" Width="58px" OnClick="btnCourseSave_Click" BackColor="#00CC00" BorderStyle="None" ForeColor="White" CausesValidation="false" />
                    </td>
                    <td class="auto-style18"></td>
                </tr>
                <tr>
                    <td class="auto-style14">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style14" style="font-family: Arial">Department</td>
                    <td>
            <asp:TextBox ID="txtDepartment" runat="server" Width="122px" BorderStyle="Dotted"></asp:TextBox>
            &nbsp;&nbsp;<asp:Button ID="btnDepartmentSave" runat="server" Text="Save" Width="58px" OnClick="btnDepartmentSave_Click" BackColor="#00CC00" BorderStyle="None" ForeColor="White" CausesValidation="false"/>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style14">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style14" style="font-family: Arial">Hire From</td>
                    <td>
            <asp:TextBox ID="txtHire" runat="server" Width="122px" BorderStyle="Dotted"></asp:TextBox>
            &nbsp;&nbsp;<asp:Button ID="btnHireSave" runat="server" Text="Save" Width="58px" OnClick="btnHireSave_Click" BackColor="#00CC00" BorderStyle="None" ForeColor="White" CausesValidation="false" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style14">&nbsp;</td>
                    <td class="auto-style13" style="font-family: Arial">Faculty Information</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="auto-style3">&nbsp;</td>
        <td class="auto-style7">&nbsp;</td>
        <td class="auto-style16">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style5">
            &nbsp;</td>
        <td class="auto-style8"><span class="newStyle1">First Name</span></td>
        <td class="auto-style6">
            <asp:TextBox ID="txtFName" runat="server" Width="192px" CssClass="auto-style15" CausesValidation="false"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="First Name Required" ControlToValidate="txtFName" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>

    </tr>
    <tr>
        <td class="auto-style3">
            &nbsp;</td>
        <td class="auto-style7" style="font-family: Arial">Last Name</td>
        <td class="auto-style16">
            <asp:TextBox ID="txtLName" runat="server" Width="192px" CausesValidation="false"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Last Name Required" ControlToValidate="txtLName" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style3">&nbsp;</td>
        <td class="auto-style7" style="font-family: Arial">Phone</td>
        <td class="auto-style16">
            <asp:TextBox ID="txtPhone" runat="server" Width="192px" TextMode="Phone"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Phone Number Required" ControlToValidate="txtPhone" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style3">
            &nbsp;</td>
        <td class="auto-style7" style="font-family: Arial">Date of Birth</td>
        <td class="auto-style16">
            <asp:TextBox ID="txtDate" runat="server" Width="192px"></asp:TextBox>
            <asp:ImageButton ID="ImageButton1" runat="server" Height="20px" ImageUrl="~/App_Image/425868.png" Width="20px" OnClick="ImageButton1_Click" CausesValidation="false" /><br/>
            <asp:Calendar ID="Calendar1" runat="server" Height="137px" Width="132px" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="DOB Required" ControlToValidate="txtDate" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style3">
            &nbsp;</td>
        <td class="auto-style7" style="font-family: Arial">Salary</td>
        <td class="auto-style16">
            <asp:TextBox ID="txtSalary" runat="server" Width="192px" ></asp:TextBox>
            &nbsp;
            <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="100-20000 Only" ControlToValidate="txtSalary" ForeColor="Red" MaximumValue="20000" MinimumValue="100" Type="String"></asp:RangeValidator>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">&nbsp;</td>
        <td class="auto-style7" style="font-family: Arial">Image</td>
        <td class="auto-style16">
            <asp:Image ID="Image1" runat="server" class="img" />
            <asp:FileUpload ID="FileUpload1" runat="server" onchange="if(confirm('upload'+this.value+'?')) this.form.submit" BackColor="White" BorderStyle="None" Width="151px" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Photo Required" ControlToValidate="FileUpload1" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style3">
            &nbsp;</td>
        <td class="auto-style7" style="font-family: Arial">Course</td>
        <td class="auto-style16">
            <asp:DropDownList ID="ddlCourse" runat="server" Width="100px">
            </asp:DropDownList>
        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlCourse" ErrorMessage="Please Select At Least One Course" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style3">
            &nbsp;</td>
        <td class="auto-style7" style="font-family: Arial">Department</td>
        <td class="auto-style16">
            <asp:DropDownList ID="ddlDepartment" runat="server" Width="100px">
            </asp:DropDownList>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlDepartment" ErrorMessage="Please Select At Least One Department" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style3">&nbsp;</td>
        <td class="auto-style7" style="font-family: Arial">Hire From</td>
        <td class="auto-style16">
            <asp:DropDownList ID="ddlHire" runat="server" Width="100px">
            </asp:DropDownList>
        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtDepartment" ErrorMessage="Please Select Hire Country" ForeColor="Red" CausesValidation="false"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style3">&nbsp;</td>
        <td class="auto-style7">&nbsp;</td>
        <td class="auto-style16">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">&nbsp;</td>
        <td class="auto-style7">
            &nbsp;</td>
        <td class="auto-style16">
            <asp:Button ID="btnSaveFaculty" runat="server" CausesValidation="false" Text="Save" OnClick="btnSaveFaculty_Click" BackColor="#00CC00" BorderStyle="None" ForeColor="White" Height="29px" Width="90px" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnClear" runat="server" Text="Clear" BackColor="Red" BorderStyle="None" ForeColor="White" Height="29px" Width="84px" />
        </td>
    </tr>
    <tr>
        <td class="auto-style3">&nbsp;</td>
        <td class="auto-style7">&nbsp;</td>
        <td class="auto-style16">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">&nbsp;</td>
        <td class="auto-style7">&nbsp;</td>
        <td class="auto-style16">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">&nbsp;</td>
        <td class="auto-style7">&nbsp;</td>
        <td class="auto-style16">&nbsp;</td>
    </tr>
</table>
    </ContentTemplate>
    <Triggers>
        <asp:PostBackTrigger ControlID="btnSaveFaculty" />
    </Triggers>
</asp:UpdatePanel>



