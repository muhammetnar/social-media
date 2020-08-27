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
    public partial class adminphotocategoryprocess : System.Web.UI.Page
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

        protected void getupdatecattitle()
        {
            GridView1.Visible = true;
            lblopenmsg.Visible = false;
            SqlDataAdapter asd = new SqlDataAdapter("select * from T_PHOTOGALLERY_CATEGORY  order by ID desc", connect);
            DataTable dt = new DataTable("tb");
            asd.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        protected void getdeletecattitle()
        {
            GridView2.Visible = true;
            lblopenmsg.Visible = false;
            SqlDataAdapter asd = new SqlDataAdapter("select * from T_PHOTOGALLERY_CATEGORY  order by ID desc", connect);
            DataTable dt = new DataTable("tb");
            asd.Fill(dt);
            GridView2.DataSource = dt;
            GridView2.DataBind();
        }
        protected void getlistcattitle()
        {
            GridView3.Visible = true;
            lblopenmsg.Visible = false;
            SqlDataAdapter asd = new SqlDataAdapter("select * from T_PHOTOGALLERY_CATEGORY  order by ID desc", connect);
            DataTable dt = new DataTable("tb");
            asd.Fill(dt);
            GridView3.DataSource = dt;
            GridView3.DataBind();
        }

        //OPEN BUTTON
        protected void BtnOpen_Click(object sender, EventArgs e)
        {
            MultiView1.Visible = true;
            if (DropProcess.SelectedIndex == 0)
            {
                lblopenmsg.Visible = true;
                lblopenmsg.Text = "Lütfen Bir işlem Seçiniz...";
            }
            else if (DropProcess.SelectedIndex == 1)
            {
                lblopenmsg.Visible = false;
                MultiView1.ActiveViewIndex = 0;
            }
            else if (DropProcess.SelectedIndex == 2)
            {
                lblopenmsg.Visible = false;
                MultiView1.ActiveViewIndex = 1;
                getupdatecattitle();
            }
            else if (DropProcess.SelectedIndex == 3)
            {
                lblopenmsg.Visible = false;
                MultiView1.ActiveViewIndex = 2;
                getdeletecattitle();
            }
            else if (DropProcess.SelectedIndex == 4)
            {
                lblopenmsg.Visible = false;
                MultiView1.ActiveViewIndex = 3;
                getlistcattitle();
            }
            else
            {
                lblopenmsg.Text = "Bir Hata Oluştu...";
            }
        }


        //ADD SECTION
        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            connect.Open();
            string sorgu = "insert into T_PHOTOGALLERY_CATEGORY (CATEGORY_TITLE,CAT_PHOTO_URL,CAT_PHOTO_LANGUAGE)values(@CATEGORY_TITLE,@CAT_PHOTO_URL,@CAT_PHOTO_LANGUAGE)";
            string dosyaadi = Path.GetFileName(fotoaddfile.PostedFile.FileName);
            fotoaddfile.SaveAs(Server.MapPath("photocatgallery/" + dosyaadi));
            SqlCommand asd = new SqlCommand(sorgu, connect);
            asd.Parameters.Add("@CATEGORY_TITLE", SqlDbType.VarChar).Value = TextCatName.Text;
            asd.Parameters.AddWithValue("@CAT_PHOTO_URL", dosyaadi);
            if (DropAddLanguage.SelectedIndex == 1)
            {
                asd.Parameters.Add("@CAT_PHOTO_LANGUAGE", SqlDbType.VarChar).Value = "TR";
            }
            else if (DropAddLanguage.SelectedIndex == 2)
            {
                asd.Parameters.Add("@CAT_PHOTO_LANGUAGE", SqlDbType.VarChar).Value = "EN";
            }
            else
            {
                lbladdmsg.Text = "Lütfen Bir Dil Seçiniz...";
            }
            asd.ExecuteNonQuery();
            lbladdmsg.Text = "İşlem Başarılı";
            connect.Close();
        }
        protected void BtnAddCancel_Click(object sender, EventArgs e)
        {
            MultiView1.Visible = false;
        }


        //UPDATE SECTION
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblopenmsg.Visible = false;
            Label lblupdatecatid = (Label)GridView1.SelectedRow.FindControl("lblupdatecatid");
            Label lblupdatecattitle = (Label)GridView1.SelectedRow.FindControl("lblupdatecattitle");
            Label lblupdatecaturl = (Label)GridView1.SelectedRow.FindControl("lblupdatecaturl");
            Label lblupdatecatlanguage = (Label)GridView1.SelectedRow.FindControl("lblupdatecatlanguage");

            Textupdatecatid.Text = lblupdatecatid.Text;
            Textupdatecattitle.Text = lblupdatecattitle.Text;
            textupdatecaturl.Text = lblupdatecaturl.Text;
            Textupdatecatlanguage.Text = lblupdatecatlanguage.Text;
            PnlUpdate.Visible = true;
            lblupdatemsg.Visible = false;
        }
        protected void BtnUpdate_Click(object sender, EventArgs e)
        {

            connect.Open();
            if (DropUpdateLanguage.SelectedIndex == 1)
            {
                string resimadi = Path.GetFileName(textupdatecaturl.Text);
                FileInfo IlkResimDosyasi = new FileInfo(Server.MapPath("~\\photocatgallery\\") + resimadi);
                IlkResimDosyasi.Delete();

                SqlDataAdapter ds = new SqlDataAdapter("update T_PHOTOGALLERY_CATEGORY set  CATEGORY_TITLE='" + Textupdatecattitle.Text + "',CAT_PHOTO_URL='" + FileUpload1.PostedFile.FileName + "',CAT_PHOTO_LANGUAGE='TR' where ID='" + Textupdatecatid.Text + "'", connect);
                string dosyaadi = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("photocatgallery/" + dosyaadi));
                DataTable dt = new DataTable();
                ds.Fill(dt);
                ds.Dispose();
                lblupdatemsg.Visible = true;
                lblupdatemsg.Text = "İşlem Başarılı";
            }
            else if (DropUpdateLanguage.SelectedIndex == 2)
            {
                string resimadi = Path.GetFileName(textupdatecaturl.Text);
                FileInfo IlkResimDosyasi = new FileInfo(Server.MapPath("~\\photocatgallery\\") + resimadi);
                IlkResimDosyasi.Delete();

                SqlDataAdapter ds = new SqlDataAdapter("update T_PHOTOGALLERY_CATEGORY set  CATEGORY_TITLE='" + Textupdatecattitle.Text + "',CAT_PHOTO_URL='" + FileUpload1.PostedFile.FileName + "',CAT_PHOTO_LANGUAGE='EN' where ID='" + Textupdatecatid.Text + "'", connect);
                string dosyaadi = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("photocatgallery/" + dosyaadi));
                DataTable dt = new DataTable();
                ds.Fill(dt);
                ds.Dispose();
                lblupdatemsg.Visible = true;
                lblupdatemsg.Text = "İşlem Başarılı";
            }
            else
            {
                string resimadi = Path.GetFileName(textupdatecaturl.Text);
                FileInfo IlkResimDosyasi = new FileInfo(Server.MapPath("~\\photocatgallery\\") + resimadi);
                IlkResimDosyasi.Delete();

                SqlDataAdapter ds = new SqlDataAdapter("update T_PHOTOGALLERY_CATEGORY set  CATEGORY_TITLE='" + Textupdatecattitle.Text + "',CAT_PHOTO_URL='" + FileUpload1.PostedFile.FileName + "',CAT_PHOTO_LANGUAGE='" + Textupdatecatlanguage.Text + "' where ID='" + Textupdatecatid.Text + "'", connect);
                string dosyaadi = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("photocatgallery/" + dosyaadi));
                DataTable dt = new DataTable();
                ds.Fill(dt);
                ds.Dispose();
                lblupdatemsg.Visible = true;
                lblupdatemsg.Text = "İşlem Başarılı";
            }
            connect.Close();

                  GridView1.Visible = true;
                  lblopenmsg.Visible = false;
                  getupdatecattitle();
            PnlUpdate.Visible = false;
        }
        protected void BtnUpdateCancel_Click(object sender, EventArgs e)
        {
            lblopenmsg.Visible = true;
            lblopenmsg.Text = "Hiç bir işlem yapılmadı..";
            PnlUpdate.Visible = false;
        }


        //DELETE SECTION
        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblopenmsg.Visible = false;
            Label lbldeletecatid = (Label)GridView2.SelectedRow.FindControl("lbldeletecatid");
            Label lbldeletecattitle = (Label)GridView2.SelectedRow.FindControl("lbldeletecattitle");
       
            Textdeletecatid.Text = lbldeletecatid.Text;
            Textdeletecattitle.Text = lbldeletecattitle.Text;

            PnlDelete.Visible = true;
            lbldeletemsg.Visible = false;
        }
        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            connect.Open();
            DataTable dt = new DataTable();
            SqlDataAdapter komut = new SqlDataAdapter("delete from T_PHOTOGALLERY_CATEGORY where ID='" + Textdeletecatid.Text + "' ", connect);
            komut.Fill(dt);

            DataTable dt2 = new DataTable();
            SqlDataAdapter komut2 = new SqlDataAdapter("delete from T_PHOTOGALLERY where PCAT_ID='" + Textdeletecatid.Text + "' ", connect);
            komut2.Fill(dt2);

            lbldeletemsg.Visible = true;
            lbldeletemsg.Text = "İşlem Başarılı";

            connect.Close();

            GridView2.Visible = true;
            lblopenmsg.Visible = false;
            getdeletecattitle();
         
            PnlDelete.Visible = false;
        }
        protected void BtnDeleteCancel_Click(object sender, EventArgs e)
        {
            lblopenmsg.Visible = true;
            lblopenmsg.Text = "Hiç bir işlem yapılmadı..";
            PnlDelete.Visible = false;
        }
    }
}