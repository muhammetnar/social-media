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
    public partial class userarticle_tr : System.Web.UI.Page
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
            Txtdate.Text = DateTime.Now.ToShortDateString();
            getinformations();
            getprofilephoto();
            getnumberoffollowing();
            getnumberoffollowers();
            getarticles();
            getupdatearticle();
            getdeletearticle();
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
        protected void getarticles()
        {
            connect.Open();
            string sorgu = "select * from T_ARTICLE TA,T_USER TU where TA.ARTICLE_USER_ID=TU.ID and TU.ID='" + lblid.Text + "' order by TA.ID desc";
            SqlCommand cmd = new SqlCommand(sorgu, connect);
            SqlDataReader dr = cmd.ExecuteReader();
            lstDuyuru.DataSource = dr;
            lstDuyuru.DataBind();
            connect.Close();
            MultiView1.ActiveViewIndex = 0;
        }
        protected void getupdatearticle()
        {
            connect.Open();
            SqlDataAdapter asd = new SqlDataAdapter("select * from T_ARTICLE where ARTICLE_USER_ID='" + lblid.Text + "' order by ID desc", connect);
            DataTable dt = new DataTable("tb");
            asd.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            connect.Close();

        }
        protected void getdeletearticle()
        {
            connect.Open();
            SqlDataAdapter asd = new SqlDataAdapter("select * from T_ARTICLE where ARTICLE_USER_ID='" + lblid.Text + "' order by ID desc", connect);
            DataTable dt = new DataTable("tb");
            asd.Fill(dt);
            GridView2.DataSource = dt;
            GridView2.DataBind();
            connect.Close();

        }


        //OPEN BUTTONS
        protected void BtnOpenWriteArticle_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            lblmsg.Visible = false;
        }
        protected void BtnOpenEditArticle_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }
        protected void BtnOpenDeleteArticle_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 3;
        }


        //ADD SECTIONS
        protected void BtnAddArticle_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            connect.Open();
            string sorgu = "insert into T_ARTICLE (ARTICLE_TITLE,ARTICLE_CONTENT,ARTICLE_DATE,ARTICLE_USER_ID)values(@ARTICLE_TITLE,@ARTICLE_CONTENT,@ARTICLE_DATE,@ARTICLE_USER_ID) ";
            SqlCommand asd = new SqlCommand(sorgu, connect);
            asd.Parameters.Add("@ARTICLE_TITLE", SqlDbType.VarChar).Value = Txtarticletitle.Text;
            asd.Parameters.Add("@ARTICLE_CONTENT", SqlDbType.VarChar).Value = Txtarticlecontent.Text;
            asd.Parameters.Add("@ARTICLE_DATE", SqlDbType.Date).Value = Txtdate.Text;
            asd.Parameters.Add("@ARTICLE_USER_ID", SqlDbType.Int).Value = lblid.Text;
            asd.ExecuteNonQuery();
            lblmsg.Visible = true;
            lblmsg.Text = "İşlem Başarılı";
            connect.Close(); 
            Txtarticletitle.Text = null;
            Txtarticlecontent.Text = null;
        }
        protected void BtnAddBackArticle_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            lblmsg.Visible = false;
        }


        //UPDATE SECTIONS
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
            Pnlopenupdate.Visible = false;
            Pnlupdate.Visible = true;
            lblmsgupdate.Visible = false;

            Label lblupdatearticleid = (Label)GridView1.SelectedRow.FindControl("lblupdatearticleid");
            Label lblupdatearticletitle = (Label)GridView1.SelectedRow.FindControl("lblupdatearticletitle");
            Label lblupdatearticlecontent = (Label)GridView1.SelectedRow.FindControl("lblupdatearticlecontent");

            Labelupdatearticleid.Text = lblupdatearticleid.Text;
            Labelupdatearticletitle.Text = lblupdatearticletitle.Text;
            Labelupdatearticlecontent.Text = lblupdatearticlecontent.Text;

            Session["UPDATEARTICLETITLE"] = Labelupdatearticletitle.Text;
            Textupdatearticletitle.Text = Session["UPDATEARTICLETITLE"].ToString();

            Session["UPDATEARTICLECONTENT"] = Labelupdatearticlecontent.Text;
            Textupdatearticlecontent.Text = Session["UPDATEARTICLECONTENT"].ToString();
        }
        protected void BtnBackUpdate_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }
        protected void BtnUpdatearticle_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
            connect.Open();
            SqlDataAdapter ds = new SqlDataAdapter("update T_ARTICLE set  ARTICLE_TITLE='" + Textupdatearticletitle.Text + "',ARTICLE_CONTENT='" + Textupdatearticlecontent.Text + "' where ID='" + Labelupdatearticleid.Text + "'", connect);
            DataTable dt = new DataTable();
            ds.Fill(dt);
            ds.Dispose();
            lblmsgupdate.Visible = true;
            lblmsgupdate.Text = "İşlem Başarılı";
            Pnlupdate.Visible = false;
            Pnlopenupdate.Visible = true;
            connect.Close();
            getupdatearticle();
        }
        protected void BtnCancelUpdateArticle_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
            Pnlupdate.Visible = false;
            Pnlopenupdate.Visible = true;
            lblmsgupdate.Visible = true;
            lblmsgupdate.Text = "Hiçbir İşlem Yapılmadı";
        }


        //DELETE SECTIONS
        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 3;
            Pnldelete.Visible = true;
            Pnlopendelete.Visible = false;
            lblmsgdelete.Visible = false;

            Label lbldeletearticleid = (Label)GridView2.SelectedRow.FindControl("lbldeletearticleid");
            Label lbldeletearticletitle = (Label)GridView2.SelectedRow.FindControl("lbldeletearticletitle");
            Label lbldeletearticlecontent = (Label)GridView2.SelectedRow.FindControl("lbldeletearticlecontent");

            Labeldeletearticleid.Text = lbldeletearticleid.Text;
            Textdeletearticletitle.Text = lbldeletearticletitle.Text;
            Textdeletearticlecontent.Text = lbldeletearticlecontent.Text;
        }
        protected void BtnBackDelete_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }
        protected void BtnDeleteArticle_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 3;
            connect.Open();
            DataTable dt = new DataTable();
            SqlDataAdapter komut = new SqlDataAdapter("delete from T_ARTICLE where ID = '" + Labeldeletearticleid.Text + "'", connect);
            komut.Fill(dt);
            lblmsgdelete.Visible = true;
            lblmsgdelete.Text = "İşlem Başarılı";
            Pnldelete.Visible = false;
            Pnlopendelete.Visible = true;
            connect.Close();
            getdeletearticle();
        }
        protected void BtnCancelDeleteArticle_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 3;
            Pnldelete.Visible = false;
            Pnlopendelete.Visible = true;
            lblmsgdelete.Visible = true;
            lblmsgdelete.Text = "Hiçbir İşlem Yapılmadı";
        }
    }
}