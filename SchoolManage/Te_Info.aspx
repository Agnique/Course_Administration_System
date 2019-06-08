<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Te_Info.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="header">
        <strong>
            <asp:Label ID="Label1" runat="server" CssClass="auto-style1" Text="编辑个人信息"></asp:Label>
        </strong>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" EnableModelValidation="false" OnPageIndexChanging="FormView1_PageIndexChanging" >
        <ItemTemplate>
                        <table style="font-size:12px; font-family:宋体; background-color:#F5F5F5 "  border="0">
                <tr>
                    <td style="width:60px;" align="right">职工号：</td>
                    <td style="width:110px"><asp:Label ID="Label1" runat="server" Text='<%# Eval("Te_ID") %>' /></td>
                </tr>
                <tr>
                    <td style="width:60px;" align="right">姓名：</td>
                    <td style="width:110px"><asp:Label ID="Label2" runat="server" Text='<%# Eval("Name") %>' /></td>
                </tr>
                <tr>
                    <td style="width:60px;" align="right">性别：</td>
                    <td style="width:110px"><asp:Label ID="Label3" runat="server" Text='<%# Eval("Gender") %>' /></td>
                </tr>
                <tr>
                    <td style="width:60px;" align="right">部门：</td>
                    <td style="width:110px"><asp:Label ID="Label4" runat="server" Text='<%# Eval("Dpt") %>' /></td>
                </tr>
                <tr>
                    <td style="width:60px;" align="right">Email：</td>
                    <td style="width:110px"><asp:Label ID="txtEmail" runat="server" Text='<%# Eval("Email") %>' /></td>
                </tr>
                <tr>
                    <td style="width:60px;" align="right">手机号：</td>
                    <td style="width:110px"><asp:Label ID="txtPhone" runat="server" Text='<%# Eval("Phone") %>' /></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="编辑" />
                    </td>
                </tr>
            </table>
        </ItemTemplate>
        <EditItemTemplate>
            <table style="font-size:12px; font-family:宋体; background-color:#F5F5F5 "  border="0">
                <tr>
                    <td style="width:60px;" align="right">职工号：</td>
                    <td style="width:110px"><asp:Label ID="Label1" runat="server" Text='<%# Bind("Te_ID") %>' /></td>
                </tr>
                <tr>
                    <td style="width:60px;" align="right">姓名：</td>
                    <td style="width:110px"><asp:Label ID="Label2" runat="server" Text='<%# Eval("Name") %>' /></td>
                </tr>
                <tr>
                    <td style="width:60px;" align="right">性别：</td>
                    <td style="width:110px"><asp:Label ID="Label3" runat="server" Text='<%# Eval("Gender") %>' /></td>
                </tr>
                <tr>
                    <td style="width:60px;" align="right">部门：</td>
                    <td style="width:110px"><asp:Label ID="Label4" runat="server" Text='<%# Eval("Dpt") %>' /></td>
                </tr>
                <tr>
                    <td style="width:60px;" align="right">Email：</td>
                    <td style="width:110px"><asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email") %>' /></td>
                </tr>
                <tr>
                    <td style="width:60px;" align="right">手机号：</td>
                    <td style="width:110px"><asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("Phone") %>' /></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="False" CommandName="Update" Text="更新" />
                    </td>
                </tr>
            </table>
        </EditItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:schoolConnectionString %>" 
        SelectCommand=""
        UpdateCommand="UPDATE Teacher SET Email = @Email, Phone=@Phone WHERE Te_ID = @Te_ID" >
        <UpdateParameters>
            <asp:Parameter Name="Te_ID" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />            
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

