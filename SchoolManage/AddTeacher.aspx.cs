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

    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        string strconn = ConfigurationManager.ConnectionStrings["schoolConnectionString"].ConnectionString;

        SqlConnection conn = new SqlConnection(strconn);
        conn.Open();

        string strsql = "INSERT INTO Teacher(Te_ID, Dpt, Name, Gender, Email, Phone, Pwd) VALUES(@Te_ID, @Dpt, @Name, @Gender, @Email, @Phone, @Pwd)";
        SqlCommand cm = new SqlCommand(strsql, conn);

        cm.Parameters.Add(new SqlParameter("@Te_ID", SqlDbType.NVarChar, 20));
        cm.Parameters.Add(new SqlParameter("@Dpt", SqlDbType.NVarChar, 20));
        cm.Parameters.Add(new SqlParameter("@Email", SqlDbType.NVarChar, 50));
        cm.Parameters.Add(new SqlParameter("@Name", SqlDbType.NVarChar, 20));
        cm.Parameters.Add(new SqlParameter("@Gender", SqlDbType.Char, 2));
        cm.Parameters.Add(new SqlParameter("@Phone", SqlDbType.NVarChar, 20));
        cm.Parameters.Add(new SqlParameter("@Pwd", SqlDbType.NVarChar, 50));

        cm.Parameters["@Te_ID"].Value = txtAccount.Text.Trim();
        cm.Parameters["@Dpt"].Value = txtDpt.Text.Trim();
        cm.Parameters["@Name"].Value = txtName.Text.Trim();
        cm.Parameters["@Email"].Value = txtEmail.Text.Trim();
        cm.Parameters["@Phone"].Value = txtPhone.Text.Trim();
        cm.Parameters["@Pwd"].Value = txtPwd.Text.Trim();
        cm.Parameters["@Gender"].Value = DropDownList1.SelectedValue.ToString();


        try
        {
            cm.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("EditTeacher.aspx");

        }
        catch (SqlException)
        {
            lblTooltip.Text = "添加失败";
        }
        conn.Close();
    }

    protected void txtClient_id_ServerValidate(object source, ServerValidateEventArgs args)
    {
        string strconn = ConfigurationManager.ConnectionStrings["schoolConnectionString"].ConnectionString;

        SqlConnection conn = new SqlConnection(strconn);
        conn.Open();

        string strsql = "SELECT * FROM Users WHERE Te_ID=@Account";
        SqlCommand cm = new SqlCommand(strsql, conn);
        cm.Parameters.Add(new SqlParameter("@Account", SqlDbType.NVarChar, 20));
        cm.Parameters["@Account"].Value = txtAccount.Text;

        SqlDataReader dr = cm.ExecuteReader();
        args.IsValid = !dr.Read();
        conn.Close();
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddTeacher.aspx");
    }
}