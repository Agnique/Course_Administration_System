﻿using System;
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
        Session["CurrentPage"] = "EditCourse.aspx";
        lblTooltip.Text = "";
    }
    protected void lbInsert_Click(object sender, EventArgs e)
    {
        SqlDataSource1.InsertParameters["Cs_ID"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtCs_ID")).Text.Trim();
        SqlDataSource1.InsertParameters["Cs_Name"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtCs_Name")).Text.Trim();
        SqlDataSource1.InsertParameters["Cs_Time"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtCs_Time")).Text.Trim();
        SqlDataSource1.InsertParameters["Cs_Place"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtCs_Place")).Text.Trim();
        SqlDataSource1.InsertParameters["Cs_Year"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtCs_Year")).Text;
        SqlDataSource1.InsertParameters["Cs_Semster"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtCs_Semester")).Text.Trim();
        SqlDataSource1.InsertParameters["Te_ID"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtTe_ID")).Text.Trim();

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
                    SqlDataSource1.DeleteParameters["Cs_ID"].DefaultValue = ((Label)GridView1.Rows[i].FindControl("txtCs_ID")).Text;
                    SqlDataSource1.Delete();
                }
                catch (SqlException)
                {
                    lblTooltip.Text = string.Format("无法退选课程号为‘{0}'的课程！", ((Label)GridView1.Rows[i].FindControl("txtCs_ID")).Text);
                }
            }
        }

    }
}