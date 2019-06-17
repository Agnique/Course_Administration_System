<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Grade_Homework.aspx.cs" Inherits="_Default" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="header">
        <strong>
            <asp:Label ID="Label1" runat="server" CssClass="auto-style1" Text="作业批改"></asp:Label>
        </strong>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    课程号:   
    <asp:TextBox ID="txtCs_ID" runat="server" Width="100px"></asp:TextBox>
    &nbsp;课程名：
    <asp:TextBox ID="txtName" runat="server" Width="100px"></asp:TextBox>
    &nbsp;周次: 
    <asp:TextBox ID="txtWeek" runat="server" Width="50px"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="查询" CausesValidation="False" />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Hw_ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%" Font-Size="12px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText="课程号" SortExpression="Cs_ID">
                <EditItemTemplate>
                    <asp:TextBox ID="txtCs_ID" runat="server" Text='<%# Bind("Cs_ID") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Cs_ID") %>'></asp:Label>
                </ItemTemplate>
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
            </asp:TemplateField>
            <asp:BoundField DataField="Handout" HeaderText="布置时间" SortExpression="Handout" />
            <asp:TemplateField HeaderText="截止时间" SortExpression="Handin">
                <EditItemTemplate>
                    <asp:Label ID="txtHandin" runat="server" Text='<%# Bind("Handin") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Handin") %>'></asp:Label>
                </ItemTemplate>
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
    <br />
    <asp:Label ID="lblTooltip" runat="server" Style="font-size: 12pt; color: red; font-family: 宋体;"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:schoolConnectionString %>" SelectCommand="SELECT Homework.Cs_ID, Cs_Name, Hw_ID, Hw_Week, Handout, Handin
