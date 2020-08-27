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
using System.Configuration;

namespace mnwebproject
{
    public partial class adminphotogalleryprocess : System.Web.UI.Page
    {
        SqlConnection connect = new SqlConnection("Data Source=desktop-oqk00gg;Initial Catalog=MNWEBDB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null)
                lblwelcomemsg.Text = ("Hoşgeldin   " + Session["admin"]);
            else
                Response.Redirect("adminlogin.aspx");

            if (!this.IsPostBack)
            {
                phototitle();
                getdropphotoupdate();
                getdropphotodelete();
                getdropphotolist();
            }
        }

        protected void AdminLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("adminlogin.aspx");
        }
        protected void phototitle()
        {
            connect.Open();
            string sql = "select * from T_PHOTOGALLERY_CATEGORY order by CATEGORY_TITLE";
            SqlDataAdapter adap = new SqlDataAdapter(sql, connect);
            DataTable dtKurum = new DataTable();
            adap.Fill(dtKurum);

            DropAdd.Items.Add(new ListItem("Seçiniz!", "0"));

            foreach (DataRow dr in dtKurum.Rows)
            {
                DropAdd.Items.Add(new ListItem(dr["CATEGORY_TITLE"].ToString(), dr["ID"].ToString()));
            }
            connect.Close();
        }
        protected void getdropphotoupdate()
        {
            connect.Open();
            string sql = "select * from T_PHOTOGALLERY_CATEGORY order by CATEGORY_TITLE";
            SqlDataAdapter adap = new SqlDataAdapter(sql, connect);
            DataTable dtKurum = new DataTable();
            adap.Fill(dtKurum);

            DropUpdateOpen.Items.Add(new ListItem("Seçiniz!", "0"));

            foreach (DataRow dr in dtKurum.Rows)
            {
                DropUpdateOpen.Items.Add(new ListItem(dr["CATEGORY_TITLE"].ToString(), dr["ID"].ToString()));
            }
            connect.Close();
        }
        protected void getdropphotodelete()
        {
            connect.Open();
            string sql = "select * from T_PHOTOGALLERY_CATEGORY order by CATEGORY_TITLE";
            SqlDataAdapter adap = new SqlDataAdapter(sql, connect);
            DataTable dtKurum = new DataTable();
            adap.Fill(dtKurum);

            DropDeleteOpen.Items.Add(new ListItem("Seçiniz!", "0"));

            foreach (DataRow dr in dtKurum.Rows)
            {
                DropDeleteOpen.Items.Add(new ListItem(dr["CATEGORY_TITLE"].ToString(), dr["ID"].ToString()));
            }
            connect.Close();
        }
        protected void getdropphotolist()
        {
            connect.Open();
            string sql = "select * from T_PHOTOGALLERY_CATEGORY order by CATEGORY_TITLE";
            SqlDataAdapter adap = new SqlDataAdapter(sql, connect);
            DataTable dtKurum = new DataTable();
            adap.Fill(dtKurum);

            DropListOpen.Items.Add(new ListItem("Seçiniz!", "0"));

            foreach (DataRow dr in dtKurum.Rows)
            {
                DropListOpen.Items.Add(new ListItem(dr["CATEGORY_TITLE"].ToString(), dr["ID"].ToString()));
            }
            connect.Close();
        }
        protected void findid()
        {
            connect.Open();
            SqlDataAdapter asd = new SqlDataAdapter("select * from T_PHOTOGALLERY_CATEGORY where CATEGORY_TITLE='" + lblphotoid.Text + "'", connect);
            DataTable dt = new DataTable("tb");
            asd.Fill(dt);

            textphotoid.Text = dt.Rows[0]["ID"].ToString();

            connect.Close();
        }

