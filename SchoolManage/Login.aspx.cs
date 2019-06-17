using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["branch"] = null;
        Session["CurrentPage"] = "Login.aspx";
    }
    protected void CheckCode_Click(object sender, EventArgs e)
    {
        CheckCode.ImageUrl = "~/CheckCode.aspx";
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string UserName = txtUserName.Text.Replace("'", "''");
        string Password = txtPassword.Text.Replace("'", "''");

        string strconn = ConfigurationManager.ConnectionStrings["schoolConnectionString"].ConnectionString;

        string CheckCode = Session["CheckCode"].ToString().Trim();
        string InputCode = CheckCodeTxt.Text.ToString().Trim();
        if(InputCode == CheckCode)
        {
            SqlConnection conn = new SqlConnection(strconn);
            conn.Open();
            string strsql;
            string branch;
            string strsql1 = string.Format("SELECT * FROM Users WHERE Account='{0}' AND Pwd='{1}'", UserName, Password);
            string strsql2 = string.Format("SELECT * FROM Teacher WHERE Te_ID='{0}' AND Pwd='{1}'", UserName, Password);
            string strsql3 = string.Format("SELECT * FROM Student WHERE Stu_ID='{0}' AND Pwd='{1}'", UserName, Password);
            if (CheckBox1.Checked)
            {
                strsql = strsql1;
                branch = "a";
            }
            else if (CheckBox2.Checked)
            {
                strsql = strsql2;
                branch = "t";
            }
            else if (CheckBox3.Checked)
            {
                strsql = strsql3;
                branch = "s";
            }
            else
            {
                strsql = strsql1;
                branch = "a";
            }
            SqlCommand cm = new SqlCommand(strsql, conn);
            SqlDataReader dr = cm.ExecuteReader();

            if (dr.Read())
            {
                Session["branch"] = branch;
                Session["UserName"] = UserName;
                if (Session["branch"].ToString() == "a")
                {
                    Response.Redirect("EditUser.aspx");
                }
                else if (Session["branch"].ToString() == "t")
                {
                    Response.Redirect("Te_Course.aspx");
                }
                else if (Session["branch"].ToString() == "s")
                {
                    Response.Redirect("Register_Course.aspx");
                }
            }
            else
            {
                lblNote.Text = "用户名或密码不正确，登录失败！";
            }
        }
        else
        {
            lblNote.Text = "验证码不正确，请重试!";
        }

    }
    protected void btnChange_Click(object sender, EventArgs e)
    {
        Response.Redirect("ChangePass.aspx");
    }


}