FROM Homework JOIN Course ON Course.Cs_ID = Homework.Cs_ID
JOIN Teacher ON Course.Te_ID = Teacher.Te_ID
WHERE Teacher.Te_ID = @Te_ID AND Homework.Cs_ID LIKE '%'+@Cs_ID+'%' AND Cs_Name LIKE '%'+@Cs_Name+'%' AND Hw_Week LIKE '%'+@Hw_Week+'%'"
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
            <asp:ControlParameter ControlID="txtCs_ID" Name="Cs_ID" PropertyName="Text" ConvertEmptyStringToNull="False" />
            <asp:ControlParameter ControlID="txtName" Name="Cs_Name" PropertyName="Text" ConvertEmptyStringToNull="False" />
            <asp:ControlParameter ControlID="txtWeek" Name="Hw_Week" PropertyName="Text" ConvertEmptyStringToNull="False" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Handin" />
            <asp:Parameter Name="Hw_ID" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="Hw_ID" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Height="50px" Width="100%" Font-Size="12px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" Width="20%" />
        <Fields>
            <asp:BoundField DataField="Hw_ID" HeaderText="作业号" ReadOnly="True" SortExpression="Hw_ID" />
            <asp:BoundField DataField="Hw" HeaderText="作业内容" SortExpression="Hw" />
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:schoolConnectionString %>" SelectCommand="SELECT [Hw_ID], [Hw] FROM [Homework] WHERE ([Hw_ID] = @Hw_ID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="Hw_ID" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Stu_Hw_ID" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Width="100%" EmptyDataText="暂无作业提交记录！" Font-Size="12px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Stu_Hw_ID" HeaderText="学生作业号" ReadOnly="True" SortExpression="Stu_Hw_ID" />
            <asp:BoundField DataField="Stu_ID" HeaderText="学号" SortExpression="Stu_ID" />
            <asp:BoundField DataField="Stu_Name" HeaderText="姓名" SortExpression="Stu_Name" />
            <asp:BoundField DataField="Handin" HeaderText="上交时间" SortExpression="Handin" />
            <asp:BoundField DataField="Status" HeaderText="状态" SortExpression="Status" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="批改"></asp:LinkButton>
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
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:schoolConnectionString %>" SelectCommand="Select Stu_Hw_ID, StudentHomework.Stu_ID, Stu_Name, StudentHomework.Handin, Status From StudentHomework 
JOIN Homework on Homework.Hw_ID = StudentHomework.Hw_ID
JOIN Course ON Homework.Cs_ID = Course.Cs_ID
JOIN Student ON StudentHomework.Stu_ID = Student.Stu_ID
Where Course.Te_ID = @Te_ID AND Homework.Hw_ID = @Hw_ID
Order by Status">
        <SelectParameters>
            <asp:SessionParameter Name="Te_ID" SessionField="UserName" />
            <asp:ControlParameter ControlID="GridView1" Name="Hw_ID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
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
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Stu_Hw_ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="学号" SortExpression="Stu_ID">
                <EditItemTemplate>
                    <asp:Label ID="Label" runat="server" Text='<%# Eval("Stu_ID") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Stu_ID") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Stu_ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="提交内容" SortExpression="Handin_Homework">
                <EditItemTemplate>
                    <asp:Label ID="TextBox2" runat="server" Text='<%# Bind("Handin_Homework") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Handin_Homework") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Handin_Homework") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="提交时间" SortExpression="Handin">
                <EditItemTemplate>
                    <asp:Label ID="TextBox3" runat="server" Text='<%# Bind("Handin") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Handin") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Handin") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="状态" SortExpression="Status">
                <EditItemTemplate>

                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="评语" SortExpression="Comment">
                <EditItemTemplate>
                    <asp:TextBox ID="txtComment" runat="server" Text='<%# Bind("Comment") %>' Width="80%" Height="50px" TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Comment") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Comment") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="成绩" SortExpression="Grade">
                <EditItemTemplate>
                    <asp:TextBox ID="txtGrade" runat="server" Text='<%# Bind("Grade") %>' Width="80%" MaxLength="3"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Grade") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Grade") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="批改时间" SortExpression="Grade_Time">
                <EditItemTemplate>

                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Grade_Time") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Grade_Time") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" OnClick="lbUpdate_Click" Text="提交"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="批改"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>
    <asp:Label ID="lblTooltip1" runat="server" Style="font-size: 12pt; color: red; font-family: 宋体;"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:schoolConnectionString %>" 
        DeleteCommand="DELETE FROM [StudentHomework] WHERE [Stu_Hw_ID] = @Stu_Hw_ID" 
        InsertCommand="INSERT INTO [StudentHomework] ([Stu_Hw_ID], [Stu_ID], [Handin_Homework], [Handin], [Status], [Comment], [Grade], [Grade_Time]) VALUES (@Stu_Hw_ID, @Stu_ID, @Handin_Homework, @Handin, @Status, @Comment, @Grade, @Grade_Time)" 
        SelectCommand="SELECT [Stu_Hw_ID], [Stu_ID], [Handin_Homework], [Handin], [Status], [Comment], [Grade], [Grade_Time] FROM [StudentHomework] WHERE ([Stu_Hw_ID] = @Stu_Hw_ID)" 
        UpdateCommand="UPDATE [StudentHomework] SET [Status] = @Status, [Comment] = @Comment, [Grade] = @Grade, [Grade_Time] = @Grade_Time WHERE [Stu_Hw_ID] = @Stu_Hw_ID">
        <DeleteParameters>
            <asp:Parameter Name="Stu_Hw_ID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Stu_Hw_ID" Type="String" />
            <asp:Parameter Name="Stu_ID" Type="String" />
            <asp:Parameter Name="Handin_Homework" Type="String" />
            <asp:Parameter Name="Handin" Type="DateTime" />
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="Comment" Type="String" />
            <asp:Parameter Name="Grade" Type="Int16" />
            <asp:Parameter Name="Grade_Time" Type="DateTime" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView2" Name="Stu_Hw_ID" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Status" Type="String" DefaultValue="已批改" />
            <asp:Parameter Name="Comment" Type="String" />
            <asp:Parameter Name="Grade" Type="Int16" />
            <asp:Parameter Name="Grade_Time" Type="DateTime" />
            <asp:ControlParameter ControlID="GridView2" Name="Stu_Hw_ID" PropertyName="SelectedValue" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>

