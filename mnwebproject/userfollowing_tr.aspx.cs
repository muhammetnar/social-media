﻿using System;
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
    public partial class userfollowing_tr : System.Web.UI.Page
    {
        SqlConnection connect = new SqlConnection("Data Source=desktop-oqk00gg;Initial Catalog=MNWEBDB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kullanici"] != null)
            {
                lblwelcomemsg.Text = ("Hoşgeldin   " + Session["kullanici"]);
                //kisibilgileri.Text = ("" + Session["kullanici"] + "");
            }
            else
            {
                Response.Redirect("userlogin_tr.aspx");
            }
            getinformations();
            getprofilephoto();
            getnumberoffollowers();
            getnumberoffollowing();

            if (!Page.IsPostBack)
            {
                doldur();
            }
        }

        protected void AdminLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("userlogin_tr.aspx");
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
            string SQL = "SELECT * FROM T_FOLLOW TF,T_USER TU,T_USER_PROFILE_PHOTO TUPP where TU.ID=TF.FOLLOWED_USER_ID and TU.ID=TUPP.PROFILE_PHOTO_USER_ID and TF.FOLLOWING_USER_ID='" + lblid.Text + "' and TF.FOLLOW_CONFIRM=1 order by TF.ID desc";
            SqlDataAdapter adp = new SqlDataAdapter(SQL, Con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            DataList1.DataSource = ds.Tables[0];
            DataList1.DataBind();
            Con.Close();
            Con.Dispose();
        }

        //DATALISTS AND MAIN SEARCH BUTTON
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Details")
            {
                Response.Redirect("userprofile_tr.aspx?id=" + e.CommandArgument);
            }
        }
        protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Details")
            {
                Response.Redirect("userprofile_tr.aspx?id=" + e.CommandArgument);
            }
        }
        protected void BtnMainSearch_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            if (TextSeaarch.Text == "")
            {
                PnlTakipci.Visible = true;
                lblbosmsg.Visible = true;
                lblbosmsg.Text = "*Boş geçilemez.Lütfen Aradığınız Kişi'nin Kullanıcı Adı,İsim veya Soyismini Giriniz.";
                doldur();
                DataList2.Visible = false;
            }
            else
            {
                PnlTakipci.Visible = false;
                lblbosmsg.Visible = false;
                DataList2.Visible = true;
                connect.Open();
                SqlDataAdapter asd = new SqlDataAdapter("select * from T_USER TU,T_USER_PROFILE_PHOTO TUPP where TU.ID=TUPP.PROFILE_PHOTO_USER_ID and TU.ID IN (select ID from T_USER where USER_USERNAME like '%" + TextSeaarch.Text + "%' or USER_NAME like '%" + TextSeaarch.Text + "%' or USER_SURNAME like '%" + TextSeaarch.Text + "%')", connect);
                DataTable dt = new DataTable("tb");
                asd.Fill(dt);
                DataList2.DataSource = dt;
                DataList2.DataBind();
                connect.Close();
            }
        }
    }
}