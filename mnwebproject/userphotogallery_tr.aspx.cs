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
    public partial class userphotogallery_tr : System.Web.UI.Page
    {
        SqlConnection connect = new SqlConnection("Data Source=desktop-oqk00gg;Initial Catalog=MNWEBDB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kullanici"] != null)
            {
                lblwelcomemsg.Text = ("Hoşgeldin   " + Session["kullanici"]);
            }
            else
            {
                Response.Redirect("userlogin_tr.aspx");
            }

            getinformations();
            getprofilephoto();
            getnumberoffollowing();
            getnumberoffollowers();
            MultiView1.ActiveViewIndex = 0;
            fotogetir();
            Textphotodate.Text = DateTime.Now.ToShortDateString();
        }

        protected void AdminLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("userlogin_tr.aspx");
        }

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
        protected void fotogetir()
        {
            connect.Open();
            SqlDataAdapter asd = new SqlDataAdapter("select * from T_USER_PHOTOGALLERY where USER_ID=" + lblid.Text + " order by ID desc ", connect);
            DataTable dt = new DataTable("tb");
            asd.Fill(dt);
            DataList1.DataSource = dt;
            DataList1.DataBind();
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
            string SQL = "select * from T_USER_PHOTOGALLERY where USER_ID='" + lblid.Text + "' order by ID desc ";
            SqlDataAdapter adp = new SqlDataAdapter(SQL, Con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
            Con.Close();
            Con.Dispose();
        }
        void doldur2()
        {
            // veritabanına bağlanmayı sağlar
            string yol = ("Data Source=desktop-oqk00gg;Initial Catalog=MNWEBDB;Integrated Security=True");
            SqlConnection Con = new SqlConnection(yol);
            //aşağıdaki tümce kapalı durumda olan bağlantıyı açar
            if (Con.State == ConnectionState.Closed)
            {
                Con.Open();
            }
            string SQL = "select * from T_USER_PHOTOGALLERY where USER_ID='" + lblid.Text + "' order by ID desc ";
            SqlDataAdapter adp = new SqlDataAdapter(SQL, Con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            GridView2.DataSource = ds.Tables[0];
            GridView2.DataBind();
            Con.Close();
            Con.Dispose();
        }

        //BACK BUTTON
        protected void BtnBack_Click(object sender, EventArgs e)
        {
            BtnAddOpen.Visible = true;
            BtnUpdateOpen.Visible = true;
            BtnDeleteOpen.Visible = true;
            BtnBack.Visible = false;
            MultiView1.ActiveViewIndex = 0;
        }



        //ADD SECTION
        protected void BtnAddOpen_Click(object sender, EventArgs e)
        {
            BtnAddOpen.Visible = false;
            BtnUpdateOpen.Visible = false;
            BtnDeleteOpen.Visible = false;
            BtnBack.Visible = true;
            MultiView1.ActiveViewIndex = 1;
        }
        protected void Btnadd_Click(object sender, EventArgs e)
        {
            connect.Open();
            string sorgu = "insert into T_USER_PHOTOGALLERY(USER_ID,USER_PHOTO_CONTENT,USER_PHOTO_URL,USER_PHOTO_DATE)values(@USER_ID,@USER_PHOTO_CONTENT,@USER_PHOTO_URL,@USER_PHOTO_DATE)";
            string dosyaadi = Path.GetFileName(FileAddUpload.PostedFile.FileName);
            FileAddUpload.SaveAs(Server.MapPath("userphotogallery/" + dosyaadi));
            SqlCommand asd = new SqlCommand(sorgu, connect);
            asd.Parameters.Add("@USER_ID", SqlDbType.VarChar).Value = lblid.Text;
            asd.Parameters.Add("@USER_PHOTO_CONTENT", SqlDbType.VarChar).Value = Textphotocontent.Text;
            asd.Parameters.Add("@USER_PHOTO_DATE", SqlDbType.Date).Value = Textphotodate.Text;
            asd.Parameters.AddWithValue("@USER_PHOTO_URL", dosyaadi);
            asd.ExecuteNonQuery();
            connect.Close();
            MultiView1.ActiveViewIndex = 0;
            fotogetir();
            BtnAddOpen.Visible = true;
            BtnUpdateOpen.Visible = true;
            BtnDeleteOpen.Visible = true;
            BtnBack.Visible = false;
        }
        protected void Btnaddcancel_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            BtnAddOpen.Visible = true;
            BtnUpdateOpen.Visible = true;
            BtnDeleteOpen.Visible = true;
            BtnBack.Visible = false;
        }



        //UPDATE SECTION
        protected void BtnUpdateOpen_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
            BtnAddOpen.Visible = false;
            BtnUpdateOpen.Visible = false;
            BtnDeleteOpen.Visible = false;
            BtnBack.Visible = true;
            doldur();
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
            Label lblupdateimageid = (Label)GridView1.SelectedRow.FindControl("lblupdateimageid");
            Label lblupdateimageurl = (Label)GridView1.SelectedRow.FindControl("lblupdateimageurl");
            Label lblupdateimagecontent = (Label)GridView1.SelectedRow.FindControl("lblupdateimagecontent");

            lblupdateimgid.Text = lblupdateimageid.Text;
            lblupdateimgurl.Text = lblupdateimageurl.Text;
            TextupdateContent.Text = lblupdateimagecontent.Text;
            PnlUpdate.Visible = true;
            GridView1.Visible = false;
        }
        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            BtnAddOpen.Visible = false;
            BtnUpdateOpen.Visible = false;
            BtnDeleteOpen.Visible = false;
            BtnBack.Visible = true;
            MultiView1.ActiveViewIndex = 2;

            connect.Open();
            string resimadi = Path.GetFileName(lblupdateimgurl.Text);
            FileInfo IlkResimDosyasi = new FileInfo(Server.MapPath("~\\userphotogallery\\") + resimadi);
            IlkResimDosyasi.Delete();

            SqlDataAdapter ds = new SqlDataAdapter("update T_USER_PHOTOGALLERY set  USER_PHOTO_URL='" + FileUpload1.PostedFile.FileName + "' , USER_PHOTO_CONTENT='" + TextupdateContent.Text + "' where ID='" + lblupdateimgid.Text + "'", connect);
            string dosyaadi = Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.SaveAs(Server.MapPath("userphotogallery/" + dosyaadi));
            DataTable dt = new DataTable();
            ds.Fill(dt);
            ds.Dispose();
            connect.Close();

            connect.Open();
            GridView1.Visible = true;
            SqlDataAdapter asdd = new SqlDataAdapter("select * from T_USER_PHOTOGALLERY where USER_ID='" + lblid.Text + "' order by ID desc", connect);
            DataTable dtt = new DataTable("tb");
            asdd.Fill(dtt);
            GridView1.DataSource = dtt;
            GridView1.DataBind();
            connect.Close();
            PnlUpdate.Visible = false;
            GridView1.Visible = true;
        }
        protected void BtnUpdateCancel_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
            BtnAddOpen.Visible = false;
            BtnUpdateOpen.Visible = false;
            BtnDeleteOpen.Visible = false;
            BtnBack.Visible = true;
            PnlUpdate.Visible = false;
            GridView1.Visible = true;
        }



        //DELETE SECTION
        protected void BtnDeleteOpen_Click(object sender, EventArgs e)
        {
            BtnAddOpen.Visible = false;
            BtnUpdateOpen.Visible = false;
            BtnDeleteOpen.Visible = false;
            BtnBack.Visible = true;
            MultiView1.ActiveViewIndex = 3;
            doldur2();

        }
        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            BtnAddOpen.Visible = false;
            BtnUpdateOpen.Visible = false;
            BtnDeleteOpen.Visible = false;
            BtnBack.Visible = true;
            MultiView1.ActiveViewIndex = 3;

            Label lbldeleteimageid = (Label)GridView2.SelectedRow.FindControl("lbldeleteimageid");
            lbldeleteimgid.Text = lbldeleteimageid.Text;
            Label lbldeleteimageurl = (Label)GridView2.SelectedRow.FindControl("lbldeleteimageurl");
            lbldeleteimgurl.Text = lbldeleteimageurl.Text;

            string resimadi = Path.GetFileName(lbldeleteimgurl.Text);
            FileInfo IlkResimDosyasi = new FileInfo(Server.MapPath("~\\userphotogallery\\") + resimadi);
            IlkResimDosyasi.Delete();

            connect.Open();
            DataTable dt = new DataTable();
            SqlDataAdapter komut = new SqlDataAdapter("delete from T_USER_PHOTOGALLERY where ID='" + lbldeleteimgid.Text + "' ", connect);
            komut.Fill(dt);
            connect.Close();

            connect.Open();
            string sorgu = "select * from T_USER_PHOTOGALLERY where USER_ID='" + lblid.Text + "' order by ID desc";
            SqlCommand cmd = new SqlCommand(sorgu, connect);
            SqlDataReader dr = cmd.ExecuteReader();
            GridView2.DataSource = dr;
            GridView2.DataBind();
            connect.Close();
        }
    }
}