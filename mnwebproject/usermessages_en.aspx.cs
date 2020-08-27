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
    public partial class usermessages_en : System.Web.UI.Page
    {
        SqlConnection connect = new SqlConnection("Data Source=desktop-oqk00gg;Initial Catalog=MNWEBDB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kullanici"] != null)
            {
                lblwelcomemsg.Text = ("Welcome   " + Session["kullanici"]);
            }
            else
            {
                Response.Redirect("userlogin_en.aspx");
            }
            TextTodayDate.Text = DateTime.Now.ToShortDateString();
            getinformations();
            getprofilephoto();
            getnumberoffollowing();
            getnumberoffollowers();
            MultiView1.ActiveViewIndex = 0;
            doldur();
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
        protected void getinformations()
        {
            DataTable dt = null;
            DataSet ds = new DataSet();
            SqlConnection db_baglanti;
            SqlCommand db_komut;
            SqlDataAdapter db_adapter = null;
            db_baglanti = new SqlConnection("Data Source=desktop-oqk00gg;Initial Catalog=MNWEBDB;Integrated Security=True");
            db_baglanti.Open();
            string sorgu = "SELECT * FROM T_USER WHERE   USER_USERNAME=@USER_USERNAME";
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
                lblid.Text = dt.Rows[0]["ID"].ToString();
                lbladi.Text = dt.Rows[0]["USER_NAME"].ToString();
                lblsoyadi.Text = dt.Rows[0]["USER_SURNAME"].ToString();


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
        void doldur()
        {
            // veritabanına bağlanmayı sağlar
            string yol = ("Data Source=desktop-oqk00gg;Initial Catalog=MNWEBDB;Integrated Security=True");
            SqlConnection Con = new SqlConnection(yol);
            //aşağıdaki tümce kapalı durumda olan bağlantıyı açar
            if (Con.State == ConnectionState.Closed)
            {
                Con.Open();
            }
            string SQL = "select TUM.ID,TU.USER_NAME,TU.USER_SURNAME,TUM.FROM_USER_ID,TUM.TO_USER_ID,TUPP.PROFILE_PHOTO_URL from T_USER TU, T_USER_PROFILE_PHOTO TUPP,T_USER_MESSAGE TUM where TUM.FROM_USER_ID = TUPP.PROFILE_PHOTO_USER_ID and TU.ID = TUM.FROM_USER_ID and TUM.TO_USER_ID='" + lblid.Text + "' order by TUM.ID desc ";
            SqlDataAdapter adp = new SqlDataAdapter(SQL, Con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
            Con.Close();
            Con.Dispose();
        }
        private void getmessageid()
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
            db_komut.Parameters.Add("@FROM_USER_ID", SqlDbType.VarChar).Value = lblid.Text;
            db_komut.Parameters.Add("@TO_USER_ID", SqlDbType.VarChar).Value = Textfromid.Text;
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
            db_komut.Parameters.Add("@FROM_USER_ID", SqlDbType.VarChar).Value = lblid.Text;
            db_komut.Parameters.Add("@TO_USER_ID", SqlDbType.VarChar).Value = lbluserid.Text;
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
        private void getusername()
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
            db_komut.Parameters.Add("@USER_USERNAME", SqlDbType.VarChar).Value = TextSelectUser.Text;
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
        private void getuserid()
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
            db_komut.Parameters.Add("@ID", SqlDbType.VarChar).Value = Textfromid.Text;
            db_adapter = new SqlDataAdapter();
            db_adapter.SelectCommand = db_komut;
            db_adapter.Fill(ds);
            dt = ds.Tables[0];
            db_adapter = null;
            db_baglanti.Close();
            db_baglanti = null;
            if (dt.Rows.Count > 0)
            {
                Textusername.Text = dt.Rows[0]["USER_USERNAME"].ToString();

            }
        }
        private void getusername2()
        {
            getuserid();
            DataTable dt = null;
            DataSet ds = new DataSet();
            SqlConnection db_baglanti;
            SqlCommand db_komut;
            SqlDataAdapter db_adapter = null;
            db_baglanti = new SqlConnection("Data Source=desktop-oqk00gg;Initial Catalog=MNWEBDB;Integrated Security=True");
            db_baglanti.Open();
            string sorgu = "SELECT * FROM T_USER WHERE USER_USERNAME=@USER_USERNAME";
            db_komut = new SqlCommand(sorgu, db_baglanti);
            db_komut.Parameters.Add("@USER_USERNAME", SqlDbType.VarChar).Value = Textusername.Text;
            db_adapter = new SqlDataAdapter();
            db_adapter.SelectCommand = db_komut;
            db_adapter.Fill(ds);
            dt = ds.Tables[0];
            db_adapter = null;
            db_baglanti.Close();
            db_baglanti = null;
            if (dt.Rows.Count > 0)
            {
                lbluserid2.Text = dt.Rows[0]["ID"].ToString();

            }
        }


        //MESSAGES GRIDVIEW
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            Label lblmessageid = (Label)GridView1.SelectedRow.FindControl("lblmessageid");
            Label lblfromid = (Label)GridView1.SelectedRow.FindControl("lblfromid");
            Label lblmessageusername = (Label)GridView1.SelectedRow.FindControl("lblmessageusername");
            Label lblmessageusersurname = (Label)GridView1.SelectedRow.FindControl("lblmessageusersurname");

            Textmessageid.Text = lblmessageid.Text;
            Textfromid.Text = lblfromid.Text;
            labeltoname.Text = lblmessageusername.Text;
            labeltosurname.Text = lblmessageusersurname.Text;

            PnlSeeMessage.Visible = true;
            connect.Open();
            string sorgu = "select TU.USER_NAME,TU.USER_SURNAME,TUMS.MESSAGE_CONTENT,TUMS.MESSAGE_DATE from T_USER TU,T_USER_MESSAGE TUM,T_USER_MESSAGES TUMS where TU.ID=TUM.FROM_USER_ID and TUM.ID=TUMS.MESSAGE_ID and TUM.ID=" + lblmessageid.Text + " order by TUMS.ID desc";
            SqlCommand cmd = new SqlCommand(sorgu, connect);
            SqlDataReader dr = cmd.ExecuteReader();
            lstDuyuru.DataSource = dr;
            lstDuyuru.DataBind();
            connect.Close();
        }


        //BACK BUTTONS
        protected void BtnWriteMsgBack_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            BtnWriteMessage.Visible = true;
        }
        protected void BtnAnswerBack_Click(object sender, EventArgs e)
        {
            lstDuyuru.Visible = true;
            BtnBack.Visible = true;
            BtnAnswer.Visible = true;
            BtnDelete.Visible = true;
            BtnDeleteConversation.Visible = true;
            BtnAnswerBack.Visible = false;
            labelto.Visible = false;
            labeltoname.Visible = false;
            labeltosurname.Visible = false;
            TextMessage.Visible = false;
            BtnSend.Visible = false;
        }
        protected void BtnBack_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
            PnlSeeMessage.Visible = false;
            lblanswermsg.Visible = false;
        }


        //MESSAGE FIRST WRITE SECTIONS
        protected void BtnWriteMessage_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            lblwritemsg.Visible = false;
        }
        protected void BtnWriteMsg_Click(object sender, EventArgs e)
        {
            getusername();
            if (!Control(TextSelectUser.Text))
            {
            }
            else
            {
                if (Control2(lblid.Text) && Control3(lbluserid.Text))
                {
                    getmessageid2();

                    connect.Open();
                    string sorgu3 = "insert into T_USER_MESSAGES(MESSAGE_ID,MESSAGE_CONTENT,MESSAGE_DATE)values(@MESSAGE_ID,@MESSAGE_CONTENT,@MESSAGE_DATE)";
                    SqlCommand asd3 = new SqlCommand(sorgu3, connect);
                    asd3.Parameters.Add("@MESSAGE_ID", SqlDbType.VarChar).Value = lblmessageid.Text;
                    asd3.Parameters.Add("@MESSAGE_CONTENT", SqlDbType.VarChar).Value = TextMessageBox.Text;
                    asd3.Parameters.Add("@MESSAGE_DATE", SqlDbType.Date).Value = TextTodayDate.Text;
                    asd3.ExecuteReader();
                    lblwritemsg.Visible = true;
                    lblwritemsg.Text = "Message has been sent.";
                    connect.Close();

                    TextSelectUser.Text = null;
                    lbluserid.Text = null;
                }
                else
                {
                    connect.Open();
                    string sorgu = "insert into T_USER_MESSAGE(FROM_USER_ID,TO_USER_ID)values(@FROM_USER_ID,@TO_USER_ID)";
                    SqlCommand asd = new SqlCommand(sorgu, connect);
                    asd.Parameters.Add("@FROM_USER_ID", SqlDbType.VarChar).Value = lblid.Text;
                    asd.Parameters.Add("@TO_USER_ID", SqlDbType.VarChar).Value = lbluserid.Text;
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
                    lblwritemsg.Visible = true;
                    lblwritemsg.Text = "Message has been sent.";
                    connect.Close();

                    TextSelectUser.Text = null;
                    lbluserid.Text = null;
                }
            }
            MultiView1.ActiveViewIndex = 1;
            BtnWriteMessage.Visible = true;
        }


        //MESSAGE DETAIL SECTIONS
        protected void BtnAnswer_Click(object sender, EventArgs e)
        {
            lstDuyuru.Visible = false;
            BtnBack.Visible = false;
            BtnAnswer.Visible = false;
            BtnDelete.Visible = false;
            BtnDeleteConversation.Visible = false;
            BtnAnswerBack.Visible = true;
            labelto.Visible = true;
            labeltoname.Visible = true;
            labeltosurname.Visible = true;
            TextMessage.Visible = true;
            BtnSend.Visible = true;
        }
        protected void BtnSend_Click(object sender, EventArgs e)
        {
            getusername2();
            if (!Control(Textusername.Text))
            {
            }
            else
            {

                if (Control2(lblid.Text) && Control3(lbluserid2.Text))
                {
                    getmessageid();
                    connect.Open();
                    string sorgu = "insert into T_USER_MESSAGES(MESSAGE_ID,MESSAGE_CONTENT,MESSAGE_DATE)values(@MESSAGE_ID,@MESSAGE_CONTENT,@MESSAGE_DATE)";
                    SqlCommand asd = new SqlCommand(sorgu, connect);
                    asd.Parameters.Add("@MESSAGE_ID", SqlDbType.VarChar).Value = lblmessageid.Text;
                    asd.Parameters.Add("@MESSAGE_CONTENT", SqlDbType.VarChar).Value = TextMessage.Text;
                    asd.Parameters.Add("@MESSAGE_DATE", SqlDbType.Date).Value = TextTodayDate.Text;
                    asd.ExecuteReader();
                    lblanswermsg.Visible = true;
                    lblanswermsg.Text = "Message has been sent.";
                    connect.Close();
                }
                else
                {
                    connect.Open();
                    string sorgu = "insert into T_USER_MESSAGE(FROM_USER_ID,TO_USER_ID)values(@FROM_USER_ID,@TO_USER_ID)";
                    SqlCommand asd = new SqlCommand(sorgu, connect);
                    asd.Parameters.Add("@FROM_USER_ID", SqlDbType.VarChar).Value = lblid.Text;
                    asd.Parameters.Add("@TO_USER_ID", SqlDbType.VarChar).Value = lbluserid2.Text;
                    asd.ExecuteReader();
                    connect.Close();

                    getmessageid();
                    connect.Open();
                    string sorgu2 = "insert into T_USER_MESSAGES(MESSAGE_ID,MESSAGE_CONTENT,MESSAGE_DATE)values(@MESSAGE_ID,@MESSAGE_CONTENT,@MESSAGE_DATE)";
                    SqlCommand asd2 = new SqlCommand(sorgu2, connect);
                    asd2.Parameters.Add("@MESSAGE_ID", SqlDbType.VarChar).Value = lblmessageid.Text;
                    asd2.Parameters.Add("@MESSAGE_CONTENT", SqlDbType.VarChar).Value = TextMessage.Text;
                    asd2.Parameters.Add("@MESSAGE_DATE", SqlDbType.Date).Value = TextTodayDate.Text;
                    asd2.ExecuteReader();
                    lblanswermsg.Visible = true;
                    lblanswermsg.Text = "Message has been sent.";
                    connect.Close();
                }
            }
        }
        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            connect.Open();
            DataTable dt = new DataTable();
            SqlDataAdapter komut = new SqlDataAdapter("delete from T_USER_MESSAGES where MESSAGE_ID='" + Textmessageid.Text + "' ", connect);
            komut.Fill(dt);
            connect.Close();

            doldur();
            GridView1.Visible = true;
            PnlSeeMessage.Visible = false;
        }
        protected void BtnDeleteConversation_Click(object sender, EventArgs e)
        {
            connect.Open();
            DataTable dt = new DataTable();
            SqlDataAdapter komut = new SqlDataAdapter("delete from T_USER_MESSAGE where TO_USER_ID='" + lblid.Text + "' and FROM_USER_ID='" + Textfromid.Text + "' ", connect);
            komut.Fill(dt);
            connect.Close();

            connect.Open();
            DataTable dt2 = new DataTable();
            SqlDataAdapter komut2 = new SqlDataAdapter("delete from T_USER_MESSAGES where MESSAGE_ID='" + Textmessageid.Text + "' ", connect);
            komut2.Fill(dt2);
            connect.Close();

            doldur();
            GridView1.Visible = true;
            PnlSeeMessage.Visible = false;
        }


        //CONTROL FUNCTIONS AND CONTROL TEXTBOX
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
        protected void TextSelectUser_Textchanged(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            if (Control(TextSelectUser.Text))
            {
                durum.ForeColor = Color.Red;
                durum.Text = "You can send a message this user...";
            }
            else if ((TextSelectUser.Text) == null)
            {
                durum.ForeColor = Color.Red;
                durum.Text = "Username can not be empty...";
            }
            else
            {
                durum.ForeColor = Color.Green;
                durum.Text = "User not found... ";
            }
        }
    }
}