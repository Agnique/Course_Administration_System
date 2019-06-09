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
            Session["CurrentPage"] = "Te_Info.aspx";
            SqlDataSource1.SelectParameters["Te_ID"].DefaultValue = Session["UserName"].ToString();
            //SqlDataSource1.SelectCommand = string.Format("SELECT * FROM Teacher WHERE Te_ID = '{0}'", Session["UserName"].ToString());
            lblTooltip.Text = "";
        }
    }
    protected void lbInsert_Click(object sender, EventArgs e)
    {
        SqlDataSource1.InsertParameters["Cs_ID"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtCs_ID")).Text.Trim();
        SqlDataSource1.InsertParameters["Cs_Name"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtCs_Name")).Text.Trim();
        SqlDataSource1.InsertParameters["Cs_Time"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtCs_Time")).Text.Trim();
        SqlDataSource1.InsertParameters["Cs_Place"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtCs_Place")).Text.Trim();
        SqlDataSource1.InsertParameters["Cs_Year"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtCs_Year")).Text;
        SqlDataSource1.InsertParameters["Cs_Semster"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtCs_Semester")).Text.Trim();
        SqlDataSource1.InsertParameters["Te_ID"].DefaultValue = Session["UserName"].ToString();

        try
        {
            SqlDataSource1.Insert();
        }
        catch (SqlException)
        {
            lblTooltip.Text = "添加失败!请检查输入！";
        }

    }
    protected void lbDelete_Click(object sender, EventArgs e)
    {
        for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
        {
            CheckBox cbox = (CheckBox)GridView1.Rows[i].FindControl("chkSelectRow");
            if (cbox.Checked)
            {
                try
                {
                    SqlDataSource1.DeleteParameters["Cs_ID"].DefaultValue = ((Label)GridView1.Rows[i].FindControl("txtCs_ID")).Text;
                    SqlDataSource1.Delete();
                }
                catch (SqlException)
                {
                    lblTooltip.Text = string.Format("无法删除课程号为‘{0}'的课程信息！", ((Label)GridView1.Rows[i].FindControl("txtCs_ID")).Text);
                }
            }
        }

    }
}