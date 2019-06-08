<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="header">
        <strong>
            <asp:Label ID="Label1" runat="server" CssClass="auto-style1" Text="欢迎使用教务管理系统"></asp:Label>
        </strong>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table width="300" style="border:1px solid #507CD1; background-color: #DAE3F5;" align="center">
    <tr style="height: 35px;">
      <td colspan="2" style="font-size: 12pt; font-family: 宋体; text-align:center; background-color: #507CD1; color:#ffffff; padding: 3px">登录</td>
    </tr>
    <tr style="height: 15px;"><td></td></tr>
    <tr style="height: 35px;">
      <td style="font-size: 12pt; font-family: 宋体; text-align: right;" width="80">用户名：</td>
      <td>
        <asp:TextBox ID="txtUserName" runat="server" Width="100px"></asp:TextBox>
        <font style="font-size: 12pt; color: red; font-family: 宋体;">
          *
          <asp:RequiredFieldValidator ID="rfv_name" runat="server" ErrorMessage="不能为空" ControlToValidate="txtUserName">
          </asp:RequiredFieldValidator>
        </font>
      </td>
    </tr>
    <tr style="height: 35px;">
      <td style="font-size: 12pt; font-family: 宋体; text-align: right;">密　码：</td>
      <td><asp:TextBox ID="txtPassword" TextMode="Password" runat="server" Width="100px"></asp:TextBox></td>
    </tr>
    <tr style="height: 35px;">
      <td style="font-size: 12pt; font-family: 宋体; text-align: right;">验证码：</td>
      <td><asp:TextBox ID="CheckCodeTxt" runat="server" Width="100px"  ></asp:TextBox></td>
    </tr>
    <tr style="height: 35px;">
        <td></td>
        <td>
            <asp:ImageButton ID="CheckCode" runat="server" ImageUrl="~/CheckCode.aspx" onClick="CheckCode_Click" />
        </td>
    </tr>
    <tr style="height: 35px; text-align:center;">
        <td colspan="2" style="font-size: 12pt; font-family: 宋体; text-align:center;">
            <asp:CheckBox ID="CheckBox1" runat="server" Text="管理员" />
            <asp:CheckBox ID="CheckBox2" runat="server" Text="教师" />
            <asp:CheckBox ID="CheckBox3" runat="server" Text="学生" />
        </td>
    </tr>
    <tr style="height: 35px; text-align:center;">
      <td colspan="2" style="font-size: 12pt; font-family: 宋体; text-align:center;">
        <asp:Button ID="btnLogin" runat="server" Text="登录" onclick="btnLogin_Click" />
      </td>
    </tr>
    <tr style="height: 35px; text-align:center;">
      <td colspan="2" style="font-size: 12pt; font-family: 宋体; color: #ff0000; text-align:center;">
        <asp:Label ID="lblNote" runat="server" Text=""></asp:Label>
      </td>
    </tr>
  </table>
</asp:Content>


