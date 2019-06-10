<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditRegister.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="header">
        <strong>
            <asp:Label ID="Label1" runat="server" CssClass="auto-style1" Text="选课信息管理"></asp:Label>
        </strong>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    课程号:   
    <asp:TextBox ID="txtCs_ID" runat="server" Width="50px"></asp:TextBox>
    &nbsp;课程名：
    <asp:TextBox ID="txtCs_Name" runat="server" Width="100px"></asp:TextBox>
    &nbsp;学号: 
    <asp:TextBox ID="txtStu_ID" runat="server" Width="50px"></asp:TextBox>
    &nbsp;姓名:
    <asp:TextBox ID="txtStu_Name" runat="server" Width="80px"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="查询" CausesValidation="False" CommandName="Select" />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" ShowFooter="True" Font-Size="12px" Width="100%">
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
                    <asp:Label ID="txtCs_ID" runat="server" Text='<%# Bind("Cs_ID") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="txtCs_ID" runat="server" Text='<%# Bind("Cs_ID") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtCs_ID" runat="server" Width="80px" MaxLength="9"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvID" runat="server" ErrorMessage="不能为空" ControlToValidate="txtCs_ID" Text="*" ForeColor="Red" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="课程名" SortExpression="Cs_Name">
                <EditItemTemplate>
                    <asp:Label ID="txtCs_Name" runat="server" Text='<%# Bind("Cs_Name") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="txtCs_Name" runat="server" Text='<%# Bind("Cs_Name") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate></FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="学号" SortExpression="Stu_ID">
                <EditItemTemplate>
                    <asp:Label ID="txtStu_ID" runat="server" Text='<%# Bind("Stu_ID") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="txtStu_ID" runat="server" Text='<%# Bind("Stu_ID") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtStu_ID" runat="server" Width="50px" MaxLength="5"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvSID" runat="server" ErrorMessage="不能为空" ControlToValidate="txtStu_ID" Text="*" ForeColor="Red" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="姓名" SortExpression="Stu_Name">
                <EditItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Stu_Name") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Stu_Name") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate></FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="成绩" SortExpression="Grade">
                <EditItemTemplate>
                    <asp:TextBox ID="txtGrade" runat="server" Text='<%# Bind("Grade") %>' Width="50px" MaxLength="3"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="txtGrade" runat="server" Text='<%# Bind("Grade") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtGrade" runat="server" Width="30px" MaxLength="3"></asp:TextBox>
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
        SelectCommand="SELECT StudentCourse.Cs_ID, Cs_Name, StudentCourse.Stu_ID, Stu_Name, Grade FROM StudentCourse 
        JOIN Course ON StudentCourse.Cs_ID = Course.Cs_ID 
        JOIN Student ON StudentCourse.Stu_ID = Student.Stu_ID
        WHERE (StudentCourse.Cs_ID LIKE '%'+@Cs_ID+'%') AND (StudentCourse.Stu_ID LIKE '%'+@Stu_ID+'%') AND (Stu_Name LIKE '%'+@Stu_Name+'%') AND (Cs_Name LIKE '%'+@Cs_Name+'%')"
        DeleteCommand="DELETE FROM StudentCourse Where Cs_ID = @Cs_ID AND Stu_ID = @Stu_ID"
        InsertCommand="INSERT INTO StudentCourse ([Cs_ID], [Stu_ID], [Grade]) VALUES (@Cs_ID, @Stu_ID, @Grade)"
        UpdateCommand="UPDATE StudentCourse SET Grade = @Grade Where Cs_ID = @Cs_ID AND Stu_ID = @Stu_ID">
        <DeleteParameters>
            <asp:Parameter Name="Cs_ID" />
            <asp:Parameter Name="Stu_ID" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Cs_ID" />
            <asp:Parameter Name="Stu_ID" />
            <asp:Parameter Name="Grade" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Grade" />
            <asp:Parameter Name="Cs_ID" />
            <asp:Parameter Name="Stu_ID" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtCs_ID" Name="Cs_ID" PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
            <asp:ControlParameter ControlID="txtCs_Name" Name="Cs_Name" PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
            <asp:ControlParameter ControlID="txtStu_ID" Name="Stu_ID" PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
            <asp:ControlParameter ControlID="txtStu_Name" Name="Stu_Name" PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

