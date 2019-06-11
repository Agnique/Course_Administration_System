<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditHomework.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="header">
        <strong>
            <asp:Label ID="Label1" runat="server" CssClass="auto-style1" Text="作业信息管理"></asp:Label>
        </strong>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    课程号:   
    <asp:TextBox ID="txtCs_ID" runat="server" Width="100px" MaxLength="9"></asp:TextBox>
    &nbsp;周次：
    <asp:TextBox ID="txtHw_Week" runat="server" Width="50px" MaxLength="2"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="查询" CausesValidation="False" CommandName="Select" />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Hw_ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AllowPaging="True" Font-Size="12px" ShowFooter="True" Width="100%">
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
            <asp:TemplateField HeaderText="作业号" SortExpression="Hw_ID">
                <EditItemTemplate>
                    <asp:Label ID="txtHw_ID" runat="server" Text='<%# Eval("Hw_ID") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="txtHw_ID" runat="server" Text='<%# Bind("Hw_ID") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtHw_ID" runat="server" Width="80px" MaxLength="5"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvHW" runat="server" ErrorMessage="不能为空" ControlToValidate="txtHw_ID" ValidationGroup="Insert" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="课程号" SortExpression="Cs_ID">
                <EditItemTemplate>
                    <asp:Label ID="txtCs_ID" runat="server" Text='<%# Bind("Cs_ID") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Cs_ID") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtCs_ID" runat="server" Width="100px" MaxLength="9"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCS" runat="server" ErrorMessage="不能为空" ControlToValidate="txtCs_ID" ValidationGroup="Insert" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="周次" SortExpression="Hw_Week">
                <EditItemTemplate>
                    <asp:TextBox ID="txtHw_Week" runat="server" Text='<%# Bind("Hw_Week") %>' Width="50px" MaxLength="2"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="txtHw_Week" runat="server" Text='<%# Bind("Hw_Week") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtHw_Week" runat="server" Width="50px" MaxLength="2"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="布置时间" SortExpression="Handout">
                <EditItemTemplate>
                    <asp:TextBox ID="txtHandout" runat="server" Text='<%# Bind("Handout") %>' Width="100px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Handout") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtHandout" runat="server" Width="100px"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="截止时间" SortExpression="Handin">
                <EditItemTemplate>
                    <asp:TextBox ID="txtHandin" runat="server" Text='<%# Bind("Handin") %>' Width="100px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Handin") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtHandin" runat="server" Width="100px"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Select" Text="查看" Font-Size="12px"></asp:LinkButton>
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
        SelectCommand="SELECT [Hw_ID], [Cs_ID], [Hw_Week], [Handout], [Handin] FROM [Homework] WHERE (Cs_ID LIKE '%' + @Cs_ID + '%') AND (Hw_Week LIKE '%' + @Hw_Week + '%')"
        DeleteCommand="DELETE FROM [Homework] WHERE [Hw_ID] = @Hw_ID"
        InsertCommand="INSERT INTO [Homework] ([Hw_ID], [Cs_ID], [Hw_Week], [Handout], [Handin]) VALUES (@Hw_ID, @Cs_ID, @Hw_Week, @Handout, @Handin)"
        UpdateCommand="UPDATE [Homework] SET [Cs_ID] = @Cs_ID, [Hw_Week] = @Hw_Week, [Handout] = @Handout, [Handin] = @Handin WHERE [Hw_ID] = @Hw_ID">
        <DeleteParameters>
            <asp:Parameter Name="Hw_ID" Type="String" />
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtCs_ID" Name="Cs_ID" PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
            <asp:ControlParameter ControlID="txtHw_Week" Name="Hw_Week" PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="Hw_ID" Type="String" />
            <asp:Parameter Name="Cs_ID" Type="String" />
            <asp:Parameter Name="Hw_Week" Type="Int16" />
            <asp:Parameter Name="Handout" Type="DateTime" />
            <asp:Parameter Name="Handin" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Cs_ID" Type="String" />
            <asp:Parameter Name="Hw_Week" Type="Int16" />
            <asp:Parameter Name="Handout" Type="DateTime" />
            <asp:Parameter Name="Handin" Type="DateTime" />
            <asp:Parameter Name="Hw_ID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="Hw_ID" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Height="50px" Width="100%" AllowPaging="True" OnPageIndexChanging="DetailsView1_PageIndexChanging" Font-Size="12px" EmptyDataText="暂无选中作业信息!">
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
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Hw_ID") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Hw_ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="作业内容" SortExpression="Hw">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Hw") %>' Width="80%" Height="50px" TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Hw") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Hw") %>' Width="80%" Height="50px"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" />

        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:schoolConnectionString %>" SelectCommand="SELECT Hw_ID, Hw FROM Homework WHERE Hw_ID = @Hw_ID" UpdateCommand="UPDATE Homework SET Hw = @Hw WHERE Hw_ID = @Hw_ID">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="Hw_ID" PropertyName="SelectedValue" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Hw" />
            <asp:Parameter Name="Hw_ID" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    学号:   
    <asp:TextBox ID="txtStu_ID" runat="server" Width="100px" MaxLength="5"></asp:TextBox>
    &nbsp;姓名：
    <asp:TextBox ID="txtName" runat="server" Width="100px" MaxLength="5"></asp:TextBox>
    <asp:Button ID="Button2" runat="server" Text="查询" CausesValidation="False" CommandName="Select" />
    <br />
    <br />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Stu_Hw_ID" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" AllowPaging="True" Font-Size="12px" ShowFooter="True" Width="100%">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText="选项">
                <ItemTemplate>
                    <asp:CheckBox ID="chkSelectRow" runat="server" />
                </ItemTemplate>
                <FooterTemplate>
                    <asp:LinkButton ID="lbDelete" runat="server" CausesValidation="False" OnClick="lbDelete1_Click" Text="删除" Font-Size="12px"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="lbInsert" runat="server" OnClick="lbInsert1_Click" ValidationGroup="Insert1">添加</asp:LinkButton>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="学生作业号" SortExpression="Stu_Hw_ID">
                <EditItemTemplate>
                    <asp:Label ID="txtStu_Hw_ID" runat="server" Text='<%# Eval("Stu_Hw_ID") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="txtStu_Hw_ID" runat="server" Text='<%# Bind("Stu_Hw_ID") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtStu_Hw_ID" runat="server" Width="50px" MaxLength="5"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvhwid" runat="server" ErrorMessage="不能为空" ControlToValidate="txtStu_Hw_ID" ValidationGroup="Insert1" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="学号" SortExpression="Stu_ID">
                <EditItemTemplate>
                    <asp:Label ID="txtStu_ID" runat="server" Text='<%# Bind("Stu_ID") %>' Width="50px" MaxLength="5"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="txtStu_ID" runat="server" Text='<%# Bind("Stu_ID") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtStu_ID" runat="server" Width="50px" MaxLength="5"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvSTUid" runat="server" ErrorMessage="不能为空" ControlToValidate="txtStu_ID" ValidationGroup="Insert1" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="姓名" SortExpression="Stu_Name">
                <EditItemTemplate>
                    <asp:Label ID="txtName" runat="server" Text='<%# Bind("Stu_Name") %>' Width="80px" MaxLength="5"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="txtName" runat="server" Text='<%# Bind("Stu_Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="上交时间" SortExpression="Handin">
                <EditItemTemplate>
                    <asp:TextBox ID="txtHandin" runat="server" Text='<%# Bind("Handin") %>' Width="100px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="txtHandin" runat="server" Text='<%# Bind("Handin") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtHandin" runat="server" Width="100px"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="状态" SortExpression="Status">
                <EditItemTemplate>
                    <asp:DropDownList ID="dlStatus" runat="server" SelectedValue='<%# Bind("Status") %>'>
                        <asp:ListItem>未批改</asp:ListItem>
                        <asp:ListItem>已批改</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="txtStatus" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList ID="dlStatus" runat="server">
                        <asp:ListItem>未批改</asp:ListItem>
                        <asp:ListItem>已批改</asp:ListItem>
                    </asp:DropDownList>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="批改时间" SortExpression="Grade_Time">
                <EditItemTemplate>
                    <asp:TextBox ID="txtGrade_Time" runat="server" Text='<%# Bind("Grade_Time") %>' Width="100px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="txtGrade_Time" runat="server" Text='<%# Bind("Grade_Time") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtGrade_Time" runat="server" Width="100px"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Select" Text="查看" Font-Size="12px"></asp:LinkButton>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="编辑" Font-Size="12px"></asp:LinkButton>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新" Font-Size="12px" ValidationGroup="Edit1"></asp:LinkButton>
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
    <asp:Label ID="lblTooltip1" runat="server" Style="font-size: 12pt; color: red; font-family: 宋体;"></asp:Label>
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:schoolConnectionString %>" SelectCommand="SELECT Stu_Hw_ID, StudentHomework.Stu_ID, Stu_Name, StudentHomework.Handin, Status , Grade_Time
FROM StudentHomework
JOIN Homework ON StudentHomework.Hw_ID = Homework.Hw_ID
JOIN Student ON StudentHomework.Stu_ID = Student.Stu_ID
WHERE StudentHomework.Hw_ID = @Hw_ID AND (StudentHomework.Stu_ID LIKE '%' + @Stu_ID + '%') AND (Student.Stu_Name LIKE '%' + @Name + '%') "
        DeleteCommand="DELETE FROM StudentHomework WHERE Stu_Hw_ID = @Stu_Hw_ID"
        InsertCommand="INSERT INTO StudentHomework (Stu_Hw_ID, Hw_ID,Stu_ID, Handin, Status, Grade_Time)
