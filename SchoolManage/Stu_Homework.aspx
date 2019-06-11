<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Stu_Homework.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="header">
        <strong>
            <asp:Label ID="Label1" runat="server" CssClass="auto-style1" Text="查看作业"></asp:Label>
        </strong>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    课程名:  
    <asp:TextBox ID="txtCs_Name" runat="server" Width="100px"></asp:TextBox>
    课程号：
    <asp:TextBox ID="txtCs_ID" runat="server" Width="100px"></asp:TextBox>
    周次：
    <asp:TextBox ID="txtHw_Week" runat="server" Width="50px"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="查询" CausesValidation="False" CommandName="Select" />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Hw_ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%" OnRowDataBound="GridView1_RowDataBound">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText="作业号" SortExpression="Hw_ID">
                <EditItemTemplate>
                    <asp:Label ID="txtHw_ID" runat="server" Text='<%# Eval("Hw_ID") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="txtHw_ID" runat="server" Text='<%# Bind("Hw_ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="课程号" SortExpression="Cs_ID">
                <EditItemTemplate>
                    <asp:TextBox ID="txtCs_ID" runat="server" Text='<%# Bind("Cs_ID") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="txtCs_ID" runat="server" Text='<%# Bind("Cs_ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="课程名" SortExpression="Cs_Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Cs_Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Cs_Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="周次" SortExpression="Hw_Week">
                <EditItemTemplate>
                    <asp:TextBox ID="txtHw_Week" runat="server" Text='<%# Bind("Hw_Week") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="txtHw_Week" runat="server" Text='<%# Bind("Hw_Week") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="布置时间" SortExpression="Handout">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Handout") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Handout") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="截止时间" SortExpression="Handin">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Handin") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Handin") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowSelectButton="True" SelectText="查看" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:schoolConnectionString %>" SelectCommand="SELECT Homework.Hw_ID, Homework.Cs_ID, Cs_Name, Hw_Week, Handout, Handin
FROM Homework JOIN Course ON Homework.Cs_ID = Course.Cs_ID
JOIN StudentCourse ON StudentCourse.Cs_ID = Homework.Cs_ID
JOIN Student ON Student.Stu_ID = StudentCourse.Stu_ID
WHERE Student.Stu_ID = @Stu_ID AND Course.Cs_ID LIKE '%' + @Cs_ID + '%' AND Course.Cs_Name LIKE '%' +@Cs_Name+'%'
AND Hw_Week LIKE '%'+ @Hw_Week+'%'
">
        <SelectParameters>
            <asp:SessionParameter Name="Stu_ID" SessionField="UserName" ConvertEmptyStringToNull="False" />
            <asp:ControlParameter ControlID="txtCs_ID" Name="Cs_ID" PropertyName="Text" ConvertEmptyStringToNull="False" />
            <asp:ControlParameter ControlID="txtCs_Name" Name="Cs_Name" PropertyName="Text" ConvertEmptyStringToNull="False" />
            <asp:ControlParameter ControlID="txtHw_Week" Name="Hw_Week" PropertyName="Text" ConvertEmptyStringToNull="False" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="Hw_ID" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Height="50px" Width="100%">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" Width="20%" />
        <Fields>
            <asp:BoundField DataField="Hw_ID" HeaderText="作业号" ReadOnly="True" SortExpression="Hw_ID" />
            <asp:BoundField DataField="Handout" HeaderText="布置时间" SortExpression="Handout" />
            <asp:BoundField DataField="Handin" HeaderText="截止时间" SortExpression="Handin" />
            <asp:BoundField DataField="Hw" HeaderText="作业内容" SortExpression="Hw" />
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:schoolConnectionString %>" SelectCommand="SELECT [Hw_ID], [Handout], [Handin], [Hw] FROM [Homework] WHERE ([Hw_ID] = @Hw_ID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="Hw_ID" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="Stu_Hw_ID" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Height="50px" Width="100%">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" Width="20%" />
        <Fields>
            <asp:TemplateField HeaderText="学生作业号" SortExpression="Stu_Hw_ID">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Stu_Hw_ID") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="txtStu_Hw_ID" runat="server" Text='<%# Bind("Stu_Hw_ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="提交内容" SortExpression="Handin_Homework">
                <EditItemTemplate>
                    <asp:TextBox ID="txtHandin_Homework" runat="server" Text='<%# Bind("Handin_Homework") %>' Width="80%" Height="80px" TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="txtHandin_Homework" runat="server" Text='<%# Bind("Handin_Homework") %>' Width="80%" Height="80px" TextMode="MultiLine"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Handin_Homework") %>' Width="80%" Height="30px"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="提交时间" SortExpression="Handin">
                <EditItemTemplate>
                    <asp:Label ID="txtHandin" runat="server" Text='<%# Eval("Handin") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Handin") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="状态" SortExpression="Status">
                <EditItemTemplate>
                    <asp:Label ID="txtStatus" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="txtStatus" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="教师评语" SortExpression="Comment">
                <EditItemTemplate>
                    <asp:Label ID="TextBox4" runat="server" Text='<%# Bind("Comment") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Comment") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="成绩" SortExpression="Grade">
                <EditItemTemplate>
                    <asp:Label ID="TextBox5" runat="server" Text='<%# Bind("Grade") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Grade") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="批改时间" SortExpression="Grade_Time">
                <EditItemTemplate>
                    <asp:Label ID="TextBox6" runat="server" Text='<%# Bind("Grade_Time") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Grade_Time") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" OnClick="Insert_Click" Text="插入"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" Text="编辑" OnClick="lbEdit_Click"></asp:LinkButton>
                    &nbsp;&nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" Text="删除" CommandName="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
        <EmptyDataTemplate>
            暂无提交记录！
            <asp:Button ID="Button1" runat="server" Text="添加新的提交" OnClick="Button1_Click" />
        </EmptyDataTemplate>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>
    <asp:Label ID="lblTooltip" runat="server" Style="font-size: 12pt; color: red; font-family: 宋体;"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:schoolConnectionString %>"
        InsertCommand="Insert into StudentHomework (Stu_Hw_ID, Stu_ID, Hw_ID, Handin_Homework, Handin, Status)
Values(@Stu_Hw_ID, @Stu_ID, @Hw_ID, @Handin_Homework, @Handin, @Status)"
        SelectCommand="SELECT Stu_Hw_ID, Handin_Homework, Handin, Status, Comment, Grade, Grade_Time
From StudentHomework 
Where Hw_ID = @Hw_ID and Stu_ID = @Stu_ID"
        UpdateCommand="Update StudentHomework SET Handin_Homework = @Handin_Homework WHERE Stu_Hw_ID = @Stu_Hw_ID" DeleteCommand="DELETE FROM StudentHomework WHERE Stu_Hw_ID = @Stu_Hw_ID">
        <DeleteParameters>
            <asp:Parameter Name="Stu_Hw_ID" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Stu_Hw_ID" />
            <asp:Parameter Name="Stu_ID" />
            <asp:Parameter Name="Hw_ID" />
            <asp:Parameter Name="Handin_Homework" />
            <asp:Parameter Name="Handin" />
            <asp:Parameter Name="Status" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="Hw_ID" PropertyName="SelectedValue" />
            <asp:SessionParameter Name="Stu_ID" SessionField="UserName" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Handin_Homework" />
            <asp:Parameter Name="Stu_Hw_ID" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>

