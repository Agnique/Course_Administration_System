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
        else if (Session["branch"].ToString() != "t")  // 只有教师可以打开本页面
        {
            Response.Write("<script>alert('您不是教师，不能打开该页面！');window.location='" + Session["CurrentPage"].ToString() + "';</script>");
            
        }
        else
        {
            Session["CurrentPage"] = "Te_Info.aspx";
            SqlDataSource1.SelectCommand = string.Format("SELECT * FROM Teacher WHERE Te_ID = '{0}'", Session["UserName"].ToString());

        }

    }

    protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
    {

    }
}