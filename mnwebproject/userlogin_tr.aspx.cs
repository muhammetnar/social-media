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
    public partial class userlogin_tr : System.Web.UI.Page
    {
        SqlConnection connect = new SqlConnection("Data Source=desktop-oqk00gg;Initial Catalog=MNWEBDB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            connect.Open();
            string yAd = kadi.Text;
            string yParola = sifre.Text;
            SqlCommand sorgu = new SqlCommand("select * from T_USER where USER_USERNAME='" + yAd + "' and USER_PASSWORD='" + yParola + "'", connect);
            SqlDataReader asd = sorgu.ExecuteReader();
            if (asd.Read())
            {
                Session.Add("kullanici", yAd);
                Response.Redirect("userhomepage_tr.aspx");
            }
            else
            {
                lblmsg.Text = "Kullanıcı Adı veya Şifre Yanlış Girdiniz";
            }
            connect.Dispose();
            connect.Close();
        }
    }
}