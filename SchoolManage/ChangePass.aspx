<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChangePass.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="header">
        <strong>
            <asp:Label ID="Label1" runat="server" CssClass="auto-style1" Text="修改密码"></asp:Label>
        </strong>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <table width="300" style="border: 1px solid #507CD1; background-color: #DAE3F5;" align="center">
        <tr style="height: 35px;">
            <td colspan="2" style="font-size: 12pt; font-family: 宋体; text-align: center; background-color: #507CD1; color: #ffffff; padding: 3px">修改密码</td>
        </tr>
        <tr style="height: 15px;">
            <td class="auto-style3"></td>
        </tr>
        <tr style="height: 35px;">
            <td style="font-size: 12pt; font-family: 宋体; text-align: right;" class="auto-style3">用户名：</td>
            <td>
                <asp:TextBox ID="txtUserName" runat="server" Width="100px"></asp:TextBox>
                <font style="font-size: 12pt; color: red; font-family: 宋体;">
          *
          <asp:RequiredFieldValidator ID="rfv_name" runat="server" ErrorMessage="不能为空" ControlToValidate="txtUserName">
          </asp:RequiredFieldValidator>
        </font>
            </td>
        </tr>
        <tr>
            <td style="font-size: 12pt; font-family: 宋体; text-align: right;" class="auto-style4">密　码：</td>
            <td class="auto-style2">
                <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" Width="100px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="font-size: 12pt; font-family: 宋体; text-align: right;" class="auto-style4">新密码：</td>
            <td class="auto-style2">
                <asp:TextBox ID="NewPassword" runat="server" Width="100px" TextMode="Password"></asp:TextBox>
                <ajaxToolkit:PasswordStrength runat="server" TargetControlID="NewPassword" PreferredPasswordLength="12" PrefixText="强度: " TextStrengthDescriptions="弱;中等;强" BehaviorID="myPSBID" CalculationWeightings="30;15;30;25" BarBorderCssClass="barline" TextStrengthDescriptionStyles="very;weak;average;good;excellent" StrengthIndicatorType="BarIndicator" MinimumLowerCaseCharacters="1" MinimumNumericCharacters="1" MinimumSymbolCharacters="1" MinimumUpperCaseCharacters="1" RequiresUpperAndLowerCaseCharacters="True"></ajaxToolkit:PasswordStrength>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr>
            <td style="font-size: 12pt; font-family: 宋体; text-align: right;" class="auto-style4">确认新密码：</td>
            <td class="auto-style2">
                <asp:TextBox ID="ConfirmNewPassword" runat="server" Width="100px" TextMode="Password"></asp:TextBox></td>
        </tr>
        <tr style="height: 35px; text-align: center;">
            <td colspan="2" style="font-size: 12pt; font-family: 宋体; text-align: center;">
                <asp:CheckBox ID="CheckBox1" runat="server" Text="管理员" />
                <asp:CheckBox ID="CheckBox2" runat="server" Text="教师" />
                <asp:CheckBox ID="CheckBox3" runat="server" Text="学生" />
            </td>
        </tr>
        <tr style="height: 35px; text-align: center;">
            <td colspan="2">
                <asp:Button ID="Button1" runat="server" Text="取消" OnClick="Button1_Click" />
                &nbsp;&nbsp;<asp:Button ID="btnChange" runat="server" Text="修改密码" OnClick="btnChange_Click" OnClientClick="return PasswordValidate()" ValidationGroup="ChangePassword1" />

            </td>
        </tr>
        <tr style="height: 35px; text-align: center;">
            <td colspan="2" style="font-size: 12pt; font-family: 宋体; color: #ff0000; text-align: center;">
                <asp:Label ID="lblNote" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>
    <script>

        function PasswordValidate() {
            
            if (document.getElementById("<%=NewPassword.ClientID %>").value.length >= 6) {
                if ($find("myPSBID")._getPasswordStrength() < 50) {
                    alert("密码强度必须达到中度！");
                    return false;
                }
                else {
                    return true;
                }
            }
            else {
                alert("密码长度必须达到六位！");
                return false;
            }
           
        }
    </script>
</asp:Content>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .auto-style2 {
            height: 35px;
        }

        .auto-style3 {
            width: 126px;
        }

        .auto-style4 {
            height: 35px;
            width: 126px;
        }
    </style>
</asp:Content>


