<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddTeacher.aspx.cs" Inherits="_Default" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="header">
        <strong>
            <asp:Label ID="Label1" runat="server" CssClass="auto-style1" Text="添加教师"></asp:Label>
        </strong>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<table align="center" border="0" bgcolor="#f5f5f5" >
    <tr style="height: 10px"><td colspan="2"></td></tr>
    <tr style="height:35px">
      <td align="right" style="font-size: 12pt; font-family: 宋体">
        职工号：
      </td>
      <td align="left">
        <asp:TextBox ID="txtAccount" runat="server" MaxLength="5" Width="300"></asp:TextBox>
        <font style="font-size: 12pt; color: red; font-family: 宋体;">
          *
          <asp:RequiredFieldValidator ID="rfvClient_id" runat="server" ErrorMessage="不能为空" ControlToValidate="txtAccount" Display="Dynamic"></asp:RequiredFieldValidator>
          <asp:CustomValidator ID="cvClient_id" runat="server" ErrorMessage="已存在" ControlToValidate="txtAccount" OnServerValidate="txtClient_id_ServerValidate" Display="Dynamic"></asp:CustomValidator>
        </font>
      </td>
    </tr>
    <tr>
      <td align="right" style="font-size: 12pt; font-family: 宋体">
        学院：
      </td>
      <td align="left">
        <asp:TextBox ID="txtDpt" runat="server" MaxLength="20" Width="300"></asp:TextBox>
        <font style="font-size: 12pt; color: red; font-family: 宋体;">
          *
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="不能为空" ControlToValidate="txtName" Display="Dynamic"></asp:RequiredFieldValidator>
        </font>
      </td>
    </tr>
    <tr>
      <td align="right" style="font-size: 12pt; font-family: 宋体">
        姓名：
      </td>
      <td align="left">
        <asp:TextBox ID="txtName" runat="server" MaxLength="20" Width="300"></asp:TextBox>
        <font style="font-size: 12pt; color: red; font-family: 宋体;">
          *
          <asp:RequiredFieldValidator ID="rfvClient_name" runat="server" ErrorMessage="不能为空" ControlToValidate="txtName" Display="Dynamic"></asp:RequiredFieldValidator>
        </font>
      </td>
    </tr>
    <tr>
      <td align="right" style="font-size: 12pt; font-family: 宋体">
        性别：
      </td>
      <td align="left">
          <asp:DropDownList ID="DropDownList1" runat="server">
              <asp:ListItem>男</asp:ListItem>
              <asp:ListItem>女</asp:ListItem>
          </asp:DropDownList>
      </td>
    </tr>
    <tr>
      <td align="right" style="font-size: 12pt; font-family: 宋体">
        Email：
      </td>
      <td align="left">
        <asp:TextBox ID="txtEmail" runat="server" MaxLength="50" Width="300"></asp:TextBox>
      </td>
    </tr>
    <tr>
      <td align="right" style="font-size: 12pt; font-family: 宋体">
        手机号：
      </td>
      <td align="left">
        <asp:TextBox ID="txtPhone" runat="server" MaxLength="20" Width="300"></asp:TextBox>
      </td>
    </tr>
    <tr>
      <td align="right" style="font-size: 12pt; font-family: 宋体">
        密码：
      </td>
      <td align="left">
        <asp:TextBox ID="txtPwd" runat="server" MaxLength="50" Width="300"></asp:TextBox>
      </td>
    </tr>

    <tr>
      <td></td>
      <td>
        <asp:Button ID="btnAdd" CssClass="Button" runat="server" Text="提交" BorderStyle="Groove" OnClick="btnAdd_Click"></asp:Button>
        <asp:Button ID="btnReset" CssClass="Button" runat="server" Text="重置" BorderStyle="Groove" CausesValidation="false" OnClick="btnReset_Click"></asp:Button>&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblTooltip" runat="server" style="font-size: 12pt; color: red; font-family: 宋体;"></asp:Label>
      </td>
    </tr>
  </table>
</asp:Content>

