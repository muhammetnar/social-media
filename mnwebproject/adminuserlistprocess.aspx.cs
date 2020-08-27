using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace mnwebproject
{
    public partial class adminuserlistprocess : System.Web.UI.Page
    {
        SqlConnection connect = new SqlConnection("Data Source=desktop-oqk00gg;Initial Catalog=MNWEBDB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null)
                lblwelcomemsg.Text = ("Hoşgeldin   " + Session["admin"]);
            else
                Response.Redirect("adminlogin.aspx");
            getsuggestion();
        }

        protected void AdminLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("adminlogin.aspx");
        }
        protected void getsuggestion()
        {
            GridView1.Visible = true;
            connect.Open();
            SqlDataAdapter asd = new SqlDataAdapter("select * from T_USER order by ID desc", connect);
            DataTable dt = new DataTable("tb");
            asd.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            connect.Close();
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
            connect.Open();
            SqlDataAdapter asd = new SqlDataAdapter("select * from T_USER where USER_USERNAME like '%" + TextSearch.Text + "%' or USER_NAME like '%" + TextSearch.Text + "%' order by ID desc", connect);
            DataTable dt = new DataTable("tb");
            asd.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            connect.Close();
        }
    }
}