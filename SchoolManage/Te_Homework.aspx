<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Te_Homework.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="header">
        <strong>
            <asp:Label ID="Label1" runat="server" CssClass="auto-style1" Text="作业发布"></asp:Label>
        </strong>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Hw_ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" ShowFooter="True" Width="100%" Font-Size="12px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText="选项">
                <ItemTemplate>
                    <asp:CheckBox ID="chkSelectRow" runat="server" />
                </ItemTemplate>
                <FooterTemplate>
                    <asp:LinkButton ID="lbDelete" runat="server" CausesValidation="False" OnClick="lbDelete_Click" Text="删除" Font-Size="12px"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="lbInsert" runat="server" OnClick="lbInsert_Click" ValidationGroup="Insert" Text="添加"></asp:LinkButton>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="课程号" SortExpression="Cs_ID">
                <EditItemTemplate>
                    <asp:TextBox ID="txtCs_ID" runat="server" Text='<%# Bind("Cs_ID") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Cs_ID") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtCs_ID" runat="server" Width="80px" MaxLength="9"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="不能为空" Text="*" ForeColor="Red" ControlToValidate="txtCs_ID" ValidationGroup="Insert"></asp:RequiredFieldValidator>

                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="课程名" SortExpression="Cs_Name">
                <EditItemTemplate>
                    <asp:Label ID="TextBox3" runat="server" Text='<%# Bind("Cs_Name") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="txtCs_Name" runat="server" Text='<%# Bind("Cs_Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="作业号" SortExpression="Hw_ID">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Hw_ID") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="txtHw_ID" runat="server" Text='<%# Bind("Hw_ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="周次" SortExpression="Hw_Week">
                <EditItemTemplate>
                    <asp:TextBox ID="txtHw_Week" runat="server" Text='<%# Bind("Hw_Week") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="txtHw_Week" runat="server" Text='<%# Bind("Hw_Week") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtHw_Week" runat="server" Width="80px" MaxLength="9"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="不能为空" Text="*" ForeColor="Red" ControlToValidate="txtHw_Week" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Handout" HeaderText="布置时间" SortExpression="Handout" />
            <asp:TemplateField HeaderText="截止时间" SortExpression="Handin">
                <EditItemTemplate>
                    <asp:Label ID="txtHandin" runat="server" Text='<%# Bind("Handin") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Handin") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtHandin" runat="server" Width="80px"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="查看"></asp:LinkButton>
                </ItemTemplate>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:schoolConnectionString %>" SelectCommand="SELECT Homework.Cs_ID, Cs_Name, Hw_ID, Hw_Week, Handout, Handin
FROM Homework JOIN Course ON Course.Cs_ID = Homework.Cs_ID
JOIN Teacher ON Course.Te_ID = Teacher.Te_ID
WHERE Teacher.Te_ID = @Te_ID"
        DeleteCommand="DELETE FROM Homework WHERE Hw_ID = @Hw_ID" InsertCommand="INSERT INTO Homework (Hw_ID, Cs_ID, Hw_Week, Handout, Handin) VALUES (@Hw_ID, @Cs_ID, @Hw_Week, @Handout, @Handin)" UpdateCommand="UPDATE Homework SET Handin = @Handin WHERE Hw_ID = @Hw_ID">
        <DeleteParameters>
            <asp:Parameter Name="Hw_ID" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Hw_ID" />
            <asp:Parameter Name="Cs_ID" />
            <asp:Parameter Name="Hw_Week" />
            <asp:Parameter Name="Handout" />
            <asp:Parameter Name="Handin" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="Te_ID" SessionField="UserName" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Handin" />
            <asp:Parameter Name="Hw_ID" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="Hw_ID" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Height="50px" Width="100%" Font-Size="12px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" Width="20%" />
        <Fields>
            <asp:TemplateField HeaderText="作业号" SortExpression="Hw_ID">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Hw_ID") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Hw_ID") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Hw_ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="布置时间" SortExpression="Handout">
                <EditItemTemplate>
                    <asp:Label ID="TextBox3" runat="server" Text='<%# Bind("Handout") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Handout") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Handout") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="截止时间" SortExpression="Handin">
                <EditItemTemplate>
                    <asp:TextBox ID="txtHandin" runat="server" Text='<%# Bind("Handin") %>' Width="80%"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Handin") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Handin") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="作业内容" SortExpression="Hw">
                <EditItemTemplate>
                    <asp:TextBox ID="txtHw" runat="server" Text='<%# Bind("Hw") %>' Width="80%" Height="80px" TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Hw") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Hw") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" OnClick="lbUpdate_Click" Text="更新"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="编辑"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>
    <asp:Label ID="lblTooltip1" runat="server" Style="font-size: 12pt; color: red; font-family: 宋体;"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:schoolConnectionString %>" DeleteCommand="DELETE FROM [Homework] WHERE [Hw_ID] = @Hw_ID" InsertCommand="INSERT INTO [Homework] ([Hw_ID], [Hw]) VALUES (@Hw_ID, @Hw)" SelectCommand="SELECT [Hw_ID],[Handout],[Handin],[Hw] FROM [Homework] WHERE ([Hw_ID] = @Hw_ID)" UpdateCommand="UPDATE [Homework] SET [Hw] = @Hw, [Handin] = @Handin WHERE [Hw_ID] = @Hw_ID">
        <DeleteParameters>
            <asp:Parameter Name="Hw_ID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Hw_ID" Type="String" />
            <asp:Parameter Name="Hw" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="Hw_ID" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Hw" />
            <asp:Parameter Name="Handin" />
            <asp:Parameter Name="Hw_ID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>

