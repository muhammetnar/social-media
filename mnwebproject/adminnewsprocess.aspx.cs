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
    public partial class adminnewsprocess : System.Web.UI.Page
    {
        SqlConnection connect = new SqlConnection("Data Source=desktop-oqk00gg;Initial Catalog=MNWEBDB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null)
                lblwelcomemsg.Text = ("Hoşgeldin   " + Session["admin"]);
            else
                Response.Redirect("adminlogin.aspx");

            getnews1();
            getnews2();
            getnews3();
        }

        protected void AdminLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("adminlogin.aspx");
        }

        //AUTOMATIC SEARCH SECTION (FUNCTIONS)
        private void getnews1()
        {
            connect.Open();
            string sorgu = "select * from T_NEWS order by NEWS_DATE desc";
            SqlCommand cmd = new SqlCommand(sorgu, connect);
            SqlDataReader dr = cmd.ExecuteReader();
            GridView1.DataSource = dr;
            GridView1.DataBind();
            connect.Close();

        }

        private void getnews2()
        {
            connect.Open();
            string sorgu = "select * from T_NEWS order by NEWS_DATE desc";
            SqlCommand cmd = new SqlCommand(sorgu, connect);
            SqlDataReader dr = cmd.ExecuteReader();
            GridView2.DataSource = dr;
            GridView2.DataBind();
            connect.Close();

        }

        private void  getnews3()
        {
            connect.Open();
            string sorgu = "select * from T_NEWS order by NEWS_DATE desc";
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
                lbleklemsg.Visible = false;
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
            if (Dropdowndil.SelectedIndex == 0)
            {
                lbleklemsg.Text = "Bir Dil Seçiniz";
            }
            else if (Dropdowndil.SelectedIndex == 1)
            {
                string sorgu = "insert into T_NEWS (NEWS_TITLE,NEWS_CONTENT,NEWS_DATE,NEWS_LANGUAGE)values(@NEWS_TITLE,@NEWS_CONTENT,@NEWS_DATE,@NEWS_LANGUAGE)";
                SqlCommand asd = new SqlCommand(sorgu, connect);
                asd.Parameters.Add("@NEWS_TITLE", SqlDbType.VarChar).Value = texthaberbaslikekle.Text;
                asd.Parameters.Add("@NEWS_CONTENT", SqlDbType.VarChar).Value = texthaberekle.Text;
                asd.Parameters.Add("@NEWS_DATE", SqlDbType.Date).Value = texthabertarihekle.Text;
                asd.Parameters.Add("@NEWS_LANGUAGE", SqlDbType.VarChar).Value = "TR";
                asd.ExecuteNonQuery();
                lbleklemsg.Visible = true;
                lbleklemsg.Text = "İşlem Başarılı";
            }
            else
            {
                string sorgu = "insert into T_NEWS (NEWS_TITLE,NEWS_CONTENT,NEWS_DATE,NEWS_LANGUAGE)values(@NEWS_TITLE,@NEWS_CONTENT,@NEWS_DATE,@NEWS_LANGUAGE)";
                SqlCommand asd = new SqlCommand(sorgu, connect);
                asd.Parameters.Add("@NEWS_TITLE", SqlDbType.VarChar).Value = texthaberbaslikekle.Text;
                asd.Parameters.Add("@NEWS_CONTENT", SqlDbType.VarChar).Value = texthaberekle.Text;
                asd.Parameters.Add("@NEWS_DATE", SqlDbType.Date).Value = texthabertarihekle.Text;
                asd.Parameters.Add("@NEWS_LANGUAGE", SqlDbType.VarChar).Value = "EN";
                asd.ExecuteNonQuery();
                lbleklemsg.Visible = true;
                lbleklemsg.Text = "İşlem Başarılı";
            }
            connect.Close();
        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            MultiView1.Visible = false;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            texthabertarihekle.Text = Calendar1.SelectedDate.ToShortDateString();
        }

        //UPDATE SECTION
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label lblHaberID = (Label)GridView1.SelectedRow.FindControl("lblHaberID");
            Label lblHaberBaslik = (Label)GridView1.SelectedRow.FindControl("lblHaberBaslik");
            Label lblHaber = (Label)GridView1.SelectedRow.FindControl("lblHaber");

            texthaberidguncelle.Text = lblHaberID.Text;
            texthaberbaslikguncelle.Text = lblHaberBaslik.Text;
            texthaberguncelle.Text = lblHaber.Text;

            PnlGuncelleme.Visible = true;
            Lblguncellemsg.Visible = false;
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            connect.Open();
            SqlDataAdapter ds = new SqlDataAdapter("update T_NEWS set NEWS_TITLE='" + texthaberbaslikguncelle.Text + "',NEWS_CONTENT='" + texthaberguncelle.Text + "' where ID='" + texthaberidguncelle.Text + "'", connect);
            DataTable dt = new DataTable();
            ds.Fill(dt);
            ds.Dispose();
            Lblguncellemsg.Visible = true;
            Lblguncellemsg.Text = "İşlem Başarılı";
            connect.Close();

            PnlGuncelleme.Visible = false;

            connect.Open();
            string sorgu = "select * from T_NEWS order by NEWS_DATE desc";
            SqlCommand cmd = new SqlCommand(sorgu, connect);
            SqlDataReader dr = cmd.ExecuteReader();
            GridView1.DataSource = dr;
            GridView1.DataBind();
            connect.Close();
        }

        protected void BtnUpdateCancel_Click(object sender, EventArgs e)
        {
            Lblguncellemsg.Visible = true;
            Lblguncellemsg.Text = "Hiçbie İşlem Yapılmadı";
            PnlGuncelleme.Visible = false;
        }

        //DELETE SECTION
        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label lblHaberIDSil = (Label)GridView2.SelectedRow.FindControl("lblHaberIDSil");
            Label lblHaberBaslikSil = (Label)GridView2.SelectedRow.FindControl("lblHaberBaslikSil");
            Label lblHaberSil = (Label)GridView2.SelectedRow.FindControl("lblHaberSil");
            Label lblHaberTarihSil = (Label)GridView2.SelectedRow.FindControl("lblHaberTarihSil");

            texthaberidsil.Text = lblHaberIDSil.Text;
            lblhaberbasliksil.Text = lblHaberBaslikSil.Text;
            lblhabersil.Text = lblHaberSil.Text;
            lblhabertarihsil.Text = lblHaberTarihSil.Text;

            PnlSilme.Visible = true;
            lblmsgsil.Visible = false;
        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            connect.Open();
            DataTable dt = new DataTable();
            SqlDataAdapter komut = new SqlDataAdapter("delete from T_NEWS where ID='" + texthaberidsil.Text + "' ", connect);
            komut.Fill(dt);
            lblmsgsil.Visible = true;
            lblmsgsil.Text = "İşlem Başarılı";
            connect.Close();

            PnlSilme.Visible = false;

            connect.Open();
            string sorgu = "select * from T_NEWS order by NEWS_DATE desc";
            SqlCommand cmd = new SqlCommand(sorgu, connect);
            SqlDataReader dr = cmd.ExecuteReader();
            GridView2.DataSource = dr;
            GridView2.DataBind();
            connect.Close();
        }

        protected void BtnDeleteCancel_Click(object sender, EventArgs e)
        {
            lblmsgsil.Visible = true;
            lblmsgsil.Text = "Hiçbir İşlem Yapılmadı";
            PnlSilme.Visible = false;
        }
    }
}