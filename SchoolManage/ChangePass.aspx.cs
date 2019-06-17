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

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }

    protected void btnChange_Click(object sender, EventArgs e)
    {
        string FailText = null;
        string strConn = ConfigurationManager.ConnectionStrings["schoolConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(strConn);
        conn.Open();
        //string strSql = "SELECT * FROM Patron WHERE name='"
        //    + UserName.Text.ToString().Trim() + "' and Password='" + CurrentPassword.Text.ToString().Trim() + "'";

        string UserName = txtUserName.Text.Replace("'", "''");
        string Password = txtPassword.Text.Replace("'", "''");
        string NewPass = NewPassword.Text.Replace("'", "''");
        string strsql,strsqlc;
        string strsql1 = string.Format("SELECT * FROM Users WHERE Account='{0}' AND Pwd='{1}'", UserName, Password);
        string strsql2 = string.Format("SELECT * FROM Teacher WHERE Te_ID='{0}' AND Pwd='{1}'", UserName, Password);
        string strsql3 = string.Format("SELECT * FROM Student WHERE Stu_ID='{0}' AND Pwd='{1}'", UserName, Password);
        string strsql4 = string.Format("UPDATE Users SET Pwd='{0}' WHERE Account='{1}'", NewPass, UserName);
        string strsql5 = string.Format("UPDATE Teacher SET Pwd='{0}' WHERE Te_ID='{1}'", NewPass, UserName);
        string strsql6 = string.Format("UPDATE Student SET Pwd='{0}' WHERE Stu_ID='{1}'", NewPass, UserName);

        if (CheckBox1.Checked)
        {
            strsql = strsql1;
            strsqlc = strsql4;
        }
        else if (CheckBox2.Checked)
        {
            strsql = strsql2;
            strsqlc = strsql5;
        }
        else if (CheckBox3.Checked)
        {
            strsql = strsql3;
            strsqlc = strsql6;
        }
        else
        {
            strsql = strsql1;
            strsqlc = strsql4;
        }
        SqlCommand myCommand = new SqlCommand(strsql, conn);

        SqlDataReader dr = myCommand.ExecuteReader();
        if (dr.Read())
        {
            conn.Close();
            conn.Open();
            if (NewPassword.Text.Trim() == ConfirmNewPassword.Text.Trim())
            {
               
                SqlCommand myCommand2 = new SqlCommand(strsqlc, conn);

                myCommand2.ExecuteNonQuery();
                Response.Write("<script type='text/javascript'>alert('修改密码成功！');window.location='Login.aspx';</script>");

            }
            else
            {
                FailText = "两次输入的新密码必须一致！";
            }
        }
        else
        {
            FailText = "用户名或密码不正确！";
        }
        lblNote.Text = FailText;
    }
}