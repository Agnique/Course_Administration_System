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
        else if (Session["branch"].ToString() != "s")  // 只有学生可以打开本页面
        {
            Response.Write("<script>alert('您不是学生，不能打开该页面！');window.location='" + Session["CurrentPage"].ToString() + "';</script>");

        }
        else
        {
            Session["CurrentPage"] = "Register_Course.aspx";
            //SqlDataSource1.SelectCommand = string.Format("SELECT * FROM Student WHERE Stu_ID = '{0}'", Session["UserName"].ToString());

        }
    }
    protected void lbRegister_Click(object sender, EventArgs e)
    {
        for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
        {
            CheckBox cbox = (CheckBox)GridView1.Rows[i].FindControl("chkSelectRow");
            if (cbox.Checked)
            {
                try
                {
                    SqlDataSource1.InsertParameters["Cs_ID"].DefaultValue = ((Label)GridView1.Rows[i].FindControl("txtCs_ID")).Text;
                    SqlDataSource1.Insert();
                    lblTooltip.Text = "选课成功！若要查看已选课程或退课，请前往“已选课程”。";
                }
                catch (SqlException)
                {
                    lblTooltip.Text = string.Format("无法选课程号为‘{0}'的课程！", ((Label)GridView1.Rows[i].FindControl("txtCs_ID")).Text);
                }
            }
        }

    }
}