VALUES (@Stu_Hw_ID,@Hw_ID, @Stu_ID, @Handin, @Status,@Grade_Time)"
        UpdateCommand="UPDATE StudentHomework SET Handin = @Handin, Status=@Status, Grade_Time = @Grade_Time WHERE Stu_Hw_ID = @Stu_Hw_ID">
        <DeleteParameters>
            <asp:Parameter Name="Stu_Hw_ID" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="GridView1" Name="Hw_ID" PropertyName="SelectedValue" />
            <asp:Parameter Name="Stu_Hw_ID" />
            <asp:Parameter Name="Stu_ID" />
            <asp:Parameter Name="Handin" />
            <asp:Parameter Name="Status" />
            <asp:Parameter Name="Grade_Time" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="Hw_ID" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="txtStu_ID" Name="Stu_ID" PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
            <asp:ControlParameter ControlID="txtName" Name="Name" PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Handin" />
            <asp:Parameter Name="Status" />
            <asp:Parameter Name="Grade_Time" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="Stu_Hw_ID" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None" Height="50px" Width="100%" Font-Size="12px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" Width="20%" />
        <Fields>
            <asp:TemplateField HeaderText="学生作业号" SortExpression="Stu_Hw_ID">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Stu_Hw_ID") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Stu_Hw_ID") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Stu_Hw_ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="学号" SortExpression="Stu_ID">
                <EditItemTemplate>
                    <asp:Label ID="TextBox1" runat="server" Text='<%# Bind("Stu_ID") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Stu_ID") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Stu_ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="姓名" SortExpression="Stu_Name">
                <EditItemTemplate>
                    <asp:Label ID="TextBox2" runat="server" Text='<%# Bind("Stu_Name") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Stu_Name") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Stu_Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="提交内容" SortExpression="Handin_Homework">
                <EditItemTemplate>
                    <asp:TextBox ID="txtHandinHomework" runat="server" Text='<%# Bind("Handin_Homework") %>' Width="80%" Height="50px" TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Handin_Homework") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Handin_Homework") %>' Width="80%" Height="50px"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="提交时间" SortExpression="Handin">
                <EditItemTemplate>
                    <asp:Label ID="TextBox4" runat="server" Text='<%# Bind("Handin") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Handin") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Handin") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="状态" SortExpression="Status">
                <EditItemTemplate>
                    <asp:Label ID="TextBox5" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="教师评语" SortExpression="Comment">
                <EditItemTemplate>
                    <asp:TextBox ID="txtComment" runat="server" Text='<%# Bind("Comment") %>' Width="80%" Height="30px" TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Comment") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Comment") %>' Width="80%" Height="30px"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="成绩" SortExpression="Grade">
                <EditItemTemplate>
                    <asp:TextBox ID="txtGrade" runat="server" Text='<%# Bind("Grade") %>' Width="80%"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Grade") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Grade") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="批改时间" SortExpression="Grade_Time">
                <EditItemTemplate>
                    <asp:Label ID="TextBox8" runat="server" Text='<%# Bind("Grade_Time") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Grade_Time") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("Grade_Time") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" />
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:schoolConnectionString %>" SelectCommand="SELECT Stu_Hw_ID, StudentHomework.Stu_ID, Stu_Name, Handin_Homework, Handin, Status, Comment, Grade, Grade_Time
FROM StudentHomework
JOIN Student ON Student.Stu_ID = StudentHomework.Stu_ID
WHERE Stu_Hw_ID = @Stu_Hw_ID"
        UpdateCommand="UPDATE StudentHomework SET Handin_Homework = @Handin_Homework, Comment = @Comment, Grade=@Grade
WHERE Stu_Hw_ID = @Stu_Hw_ID">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView2" Name="Stu_Hw_ID" PropertyName="SelectedValue" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Handin_Homework" />
            <asp:Parameter Name="Comment" />
            <asp:Parameter Name="Grade" />
            <asp:ControlParameter ControlID="GridView2" Name="Stu_Hw_ID" PropertyName="SelectedValue" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>

