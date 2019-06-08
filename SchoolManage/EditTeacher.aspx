<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditTeacher.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="header">
        <strong>
            <asp:Label ID="Label1" runat="server" CssClass="auto-style1" Text="编辑教师信息"></asp:Label>
        </strong>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    职工号:
    <asp:TextBox ID="txtTe_ID" runat="server" Width="50px"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="查询" OnClick="Button1_Click1" />
    &nbsp;姓名：
    <asp:TextBox ID="txtName" runat="server" Width="50px"></asp:TextBox>
    <asp:Button ID="Button2" runat="server" Text="查询" />
    &nbsp;部门:
    <asp:TextBox ID="txtDpt" runat="server" Width="70px"></asp:TextBox>
    <asp:Button ID="Button3" runat="server" Text="查询" />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Te_ID" DataSourceID="SqlDataSource1" Font-Size="12px" ShowFooter="True">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText="选项">
                <ItemTemplate>
                    <asp:CheckBox ID="chkSelectRow" runat="server" />
                </ItemTemplate>
                <FooterTemplate>
                    <asp:LinkButton ID="lbDelete" runat="server" CausesValidation="False" OnClick="lbDelete_Click" Text="删除" Font-Size="12px"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="lbInsert" runat="server" OnClick="lbInsert_Click">添加</asp:LinkButton>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="职工号" SortExpression="Te_ID">
                <EditItemTemplate>
                    <asp:Label ID="dlTe_ID" runat="server" Text='<%# Eval("Te_ID") %>' Width="50px"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="dlTe_ID" runat="server" Text='<%# Bind("Te_ID") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtTe_ID" runat="server" Width="50px" MaxLength="5"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvID" runat="server" ErrorMessage="不能为空" Text="*" ForeColor="Red" ControlToValidate="txtTe_ID"></asp:RequiredFieldValidator>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="密码" SortExpression="Pwd">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Pwd") %>' Width="50px" MaxLength="20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="不能为空" Text="*" ForeColor="Red" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Pwd") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtPwd" runat="server" Width="50px" MaxLength="20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPwd" runat="server" ErrorMessage="不能为空" Text="*" ForeColor="Red" ControlToValidate="txtPwd"></asp:RequiredFieldValidator>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="姓名" SortExpression="Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Name") %>' Width="50px" MaxLength="20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="不能为空" Text="*" ForeColor="Red" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtName" runat="server" Width="50px" MaxLength="20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="不能为空" Text="*" ForeColor="Red" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="性别" SortExpression="Gender">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("Gender") %>'>
                        <asp:ListItem>男</asp:ListItem>
                        <asp:ListItem>女</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="不能为空" Text="*" ForeColor="Red" ControlToValidate="DropDownList1"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList ID="dlGender" runat="server">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>男</asp:ListItem>
                        <asp:ListItem>女</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvGender" runat="server" ErrorMessage="不能为空" Text="*" ForeColor="Red" ControlToValidate="dlGender"></asp:RequiredFieldValidator>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email" SortExpression="Email">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Email") %>' Width="100px" MaxLength="50"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtEmail" runat="server" Width="100px"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="部门" SortExpression="Dpt">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Dpt") %>' Width="60px" MaxLength="20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="不能为空" Text="*" ForeColor="Red" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Dpt") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtDpt" runat="server" Width="60px" MaxLength="20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDpt" runat="server" ErrorMessage="不能为空" Text="*" ForeColor="Red" ControlToValidate="txtDpt"></asp:RequiredFieldValidator>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="手机号" SortExpression="Phone">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Phone") %>' Width="80px" MaxLength="20"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Phone") %>' MaxLength="20"></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtPhone" runat="server" Width="80px"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="编辑" Font-Size="12px"></asp:LinkButton>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新" Font-Size="12px"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" Font-Size="12px"></asp:LinkButton>
                </EditItemTemplate>
            </asp:TemplateField>

        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:Label ID="lblTooltip" runat="server" Style="font-size: 12pt; color: red; font-family: 宋体;"></asp:Label>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:schoolConnectionString %>" DeleteCommand="DELETE FROM [Teacher] WHERE [Te_ID] = @Te_ID" InsertCommand="INSERT INTO [Teacher] ([Te_ID], [Pwd], [Name], [Gender], [Email], [Dpt], [Phone]) VALUES (@Te_ID, @Pwd, @Name, @Gender, @Email, @Dpt, @Phone)" SelectCommand="SELECT * FROM [Teacher]" UpdateCommand="UPDATE [Teacher] SET [Pwd] = @Pwd, [Name] = @Name, [Gender] = @Gender, [Email] = @Email, [Dpt] = @Dpt, [Phone] = @Phone WHERE [Te_ID] = @Te_ID">
        <DeleteParameters>
            <asp:Parameter Name="Te_ID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Te_ID" Type="String" />
            <asp:Parameter Name="Pwd" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Gender" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Dpt" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Pwd" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Gender" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Dpt" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="Te_ID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

