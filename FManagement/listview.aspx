<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="listview.aspx.cs" Inherits="FManagement.listview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h3>Details View</h3>
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="385px" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="FacultyId" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="FacultyId" HeaderText="FacultyId" InsertVisible="False" ReadOnly="True" SortExpression="FacultyId" />
                <asp:BoundField DataField="FacultyFName" HeaderText="FacultyFName" SortExpression="FacultyFName" />
                <asp:BoundField DataField="FacultyLName" HeaderText="FacultyLName" SortExpression="FacultyLName" />
                <asp:BoundField DataField="FacultyPhone" HeaderText="FacultyPhone" SortExpression="FacultyPhone" />
                <asp:BoundField DataField="DateOfBirth" HeaderText="DateOfBirth" SortExpression="DateOfBirth" />
                <asp:BoundField DataField="Salary" HeaderText="Salary" SortExpression="Salary" />
            </Fields>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT [FacultyId], [FacultyFName], [FacultyLName], [FacultyPhone], [DateOfBirth], [Salary] FROM [Faculty]"></asp:SqlDataSource>
        <h3>List View</h3>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="FacultyId" DataSourceID="SqlDataSource1">
            <AlternatingItemTemplate>
                <li style="">FacultyId:
                    <asp:Label ID="FacultyIdLabel" runat="server" Text='<%# Eval("FacultyId") %>' />
                    <br />
                    FacultyFName:
                    <asp:Label ID="FacultyFNameLabel" runat="server" Text='<%# Eval("FacultyFName") %>' />
                    <br />
                    FacultyLName:
                    <asp:Label ID="FacultyLNameLabel" runat="server" Text='<%# Eval("FacultyLName") %>' />
                    <br />
                    FacultyPhone:
                    <asp:Label ID="FacultyPhoneLabel" runat="server" Text='<%# Eval("FacultyPhone") %>' />
                    <br />
                    DateOfBirth:
                    <asp:Label ID="DateOfBirthLabel" runat="server" Text='<%# Eval("DateOfBirth") %>' />
                    <br />
                    Salary:
                    <asp:Label ID="SalaryLabel" runat="server" Text='<%# Eval("Salary") %>' />
                    <br />
                </li>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <li style="">FacultyId:
                    <asp:Label ID="FacultyIdLabel1" runat="server" Text='<%# Eval("FacultyId") %>' />
                    <br />
                    FacultyFName:
                    <asp:TextBox ID="FacultyFNameTextBox" runat="server" Text='<%# Bind("FacultyFName") %>' />
                    <br />
                    FacultyLName:
                    <asp:TextBox ID="FacultyLNameTextBox" runat="server" Text='<%# Bind("FacultyLName") %>' />
                    <br />
                    FacultyPhone:
                    <asp:TextBox ID="FacultyPhoneTextBox" runat="server" Text='<%# Bind("FacultyPhone") %>' />
                    <br />
                    DateOfBirth:
                    <asp:TextBox ID="DateOfBirthTextBox" runat="server" Text='<%# Bind("DateOfBirth") %>' />
                    <br />
                    Salary:
                    <asp:TextBox ID="SalaryTextBox" runat="server" Text='<%# Bind("Salary") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </li>
            </EditItemTemplate>
            <EmptyDataTemplate>
                No data was returned.
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <li style="">FacultyFName:
                    <asp:TextBox ID="FacultyFNameTextBox" runat="server" Text='<%# Bind("FacultyFName") %>' />
                    <br />FacultyLName:
                    <asp:TextBox ID="FacultyLNameTextBox" runat="server" Text='<%# Bind("FacultyLName") %>' />
                    <br />FacultyPhone:
                    <asp:TextBox ID="FacultyPhoneTextBox" runat="server" Text='<%# Bind("FacultyPhone") %>' />
                    <br />DateOfBirth:
                    <asp:TextBox ID="DateOfBirthTextBox" runat="server" Text='<%# Bind("DateOfBirth") %>' />
                    <br />Salary:
                    <asp:TextBox ID="SalaryTextBox" runat="server" Text='<%# Bind("Salary") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </li>
            </InsertItemTemplate>
            <ItemSeparatorTemplate>
<br />
            </ItemSeparatorTemplate>
            <ItemTemplate>
                <li style="">FacultyId:
                    <asp:Label ID="FacultyIdLabel" runat="server" Text='<%# Eval("FacultyId") %>' />
                    <br />
                    FacultyFName:
                    <asp:Label ID="FacultyFNameLabel" runat="server" Text='<%# Eval("FacultyFName") %>' />
                    <br />
                    FacultyLName:
                    <asp:Label ID="FacultyLNameLabel" runat="server" Text='<%# Eval("FacultyLName") %>' />
                    <br />
                    FacultyPhone:
                    <asp:Label ID="FacultyPhoneLabel" runat="server" Text='<%# Eval("FacultyPhone") %>' />
                    <br />
                    DateOfBirth:
                    <asp:Label ID="DateOfBirthLabel" runat="server" Text='<%# Eval("DateOfBirth") %>' />
                    <br />
                    Salary:
                    <asp:Label ID="SalaryLabel" runat="server" Text='<%# Eval("Salary") %>' />
                    <br />
                </li>
            </ItemTemplate>
            <LayoutTemplate>
                <ul id="itemPlaceholderContainer" runat="server" style="">
                    <li runat="server" id="itemPlaceholder" />
                </ul>
                <div style="">
                </div>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <li style="">FacultyId:
                    <asp:Label ID="FacultyIdLabel" runat="server" Text='<%# Eval("FacultyId") %>' />
                    <br />
                    FacultyFName:
                    <asp:Label ID="FacultyFNameLabel" runat="server" Text='<%# Eval("FacultyFName") %>' />
                    <br />
                    FacultyLName:
                    <asp:Label ID="FacultyLNameLabel" runat="server" Text='<%# Eval("FacultyLName") %>' />
                    <br />
                    FacultyPhone:
                    <asp:Label ID="FacultyPhoneLabel" runat="server" Text='<%# Eval("FacultyPhone") %>' />
                    <br />
                    DateOfBirth:
                    <asp:Label ID="DateOfBirthLabel" runat="server" Text='<%# Eval("DateOfBirth") %>' />
                    <br />
                    Salary:
                    <asp:Label ID="SalaryLabel" runat="server" Text='<%# Eval("Salary") %>' />
                    <br />
                </li>
            </SelectedItemTemplate>
        </asp:ListView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT [FacultyId], [FacultyFName], [FacultyLName], [FacultyPhone], [DateOfBirth], [Salary] FROM [Faculty]"></asp:SqlDataSource>
    </div>
</asp:Content>
