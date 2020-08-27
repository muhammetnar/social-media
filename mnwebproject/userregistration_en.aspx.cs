using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Drawing;

namespace mnwebproject
{
    public partial class userregistration_en : System.Web.UI.Page
    {
        SqlConnection connect = new SqlConnection("Data Source=desktop-oqk00gg;Initial Catalog=MNWEBDB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void getuserid()
        {
            DataTable dt = null;
            DataSet ds = new DataSet();
            SqlConnection db_baglanti;
            SqlCommand db_komut;
            SqlDataAdapter db_adapter = null;
            db_baglanti = new SqlConnection("Data Source=desktop-oqk00gg;Initial Catalog=MNWEBDB;Integrated Security=True");
            db_baglanti.Open();
            string sorgu = "SELECT * FROM T_USER WHERE USER_USERNAME=@USER_USERNAME";
            db_komut = new SqlCommand(sorgu, db_baglanti);
            db_komut.Parameters.Add("@USER_USERNAME", SqlDbType.VarChar).Value = lblusername.Text;

            db_adapter = new SqlDataAdapter();
            db_adapter.SelectCommand = db_komut;
            db_adapter.Fill(ds);
            dt = ds.Tables[0];
            db_adapter = null;
            db_baglanti.Close();
            db_baglanti = null;
            if (dt.Rows.Count > 0)
            {
                lbluserid.Text = dt.Rows[0]["ID"].ToString();

            }
        }
        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            if (!Control(username.Text))
            {
                connect.Open();
                string sorgu = "insert into T_USER(USER_USERNAME,USER_PASSWORD,USER_NAME,USER_SURNAME,USER_GENDER,USER_EMAIL,USER_COUNTRY_ID,USER_CITY_ID)values(@USER_USERNAME,@USER_PASSWORD,@USER_NAME,@USER_SURNAME,@USER_GENDER,@USER_EMAIL,@USER_COUNTRY_ID,@USER_CITY_ID)";
                //string dosyaadi = Path.GetFileName(slideeklefile.PostedFile.FileName);
                //slideeklefile.SaveAs(Server.MapPath("profilfoto/" + dosyaadi));
                SqlCommand asd = new SqlCommand(sorgu, connect);

                asd.Parameters.AddWithValue("@USER_USERNAME", username.Text);
                //asd.Parameters.Add("@KULLANICI_ADI", SqlDbType.VarChar).Value = kadi.Text;
                asd.Parameters.Add("@USER_PASSWORD", SqlDbType.VarChar).Value = password.Text;
                asd.Parameters.Add("@USER_NAME", SqlDbType.VarChar).Value = name.Text;
                asd.Parameters.Add("@USER_SURNAME", SqlDbType.VarChar).Value = surname.Text;
                asd.Parameters.Add("@USER_EMAIL", SqlDbType.VarChar).Value = email.Text;
                asd.Parameters.Add("@USER_COUNTRY_ID", SqlDbType.Int).Value = "1";
                asd.Parameters.Add("@USER_CITY_ID", SqlDbType.Int).Value = "1";
                //asd.Parameters.Add("@USER_PROFILE_PHOTO_ID", SqlDbType.Int).Value = "0";
                if (gender.SelectedIndex == 0)
                {

                }
                else if (gender.SelectedIndex == 1)
                {
                    asd.Parameters.Add("@USER_GENDER", SqlDbType.VarChar).Value = "M";
                }
                else if (gender.SelectedIndex == 2)
                {
                    asd.Parameters.Add("@USER_GENDER", SqlDbType.VarChar).Value = "F";
                }
                else
                {

                }
                lblusername.Text = username.Text;
                asd.ExecuteReader();
                //asd.Parameters.AddWithValue("@RESIM", dosyaadi);
                //asd.ExecuteNonQuery();

                connect.Close();
                asd.Dispose();
                username.Text = null;
                lblmsg.Text = "Registration Successful.";
            }
            else if (username.Text == null)
            {
                lblmsg.Text = "Username can not be empty.";
            }
            else
            {
                lblmsg.Text = "This username is using by anyone else.";
            }
            connect.Close();

            getuserid();

            connect.Open();
            string query2 = "insert into T_USER_PROFILE_PHOTO (PROFILE_PHOTO_URL,PROFILE_PHOTO_USER_ID)values(@PROFILE_PHOTO_URL,@PROFILE_PHOTO_USER_ID)";
            SqlCommand asdf = new SqlCommand(query2, connect);
            asdf.Parameters.Add("@PROFILE_PHOTO_URL", SqlDbType.VarChar).Value = "noimg";
            asdf.Parameters.Add("@PROFILE_PHOTO_USER_ID", SqlDbType.Int).Value = lbluserid.Text;
            asdf.ExecuteNonQuery();
            connect.Close();
        }
        private bool Control(string gelenkullanici)
        {
            bool varmisinyokmusun;
            SqlCommand sql = new SqlCommand("select *from T_USER where USER_USERNAME='" + gelenkullanici + "'", connect);
            connect.Open();
            SqlDataReader dr = sql.ExecuteReader();
            varmisinyokmusun = dr.HasRows;
            connect.Close();
            dr = null;
            return varmisinyokmusun;
        }
        protected void username_Textchanged(object sender, EventArgs e)
        {

            if (Control(username.Text))
            {
                durum.ForeColor = Color.Red;
                durum.Text = "This username is using by anyone else.";
            }
            else if ((username.Text) == null)
            {
                durum.ForeColor = Color.Red;
                durum.Text = "Username can not be empty.";
            }
            else
            {
                durum.ForeColor = Color.Green;
                durum.Text = "This Username Can Be Use.";
            }
        }
    }
}