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
    public partial class adminslideprocess : System.Web.UI.Page
    {
        SqlConnection connect = new SqlConnection("Data Source=desktop-oqk00gg;Initial Catalog=MNWEBDB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null)
                lblwelcomemsg.Text = ("Hoşgeldin   " + Session["admin"]);
            else
                Response.Redirect("adminlogin.aspx");
        }

        protected void AdminLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("adminlogin.aspx");
        }

        //OPEN SECTION
        protected void BtnOpenSlide_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedIndex == 0)
            {
                MultiView1.Visible = false;
                lblslideislemlerimsg.Visible = true;
                lblslideislemlerimsg.Text = "Lütfen Bir İşlem Seçiniz";

            }
            else if (DropDownList1.SelectedIndex == 1)
            {
                MultiView1.Visible = true;
                MultiView1.ActiveViewIndex = 0;
                lblslideislemlerimsg.Visible = false;
            }
            else if (DropDownList1.SelectedIndex == 2)
            {
                MultiView1.Visible = true;
                MultiView1.ActiveViewIndex = 1;
                connect.Open();
                SqlDataAdapter asd = new SqlDataAdapter("select * from T_SLIDE ", connect);
                DataTable dt = new DataTable("tb");
                asd.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
                connect.Close();
                lblslideislemlerimsg.Visible = false;
            }
            else if (DropDownList1.SelectedIndex == 3)
            {
                MultiView1.Visible = true;
                MultiView1.ActiveViewIndex = 2;
                connect.Open();
                SqlDataAdapter asd = new SqlDataAdapter("select * from T_SLIDE ", connect);
                DataTable dt = new DataTable("tb");
                asd.Fill(dt);
                GridView2.DataSource = dt;
                GridView2.DataBind();
                connect.Close();
                lblslideislemlerimsg.Visible = false;
            }
            else if (DropDownList1.SelectedIndex == 4)
            {
                MultiView1.Visible = true;
                MultiView1.ActiveViewIndex = 3;
                connect.Open();
                SqlDataAdapter asd = new SqlDataAdapter("select * from T_SLIDE ", connect);
                DataTable dt = new DataTable("tb");
                asd.Fill(dt);
                GridView3.DataSource = dt;
                GridView3.DataBind();
                connect.Close();

            }
            else
            {
                lblslideislemlerimsg.Text = "Lütfen Bir Galeri Seçiniz";
            }
        }


        //ADD SECTION
        protected void Slideaddbtn_Click(object sender, EventArgs e)
        {
            connect.Open();
            string sorgu = "insert into T_SLIDE (SLIDE_TITLE_TR,SLIDE_TITLE_EN,SLIDE_CONTENT_TR,SLIDE_CONTENT_EN,SLIDE_SITEURL_TR,SLIDE_SITEURL_EN,SLIDE_URL)values(@SLIDE_TITLE_TR,@SLIDE_TITLE_EN,@SLIDE_CONTENT_TR,@SLIDE_CONTENT_EN,@SLIDE_SITEURL_TR,@SLIDE_SITEURL_EN,@SLIDE_URL)";
            string dosyaadi = Path.GetFileName(slideeklefile.PostedFile.FileName);
            slideeklefile.SaveAs(Server.MapPath("slider/" + dosyaadi));
            SqlCommand asd = new SqlCommand(sorgu, connect);
            asd.Parameters.Add("@SLIDE_TITLE_TR", SqlDbType.VarChar).Value = TextResimAdi.Text;
            asd.Parameters.Add("@SLIDE_TITLE_EN", SqlDbType.VarChar).Value = TextPictureName.Text;
            asd.Parameters.Add("@SLIDE_CONTENT_TR", SqlDbType.VarChar).Value = TextResimAciklama.Text;
            asd.Parameters.Add("@SLIDE_CONTENT_EN", SqlDbType.VarChar).Value = TextExplanation.Text;
            asd.Parameters.Add("@SLIDE_SITEURL_TR", SqlDbType.VarChar).Value = TextResimSiteUrl.Text;
            asd.Parameters.Add("@SLIDE_SITEURL_EN", SqlDbType.VarChar).Value = TextPictureSiteUrl.Text;
            asd.Parameters.AddWithValue("@SLIDE_URL", dosyaadi);
            asd.ExecuteNonQuery();
            lbleklemsg.Visible = true;
            lbleklemsg.Text = "İşlem Başarılı";
            connect.Close();
        }
        protected void Slideraddbtncancel_Click(object sender, EventArgs e)
        {
            MultiView1.Visible = false;
        }


        //UPDATE SECTION
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Pnlguncelle.Visible = true;
            Label lblId = (Label)GridView1.SelectedRow.FindControl("lblId");
            Label lblResim = (Label)GridView1.SelectedRow.FindControl("lblResim");
            Label lblUrl = (Label)GridView1.SelectedRow.FindControl("lblUrl");
            Label lblSiteUrl = (Label)GridView1.SelectedRow.FindControl("lblSiteUrl");
            Label lblAciklama = (Label)GridView1.SelectedRow.FindControl("lblAciklama");
            Label lblPicture = (Label)GridView1.SelectedRow.FindControl("lblPicture");
            Label lblExplanation = (Label)GridView1.SelectedRow.FindControl("lblExplanation");
            Label lblPictureSiteUrl = (Label)GridView1.SelectedRow.FindControl("lblPictureSiteUrl");

            lblresimid.Text = lblId.Text;
            lblresimadi.Text = lblResim.Text;
            lblresimaciklama.Text = lblAciklama.Text;
            lblpicturename.Text = lblPicture.Text;
            lblexplanation.Text = lblExplanation.Text;
            lblresimsiteurl.Text = lblSiteUrl.Text;
            lblresimurl.Text = lblUrl.Text;
            lblpicturesiteurl.Text = lblPictureSiteUrl.Text;

            Session["SLIDEID"] = lblresimid.Text;
            txtresimid.Text = Session["SLIDEID"].ToString();

            Session["SLIDERESIM"] = lblresimadi.Text;
            txtresimadi.Text = Session["SLIDERESIM"].ToString();

            Session["SLIDEACIKLAMA"] = lblresimaciklama.Text;
            txtresimaciklama.Text = Session["SLIDEACIKLAMA"].ToString();

            Session["SLIDESITEURL"] = lblresimsiteurl.Text;
            txtresimsiteurl.Text = Session["SLIDESITEURL"].ToString();

            Session["SLIDEPICTURE"] = lblpicturename.Text;
            txtpicturename.Text = Session["SLIDEPICTURE"].ToString();

            Session["SLIDEEXPLANATION"] = lblexplanation.Text;
            txtexplanation.Text = Session["SLIDEEXPLANATION"].ToString();

            Session["SLIDEPICTURESITEURL"] = lblpicturesiteurl.Text;
            txtpicturesiteurl.Text = Session["SLIDEPICTURESITEURL"].ToString();

            lblmsgguncelle.Visible = false;
        }
        protected void Btnupdate_Click(object sender, EventArgs e)
        {
            connect.Open();
            SqlDataAdapter ds = new SqlDataAdapter("update T_SLIDE set  SLIDE_TITLE_TR='" + txtresimadi.Text + "',SLIDE_URL='" + FileUpload1.PostedFile.FileName + "',SLIDE_CONTENT_TR='" + txtresimaciklama.Text + "',SLIDE_SITEURL_TR='" + txtresimsiteurl.Text + "',SLIDE_TITLE_EN='" + txtpicturename.Text + "',SLIDE_CONTENT_EN='" + txtexplanation.Text + "',SLIDE_SITEURL_EN='" + txtpicturesiteurl.Text + "' where ID='" + txtresimid.Text + "'", connect);
            string dosyaadi = Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.SaveAs(Server.MapPath("slider/" + dosyaadi));
            DataTable dt = new DataTable();
            ds.Fill(dt);
            ds.Dispose();
            //GridView1.DataBind();
            lblmsgguncelle.Visible = true;
            lblmsgguncelle.Text = "İşlem Başarılı";
            connect.Close();
            Pnlguncelle.Visible = false;

            connect.Open();
            SqlDataAdapter asd = new SqlDataAdapter("select * from T_SLIDE ", connect);
            DataTable dta = new DataTable("tb");
            asd.Fill(dta);
            GridView1.DataSource = dta;
            GridView1.DataBind();
            connect.Close();
        }
        protected void Slideupdatecancelbtn_Click(object sender, EventArgs e)
        {
            Pnlguncelle.Visible = false;
            lblmsgguncelle.Visible = true;
            lblmsgguncelle.Text = "Hiçbir İşlem Yapılmadı";
        }


        //DELETE SECTION
        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            PnlResimSil.Visible = true;

            Label lblSilId = (Label)GridView2.SelectedRow.FindControl("lblSilId");
            Label lblSilResim = (Label)GridView2.SelectedRow.FindControl("lblSilResim");
            Label lblSilUrl = (Label)GridView2.SelectedRow.FindControl("lblSilUrl");
            Label lblSilSiteUrl = (Label)GridView2.SelectedRow.FindControl("lblSilSiteUrl");
            Label lblSilAciklama = (Label)GridView2.SelectedRow.FindControl("lblSilAciklama");
            Label lblDeletePictureName = (Label)GridView2.SelectedRow.FindControl("lblDeletePictureName");
            Label lblDeleteExplanation = (Label)GridView2.SelectedRow.FindControl("lblDeleteExplanation");
            Label lblDeleteSiteUrl = (Label)GridView2.SelectedRow.FindControl("lblDeleteSiteUrl");

            lblresimsilid.Text = lblSilId.Text;
            lblresimsiladi.Text = lblSilResim.Text;
            lblresimsilaciklama.Text = lblSilAciklama.Text;
            lblresimsilsiteurl.Text = lblSilSiteUrl.Text;
            lblresimsilurl.Text = lblSilUrl.Text;
            lblpicturedeletename.Text = lblDeletePictureName.Text;
            lblpicturedeleteexplanation.Text = lblDeleteExplanation.Text;
            lblpicturedeletesiteurl.Text = lblDeleteSiteUrl.Text;

            Session["SLIDESILID"] = lblresimsilid.Text;
            txtresimsilid.Text = Session["SLIDESILID"].ToString();

            lblmsgsil.Visible = false;
        }
        protected void Btndeleteimage_Click(object sender, EventArgs e)
        {
            connect.Open();
            SqlDataAdapter ds = new SqlDataAdapter("delete from T_SLIDE where  ID=" + txtresimsilid.Text + "", connect);
            File.Delete(Server.MapPath("~/slider/" + lblresimsilurl.Text));
            DataTable dt = new DataTable();
            ds.Fill(dt);
            ds.Dispose();
            //GridView2.DataBind();
            lblmsgsil.Visible = true;
            lblmsgsil.Text = "İşlem Başarılı";
            connect.Close();
            PnlResimSil.Visible = false;

            connect.Open();
            SqlDataAdapter asd = new SqlDataAdapter("select * from T_SLIDE ", connect);
            DataTable dta = new DataTable("tb");
            asd.Fill(dta);
            GridView2.DataSource = dta;
            GridView2.DataBind();
            connect.Close();
        }
        protected void Btndeleteimagecancel_Click(object sender, EventArgs e)
        {
            PnlResimSil.Visible = false;
            lblmsgsil.Visible = true;
            lblmsgsil.Text = "Hiçbir İşlem Yapılmadı";
        }
    }
}