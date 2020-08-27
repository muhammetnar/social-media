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
    public partial class adminannounceprocess : System.Web.UI.Page
    {
        SqlConnection connect = new SqlConnection("Data Source=desktop-oqk00gg;Initial Catalog=MNWEBDB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null)
                lblwelcomemsg.Text = ("Hoşgeldin   " + Session["admin"]);
            else
                Response.Redirect("adminlogin.aspx");

            getannounce1();
            getannounce2();
            getannounce3();
        }

        protected void AdminLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("adminlogin.aspx");
        }

        //AUTOMATIC SEARCH SECTIONS (FUNCTIONS)
        private void getannounce1()
        {
            connect.Open();
            string sorgu = "select * from T_ANNOUNCEMENT order by ANNOUNCE_DATE desc";
            SqlCommand cmd = new SqlCommand(sorgu, connect);
            SqlDataReader dr = cmd.ExecuteReader();
            GridView1.DataSource = dr;
            GridView1.DataBind();
            connect.Close();

        }
        private void getannounce2()
        {
            connect.Open();
            string sorgu = "select * from T_ANNOUNCEMENT order by ANNOUNCE_DATE desc";
            SqlCommand cmd = new SqlCommand(sorgu, connect);
            SqlDataReader dr = cmd.ExecuteReader();
            GridView2.DataSource = dr;
            GridView2.DataBind();
            connect.Close();

        }
        private void getannounce3()
        {
            connect.Open();
            string sorgu = "select * from T_ANNOUNCEMENT order by ANNOUNCE_DATE desc";
            SqlCommand cmd = new SqlCommand(sorgu, connect);
            SqlDataReader dr = cmd.ExecuteReader();
            GridView3.DataSource = dr;
            GridView3.DataBind();
            connect.Close();

        }


        //OPEN SECTION
        protected void BtnOpen_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedIndex == 0)
            {
                lblduyuruislemlerimsg.Visible = true;
                lblduyuruislemlerimsg.Text = "Lütfen Bir İşlem Seçiniz";
                MultiView1.Visible = false;

            }
            else if (DropDownList1.SelectedIndex == 1)
            {

                MultiView1.Visible = true;
                lblduyuruislemlerimsg.Visible = false;
                MultiView1.ActiveViewIndex = 0;

            }
            else if (DropDownList1.SelectedIndex == 2)
            {
                MultiView1.Visible = true;
                lblduyuruislemlerimsg.Visible = false;
                MultiView1.ActiveViewIndex = 1;


            }
            else if (DropDownList1.SelectedIndex == 3)
            {
                MultiView1.Visible = true;
                lblduyuruislemlerimsg.Visible = false;
                MultiView1.ActiveViewIndex = 2;


            }

            else if (DropDownList1.SelectedIndex == 4)
            {
                MultiView1.Visible = true;
                lblduyuruislemlerimsg.Visible = false;
                MultiView1.ActiveViewIndex = 3;
            }

            else
            {
                lblduyuruislemlerimsg.Text = "Lütfen Bir İşlem Seçiniz";
            }
        }


        //ADD SECTION
        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            connect.Open();
            if (DropdownDil.SelectedIndex == 0)
            {
                lblmsgekle.Text = "Bir Dil Seçiniz";
            }
            else if (DropdownDil.SelectedIndex == 1)
            {

                string sorgu = "insert into T_ANNOUNCEMENT (ANNOUNCE_TITLE,ANNOUNCE_CONTENT,ANNOUNCE_DATE,ANNOUNCE_LANGUAGE)values(@ANNOUNCE_TITLE,@ANNOUNCE_CONTENT,@ANNOUNCE_DATE,@ANNOUNCE_LANGUAGE)";
                SqlCommand asd = new SqlCommand(sorgu, connect);
                asd.Parameters.Add("@ANNOUNCE_TITLE", SqlDbType.VarChar).Value = textduyurubaslikekle.Text;
                asd.Parameters.Add("@ANNOUNCE_CONTENT", SqlDbType.VarChar).Value = textduyuruekle.Text;
                asd.Parameters.Add("@ANNOUNCE_DATE", SqlDbType.Date).Value = textduyurutarihekle.Text;
                asd.Parameters.Add("@ANNOUNCE_LANGUAGE", SqlDbType.VarChar).Value = "TR";
                asd.ExecuteNonQuery();
                lblmsgekle.Text = "İşlem Başarılı";

            }
            else
            {
                string sorgu = "insert into T_ANNOUNCEMENT (ANNOUNCE_TITLE,ANNOUNCE_CONTENT,ANNOUNCE_DATE,ANNOUNCE_LANGUAGE)values(@ANNOUNCE_TITLE,@ANNOUNCE_CONTENT,@ANNOUNCE_DATE,@ANNOUNCE_LANGUAGE)";
                SqlCommand asd = new SqlCommand(sorgu, connect);
                asd.Parameters.Add("@ANNOUNCE_TITLE", SqlDbType.VarChar).Value = textduyurubaslikekle.Text;
                asd.Parameters.Add("@ANNOUNCE_CONTENT", SqlDbType.VarChar).Value = textduyuruekle.Text;
                asd.Parameters.Add("@ANNOUNCE_DATE", SqlDbType.Date).Value = textduyurutarihekle.Text;
                asd.Parameters.Add("@ANNOUNCE_LANGUAGE", SqlDbType.VarChar).Value = "EN";
                asd.ExecuteNonQuery();
                lblmsgekle.Text = "İşlem Başarılı";

            }
            connect.Close();
        }
        protected void BtnAnnounceAddCancel_Click(object sender, EventArgs e)
        {
            MultiView1.Visible = false;
        }
        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            textduyurutarihekle.Text = Calendar1.SelectedDate.ToShortDateString();
        }


        //UPDATE SECTION
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label lblDuyuruID = (Label)GridView1.SelectedRow.FindControl("lblDuyuruID");
            Label lblDuyuruBaslik = (Label)GridView1.SelectedRow.FindControl("lblDuyuruBaslik");
            Label lblDuyuru = (Label)GridView1.SelectedRow.FindControl("lblDuyuru");

            textduyuruidguncelle.Text = lblDuyuruID.Text;
            textduyurubaslikguncelle.Text = lblDuyuruBaslik.Text;
            textduyuruguncelle.Text = lblDuyuru.Text;

            PnlGuncelleme.Visible = true;
            lblmsgguncelle.Visible = false;
        }
        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            connect.Open();
            SqlDataAdapter ds = new SqlDataAdapter("update T_ANNOUNCEMENT set ANNOUNCE_TITLE='" + textduyurubaslikguncelle.Text + "',ANNOUNCE_CONTENT='" + textduyuruguncelle.Text + "' where ID='" + textduyuruidguncelle.Text + "'", connect);
            DataTable dt = new DataTable();
            ds.Fill(dt);
            ds.Dispose();
            lblmsgguncelle.Visible = true;
            lblmsgguncelle.Text = "İşlem Başarılı";
            connect.Close();

            PnlGuncelleme.Visible = false;

            connect.Open();
            string sorgu = "select * from T_ANNOUNCEMENT order by ANNOUNCE_DATE desc";
            SqlCommand cmd = new SqlCommand(sorgu, connect);
            SqlDataReader dr = cmd.ExecuteReader();
            GridView1.DataSource = dr;
            GridView1.DataBind();
            connect.Close();
        }
        protected void BtnUpdateCancel_Click(object sender, EventArgs e)
        {
            PnlGuncelleme.Visible = false;
            lblmsgguncelle.Visible = true;
            lblmsgguncelle.Text = "Hiçbir İşlem Yapılmadı";
        }


        //DELETE SECTION
        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label lblDuyuruIDSil = (Label)GridView2.SelectedRow.FindControl("lblDuyuruIDSil");
            Label lblDuyuruBaslikSil = (Label)GridView2.SelectedRow.FindControl("lblDuyuruBaslikSil");
            Label lblDuyuruSil = (Label)GridView2.SelectedRow.FindControl("lblDuyuruSil");
            Label lblDuyuruTarihSil = (Label)GridView2.SelectedRow.FindControl("lblDuyuruTarihSil");

            textduyuruidsil.Text = lblDuyuruIDSil.Text;
            lblduyurubasliksil.Text = lblDuyuruBaslikSil.Text;
            lblduyurusil.Text = lblDuyuruSil.Text;
            lblduyurutarihsil.Text = lblDuyuruTarihSil.Text;

            PnlSilme.Visible = true;
            lblmsgsil.Visible = false;
        }
        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            connect.Open();
            DataTable dt = new DataTable();
            SqlDataAdapter komut = new SqlDataAdapter("delete from T_ANNOUNCEMENT where ID='" + textduyuruidsil.Text + "' ", connect);
            komut.Fill(dt);
            lblmsgsil.Visible = true;
            lblmsgsil.Text = "İşlem Başarılı";
            connect.Close();

            PnlSilme.Visible = false;

            connect.Open();
            string sorgu = "select * from T_ANNOUNCEMENT order by ANNOUNCE_DATE desc";
            SqlCommand cmd = new SqlCommand(sorgu, connect);
            SqlDataReader dr = cmd.ExecuteReader();
            GridView2.DataSource = dr;
            GridView2.DataBind();
            connect.Close();
        }
        protected void BtnDeleteCancel_Click(object sender, EventArgs e)
        {
            PnlSilme.Visible = false;
            lblmsgsil.Visible = true;
            lblmsgsil.Text = "Hiçbir İşlem Yapılmadı";
        }
    }
}