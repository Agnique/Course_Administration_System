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

        }
        Session["CurrentPage"] = "AddUser.apsx";
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {

        string strconn = ConfigurationManager.ConnectionStrings["schoolConnectionString"].ConnectionString;

        SqlConnection conn = new SqlConnection(strconn);
        conn.Open();

        string strsql = "INSERT INTO Users(Account, Email, Name, Pwd) VALUES(@Account, @Email, @Name, @Pwd)";
        SqlCommand cm = new SqlCommand(strsql, conn);

        cm.Parameters.Add(new SqlParameter("@Account", SqlDbType.NVarChar, 20));
        cm.Parameters.Add(new SqlParameter("@Email", SqlDbType.NVarChar, 50));
        cm.Parameters.Add(new SqlParameter("@Name", SqlDbType.NVarChar, 20));
        cm.Parameters.Add(new SqlParameter("@Pwd", SqlDbType.NVarChar, 50));

        cm.Parameters["@Account"].Value = txtAccount.Text.Trim();
        cm.Parameters["@Name"].Value = txtName.Text.Trim();
        cm.Parameters["@Email"].Value = txtEmail.Text.Trim();
        cm.Parameters["@Pwd"].Value = txtPwd.Text.Trim();

        try
        {
            cm.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("EditUser.aspx");

        }
        catch (SqlException)
        {
            lblTooltip.Text = "添加失败";
        }
        
        conn.Close();
    }



    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddUser.aspx");
    }

    protected void txtClient_id_ServerValidate(object source, ServerValidateEventArgs args)
    {
        string strconn = ConfigurationManager.ConnectionStrings["schoolConnectionString"].ConnectionString;

        SqlConnection conn = new SqlConnection(strconn);
        conn.Open();

        string strsql = "SELECT * FROM Users WHERE Account=@Account";
        SqlCommand cm = new SqlCommand(strsql, conn);
        cm.Parameters.Add(new SqlParameter("@Account", SqlDbType.NVarChar, 20));
        cm.Parameters["@Account"].Value = txtAccount.Text;

        SqlDataReader dr = cm.ExecuteReader();
        args.IsValid = !dr.Read();
        conn.Close();
    }
}
