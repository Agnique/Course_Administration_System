using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

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
            Session["CurrentPage"] = "Te_Homework.aspx";
            SqlDataSource1.SelectParameters["Te_ID"].DefaultValue = Session["UserName"].ToString();
            //SqlDataSource1.SelectCommand = string.Format("SELECT * FROM Teacher WHERE Te_ID = '{0}'", Session["UserName"].ToString());
            lblTooltip.Text = "";
            lblTooltip1.Text = "";
        }
    }

    protected void lbUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            SqlDataSource4.UpdateParameters["Comment"].DefaultValue = ((TextBox)DetailsView2.FindControl("txtComment")).Text.Trim();
            SqlDataSource4.UpdateParameters["Grade"].DefaultValue = ((TextBox)DetailsView2.FindControl("txtGrade")).Text.Trim();
            SqlDataSource4.UpdateParameters["Grade_Time"].DefaultValue = DateTime.Now.ToString();
            SqlDataSource4.UpdateParameters["Status"].DefaultValue = "已批改";
            SqlDataSource4.Update();
            DetailsView2.ChangeMode(DetailsViewMode.ReadOnly);
            lblTooltip1.Text = "批改成功！";
        }
        catch (SqlException)
        {
            lblTooltip1.Text = "更新失败！请检查输入!";
        }
    }
}