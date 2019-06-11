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
            Session["CurrentPage"] = "Stu_Homework.aspx";
            lblTooltip.Text = "";
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (GridView1.SelectedRow != null)
        {
            DetailsView1.ChangeMode(DetailsViewMode.Insert);
        }
        else
        {
            lblTooltip.Text = "请先选择作业！";
        }
            
    }

    protected void Stu_Hw_ID_ServerValidate(object source, ServerValidateEventArgs args)
    {
        string strconn = ConfigurationManager.ConnectionStrings["schoolConnectionString"].ConnectionString;
        SqlConnection cn = new SqlConnection(strconn);
        cn.Open();
        string strsql = "SELECT * FROM StudentHomework WHERE Stu_Hw_ID=@Stu_Hw_ID";
        SqlCommand cm = new SqlCommand(strsql, cn);
        cm.Parameters.Add(new SqlParameter("@Stu_Hw_ID", SqlDbType.Char, 5));
        cm.Parameters["@Stu_Hw_ID"].Value = ((TextBox)DetailsView1.FindControl("txtStu_Hw_ID")).Text.Trim(); ;

        SqlDataReader dr = cm.ExecuteReader();
        args.IsValid = !dr.Read();
        cn.Close();
    }

    protected void lbEdit_Click(object sender, EventArgs e)
    {
        if (((Label)DetailsView1.FindControl("txtStatus")).Text == "未批改")
        {
            DetailsView1.ChangeMode(DetailsViewMode.Edit);
        }
        else
        {
            lblTooltip.Text = "无法修改已批改的作业！";
        }
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        DetailsView1.ChangeMode(DetailsViewMode.Insert);
    }

    protected void Insert_Click(object sender, EventArgs e)
    {
        string s1 = ((Label)GridView1.SelectedRow.FindControl("txtHw_ID")).Text;
        string s2 = ((Label)GridView1.SelectedRow.FindControl("txtHw_Week")).Text;
        string s3 = Session["UserName"].ToString();
        string s = s1 + s2 + s3;
        SqlDataSource2.InsertParameters["Stu_Hw_ID"].DefaultValue = s;
        SqlDataSource2.InsertParameters["Hw_ID"].DefaultValue = s1;
        SqlDataSource2.InsertParameters["Stu_ID"].DefaultValue = Session["UserName"].ToString();
        SqlDataSource2.InsertParameters["Status"].DefaultValue = "未批改";
        SqlDataSource2.InsertParameters["Handin"].DefaultValue = DateTime.Now.ToString();
        SqlDataSource2.InsertParameters["Handin_Homework"].DefaultValue = ((TextBox)DetailsView1.FindControl("txtHandin_Homework")).Text.Trim();
        SqlDataSource2.Insert();
        DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
        lblTooltip.Text = "作业提交成功!";
    }
}