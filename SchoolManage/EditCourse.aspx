<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditCourse.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="header">
        <strong>
            <asp:Label ID="Label1" runat="server" CssClass="auto-style1" Text="课程信息管理"></asp:Label>
        </strong>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    课程号:   
    <asp:TextBox ID="txtCs_ID" runat="server" Width="50px"></asp:TextBox>
    &nbsp;课程名：
    <asp:TextBox ID="txtCs_Name" runat="server" Width="100px"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="查询" CausesValidation="False" CommandName="Select" />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Cs_ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" ShowFooter="True" Font-Size="12px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText="选项">
                <ItemTemplate>
                    <asp:CheckBox ID="chkSelectRow" runat="server" />
                </ItemTemplate>
                <FooterTemplate>
                    <asp:LinkButton ID="lbDelete" runat="server" CausesValidation="False" OnClick="lbDelete_Click" Text="删除" Font-Size="12px"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="lbInsert" runat="server" OnClick="lbInsert_Click" ValidationGroup="Insert">添加</asp:LinkButton>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="课程号" SortExpression="Cs_ID">
                <EditItemTemplate>
                    <asp:Label ID="txtCs_ID" runat="server" Text='<%# Eval("Cs_ID") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="txtCs_ID" runat="server" Text='<%# Bind("Cs_ID") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtCs_ID" runat="server" Width="80px" MaxLength="9"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCs_ID" runat="server" ErrorMessage="不能为空" Text="*" ForeColor="Red" ValidationGroup="Insert" ControlToValidate="txtCs_ID"></asp:RequiredFieldValidator>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="课程名" SortExpression="Cs_Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Cs_Name") %>' Width="100px" MaxLength="10"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="不能为空" Text="*" ForeColor="Red" ValidationGroup="Edit" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Cs_Name") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtCs_Name" runat="server" Width="100px" MaxLength="10"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="不能为空" Text="*" ForeColor="Red" ValidationGroup="Insert" ControlToValidate="txtCs_Name"></asp:RequiredFieldValidator>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="上课时间" SortExpression="Cs_Time">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Cs_Time") %>' Width="50px" MaxLength="5"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Cs_Time") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtCs_Time" runat="server" Width="50px" MaxLength="5"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="上课地点" SortExpression="Cs_Place">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Cs_Place") %>' Width="50px" MaxLength="5"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Cs_Place") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtCs_Place" runat="server" Width="50px" MaxLength="5"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="学年" SortExpression="Cs_Year">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Cs_Year") %>' Width="50px" MaxLength="4"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Cs_Year") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtCs_Year" runat="server" Width="50px" MaxLength="4"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="学期" SortExpression="Cs_Semster">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Cs_Semster") %>' Width="50px" MaxLength="2"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Cs_Semster") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtCs_Semester" runat="server" Width="50px" MaxLength="2"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="任课教师职工号" SortExpression="Te_ID">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Te_ID") %>' Width="50px" MaxLength="5"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Te_ID") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtTe_ID" runat="server" Width="50px" MaxLength="5"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="编辑" Font-Size="12px"></asp:LinkButton>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新" Font-Size="12px" ValidationGroup="Edit"></asp:LinkButton>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:schoolConnectionString %>" 
        DeleteCommand="DELETE FROM [Course] WHERE [Cs_ID] = @Cs_ID" 
        InsertCommand="INSERT INTO [Course] ([Cs_ID], [Cs_Name], [Cs_Time], [Cs_Place], [Cs_Year], [Cs_Semster], [Te_ID]) VALUES (@Cs_ID, @Cs_Name, @Cs_Time, @Cs_Place, @Cs_Year, @Cs_Semster, @Te_ID)" 
        SelectCommand="SELECT * FROM [Course] WHERE (Cs_ID LIKE '%' + @Cs_ID + '%') AND (Cs_Name LIKE '%' + @Cs_Name + '%')" 
        UpdateCommand="UPDATE [Course] SET [Cs_Name] = @Cs_Name, [Cs_Time] = @Cs_Time, [Cs_Place] = @Cs_Place, [Cs_Year] = @Cs_Year, [Cs_Semster] = @Cs_Semster, [Te_ID] = @Te_ID WHERE [Cs_ID] = @Cs_ID">
        <DeleteParameters>
            <asp:Parameter Name="Cs_ID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Cs_ID" Type="String" />
            <asp:Parameter Name="Cs_Name" Type="String" />
            <asp:Parameter Name="Cs_Time" Type="String" />
            <asp:Parameter Name="Cs_Place" Type="String" />
            <asp:Parameter Name="Cs_Year" Type="Int16" />
            <asp:Parameter Name="Cs_Semster" Type="String" />
            <asp:Parameter Name="Te_ID" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Cs_Name" Type="String" />
            <asp:Parameter Name="Cs_Time" Type="String" />
            <asp:Parameter Name="Cs_Place" Type="String" />
            <asp:Parameter Name="Cs_Year" Type="Int16" />
            <asp:Parameter Name="Cs_Semster" Type="String" />
            <asp:Parameter Name="Te_ID" Type="String" />
            <asp:Parameter Name="Cs_ID" Type="String" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtCs_ID" Name="Cs_ID" PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
            <asp:ControlParameter ControlID="txtCs_Name" Name="Cs_Name" PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

