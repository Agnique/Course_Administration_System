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

    protected void lbInsert_Click(object sender, EventArgs e)
    {
        SqlDataSource1.InsertParameters["Name"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtName")).Text.Trim();
        SqlDataSource1.InsertParameters["Pwd"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtPwd")).Text.Trim();
        SqlDataSource1.InsertParameters["Te_ID"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtTe_ID")).Text.Trim();
        SqlDataSource1.InsertParameters["Email"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtEmail")).Text.Trim();
        SqlDataSource1.InsertParameters["Phone"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtPhone")).Text.Trim();
        SqlDataSource1.InsertParameters["Dpt"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtDpt")).Text.Trim();
        SqlDataSource1.InsertParameters["Gender"].DefaultValue = ((DropDownList)GridView1.FooterRow.FindControl("dlGender")).SelectedValue;

        SqlDataSource1.Insert();



        
    

    }
    protected void lbDelete_Click(object sender, EventArgs e)
    {
        SqlDataSource1.DeleteParameters["Te_ID"].DefaultValue = Label1.Text;
        SqlDataSource1.Delete();
        try
        {
            SqlDataSource1.DeleteParameters["Te_ID"].DefaultValue = Label1.Text;
            SqlDataSource1.Delete();
        }
        catch(SqlException)
        {
            lblTooltip.Text = "由于外键约束，无法删除该教师信息！";
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

}