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
        else if (Session["branch"].ToString() != "a")  // 只有管理员可以打开本页面
        {
            Response.Write("<script>alert('您不是管理员，不能打开该页面！');window.location='" + Server.UrlEncode(Session["CurrentPage"].ToString()) + "';</script>");
            Response.Redirect(Session["CurrentPage"].ToString());
        }
        Session["CurrentPage"] = "EditHomework.aspx";
    }
    protected void lbInsert_Click(object sender, EventArgs e)
    {
        SqlDataSource1.InsertParameters["Hw_ID"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtHw_ID")).Text.Trim();
        SqlDataSource1.InsertParameters["Cs_ID"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtCs_ID")).Text.Trim();
        SqlDataSource1.InsertParameters["Hw_Week"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtHw_Week")).Text.Trim();
        SqlDataSource1.InsertParameters["Handout"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtHandout")).Text.Trim();
        SqlDataSource1.InsertParameters["Handin"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtHandin")).Text.Trim();

        try
        {
            SqlDataSource1.Insert();
        }
        catch (SqlException)
        {
            lblTooltip.Text = "添加失败!请检查输入！";
        }

    }
    protected void lbInsert1_Click(object sender, EventArgs e)
    {

        SqlDataSource2.InsertParameters["Stu_Hw_ID"].DefaultValue = ((TextBox)GridView2.FooterRow.FindControl("txtStu_Hw_ID")).Text.Trim();
        SqlDataSource2.InsertParameters["Stu_ID"].DefaultValue = ((TextBox)GridView2.FooterRow.FindControl("txtStu_ID")).Text.Trim();
        SqlDataSource2.InsertParameters["Handin"].DefaultValue = ((TextBox)GridView2.FooterRow.FindControl("txtHandin")).Text.Trim();
        SqlDataSource2.InsertParameters["Grade_Time"].DefaultValue = ((TextBox)GridView2.FooterRow.FindControl("txtGrade_Time")).Text.Trim();
        SqlDataSource2.InsertParameters["Status"].DefaultValue = ((DropDownList)GridView2.FooterRow.FindControl("dlStatus")).SelectedValue;
        
        try
        {
            SqlDataSource2.Insert();
        }
        catch (SqlException)
        {
            lblTooltip1.Text = "添加失败!请检查输入！";
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
                    SqlDataSource1.DeleteParameters["Hw_ID"].DefaultValue = ((Label)GridView1.Rows[i].FindControl("txtHw_ID")).Text;
                    SqlDataSource1.Delete();
                }
                catch (SqlException)
                {
                    lblTooltip.Text = string.Format("无法删除作业号为‘{0}'的作业！", ((Label)GridView1.Rows[i].FindControl("txtCs_ID")).Text);
                }
            }
        }

    }
    protected void lbDelete1_Click(object sender, EventArgs e)
    {
        for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
        {
            CheckBox cbox = (CheckBox)GridView1.Rows[i].FindControl("chkSelectRow");
            if (cbox.Checked)
            {
                try
                {
                    SqlDataSource2.DeleteParameters["Stu_Hw_ID"].DefaultValue = ((Label)GridView2.Rows[i].FindControl("txtStu_Hw_ID")).Text;
                    SqlDataSource2.Delete();
                }
                catch (SqlException)
                {
                    lblTooltip1.Text = string.Format("无法删除学生作业号为‘{0}'的作业！", ((Label)GridView2.Rows[i].FindControl("txtStu_Hw_ID")).Text);
                }
            }
        }

    }

    protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {




    }
}