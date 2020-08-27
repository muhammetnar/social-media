using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.IO;

namespace mnwebproject
{
    public partial class usersettings_en : System.Web.UI.Page
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
            if (!this.IsPostBack)
            {
                Addcountry();
                Addcity();

            }
            getinformations();
            getprofilephoto();
            getprofilephotosettings();
            getprofileinformations();
            getnumberoffollowers();
            getnumberoffollowing();
            Textphotodate.Text = DateTime.Now.ToShortDateString();
        }
        protected void AdminLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("userlogin_en.aspx");
        }

        //FUNCTION SECTIONS
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
        protected void getprofilephoto()
        {
            connect.Open();
            SqlDataAdapter asd = new SqlDataAdapter("select U.ID,U.USER_NAME,U.USER_SURNAME,UPP.PROFILE_PHOTO_URL from T_USER U,T_USER_PROFILE_PHOTO UPP where U.ID=UPP.PROFILE_PHOTO_USER_ID and U.ID='" + lblid.Text + "'", connect);
            DataTable dt = new DataTable("tb");
            asd.Fill(dt);
            uyeprofilfoto.DataSource = dt;
            uyeprofilfoto.DataBind();
            connect.Close();
        }
        protected void getprofilephotosettings()
        {
            connect.Open();
            SqlDataAdapter asd = new SqlDataAdapter("select U.ID,U.USER_NAME,U.USER_SURNAME,UPP.PROFILE_PHOTO_URL from T_USER U,T_USER_PROFILE_PHOTO UPP where U.ID=UPP.PROFILE_PHOTO_USER_ID and U.ID='" + lblid.Text + "'", connect);
            DataTable dt = new DataTable("tb");
            asd.Fill(dt);
            lblresimadi.Text = dt.Rows[0]["PROFILE_PHOTO_URL"].ToString();
            uyeprofilfotoduzenlegrid.DataSource = dt;
            uyeprofilfotoduzenlegrid.DataBind();
            connect.Close();
        }
        protected void getprofileinformations()
        {
            connect.Open();
            SqlDataAdapter asd = new SqlDataAdapter("select * from T_USER where ID='" + lblid.Text + "'", connect);
            DataTable dt = new DataTable("tb");
            asd.Fill(dt);

            lblusername.Text = dt.Rows[0]["USER_USERNAME"].ToString();
            lblpassword.Text = dt.Rows[0]["USER_PASSWORD"].ToString();
            lblname.Text = dt.Rows[0]["USER_NAME"].ToString();
            lblsurname.Text = dt.Rows[0]["USER_SURNAME"].ToString();
            // lblgender.Text = dt.Rows[0]["USER_GENDER"].ToString();
            if (dt.Rows[0]["USER_GENDER"].ToString() == "M")
            {
                lblgender.Text = "Male";
            }
            else
            {
                lblgender.Text = "Female";
            }
            lblemail.Text = dt.Rows[0]["USER_EMAIL"].ToString();
            lbleducation.Text = dt.Rows[0]["USER_EDUCATION"].ToString();
            lblcountryid.Text = dt.Rows[0]["USER_COUNTRY_ID"].ToString();
            lblcityid.Text = dt.Rows[0]["USER_CITY_ID"].ToString();
            lbljob.Text = dt.Rows[0]["USER_JOB"].ToString();
            connect.Close();

            connect.Open();
            SqlDataAdapter dsa = new SqlDataAdapter("select * from T_COUNTRY where ID='" + lblcountryid.Text + "'", connect);
            DataTable dt2 = new DataTable("tb2");
            dsa.Fill(dt2);
            if (lblcountryid.Text == "0")
            {
                lblcountryname.Text = "";
            }
            else
            {
                lblcountryname.Text = dt2.Rows[0]["COUNTRY_NAME"].ToString();
            }
            connect.Close();

            connect.Open();
            SqlDataAdapter dsa2 = new SqlDataAdapter("select * from T_CITY where ID='" + lblcityid.Text + "'", connect);
            DataTable dt3 = new DataTable("tb2");
            dsa2.Fill(dt3);
            if (lblcityid.Text == "0")
            {
                lblcityname.Text = "";
            }
            else
            {
                lblcityname.Text = dt3.Rows[0]["CITY_NAME"].ToString();
            }
            connect.Close();
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
        protected void Addcountry()
        {
            connect.Open();
            string sql = "select * from T_COUNTRY order by COUNTRY_NAME";
            SqlDataAdapter adap = new SqlDataAdapter(sql, connect);
            DataTable dtCategory = new DataTable();
            adap.Fill(dtCategory);

            DropCountry.Items.Add(new ListItem("Select!", "0"));

            foreach (DataRow dr in dtCategory.Rows)
            {
                if ((dr["ID"].ToString()) != "1")
                {
                    DropCountry.Items.Add(new ListItem(dr["COUNTRY_NAME"].ToString(), dr["ID"].ToString()));
                }

            }
            connect.Close();
            //  Addcity();
        }
        protected void Addcity()
        {
            DropCity.Items.Clear();

            connect.Open();
            string sql = "select TCI.ID,TCI.CITY_NAME from T_CITY TCI,T_COUNTRY TCO where TCI.COUNTRY_ID=TCO.ID and TCI.COUNTRY_ID='" + textcountry.Text + "' order by TCI.CITY_NAME desc";
            SqlDataAdapter adap = new SqlDataAdapter(sql, connect);
            DataTable dtCategory = new DataTable();
            adap.Fill(dtCategory);

            DropCity.Items.Add(new ListItem("Select!", "0"));

            foreach (DataRow dr in dtCategory.Rows)
            {
                DropCity.Items.Add(new ListItem(dr["CITY_NAME"].ToString(), dr["ID"].ToString()));
            }
            connect.Close();
        }
        protected void findcountry()
        {

            connect.Open();
            SqlDataAdapter asd = new SqlDataAdapter("select * from T_COUNTRY where COUNTRY_NAME='" + lblcountry.Text + "'", connect);
            DataTable dt = new DataTable("tb");
            asd.Fill(dt);

            textcountry.Text = dt.Rows[0]["ID"].ToString();

            connect.Close();


        }
        protected void findcity()
        {

            connect.Open();
            SqlDataAdapter asd = new SqlDataAdapter("select * from T_CITY where CITY_NAME='" + lblcity.Text + "'", connect);
            DataTable dt = new DataTable("tb");
            asd.Fill(dt);

            textcity.Text = dt.Rows[0]["ID"].ToString();

            connect.Close();
        }

        //CITY AND COUNTRY DROPDOWNLIST SECTIONS
        protected void DropCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            string CatID = DropCountry.SelectedValue.ToString();

            connect.Open();
            SqlDataAdapter dsa = new SqlDataAdapter("select COUNTRY_NAME from T_COUNTRY where ID='" + CatID + "'", connect);
            DataTable dt = new DataTable("td");
            dsa.Fill(dt);
            connect.Close();

            if (dt != null && dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                if (dr["COUNTRY_NAME"] != DBNull.Value)
                    lblcountry.Text = dr["COUNTRY_NAME"].ToString();
            }
            textcity.Text = "0";
            lblcity.Text = null;
            findcountry();
            Addcity();
        }
        protected void DropCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            string CatID = DropCity.SelectedValue.ToString();

            connect.Open();
            SqlDataAdapter dsa = new SqlDataAdapter("select CITY_NAME from T_CITY where ID='" + CatID + "'", connect);
            DataTable dt = new DataTable("td");
            dsa.Fill(dt);
            connect.Close();

            if (dt != null && dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                if (dr["CITY_NAME"] != DBNull.Value)
                    lblcity.Text = dr["CITY_NAME"].ToString();
            }
            findcity();
        }

        //PROFILE PHOTO UPDATE SECTIONS
        protected void BtnchangeUpdateProfilePhoto_Click(object sender, EventArgs e)
        {
            BtnUpdateProfilePhoto.Visible = true;
            FileUpload1.Visible = true;
            BtnCancelProfilephoto.Visible = true;
            uyeprofilfotoduzenlegrid.Visible = false;
            BtnchangeUpdateProfilePhoto.Visible = false;
            lblmsgprofildegistirme.Visible = false;
        }
        protected void BtnUpdateProfilePhoto_Click(object sender, EventArgs e)
        {
            connect.Open();

            string resimadi = Path.GetFileName(lblresimadi.Text);
            FileInfo IlkResimDosyasi = new FileInfo(Server.MapPath("~\\profilephoto\\") + resimadi);
            IlkResimDosyasi.Delete();
            //bu 3 satırda eksi resmi klasörden sildik

            SqlDataAdapter dsa = new SqlDataAdapter("update T_USER_PROFILE_PHOTO set  PROFILE_PHOTO_URL='" + FileUpload1.PostedFile.FileName + "' where PROFILE_PHOTO_USER_ID='" + lblid.Text + "'", connect);
            string dosyaadi = Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.SaveAs(Server.MapPath("profilephoto/" + dosyaadi));
            DataTable dta = new DataTable();
            //burada yeni fotoğrafı ekledik
            dsa.Fill(dta);
            dsa.Dispose();

            lblmsgprofildegistirme.Visible = true;
            lblmsgprofildegistirme.Text = "Profile photo has been changed.";
            connect.Close();

            connect.Open();
            string sorgu = "insert into T_USER_PHOTOGALLERY(USER_ID,USER_PHOTO_URL,USER_PHOTO_DATE)values(@USER_ID,@USER_PHOTO_URL,@USER_PHOTO_DATE)";
            string dosyaadi2 = Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.SaveAs(Server.MapPath("userphotogallery/" + dosyaadi2));
            SqlCommand asd = new SqlCommand(sorgu, connect);
            asd.Parameters.Add("@USER_ID", SqlDbType.VarChar).Value = lblid.Text;
            asd.Parameters.Add("@USER_PHOTO_DATE", SqlDbType.Date).Value = Textphotodate.Text;
            asd.Parameters.AddWithValue("@USER_PHOTO_URL", dosyaadi2);
            asd.ExecuteNonQuery();
            connect.Close();

            uyeprofilfotoduzenlegrid.Visible = true;
            BtnchangeUpdateProfilePhoto.Visible = true;
            FileUpload1.Visible = false;
            BtnUpdateProfilePhoto.Visible = false;
            BtnCancelProfilephoto.Visible = false;

            getprofilephotosettings();
        }
        protected void BtnCancelProfilephoto_Click(object sender, EventArgs e)
        {
            uyeprofilfotoduzenlegrid.Visible = true;
            BtnchangeUpdateProfilePhoto.Visible = true;
            FileUpload1.Visible = false;
            BtnUpdateProfilePhoto.Visible = false;
            BtnCancelProfilephoto.Visible = false;
        }


        //USER INFORMATION UPDATE SECTIONS
        protected void BtnTransfer_Click(object sender, EventArgs e)
        {
            BtnUpdate.Visible = true;
            BtnTransfer.Visible = false;
            BtnCancel.Visible = true;


            Session["NAME"] = lblname.Text;
            Textname.Text = Session["NAME"].ToString();
            Session["SURNAME"] = lblsurname.Text;
            Textsurname.Text = Session["SURNAME"].ToString();
            Session["GENDER"] = lblgender.Text;
            dropgender.Text = Session["GENDER"].ToString();
            Session["EMAIL"] = lblemail.Text;
            Textemail.Text = Session["EMAIL"].ToString();
            Session["EDUCATION"] = lbleducation.Text;
            Texteducation.Text = Session["EDUCATION"].ToString();
            //Session["COUNTRYID"] = lblcountryid.Text;
            //if (lblcountryid.Text == "0")
            //{
            //}
            //else
            //{
            //        lblcountryid.Text = Session["COUNTRYID"].ToString();
            //        connect.Open();
            //        SqlDataAdapter dsa = new SqlDataAdapter("select * from T_COUNTRY where ID='" + lblcountryid.Text + "'", connect);
            //        DataTable dt2 = new DataTable("tb2");
            //        dsa.Fill(dt2);
            //        DropCountry.Text = dt2.Rows[0]["COUNTRY_NAME"].ToString();
            //        connect.Close();
            //}

            Session["JOB"] = lbljob.Text;
            Textjob.Text = Session["JOB"].ToString();


            Textname.Visible = true;
            Textsurname.Visible = true;
            dropgender.Visible = true;
            Textemail.Visible = true;
            Texteducation.Visible = true;
            DropCountry.Visible = true;
            DropCity.Visible = true;
            Textjob.Visible = true;


            lblname.Visible = false;
            lblsurname.Visible = false;
            lblgender.Visible = false;
            lblemail.Visible = false;
            lbleducation.Visible = false;
            lblcountryname.Visible = false;
            lblcityname.Visible = false;
            lbljob.Visible = false;
        }
        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            BtnTransfer.Visible = true;
            BtnUpdate.Visible = false;
            BtnCancel.Visible = false;

            connect.Open();
            if (dropgender.SelectedIndex == 0)
            {
                if (DropCountry.SelectedIndex == 0)
                {
                    SqlDataAdapter ds = new SqlDataAdapter("update T_USER set  USER_NAME='" + Textname.Text + "',USER_SURNAME='" + Textsurname.Text + "',USER_GENDER='M',USER_EMAIL='" + Textemail.Text + "',USER_COUNTRY_ID='0',USER_CITY_ID='0',USER_EDUCATION='" + Texteducation.Text + "',USER_JOB='" + Textjob.Text + "' where ID='" + lblid.Text + "'", connect);
                    DataTable dt = new DataTable();
                    ds.Fill(dt);
                    ds.Dispose();
                }
                else
                {
                    if (DropCity.SelectedIndex == 0)
                    {
                        SqlDataAdapter ds = new SqlDataAdapter("update T_USER set  USER_NAME='" + Textname.Text + "',USER_SURNAME='" + Textsurname.Text + "',USER_GENDER='M',USER_EMAIL='" + Textemail.Text + "',USER_COUNTRY_ID=" + textcountry.Text + ",USER_CITY_ID='0',USER_EDUCATION='" + Texteducation.Text + "',USER_JOB='" + Textjob.Text + "' where ID='" + lblid.Text + "'", connect);
                        DataTable dt = new DataTable();
                        ds.Fill(dt);
                        ds.Dispose();
                    }
                    else
                    {
                        SqlDataAdapter ds = new SqlDataAdapter("update T_USER set  USER_NAME='" + Textname.Text + "',USER_SURNAME='" + Textsurname.Text + "',USER_GENDER='M',USER_EMAIL='" + Textemail.Text + "',USER_COUNTRY_ID=" + textcountry.Text + ",USER_CITY_ID=" + textcity.Text + ",USER_EDUCATION='" + Texteducation.Text + "',USER_JOB='" + Textjob.Text + "' where ID='" + lblid.Text + "'", connect);
                        DataTable dt = new DataTable();
                        ds.Fill(dt);
                        ds.Dispose();
                    }
                }


                //SqlDataAdapter dsb = new SqlDataAdapter("update T_ARKADAS set  TAKIP_EDEN_AD='" + Textadi.Text + "',TAKIP_EDEN_SOYAD='" + Textsoyadi.Text + "' where TAKIP_EDEN_ID='" + lblid.Text + "'", baglanti);
                //DataTable dtb = new DataTable();
                //dsb.Fill(dtb);
                //dsb.Dispose();

                //SqlDataAdapter dsc = new SqlDataAdapter("update T_TAKIP set  TAKIP_EDEN_AD='" + Textadi.Text + "',TAKIP_EDEN_SOYAD='" + Textsoyadi.Text + "' where TAKIP_EDEN_ID='" + lblid.Text + "'", baglanti);
                //DataTable dtc = new DataTable();
                //dsc.Fill(dtc);
                //dsc.Dispose();
            }
            else
            {
                if (DropCountry.SelectedIndex == 0)
                {
                    SqlDataAdapter ds = new SqlDataAdapter("update T_USER set  USER_NAME='" + Textname.Text + "',USER_SURNAME='" + Textsurname.Text + "',USER_GENDER='F',USER_EMAIL='" + Textemail.Text + "',USER_COUNTRY_ID='0',USER_CITY_ID='0',USER_EDUCATION='" + Texteducation.Text + "',USER_JOB='" + Textjob.Text + "' where ID='" + lblid.Text + "'", connect);
                    DataTable dt = new DataTable();
                    ds.Fill(dt);
                    ds.Dispose();
                }
                else
                {
                    if (DropCity.SelectedIndex == 0)
                    {
                        SqlDataAdapter ds = new SqlDataAdapter("update T_USER set  USER_NAME='" + Textname.Text + "',USER_SURNAME='" + Textsurname.Text + "',USER_GENDER='F',USER_EMAIL='" + Textemail.Text + "',USER_COUNTRY_ID=" + textcountry.Text + ",USER_CITY_ID='0',USER_EDUCATION='" + Texteducation.Text + "',USER_JOB='" + Textjob.Text + "' where ID='" + lblid.Text + "'", connect);
                        DataTable dt = new DataTable();
                        ds.Fill(dt);
                        ds.Dispose();
                    }
                    else
                    {
                        SqlDataAdapter ds = new SqlDataAdapter("update T_USER set  USER_NAME='" + Textname.Text + "',USER_SURNAME='" + Textsurname.Text + "',USER_GENDER='F',USER_EMAIL='" + Textemail.Text + "',USER_COUNTRY_ID=" + textcountry.Text + ",USER_CITY_ID=" + textcity.Text + ",USER_EDUCATION='" + Texteducation.Text + "',USER_JOB='" + Textjob.Text + "' where ID='" + lblid.Text + "'", connect);
                        DataTable dt = new DataTable();
                        ds.Fill(dt);
                        ds.Dispose();
                    }
                }

                //SqlDataAdapter dsb = new SqlDataAdapter("update T_ARKADAS set  TAKIP_EDEN_AD='" + Textadi.Text + "',TAKIP_EDEN_SOYAD='" + Textsoyadi.Text + "' where TAKIP_EDEN_ID='" + lblid.Text + "'", baglanti);
                //DataTable dtb = new DataTable();
                //dsb.Fill(dtb);
                //dsb.Dispose();

                //SqlDataAdapter dsc = new SqlDataAdapter("update T_TAKIP set  TAKIP_EDEN_AD='" + Textadi.Text + "',TAKIP_EDEN_SOYAD='" + Textsoyadi.Text + "' where TAKIP_EDEN_ID='" + lblid.Text + "'", baglanti);
                //DataTable dtc = new DataTable();
                //dsc.Fill(dtc);
                //dsc.Dispose();
            }
            connect.Close();


            Session["NAME1"] = Textname.Text;
            lblname.Text = Session["NAME1"].ToString();
            Session["SURNAME1"] = Textsurname.Text;
            lblsurname.Text = Session["SURNAME1"].ToString();
            Session["GENDER1"] = dropgender.Text;
            lblgender.Text = Session["GENDER1"].ToString();
            Session["EMAIL1"] = Textemail.Text;
            lblemail.Text = Session["EMAIL1"].ToString();
            Session["EDUCATION1"] = Texteducation.Text;
            lbleducation.Text = Session["EDUCATION1"].ToString();
            Session["COUNTRY1"] = lblcountry.Text;
            lblcountryname.Text = Session["COUNTRY1"].ToString();
            Session["CITY1"] = lblcity.Text;
            lblcityname.Text = Session["CITY1"].ToString();
            Session["JOB1"] = Textjob.Text;
            lbljob.Text = Session["JOB1"].ToString();



            Textname.Visible = false;
            Textsurname.Visible = false;
            dropgender.Visible = false;
            Textemail.Visible = false;
            Texteducation.Visible = false;
            DropCountry.Visible = false;
            DropCity.Visible = false;
            Textjob.Visible = false;


            lblname.Visible = true;
            lblsurname.Visible = true;
            lblgender.Visible = true;
            lblemail.Visible = true;
            lbleducation.Visible = true;
            lblcountryname.Visible = true;
            lblcityname.Visible = true;
            lbljob.Visible = true;
        }
        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            BtnTransfer.Visible = true;
            BtnUpdate.Visible = false;
            BtnCancel.Visible = false;

            Textname.Visible = false;
            Textsurname.Visible = false;
            dropgender.Visible = false;
            Textemail.Visible = false;
            Texteducation.Visible = false;
            Textjob.Visible = false;
            DropCountry.Visible = false;
            DropCity.Visible = false;

            lblname.Visible = true;
            lblsurname.Visible = true;
            lblgender.Visible = true;
            lblemail.Visible = true;
            lbleducation.Visible = true;
            lblcountryname.Visible = true;
            lbljob.Visible = true;
        }


        //UPDATE PASSWORD SECTIONS
        protected void BtnTransferPassword_Click(object sender, EventArgs e)
        {
            BtnTransferPassword.Visible = false;
            BtnUpdatePassword.Visible = true;
            BtnCancelPassword.Visible = true;

            Session["PASSWORD"] = lblpassword.Text;
            Textpassword.Text = Session["PASSWORD"].ToString();
            Session["REPEATPASSWPRD"] = Textpassword.Text;
            Textrepeatpassword.Text = Session["REPEATPASSWPRD"].ToString();


            Textpassword.Visible = true;
            Textrepeatpassword.Visible = true;

            lblmsg.Visible = false;
            lblrepeatpassword.Visible = true;
            Labelrepeatpassword.Visible = true;
            lblpassword.Visible = false;
        }
        protected void BtnUpdatePassword_Click(object sender, EventArgs e)
        {
            BtnTransferPassword.Visible = true;
            BtnUpdatePassword.Visible = false;
            BtnCancelPassword.Visible = false;

            connect.Open();
            SqlDataAdapter ds = new SqlDataAdapter("update T_USER set  USER_PASSWORD='" + Textpassword.Text + "' where ID='" + lblid.Text + "'", connect);
            DataTable dt = new DataTable();
            ds.Fill(dt);
            ds.Dispose();
            lblmsg.Visible = true;
            lblmsg.Text = "Password has been changed";

            connect.Close();

            Session["PASSWORD1"] = Textpassword.Text;
            lblpassword.Text = Session["PASSWORD1"].ToString();

            Textpassword.Visible = false;
            Textrepeatpassword.Visible = false;

            lblrepeatpassword.Visible = false;
            Labelrepeatpassword.Visible = false;
            lblpassword.Visible = true;
        }
        protected void BtnCancelPassword_Click(object sender, EventArgs e)
        {
            BtnTransferPassword.Visible = true;
            BtnUpdatePassword.Visible = false;
            BtnCancelPassword.Visible = false;

            Textpassword.Visible = false;
            Textrepeatpassword.Visible = false;

            lblmsg.Visible = false;
            lblrepeatpassword.Visible = false;
            Labelrepeatpassword.Visible = false;
            lblpassword.Visible = true;
        }
    }
}