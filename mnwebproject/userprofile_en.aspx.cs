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
    public partial class userprofile_en : System.Web.UI.Page
    {
        SqlConnection connect = new SqlConnection("Data Source=desktop-oqk00gg;Initial Catalog=MNWEBDB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kullanici"] != null)
            {
                lblwelcomemsg.Text = ("Welcome   " + Session["kullanici"]);
                //kisibilgileri.Text = ("" + Session["kullanici"] + "");
            }
            else
            {
                Response.Redirect("userlogin_en.aspx");
            }

            int id = Convert.ToInt32(Request.QueryString.Get("ID"));
            // veritabanına bağlanmayı sağlar
            string yol = ("Data Source=desktop-oqk00gg;Initial Catalog=MNWEBDB;Integrated Security=True");
            SqlConnection Con = new SqlConnection(yol);

            //aşağıdaki tümce kapalı durumda olan bağlantıyı açar
            if (Con.State == ConnectionState.Closed)
            {
                Con.Open();
            }
            string sqldetay = "SELECT * FROM T_USER TU,T_USER_PROFILE_PHOTO TUPP,T_COUNTRY TCO,T_CITY TCI where TU.ID=TUPP.PROFILE_PHOTO_USER_ID and TU.USER_COUNTRY_ID=TCO.ID and TU.USER_CITY_ID=TCI.ID and TU.ID=" + id + " ";
            SqlCommand com = new SqlCommand(sqldetay, Con);
            com.Parameters.AddWithValue("@ID", id);
            SqlDataReader dr = com.ExecuteReader();
            while (dr.Read())
            {
                lblid.Text = dr["ID"].ToString();
                lblusername.Text = dr["USER_USERNAME"].ToString();
                lblimg.Text = dr["PROFILE_PHOTO_URL"].ToString();
                lblname.Text = dr["USER_NAME"].ToString();
                lblsurname.Text = dr["USER_SURNAME"].ToString();
                if (dr["USER_GENDER"].ToString() == "M")
                {
                    lblcinsiyet.Text = "Male";
                }
                else
                {
                    lblcinsiyet.Text = "Female";
                }

                lblemail.Text = dr["USER_EMAIL"].ToString();
                lbleducation.Text = dr["USER_EDUCATION"].ToString();
                lblcountry.Text = dr["COUNTRY_NAME"].ToString();
                lblcity.Text = dr["CITY_NAME"].ToString();
                lbljob.Text = dr["USER_JOB"].ToString();
            }
            Con.Close();
            Con.Dispose();


            TextTodayDate.Text = DateTime.Now.ToShortDateString();
            getusername();
            getprofilephoto();
            getarticles();
            getuserphotos();
            getnumberoffollowers();
            getnumberoffollowing();
            kontroltakip();
            kontroltakipbirak();
            Controlfollow();
        }
        protected void AdminLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("userlogin_en.aspx");
        }


        //FUNCTIONS
        protected void getprofilephoto()
        {
            connect.Open();
            SqlDataAdapter asd = new SqlDataAdapter("select * from T_USER_PROFILE_PHOTO where PROFILE_PHOTO_USER_ID='" + lblid.Text + "'", connect);
            DataTable dt = new DataTable("tb");
            asd.Fill(dt);
            uyeprofilfoto.DataSource = dt;
            uyeprofilfoto.DataBind();
            connect.Close();
        }
        protected void getarticles()
        {
            connect.Open();
            string sorgu = "select * from T_ARTICLE TA,T_USER TU where  TU.ID=TA.ARTICLE_USER_ID and TU.ID='" + lblid.Text + "'  order by TA.ID desc";
            SqlCommand cmd = new SqlCommand(sorgu, connect);
            SqlDataReader dr = cmd.ExecuteReader();
            lstDuyuru.DataSource = dr;
            lstDuyuru.DataBind();
            connect.Close();
        }
        protected void getuserphotos()
        {
            connect.Open();
            SqlDataAdapter asd = new SqlDataAdapter("select * from T_USER_PHOTOGALLERY where USER_ID=" + lblid.Text + " order by ID desc ", connect);
            DataTable dt = new DataTable("tb");
            asd.Fill(dt);
            DataList1.DataSource = dt;
            DataList1.DataBind();
            connect.Close();
        }
        private void getusername()
        {
            DataTable dt = null;
            DataSet ds = new DataSet();
            SqlConnection db_baglanti;
            SqlCommand db_komut;
            SqlDataAdapter db_adapter = null;
            db_baglanti = new SqlConnection("Data Source=desktop-oqk00gg;Initial Catalog=MNWEBDB;Integrated Security=True");
            db_baglanti.Open();
            string sorgu = "SELECT * FROM T_USER WHERE ID=@ID";
            db_komut = new SqlCommand(sorgu, db_baglanti);
            db_komut.Parameters.Add("@ID", SqlDbType.VarChar).Value = lblid.Text;
            db_adapter = new SqlDataAdapter();
            db_adapter.SelectCommand = db_komut;
            db_adapter.Fill(ds);
            dt = ds.Tables[0];
            db_adapter = null;
            db_baglanti.Close();
            db_baglanti = null;
            if (dt.Rows.Count > 0)
            {
                TextSelectUser.Text = dt.Rows[0]["USER_USERNAME"].ToString();

            }
        }
        private void getmessageid2()
        {
            DataTable dt = null;
            DataSet ds = new DataSet();
            SqlConnection db_baglanti;
            SqlCommand db_komut;
            SqlDataAdapter db_adapter = null;
            db_baglanti = new SqlConnection("Data Source=desktop-oqk00gg;Initial Catalog=MNWEBDB;Integrated Security=True");
            db_baglanti.Open();
            string sorgu = "SELECT * FROM T_USER_MESSAGE WHERE FROM_USER_ID=@FROM_USER_ID AND TO_USER_ID=@TO_USER_ID";
            db_komut = new SqlCommand(sorgu, db_baglanti);
            db_komut.Parameters.Add("@FROM_USER_ID", SqlDbType.VarChar).Value = lblgonderenid.Text;
            db_komut.Parameters.Add("@TO_USER_ID", SqlDbType.VarChar).Value = lblid.Text;
            db_adapter = new SqlDataAdapter();
            db_adapter.SelectCommand = db_komut;
            db_adapter.Fill(ds);
            dt = ds.Tables[0];
            db_adapter = null;
            db_baglanti.Close();
            db_baglanti = null;
            if (dt.Rows.Count > 0)
            {
                lblmessageid.Text = dt.Rows[0]["ID"].ToString();

            }
        }
        protected void infomessage()
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
            db_komut.Parameters.Add("@USER_USERNAME", SqlDbType.VarChar).Value = Session["kullanici"];
            db_adapter = new SqlDataAdapter();
            db_adapter.SelectCommand = db_komut;
            db_adapter.Fill(ds);
            dt = ds.Tables[0];
            db_adapter = null;
            db_baglanti.Close();
            db_baglanti = null;
            if (dt.Rows.Count > 0)
            {
                lblgonderenid.Text = dt.Rows[0]["ID"].ToString();
            }
        }
        protected void kontroltakip()
        {
            if (!Kontrol(lblid.Text))
            {
                BtnFollow.ForeColor = Color.Green;
                BtnFollow.Text = "Follow";
            }
            else
            {
                BtnFollow.ForeColor = Color.Red;
                BtnFollow.Text = "Unfollow";
            }
        }
        protected void Controlfollow()
        {
            if (Controlfollow(lblid.Text))
            {
                BtnConfirm.Visible = true;
                BtnNotConfirm.Visible = true;
            }
            else
            {
                BtnConfirm.Visible = false;
                BtnNotConfirm.Visible = false;
            }
        }
        protected void kontroltakipbirak()
        {
            if (!Kontroltakip(lblid.Text))
            {
                BtnLeaveFollow.Visible = false;
            }
            else
            {
                BtnLeaveFollow.Visible = true;
            }
        }
        protected void getnumberoffollowers()
        {
            connect.Open();
            SqlDataAdapter asd = new SqlDataAdapter("select count(*) from T_FOLLOW where FOLLOWED_USER_ID='" + lblid.Text + "' and FOLLOW_CONFIRM=1 ", connect);
            DataTable dt = new DataTable("tb");
            asd.Fill(dt);
            lblfollowers.Text = dt.Rows[0][0].ToString();
            connect.Close();
        }
        protected void getnumberoffollowing()
        {
            connect.Open();
            SqlDataAdapter asd = new SqlDataAdapter("select count(*) from T_FOLLOW where FOLLOWING_USER_ID='" + lblid.Text + "' and FOLLOW_CONFIRM=1 ", connect);
            DataTable dt = new DataTable("tb");
            asd.Fill(dt);
            lblfollowing.Text = dt.Rows[0][0].ToString();
            connect.Close();
        }



        //CONTROL FUNCTIONS
        private bool Control(string gelenkullanici)
        {
            infomessage();
            connect.Open();
            bool varmisinyokmusun;
            SqlCommand sql = new SqlCommand("select * from T_FOLLOW where FOLLOWING_USER_ID='" + lblgonderenid.Text + "' and FOLLOWED_USER_ID='" + lblid.Text + "'", connect);
            SqlDataReader dr = sql.ExecuteReader();
            varmisinyokmusun = dr.HasRows;
            connect.Close();
            dr = null;
            return varmisinyokmusun;
        }
        private bool Kontrol(string gelenkullanici2)
        {
            infomessage();
            connect.Open();
            bool varmisinyokmusun;
            SqlCommand sql = new SqlCommand("select * from T_FOLLOW where FOLLOWING_USER_ID='" + lblgonderenid.Text + "' and FOLLOWED_USER_ID='" + lblid.Text + "'", connect);
            SqlDataReader dr = sql.ExecuteReader();
            varmisinyokmusun = dr.HasRows;
            connect.Close();
            dr = null;
            return varmisinyokmusun;
        }
        private bool Control1(string gelenkullanici)
        {
            bool varmisinyokmusun;
            SqlCommand sql = new SqlCommand("select * from T_USER where USER_USERNAME='" + gelenkullanici + "'", connect);
            connect.Open();
            SqlDataReader dr = sql.ExecuteReader();
            varmisinyokmusun = dr.HasRows;
            connect.Close();
            dr = null;
            return varmisinyokmusun;
        }
        private bool Control2(string gelenkullanici)
        {
            bool varmisinyokmusun;
            SqlCommand sql = new SqlCommand("select *from T_USER_MESSAGE where FROM_USER_ID='" + gelenkullanici + "'", connect);
            connect.Open();
            SqlDataReader dr = sql.ExecuteReader();
            varmisinyokmusun = dr.HasRows;
            connect.Close();
            dr = null;
            return varmisinyokmusun;
        }
        private bool Control3(string gelenkullanici)
        {
            bool varmisinyokmusun;
            SqlCommand sql = new SqlCommand("select *from T_USER_MESSAGE where TO_USER_ID='" + gelenkullanici + "'", connect);
            connect.Open();
            SqlDataReader dr = sql.ExecuteReader();
            varmisinyokmusun = dr.HasRows;
            connect.Close();
            dr = null;
            return varmisinyokmusun;
        }
        private bool Kontroltakip(string gelenkullanici3)
        {
            infomessage();
            connect.Open();
            bool varmisinyokmusun;
            SqlCommand sql = new SqlCommand("select * from T_FOLLOW where FOLLOWING_USER_ID='" + lblid.Text + "'and FOLLOWED_USER_ID='" + lblgonderenid.Text + "' and FOLLOW_CONFIRM='" + 1 + "'", connect);
            SqlDataReader dr = sql.ExecuteReader();
            varmisinyokmusun = dr.HasRows;
            connect.Close();
            dr = null;
            return varmisinyokmusun;
        }
        private bool Controlfollow(string gelenkullanici4)
        {
            infomessage();
            connect.Open();
            bool varmisinyokmusun;
            SqlCommand sql = new SqlCommand("select * from T_FOLLOW where FOLLOWING_USER_ID='" + lblid.Text + "'and FOLLOWED_USER_ID='" + lblgonderenid.Text + "' and FOLLOW_CONFIRM=0", connect);
            SqlDataReader dr = sql.ExecuteReader();
            varmisinyokmusun = dr.HasRows;
            connect.Close();
            dr = null;
            return varmisinyokmusun;
        }



        //BUTTOMS
        protected void BtnUserProfile_Click(object sender, EventArgs e)
        {
            //PnlAnasayfa.Visible = false;
            MultiView1.ActiveViewIndex = 0;
            connect.Open();
            SqlDataAdapter asd = new SqlDataAdapter("select * from T_USER TU,T_USER_PROFILE_PHOTO TUPP where TU.ID=TUPP.PROFILE_PHOTO_USER_ID and TU.ID='" + lblid.Text + "'", connect);
            DataTable dt = new DataTable("tb");
            asd.Fill(dt);
            profilfoto.DataSource = dt;
            profilfoto.DataBind();
            connect.Close();

            labelname.Text = lblname.Text;
            labelsurname.Text = lblsurname.Text;
        }
        protected void BtnArticles_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 3;
        }
        protected void BtnUserPhotoGallery_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 4;
        }
        protected void BtnLeaveFollow_Click(object sender, EventArgs e)
        {
            infomessage();
            connect.Open();
            DataTable dt = new DataTable();
            SqlDataAdapter komut = new SqlDataAdapter("delete from T_FOLLOW where FOLLOWING_USER_ID='" + lblid.Text + "' and FOLLOWED_USER_ID = '" + lblgonderenid.Text + "'", connect);
            komut.Fill(dt);
            connect.Close();
            BtnLeaveFollow.Visible = false;
            getnumberoffollowers();
            getnumberoffollowing();
        }
        protected void BtnFollow_Click(object sender, EventArgs e)
        {
            //PnlAnasayfa.Visible = false;
            MultiView1.ActiveViewIndex = 2;
            infomessage();

            if (!Control(lblid.Text))
            {
                connect.Open();
                string sorgu = "insert into T_FOLLOW (FOLLOWING_USER_ID,FOLLOWED_USER_ID,FOLLOW_CONFIRM)values(@FOLLOWING_USER_ID,@FOLLOWED_USER_ID,@FOLLOW_CONFIRM) ";
                SqlCommand asd = new SqlCommand(sorgu, connect);

                asd.Parameters.Add("@FOLLOWING_USER_ID", SqlDbType.VarChar).Value = lblgonderenid.Text;
                asd.Parameters.Add("@FOLLOWED_USER_ID", SqlDbType.VarChar).Value = lblid.Text;
                asd.Parameters.Add("@FOLLOW_CONFIRM", SqlDbType.VarChar).Value = "0";
                asd.ExecuteNonQuery();
                lbldurum.ForeColor = Color.Green;
                lbldurum.Text = "Follow request was sent";
                BtnFollow.ForeColor = Color.Red;
                BtnFollow.Text = "Unfollow";
                connect.Close();
            }
            else
            {
                connect.Open();
                DataTable dt = new DataTable();
                SqlDataAdapter komut = new SqlDataAdapter("delete from T_FOLLOW where FOLLOWING_USER_ID='" + lblgonderenid.Text + "' and FOLLOWED_USER_ID = '" + lblid.Text + "'", connect);
                komut.Fill(dt);

                lbldurum.ForeColor = Color.Red;
                lbldurum.Text = "You stopped following the user.";
                BtnFollow.ForeColor = Color.Green;
                BtnFollow.Text = "Follow";
                connect.Close();

                //lbldurum.ForeColor = Color.Red;
                //lbldurum.Text = "Kullanıcıyı Zaten Takip Ediyorsunuz";
            }
        }
        protected void BtnConfirm_Click(object sender, EventArgs e)
        {
            infomessage();
            // PnlAnasayfa.Visible = false;
            MultiView1.ActiveViewIndex = 2;
            connect.Open();

            SqlDataAdapter ds = new SqlDataAdapter("update T_FOLLOW set FOLLOW_CONFIRM=1 where FOLLOWING_USER_ID='" + lblid.Text + "'and FOLLOWED_USER_ID='" + lblgonderenid.Text + "'", connect);
            DataTable dt = new DataTable();
            ds.Fill(dt);
            ds.Dispose();

            lbldurum.Visible = true;
            lbldurum.ForeColor = Color.Green;
            lbldurum.Text = "User can follow you anymore.";

            BtnConfirm.Visible = false;
            BtnNotConfirm.Visible = false;
            BtnLeaveFollow.Visible = true;
            connect.Close();
            getnumberoffollowers();
            getnumberoffollowing();
        }
        protected void BtnNotConfirm_Click(object sender, EventArgs e)
        {
            infomessage();
            // PnlAnasayfa.Visible = false;
            MultiView1.ActiveViewIndex = 2;
            connect.Open();
            DataTable dt = new DataTable();
            SqlDataAdapter komut = new SqlDataAdapter("delete from T_FOLLOW  where FOLLOWING_USER_ID='" + lblid.Text + "' AND FOLLOWED_USER_ID='" + lblgonderenid.Text + "' ", connect);
            lbldurum.Visible = true;
            lbldurum.ForeColor = Color.Red;
            lbldurum.Text = "You removed the user's follow request.";
            komut.Fill(dt);
            connect.Close();

            BtnConfirm.Visible = false;
            BtnNotConfirm.Visible = false;
            BtnFollow.Visible = true;
        }
        protected void BtnWriteMessage_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }
        protected void BtnSendMessage_Click(object sender, EventArgs e)
        {
            getusername();
            if (!Control1(TextSelectUser.Text))
            {
            }
            else
            {
                if (Control2(lblgonderenid.Text) && Control3(lblid.Text))
                {
                    getmessageid2();

                    connect.Open();
                    string sorgu3 = "insert into T_USER_MESSAGES(MESSAGE_ID,MESSAGE_CONTENT,MESSAGE_DATE)values(@MESSAGE_ID,@MESSAGE_CONTENT,@MESSAGE_DATE)";
                    SqlCommand asd3 = new SqlCommand(sorgu3, connect);
                    asd3.Parameters.Add("@MESSAGE_ID", SqlDbType.VarChar).Value = lblmessageid.Text;
                    asd3.Parameters.Add("@MESSAGE_CONTENT", SqlDbType.VarChar).Value = TextMessageBox.Text;
                    asd3.Parameters.Add("@MESSAGE_DATE", SqlDbType.Date).Value = TextTodayDate.Text;
                    asd3.ExecuteReader();
                    lblmessage.Visible = true;
                    lblmessage.Text = "Message has been sent.";
                    connect.Close();
                }
                else
                {
                    connect.Open();
                    string sorgu = "insert into T_USER_MESSAGE(FROM_USER_ID,TO_USER_ID)values(@FROM_USER_ID,@TO_USER_ID)";
                    SqlCommand asd = new SqlCommand(sorgu, connect);
                    asd.Parameters.Add("@FROM_USER_ID", SqlDbType.VarChar).Value = lblgonderenid.Text;
                    asd.Parameters.Add("@TO_USER_ID", SqlDbType.VarChar).Value = lblid.Text;
                    asd.ExecuteReader();
                    connect.Close();

                    getmessageid2();

                    connect.Open();
                    string sorgu3 = "insert into T_USER_MESSAGES(MESSAGE_ID,MESSAGE_CONTENT,MESSAGE_DATE)values(@MESSAGE_ID,@MESSAGE_CONTENT,@MESSAGE_DATE)";
                    SqlCommand asd3 = new SqlCommand(sorgu3, connect);
                    asd3.Parameters.Add("@MESSAGE_ID", SqlDbType.VarChar).Value = lblmessageid.Text;
                    asd3.Parameters.Add("@MESSAGE_CONTENT", SqlDbType.VarChar).Value = TextMessageBox.Text;
                    asd3.Parameters.Add("@MESSAGE_DATE", SqlDbType.Date).Value = TextTodayDate.Text;
                    asd3.ExecuteReader();
                    lblmessage.Visible = true;
                    lblmessage.Text = "Message has been sent.";
                    connect.Close();
                }
            }
            MultiView1.ActiveViewIndex = 1;
            BtnWriteMessage.Visible = true;
        }
    }
}