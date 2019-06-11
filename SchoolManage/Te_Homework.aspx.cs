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
    protected void lbInsert_Click(object sender, EventArgs e)
    {

        string s1 = ((TextBox)GridView1.FooterRow.FindControl("txtCs_ID")).Text.Trim();
        string s2 = ((TextBox)GridView1.FooterRow.FindControl("txtHw_Week")).Text.Trim();
        string s = s1 + s2;
        SqlDataSource1.InsertParameters["Hw_ID"].DefaultValue = s;
        SqlDataSource1.InsertParameters["Cs_ID"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtCs_ID")).Text.Trim();
        SqlDataSource1.InsertParameters["Hw_Week"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtHw_Week")).Text.Trim();
        SqlDataSource1.InsertParameters["Handout"].DefaultValue = DateTime.Now.ToString();
        SqlDataSource1.InsertParameters["Handin"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtHandin")).Text.Trim();

        SqlConnection cn = null;
        string strconn = ConfigurationManager.ConnectionStrings["schoolConnectionString"].ConnectionString;
        cn = new SqlConnection(strconn);
        cn.Open();
        string strsql = "SELECT * FROM Course WHERE Cs_ID = @Cs_ID AND Te_ID = @Te_ID";
        SqlCommand cm = new SqlCommand(strsql, cn);
        cm.Parameters.Add(new SqlParameter("@Cs_ID", SqlDbType.Char, 9));
        cm.Parameters.Add(new SqlParameter("@Te_ID", SqlDbType.Char, 5));
        cm.Parameters["@Te_ID"].Value = Session["UserName"].ToString();
        cm.Parameters["@Cs_ID"].Value = ((TextBox)GridView1.FooterRow.FindControl("txtCs_ID")).Text.Trim();

        SqlDataReader dr = cm.ExecuteReader();
        if (dr.Read())
        {
            try
            {
                SqlDataSource1.Insert();
            }
            catch (SqlException)
            {
                lblTooltip.Text = "添加失败!不能在同一周布置两次作业！";
            }
        }
        else
        {
            lblTooltip1.Text = "添加失败!请检查课程号，只能添加已开课的课程！";
        }
        cn.Close();

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
                    lblTooltip.Text = string.Format("无法删除作业号为‘{0}'的作业信息！", ((Label)GridView1.Rows[i].FindControl("txtHw_ID")).Text);
                }
            }
        }

    }

    protected void lbUpdate_Click(object sender, EventArgs e)
    {

        try
        {
            SqlDataSource2.UpdateParameters["Handin"].DefaultValue = ((TextBox)DetailsView1.FindControl("txtHandin")).Text.Trim();
            SqlDataSource2.UpdateParameters["Hw"].DefaultValue = ((TextBox)DetailsView1.FindControl("txtHw")).Text.Trim();
            SqlDataSource2.Update();
            DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
            lblTooltip1.Text = "更新成功！";
        }
        catch(SqlException)
        {
            lblTooltip1.Text = "更新失败！请检查输入!";
        }
    }
}