        protected void DropAdd_SelectedIndexChanged(object sender, EventArgs e)
        {
            string kurumID = DropAdd.SelectedValue.ToString();
            
            connect.Open();
            SqlDataAdapter dsa = new SqlDataAdapter("select CATEGORY_TITLE from T_PHOTOGALLERY_CATEGORY where ID='" + kurumID + "'", connect);
            DataTable dt = new DataTable("td");
            dsa.Fill(dt);
            connect.Close();

            if (dt != null && dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                if (dr["CATEGORY_TITLE"] != DBNull.Value)
                    lblphotoid.Text = dr["CATEGORY_TITLE"].ToString();
            }
            findid();
        }
        protected void DropUpdateOpen_SelectedIndexChanged(object sender, EventArgs e)
        {
            string kurumID = DropUpdateOpen.SelectedValue.ToString();

            connect.Open();
            SqlDataAdapter dsa = new SqlDataAdapter("select CATEGORY_TITLE from T_PHOTOGALLERY_CATEGORY where ID='" + kurumID + "'", connect);
            DataTable dt = new DataTable("td");
            dsa.Fill(dt);
            connect.Close();

            if (dt != null && dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                if (dr["CATEGORY_TITLE"] != DBNull.Value)
                    lblphotoid.Text = dr["CATEGORY_TITLE"].ToString();
            }
            findid();
        }
        protected void DropDeleteOpen_SelectedIndexChanged(object sender, EventArgs e)
        {
            string kurumID = DropDeleteOpen.SelectedValue.ToString();

            connect.Open();
            SqlDataAdapter dsa = new SqlDataAdapter("select CATEGORY_TITLE from T_PHOTOGALLERY_CATEGORY where ID='" + kurumID + "'", connect);
            DataTable dt = new DataTable("td");
            dsa.Fill(dt);
            connect.Close();

            if (dt != null && dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                if (dr["CATEGORY_TITLE"] != DBNull.Value)
                    lblphotoid.Text = dr["CATEGORY_TITLE"].ToString();
            }
            findid();
        }
        protected void DropListOpen_SelectedIndexChanged(object sender, EventArgs e)
        {
            string kurumID = DropListOpen.SelectedValue.ToString();

            connect.Open();
            SqlDataAdapter dsa = new SqlDataAdapter("select CATEGORY_TITLE from T_PHOTOGALLERY_CATEGORY where ID='" + kurumID + "'", connect);
            DataTable dt = new DataTable("td");
            dsa.Fill(dt);
            connect.Close();

            if (dt != null && dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                if (dr["CATEGORY_TITLE"] != DBNull.Value)
                    lblphotoid.Text = dr["CATEGORY_TITLE"].ToString();
            }
            findid();
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
            }
            else if (DropProcess.SelectedIndex == 3)
            {
                lblopenmsg.Visible = false;
                MultiView1.ActiveViewIndex = 2;
            }
            else if (DropProcess.SelectedIndex == 4)
            {
                lblopenmsg.Visible = false;
                MultiView1.ActiveViewIndex = 3;
            }
            else
            {
                lblopenmsg.Visible = true;
                lblopenmsg.Text = "Bir Hata Oluştu...";
            }
        }


        //ADD SECTION
        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            connect.Open();
            string sorgu = "insert into T_PHOTOGALLERY(PCAT_ID,PHOTO_TITLE,PHOTO_CONTENT,PHOTO_URL)values(@PCAT_ID,@PHOTO_TITLE,@PHOTO_CONTENT,@PHOTO_URL)";
            string dosyaadi = Path.GetFileName(fotoeklefile.PostedFile.FileName);
            fotoeklefile.SaveAs(Server.MapPath("photogallery/" + dosyaadi));
            SqlCommand asd = new SqlCommand(sorgu, connect);
            asd.Parameters.Add("@PCAT_ID", SqlDbType.VarChar).Value = textphotoid.Text;
            asd.Parameters.Add("@PHOTO_TITLE", SqlDbType.VarChar).Value = Textphototitle.Text;
            asd.Parameters.Add("@PHOTO_CONTENT", SqlDbType.VarChar).Value = TextphotoContent.Text;
            asd.Parameters.AddWithValue("@PHOTO_URL", dosyaadi);
            asd.ExecuteNonQuery();
            lbladdmsg.Text = "İşlem Başarılı";
            connect.Close();
        }
        protected void BtnAddCancel_Click(object sender, EventArgs e)
        {
            MultiView1.Visible = false;
        }


        //UPDATE SECTION
        protected void BtnUpdateOpen_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
            if (DropUpdateOpen.SelectedIndex == 0 )
            {
                lblupdateopenmsg.Visible = true;
                lblupdateopenmsg.Text = "Lütfen Bir galeri Seçiniz...";
                GridView1.Visible = false;
            }
            else
            {
                GridView1.Visible = true;
                lblupdateopenmsg.Visible = false;
                SqlDataAdapter asd = new SqlDataAdapter("select P.ID,P.PHOTO_TITLE,P.PHOTO_CONTENT,P.PHOTO_URL from T_PHOTOGALLERY P,T_PHOTOGALLERY_CATEGORY PC where PC.ID=P.PCAT_ID and  P.PCAT_ID='" + textphotoid.Text + "' order by P.ID desc", connect);
                DataTable dt = new DataTable("tb");
                asd.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblupdateopenmsg.Visible = false;
            Label lblupdatephotoid = (Label)GridView1.SelectedRow.FindControl("lblupdatephotoid");
            Label lblupdatephototitle = (Label)GridView1.SelectedRow.FindControl("lblupdatephototitle");
            Label lblupdatephotocontent = (Label)GridView1.SelectedRow.FindControl("lblupdatephotocontent");
            Label lblupdatephotourl = (Label)GridView1.SelectedRow.FindControl("lblupdatephotourl");

            Textupdatephotoid.Text = lblupdatephotoid.Text;
            Textupdatephototitle.Text = lblupdatephototitle.Text;
            Textupdatephotocontent.Text = lblupdatephotocontent.Text;
            textupdateurl.Text = lblupdatephotourl.Text;
            PnlUpdate.Visible = true;
        }
        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            lblupdateopenmsg.Visible = false;
            connect.Open();
              string resimadi = Path.GetFileName(textupdateurl.Text);
              FileInfo IlkResimDosyasi = new FileInfo(Server.MapPath("~\\photogallery\\") + resimadi);
              IlkResimDosyasi.Delete();

              SqlDataAdapter ds = new SqlDataAdapter("update T_PHOTOGALLERY set  PHOTO_TITLE='" + Textupdatephototitle.Text + "',PHOTO_URL='" + FileUpload1.PostedFile.FileName + "',PHOTO_CONTENT='" + Textupdatephotocontent.Text + "' where ID='" + Textupdatephotoid.Text + "'", connect);
              string dosyaadi = Path.GetFileName(FileUpload1.PostedFile.FileName);
              FileUpload1.SaveAs(Server.MapPath("photogallery/" + dosyaadi));
              DataTable dt = new DataTable();
              ds.Fill(dt);
              ds.Dispose();
              lblupdatemsg.Visible = true;
              lblupdatemsg.Text = "İşlem Başarılı";
            connect.Close();

            connect.Open();
                 GridView1.Visible = true;
                 lblupdateopenmsg.Visible = false;
                 SqlDataAdapter asdd = new SqlDataAdapter("select P.ID,P.PHOTO_TITLE,P.PHOTO_CONTENT,P.PHOTO_URL from T_PHOTOGALLERY P,T_PHOTOGALLERY_CATEGORY PC where PC.ID=P.PCAT_ID and  P.PCAT_ID='" + textphotoid.Text + "' order by P.ID desc", connect);
                  DataTable dtt = new DataTable("tb");
                  asdd.Fill(dtt);
                  GridView1.DataSource = dtt;
                  GridView1.DataBind();
            connect.Close();
            PnlUpdate.Visible = false;
        }
        protected void BtnUpdateCancel_Click(object sender, EventArgs e)
        {
            lblupdateopenmsg.Visible = true;
            lblupdateopenmsg.Text = "Hiç bir işlem yapılmadı..";
            PnlUpdate.Visible = false;
        }


        //DELETE SECTION
        protected void BtnDeleteOpen_Click(object sender, EventArgs e)
        {
            GridView2.Visible = true;
            if (DropDeleteOpen.SelectedIndex == 0)
            {
                lbldeleteopenmsg.Visible = true;
                lbldeleteopenmsg.Text = "Lütfen Bir galeri Seçiniz...";
                GridView2.Visible = false;
            }
            else
            {
                GridView2.Visible = true;
                lbldeleteopenmsg.Visible = false;
                SqlDataAdapter asd = new SqlDataAdapter("select P.ID,P.PHOTO_TITLE,P.PHOTO_CONTENT,P.PHOTO_URL from T_PHOTOGALLERY P,T_PHOTOGALLERY_CATEGORY PC where PC.ID=P.PCAT_ID and  P.PCAT_ID='" + textphotoid.Text + "' order by P.ID desc", connect);
                DataTable dt = new DataTable("tb");
                asd.Fill(dt);
                GridView2.DataSource = dt;
                GridView2.DataBind();
            }
        }
        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            lbldeleteopenmsg.Visible = false;
            Label lbldeletephotoid = (Label)GridView2.SelectedRow.FindControl("lbldeletephotoid");
            Label lbldeletephototitle = (Label)GridView2.SelectedRow.FindControl("lbldeletephototitle");
            Label lbldeletephotocontent = (Label)GridView2.SelectedRow.FindControl("lbldeletephotocontent");

            Textdeletephotoid.Text = lbldeletephotoid.Text;
            Textdeletephototitle.Text = lbldeletephototitle.Text;
            Textdeletephotocontent.Text = lbldeletephotocontent.Text;

            PnlDelete.Visible = true;
        }
        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            connect.Open();
                  DataTable dt = new DataTable();
                  SqlDataAdapter komut = new SqlDataAdapter("delete from T_PHOTOGALLERY where ID='" + Textdeletephotoid.Text + "' ", connect);
                  komut.Fill(dt);
                  lbldeletemsg.Visible = true;
                  lbldeletemsg.Text = "İşlem Başarılı";
            connect.Close();

            connect.Open();
                  string sorgu = "select P.ID,P.PHOTO_TITLE,P.PHOTO_CONTENT,P.PHOTO_URL from T_PHOTOGALLERY P,T_PHOTOGALLERY_CATEGORY PC where PC.ID=P.PCAT_ID and  P.PCAT_ID='" + textphotoid.Text + "' order by P.ID desc";
                  SqlCommand cmd = new SqlCommand(sorgu, connect);
                  SqlDataReader dr = cmd.ExecuteReader();
                  GridView2.DataSource = dr;
                  GridView2.DataBind();
            connect.Close();
            PnlDelete.Visible = false;
        }
        protected void BtnDeleteCancel_Click(object sender, EventArgs e)
        {
            lbldeleteopenmsg.Visible = true;
            lbldeleteopenmsg.Text= "Hiç bir işlem yapılmadı..";
            PnlDelete.Visible = false;
        }


        //LIST SECTION
        protected void BtnListOpen_Click(object sender, EventArgs e)
        {
            GridView3.Visible = true;
            if (DropListOpen.SelectedIndex == 0)
            {
                //lblupdateopenmsg.Visible = true;
                //lblupdateopenmsg.Text = "Lütfen Bir galeri Seçiniz...";
                //GridView3.Visible = false;
                GridView3.Visible = true;
                lblupdateopenmsg.Visible = false;
                SqlDataAdapter asd = new SqlDataAdapter("select P.ID,PC.CATEGORY_TITLE,P.PHOTO_TITLE,P.PHOTO_CONTENT,P.PHOTO_URL from T_PHOTOGALLERY P,T_PHOTOGALLERY_CATEGORY PC where PC.ID=P.PCAT_ID  order by P.ID desc", connect);
                DataTable dt = new DataTable("tb");
                asd.Fill(dt);
                GridView3.DataSource = dt;
                GridView3.DataBind();
            }
            else
            {
                GridView3.Visible = true;
                lblupdateopenmsg.Visible = false;
                SqlDataAdapter asd = new SqlDataAdapter("select P.ID,PC.CATEGORY_TITLE,P.PHOTO_TITLE,P.PHOTO_CONTENT,P.PHOTO_URL from T_PHOTOGALLERY P,T_PHOTOGALLERY_CATEGORY PC where PC.ID=P.PCAT_ID and  P.PCAT_ID='" + textphotoid.Text + "' order by P.ID desc", connect);
                DataTable dt = new DataTable("tb");
                asd.Fill(dt);
                GridView3.DataSource = dt;
                GridView3.DataBind();
            }
        }
    }
}