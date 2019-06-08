<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditUser.aspx.cs" Inherits="_Default" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="header">
        <strong>
            <asp:Label ID="Label1" runat="server" CssClass="auto-style1" Text="用户管理"></asp:Label>
        </strong>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:Label ID="Label2" runat="server" Text="账号或用户名:"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="查询" />
    <br />
    <br />
    <asp:GridView runat="server" AllowPaging="True" AllowSorting="True" 
        AutoGenerateColumns="False" BackColor="White" BorderColor="#006699" 
        BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="Account" 
        DataSourseID="SqlDataSource1" GridLines="Both" DataSourceID="SqlDataSource1" >
        <FooterStyle BackColor="White" ForeColor="#006699" />
        <Columns>
            <asp:CommandField ShowDeleteButton="true" ShowEditButton="true" ControlStyle-Width="40px" />
            <asp:BoundField DataField="Account" HeaderText="账号" ReadOnly="true" SortExpression="Account"/>
            <asp:BoundField DataField="Name" HeaderText="用户名" SortExpression="Name"/>
            <asp:BoundField DataField="Email" HeaderText="邮箱" />
            <asp:BoundField DataField="Pwd" HeaderText="密码" />
            <asp:BoundField DataField="Last_login" HeaderText="最近登录" ReadOnly="true" />
        </Columns>
        <RowStyle BackColor="White" ForeColor="#006699" />
        <SelectedRowStyle BackColor="#cccccc" ForeColor="#006699" />
        <PagerStyle BackColor="#006699" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#006699" Font-Bold="true" ForeColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
      ConnectionString="<%$ ConnectionStrings:schoolConnectionString %>"
      SelectCommand="SELECT * FROM Users WHERE (Account LIKE '%' + @Input + '%') OR (Name LIKE '%' + @Input + '%')"
      UpdateCommand="UPDATE Users SET name = @name, Email = @Email, Pwd = @Pwd WHERE (Account = @Account)"
      DeleteCommand="delete from Users where Account=@Account" OnSelecting="SqlDataSource1_Selecting">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="Input" PropertyName="Text" Type="String" ConvertEmptyStringToNull="False" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="Account" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" />
            <asp:Parameter Name="Email" />
            <asp:Parameter Name="Pwd" />
            <asp:Parameter Name="Account" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

