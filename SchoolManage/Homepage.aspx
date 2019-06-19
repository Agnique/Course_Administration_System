<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Homepage.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="header">
        <strong>
            <asp:Label ID="Label1" runat="server" CssClass="auto-style1" Text="欢迎使用教务管理系统"></asp:Label>
        </strong>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    欢迎使用教务管理系统，本页将在<span id="time" style="color: #FF0000"></span>
        秒后自动跳转至<a href="Login.aspx">登录页面</a>

    <a href="www.jwbinfosys.zju.edu.cn/default2.aspx"><img src="Welcome.jpg" width="800px""></a>
        <script type="text/javascript">
        var i = 5;
            window.onload = function JumpPage() {
            document.getElementById("time").innerText = i;
            i--;
            if (i < 0) {
                location.replace("Login.aspx");
            }
            setTimeout(JumpPage, 1000);
        }
</script>
</asp:Content>

