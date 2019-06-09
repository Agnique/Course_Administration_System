using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["branch"] == null)  // 用户未登录
        {
            Response.Write("<script>alert('您不是合法用户，请登入后再操作！');window.location='Login.aspx';</script>");

        }
        else if (Session["branch"].ToString() != "s")  // 只有学生可以打开本页面
        {
            Response.Write("<script>alert('您不是学生，不能打开该页面！');window.location='" + Session["CurrentPage"].ToString() + "';</script>");

        }
        else
        {
            Session["CurrentPage"] = "Stu_Info.aspx";
            SqlDataSource1.SelectCommand = string.Format("SELECT * FROM Student WHERE Stu_ID = '{0}'", Session["UserName"].ToString());

        }
    }
}