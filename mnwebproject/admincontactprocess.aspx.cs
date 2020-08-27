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
    public partial class admincontactprocess : System.Web.UI.Page
    {
        SqlConnection connect = new SqlConnection("Data Source=desktop-oqk00gg;Initial Catalog=MNWEBDB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null)
                lblwelcomemsg.Text = ("Hoşgeldin   " + Session["admin"]);
            else
                Response.Redirect("adminlogin.aspx");

            getcontactinfo();
        }

        protected void AdminLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("adminlogin.aspx");
        }

        protected void getcontactinfo()
        {
            connect.Open();
            string sorgu = "select * from T_CONTACT order by ID desc";
            SqlCommand cmd = new SqlCommand(sorgu, connect);
            SqlDataReader dr = cmd.ExecuteReader();
            GridView1.DataSource = dr;
            GridView1.DataBind();
            connect.Close();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label lblIletisimID = (Label)GridView1.SelectedRow.FindControl("lblIletisimID");
            Label lblAdi = (Label)GridView1.SelectedRow.FindControl("lblAdi");
            Label lblSoyadi = (Label)GridView1.SelectedRow.FindControl("lblSoyadi");
            Label lblEmail = (Label)GridView1.SelectedRow.FindControl("lblEmail");
            Label lblMesaj = (Label)GridView1.SelectedRow.FindControl("lblMesaj");

            textiletisimid.Text = lblIletisimID.Text;
            lbladi.Text = lblAdi.Text;
            lblsoyadi.Text = lblSoyadi.Text;
            lblemail.Text = lblEmail.Text;
            txtmesaj.Text = lblMesaj.Text;

            PnlSil.Visible = true;
            lblmsg.Visible = false;
        }

        protected void Btndelete_Click(object sender, EventArgs e)
        {
            connect.Open();
            DataTable dt = new DataTable();
            SqlDataAdapter komut = new SqlDataAdapter("delete from T_CONTACT where ID = '" + textiletisimid.Text + "' ", connect);
            komut.Fill(dt);
            lblmsg.Visible = true;
            lblmsg.Text = "İşlem Başarılı";
            connect.Close();
            PnlSil.Visible = false;
            getcontactinfo();
        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            PnlSil.Visible = false;
            lblmsg.Visible = true;
            lblmsg.Text = "Hiçbir İşlem Yapılmadı";
        }
    }
}