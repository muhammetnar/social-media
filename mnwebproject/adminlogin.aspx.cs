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
    public partial class adminlogin : System.Web.UI.Page
    {
        SqlConnection connect = new SqlConnection("Data Source=desktop-oqk00gg;Initial Catalog=MNWEBDB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AdminLogin_Click(object sender, EventArgs e)
        {
            connect.Open();
            string yname = username.Text;
            string ypassword = password.Text;
            SqlCommand sorgu = new SqlCommand("select * from T_ADMIN where ADMIN_USERNAME='" + yname + "'and ADMIN_PASSWORD='" + ypassword + "'", connect);
            SqlDataReader asd = sorgu.ExecuteReader();
            if (asd.Read())
            {
                Session.Add("admin", yname);
                Response.Redirect("adminhomepage.aspx");
            }
            else
            {
                lblmsg.Text = "Kullanıcı Adı veya Şifre Yanlış Girdiniz";
            }

            connect.Close();
            connect.Dispose();
        }
    }
}