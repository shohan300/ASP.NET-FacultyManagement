<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SQLDSCRUD.aspx.cs" Inherits="FManagement.SQLDSCRUD" %>

<%@ Register Src="~/FacultyUserControl.ascx" TagPrefix="uc1" TagName="FacultyUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="FacultyId" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" CausesValidation="false" />
                <asp:BoundField DataField="FacultyId" HeaderText="FacultyId" InsertVisible="False" ReadOnly="True" SortExpression="FacultyId" />
                <asp:TemplateField HeaderText="FacultyFName" SortExpression="FacultyFName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FacultyFName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("FacultyFName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="FacultyLName" SortExpression="FacultyLName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("FacultyLName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("FacultyLName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="FacultyPhone" SortExpression="FacultyPhone">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("FacultyPhone") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("FacultyPhone") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DateOfBirth" SortExpression="DateOfBirth">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("DateOfBirth") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("DateOfBirth") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Salary" SortExpression="Salary">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Salary") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Salary") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ImageName" SortExpression="ImageName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("ImageName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("ImageName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ImageUrl" SortExpression="ImageUrl">
                    <EditItemTemplate>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" Width="70px" Height="70px" ImageUrl='<%# Eval("ImageUrl") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DepartmentId" SortExpression="DepartmentId">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("DepartmentId") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("DepartmentId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CourseId" SortExpression="CourseId">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("CourseId") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("CourseId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="HireId" SortExpression="HireId">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("HireId") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("HireId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" DeleteCommand="DELETE FROM [Faculty] WHERE [FacultyId] = @FacultyId" InsertCommand="INSERT INTO [Faculty] ([FacultyFName], [FacultyLName], [FacultyPhone], [DateOfBirth], [Salary], [ImageName], [ImageUrl], [DepartmentId], [CourseId], [HireId]) VALUES (@FacultyFName, @FacultyLName, @FacultyPhone, @DateOfBirth, @Salary, @ImageName, @ImageUrl, @DepartmentId, @CourseId, @HireId)" SelectCommand="SELECT * FROM [Faculty]" UpdateCommand="UPDATE [Faculty] SET [FacultyFName] = @FacultyFName, [FacultyLName] = @FacultyLName, [FacultyPhone] = @FacultyPhone, [DateOfBirth] = @DateOfBirth, [Salary] = @Salary, [ImageName] = @ImageName, [ImageUrl] = @ImageUrl, [DepartmentId] = @DepartmentId, [CourseId] = @CourseId, [HireId] = @HireId WHERE [FacultyId] = @FacultyId">
            <DeleteParameters>
                <asp:Parameter Name="FacultyId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="FacultyFName" Type="String" />
                <asp:Parameter Name="FacultyLName" Type="String" />
                <asp:Parameter Name="FacultyPhone" Type="String" />
                <asp:Parameter Name="DateOfBirth" Type="DateTime" />
                <asp:Parameter Name="Salary" Type="Decimal" />
                <asp:Parameter Name="ImageName" Type="String" />
                <asp:Parameter Name="ImageUrl" Type="String" />
                <asp:Parameter Name="DepartmentId" Type="Int32" />
                <asp:Parameter Name="CourseId" Type="Int32" />
                <asp:Parameter Name="HireId" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="FacultyFName" Type="String" />
                <asp:Parameter Name="FacultyLName" Type="String" />
                <asp:Parameter Name="FacultyPhone" Type="String" />
                <asp:Parameter Name="DateOfBirth" Type="DateTime" />
                <asp:Parameter Name="Salary" Type="Decimal" />
                <asp:Parameter Name="ImageName" Type="String" />
                <asp:Parameter Name="ImageUrl" Type="String" />
                <asp:Parameter Name="DepartmentId" Type="Int32" />
                <asp:Parameter Name="CourseId" Type="Int32" />
                <asp:Parameter Name="HireId" Type="Int32" />
                <asp:Parameter Name="FacultyId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
            <uc1:FacultyUserControl runat="server" ID="FacultyUserControl" />
    </div>
</asp:Content>
