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
    public partial class adminaboutprocess : System.Web.UI.Page
    {
        SqlConnection connect = new SqlConnection("Data Source=desktop-oqk00gg;Initial Catalog=MNWEBDB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null)
                lblwelcomemsg.Text = ("Hoşgeldin   " + Session["admin"]);
            else
                Response.Redirect("adminlogin.aspx");

            getaboutinfo1();
            getaboutinfo2();
        }

        protected void AdminLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("adminlogin.aspx");
        }

        protected void getaboutinfo1()
        {   
            DataTable dt = null;
            DataSet ds = new DataSet();
            SqlConnection db_baglanti;
            SqlCommand db_komut;
            SqlDataAdapter db_adapter = null;
            db_baglanti = new SqlConnection("Data Source=desktop-oqk00gg;Initial Catalog=MNWEBDB;Integrated Security=True");
            db_baglanti.Open();
            string sorgu = "SELECT * FROM T_ABOUT ";
            db_komut = new SqlCommand(sorgu, connect);


            db_adapter = new SqlDataAdapter();
            db_adapter.SelectCommand = db_komut;
            db_adapter.Fill(ds);
            dt = ds.Tables[0];
            db_adapter = null;
            db_baglanti.Close();
            db_baglanti = null;
            if (dt.Rows.Count > 0)
            {
                this.lblid.Text = dt.Rows[0]["ID"].ToString();
                this.lblbaslik.Text = dt.Rows[0]["ABOUT_TITLE_TR"].ToString();
                this.lblicerik.Text = dt.Rows[0]["ABOUT_CONTENT_TR"].ToString();
            }
        }

        protected void getaboutinfo2()
        {
            DataTable dt = null;
            DataSet ds = new DataSet();
            SqlConnection db_baglanti;
            SqlCommand db_komut;
            SqlDataAdapter db_adapter = null;
            db_baglanti = new SqlConnection("Data Source=desktop-oqk00gg;Initial Catalog=MNWEBDB;Integrated Security=True");
            db_baglanti.Open();
            string sorgu = "SELECT * FROM T_ABOUT ";
            db_komut = new SqlCommand(sorgu, db_baglanti);


            db_adapter = new SqlDataAdapter();
            db_adapter.SelectCommand = db_komut;
            db_adapter.Fill(ds);
            dt = ds.Tables[0];
            db_adapter = null;
            db_baglanti.Close();
            db_baglanti = null;
            if (dt.Rows.Count > 0)
            {
                this.lbliden.Text = dt.Rows[0]["ID"].ToString();
                this.lbltitleen.Text = dt.Rows[0]["ABOUT_TITLE_EN"].ToString();
                this.lblcontenten.Text = dt.Rows[0]["ABOUT_CONTENT_EN"].ToString();
            }
        }

        protected void aktar_Click(object sender, EventArgs e)
        {
            Session["ID"] = lblid.Text;
            txtid.Text = Session["ID"].ToString();
            Session["BASLIK"] = lblbaslik.Text;
            txtbaslik.Text = Session["BASLIK"].ToString();
            Session["ICERIK"] = lblicerik.Text;
            txticerik.Text = Session["ICERIK"].ToString();

            lblbaslik.Visible = false;
            lblicerik.Visible = false;
            aktar.Visible = false;
            lblmssg.Visible = false;

            txtbaslik.Visible = true;
            txticerik.Visible = true;
            BtnDuzenle.Visible = true;
            BtnIptal.Visible = true;
        }

        protected void BtnDuzenle_Click(object sender, EventArgs e)
        {
            connect.Open();
            SqlDataAdapter ds = new SqlDataAdapter("update T_ABOUT set ABOUT_TITLE_TR='" + txtbaslik.Text + "' , ABOUT_CONTENT_TR='" + txticerik.Text + "' where ID='" + txtid.Text + "' ", connect);
            DataTable dt = new DataTable();
            ds.Fill(dt);
            ds.Dispose();
            connect.Close();

            lblbaslik.Visible = true;
            lblicerik.Visible = true;
            aktar.Visible = true;
            lblmssg.Visible = true;
            lblmssg.Text = "İşlem Başarılı";

            txtbaslik.Visible = false;
            txticerik.Visible = false;
            BtnDuzenle.Visible = false;
            BtnIptal.Visible = false;

            getaboutinfo1();
        }

        protected void BtnIptal_Click(object sender, EventArgs e)
        {
            lblbaslik.Visible = true;
            lblicerik.Visible = true;
            aktar.Visible = true;
            lblmssg.Visible = true;
            lblmssg.Text = "Hiçbir İşlem Yapılmadı";

            txtbaslik.Visible = false;
            txticerik.Visible = false;
            BtnDuzenle.Visible = false;
            BtnIptal.Visible = false;
        }

        protected void Btnup_Click(object sender, EventArgs e)
        {
            Session["IDEN"] = lbliden.Text;
            textiden.Text = Session["IDEN"].ToString();
            Session["TITLE"] = lbltitleen.Text;
            texttitleen.Text = Session["TITLE"].ToString();
            Session["CONTENT"] = lblcontenten.Text;
            textcontenten.Text = Session["CONTENT"].ToString();

            lbltitleen.Visible = false;
            lblcontenten.Visible = false;
            Btnup.Visible = false;
            lblmsgen.Visible = false;


            texttitleen.Visible = true;
            textcontenten.Visible = true;
            BtnUpdate.Visible = true;
            Btncancel.Visible = true;
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            connect.Open();

            SqlDataAdapter ds = new SqlDataAdapter("update T_ABOUT set ABOUT_TITLE_EN='" + texttitleen.Text + "' , ABOUT_CONTENT_EN='" + textcontenten.Text + "' where ID='" + textiden.Text + "' ", connect);
            DataTable dt = new DataTable();
            ds.Fill(dt);
            ds.Dispose();
            connect.Close();

            lbltitleen.Visible = true;
            lblcontenten.Visible = true;
            Btnup.Visible = true;
            lblmsgen.Visible = true;
            lblmsgen.Text = "Proccess Success ";

            texttitleen.Visible = false;
            textcontenten.Visible = false;
            BtnUpdate.Visible = false;
            Btncancel.Visible = false;

            getaboutinfo2();
        }

        protected void Btncancel_Click(object sender, EventArgs e)
        {
            lbltitleen.Visible = true;
            lblcontenten.Visible = true;
            Btnup.Visible = true;
            lblmsgen.Visible = true;
            lblmsgen.Text = "Hiçbir İşlem Yapılmadı";

            texttitleen.Visible = false;
            textcontenten.Visible = false;
            BtnUpdate.Visible = false;
            Btncancel.Visible = false;
        }
    }
}