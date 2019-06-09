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
        lblTooltip.Text = "";
    }

    protected void lbInsert_Click(object sender, EventArgs e)
    {
        SqlDataSource1.InsertParameters["Stu_Name"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtName")).Text.Trim();
        SqlDataSource1.InsertParameters["Pwd"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtPwd")).Text.Trim();
        SqlDataSource1.InsertParameters["Stu_ID"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtStu_ID")).Text.Trim();
        SqlDataSource1.InsertParameters["Email"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtEmail")).Text.Trim();
        SqlDataSource1.InsertParameters["Phone"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtPhone")).Text.Trim();
        SqlDataSource1.InsertParameters["Dpt"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtDpt")).Text.Trim();
        SqlDataSource1.InsertParameters["Major"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtMajor")).Text.Trim();
        SqlDataSource1.InsertParameters["Gender"].DefaultValue = ((DropDownList)GridView1.FooterRow.FindControl("dlGender")).SelectedValue;

        try
        {
            SqlDataSource1.Insert();
        }
        catch (SqlException)
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
                    SqlDataSource1.DeleteParameters["Stu_ID"].DefaultValue = ((Label)GridView1.Rows[i].FindControl("txtStu_ID")).Text;
                    SqlDataSource1.Delete();
                }
                catch (SqlException)
                {
                    lblTooltip.Text = string.Format("无法删除学号为‘{0}'的学生信息！", ((Label)GridView1.Rows[i].FindControl("txtStu_ID")).Text);
                }
            }
        }

    }
}