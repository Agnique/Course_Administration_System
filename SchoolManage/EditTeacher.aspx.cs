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
        Session["CurrentPage"] = "EditTeacher.aspx";
        lblTooltip.Text = "";
    }

    protected void lbInsert_Click(object sender, EventArgs e)
    {
        SqlDataSource1.InsertParameters["Name"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtName")).Text.Trim();
        SqlDataSource1.InsertParameters["Pwd"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtPwd")).Text.Trim();
        SqlDataSource1.InsertParameters["Te_ID"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtTe_ID")).Text.Trim();
        SqlDataSource1.InsertParameters["Email"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtEmail")).Text.Trim();
        SqlDataSource1.InsertParameters["Phone"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtPhone")).Text.Trim();
        SqlDataSource1.InsertParameters["Dpt"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtDpt")).Text.Trim();
        SqlDataSource1.InsertParameters["Gender"].DefaultValue = ((DropDownList)GridView1.FooterRow.FindControl("dlGender")).SelectedValue;

        try
        {
            SqlDataSource1.Insert();
        }
        catch(SqlException)
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
                    SqlDataSource1.DeleteParameters["Te_ID"].DefaultValue = ((Label)GridView1.Rows[i].FindControl("dlTe_ID")).Text;
                    SqlDataSource1.Delete();
                }
                catch (SqlException)
                {                 
                    lblTooltip.Text = string.Format("无法删除职工号为‘{0}'的教师信息！", ((Label)GridView1.Rows[i].FindControl("dlTe_ID")).Text);
                }
            }
        }
     
    }


    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}