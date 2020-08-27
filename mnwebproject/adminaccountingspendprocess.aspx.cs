using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using System.IO;

namespace mnwebproject
{
    public partial class adminaccountingspendprocess : System.Web.UI.Page
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
                AddCattitle();
                UpdateCattitle();
                DeleteCattitle();
                ListCattitle();
            }
            if (!this.IsPostBack)
            {
                AddSubCattitle();
                UpdateSubCattitle();
                DeleteSubCattitle();
                ListSubCattitle();
            }
        }

        protected void AdminLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("adminlogin.aspx");
        }

        protected void BtnOpen_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedIndex == 0)
            {
                lblopenmsg.Visible = true;
                lblopenmsg.Text = "Lütfen Bir İşlem Seçiniz!";
            }
            else if (DropDownList1.SelectedIndex == 1)
            {
                lblopenmsg.Visible = false;
                MultiView1.ActiveViewIndex = 0;
            }
            else if (DropDownList1.SelectedIndex == 2)
            {
                lblopenmsg.Visible = false;
                MultiView1.ActiveViewIndex = 1;
            }
            else if (DropDownList1.SelectedIndex == 3)
            {
                lblopenmsg.Visible = false;
                MultiView1.ActiveViewIndex = 2;
            }
            else if (DropDownList1.SelectedIndex == 4)
            {
                lblopenmsg.Visible = false;
                MultiView1.ActiveViewIndex = 3;
            }
            else
            {
                lblopenmsg.Visible = true;
                lblopenmsg.Text = "Lütfen Bir İşlem Seçiniz!";
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            TextSpendDate.Text = Calendar1.SelectedDate.ToShortDateString();
        }

        //FUNCTIONS SECTIONS
        protected void AddCattitle()
        {
            connect.Open();
            string sql = "select * from T_ACCOUNTING_CATEGORY order by ACCO_CAT_TITLE";
            SqlDataAdapter adap = new SqlDataAdapter(sql, connect);
            DataTable dtCategory = new DataTable();
            adap.Fill(dtCategory);

            DropAddCatTitle.Items.Add(new ListItem("Seçiniz!", "0"));

            foreach (DataRow dr in dtCategory.Rows)
            {
                DropAddCatTitle.Items.Add(new ListItem(dr["ACCO_CAT_TITLE"].ToString(), dr["ID"].ToString()));
            }
            connect.Close();
        }
        protected void UpdateCattitle()
        {
            connect.Open();
            string sql = "select * from T_ACCOUNTING_CATEGORY order by ACCO_CAT_TITLE";
            SqlDataAdapter adap = new SqlDataAdapter(sql, connect);
            DataTable dtCategory = new DataTable();
            adap.Fill(dtCategory);

            DropUpdateCatTitle.Items.Add(new ListItem("Seçiniz!", "0"));

            foreach (DataRow dr in dtCategory.Rows)
            {
                DropUpdateCatTitle.Items.Add(new ListItem(dr["ACCO_CAT_TITLE"].ToString(), dr["ID"].ToString()));
            }
            connect.Close();
        }
        protected void DeleteCattitle()
        {
            connect.Open();
            string sql = "select * from T_ACCOUNTING_CATEGORY order by ACCO_CAT_TITLE";
            SqlDataAdapter adap = new SqlDataAdapter(sql, connect);
            DataTable dtCategory = new DataTable();
            adap.Fill(dtCategory);

            DropDeleteCatTitle.Items.Add(new ListItem("Seçiniz!", "0"));

            foreach (DataRow dr in dtCategory.Rows)
            {
                DropDeleteCatTitle.Items.Add(new ListItem(dr["ACCO_CAT_TITLE"].ToString(), dr["ID"].ToString()));
            }
            connect.Close();
        }
        protected void ListCattitle()
        {
            connect.Open();
            string sql = "select * from T_ACCOUNTING_CATEGORY order by ACCO_CAT_TITLE";
            SqlDataAdapter adap = new SqlDataAdapter(sql, connect);
            DataTable dtCategory = new DataTable();
            adap.Fill(dtCategory);

            DropListCatTitle.Items.Add(new ListItem("Seçiniz!", "0"));

            foreach (DataRow dr in dtCategory.Rows)
            {
                DropListCatTitle.Items.Add(new ListItem(dr["ACCO_CAT_TITLE"].ToString(), dr["ID"].ToString()));
            }
            connect.Close();
        }

        protected void AddSubCattitle()
        {
            DropAddSubCatTitle.Items.Clear();

            connect.Open();
            string sql = "select TAS.ID,TAS.ACCO_SUBCAT_TITLE from T_ACCOUNTING_SUBCATEGORY TAS,T_ACCOUNTING_CATEGORY TAC where TAC.ID=TAS.ACCO_CAT_ID and TAS.ACCO_CAT_ID='" + TextAddCatid.Text + "' order by ACCO_SUBCAT_TITLE";
            SqlDataAdapter adap = new SqlDataAdapter(sql, connect);
            DataTable dtSubCategory = new DataTable();
            adap.Fill(dtSubCategory);

            DropAddSubCatTitle.Items.Add(new ListItem("Seçiniz!", "0"));

            foreach (DataRow dr in dtSubCategory.Rows)
            {
                DropAddSubCatTitle.Items.Add(new ListItem(dr["ACCO_SUBCAT_TITLE"].ToString(), dr["ID"].ToString()));
            }
            connect.Close();
        }
        protected void UpdateSubCattitle()
        {
            DropUpdateSubCatTitle.Items.Clear();

            connect.Open();
            string sql = "select TAS.ID,TAS.ACCO_SUBCAT_TITLE from T_ACCOUNTING_SUBCATEGORY TAS,T_ACCOUNTING_CATEGORY TAC where TAC.ID=TAS.ACCO_CAT_ID and TAS.ACCO_CAT_ID='" + TextUpdateCatId.Text + "' order by ACCO_SUBCAT_TITLE";
            SqlDataAdapter adap = new SqlDataAdapter(sql, connect);
            DataTable dtSubCategory = new DataTable();
            adap.Fill(dtSubCategory);

            DropUpdateSubCatTitle.Items.Add(new ListItem("Seçiniz!", "0"));

            foreach (DataRow dr in dtSubCategory.Rows)
            {
                DropUpdateSubCatTitle.Items.Add(new ListItem(dr["ACCO_SUBCAT_TITLE"].ToString(), dr["ID"].ToString()));
            }
            connect.Close();
        }
        protected void DeleteSubCattitle()
        {
            DropDeleteSubCatTitle.Items.Clear();

            connect.Open();
            string sql = "select TAS.ID,TAS.ACCO_SUBCAT_TITLE from T_ACCOUNTING_SUBCATEGORY TAS,T_ACCOUNTING_CATEGORY TAC where TAC.ID=TAS.ACCO_CAT_ID and TAS.ACCO_CAT_ID='" + TextDeleteCatId.Text + "' order by ACCO_SUBCAT_TITLE";
            SqlDataAdapter adap = new SqlDataAdapter(sql, connect);
            DataTable dtSubCategory = new DataTable();
            adap.Fill(dtSubCategory);

            DropDeleteSubCatTitle.Items.Add(new ListItem("Seçiniz!", "0"));

            foreach (DataRow dr in dtSubCategory.Rows)
            {
                DropDeleteSubCatTitle.Items.Add(new ListItem(dr["ACCO_SUBCAT_TITLE"].ToString(), dr["ID"].ToString()));
            }
            connect.Close();
        }
        protected void ListSubCattitle()
        {
            DropListSubCatTitle.Items.Clear();

            connect.Open();
            string sql = "select TAS.ID,TAS.ACCO_SUBCAT_TITLE from T_ACCOUNTING_SUBCATEGORY TAS,T_ACCOUNTING_CATEGORY TAC where TAC.ID=TAS.ACCO_CAT_ID and TAS.ACCO_CAT_ID='" + TextListCatId.Text + "' order by ACCO_SUBCAT_TITLE";
            SqlDataAdapter adap = new SqlDataAdapter(sql, connect);
            DataTable dtSubCategory = new DataTable();
            adap.Fill(dtSubCategory);

            DropListSubCatTitle.Items.Add(new ListItem("Seçiniz!", "0"));

            foreach (DataRow dr in dtSubCategory.Rows)
            {
                DropListSubCatTitle.Items.Add(new ListItem(dr["ACCO_SUBCAT_TITLE"].ToString(), dr["ID"].ToString()));
            }
            connect.Close();
        }

        protected void findAddCatid()
        {
            connect.Open();
            SqlDataAdapter asd = new SqlDataAdapter("select * from T_ACCOUNTING_CATEGORY where ACCO_CAT_TITLE='" + lblAddcattitle.Text + "'", connect);
            DataTable dt = new DataTable("tb");
            asd.Fill(dt);

            TextAddCatid.Text = dt.Rows[0]["ID"].ToString();

            connect.Close();
        }
        protected void findUpdateCatid()
        {
            connect.Open();
            SqlDataAdapter asd = new SqlDataAdapter("select * from T_ACCOUNTING_CATEGORY where ACCO_CAT_TITLE='" + lblupdatecattitle.Text + "'", connect);
            DataTable dt = new DataTable("tb");
            asd.Fill(dt);

            TextUpdateCatId.Text = dt.Rows[0]["ID"].ToString();

            connect.Close();
        }
        protected void findDeleteCatid()
        {
            connect.Open();
            SqlDataAdapter asd = new SqlDataAdapter("select * from T_ACCOUNTING_CATEGORY where ACCO_CAT_TITLE='" + lbldeletecattitle.Text + "'", connect);
            DataTable dt = new DataTable("tb");
            asd.Fill(dt);

            TextDeleteCatId.Text = dt.Rows[0]["ID"].ToString();

            connect.Close();
        }
        protected void findListCatid()
        {
            connect.Open();
            SqlDataAdapter asd = new SqlDataAdapter("select * from T_ACCOUNTING_CATEGORY where ACCO_CAT_TITLE='" + lbllistcattitle.Text + "'", connect);
            DataTable dt = new DataTable("tb");
            asd.Fill(dt);

            TextListCatId.Text = dt.Rows[0]["ID"].ToString();

            connect.Close();
        }

        protected void findAddSubCatid()
        {
            connect.Open();
            SqlDataAdapter asd = new SqlDataAdapter("select TAS.ID,TAS.ACCO_SUBCAT_TITLE from T_ACCOUNTING_SUBCATEGORY TAS,T_ACCOUNTING_CATEGORY TAC where TAC.ID=TAS.ACCO_CAT_ID and TAC.ID='" + TextAddCatid.Text + "' and TAS.ACCO_SUBCAT_TITLE='" + lblAddsubcattitle.Text + "'", connect);
            DataTable dt = new DataTable("tb");
            asd.Fill(dt);

            TextAddSubCatid.Text = dt.Rows[0]["ID"].ToString();

            connect.Close();
        }
        protected void findUpdateSubCatid()
        {
            connect.Open();
            SqlDataAdapter asd = new SqlDataAdapter("select TAS.ID,TAS.ACCO_SUBCAT_TITLE from T_ACCOUNTING_SUBCATEGORY TAS,T_ACCOUNTING_CATEGORY TAC where TAC.ID=TAS.ACCO_CAT_ID and TAC.ID='" + TextUpdateCatId.Text + "' and TAS.ACCO_SUBCAT_TITLE='" + lblupdatesubcattitle.Text + "'", connect);
            DataTable dt = new DataTable("tb");
            asd.Fill(dt);
            TextUpdateSubCatId.Text = dt.Rows[0]["ID"].ToString();

            connect.Close();
        }
        protected void findDeleteSubCatid()
        {
            connect.Open();
            SqlDataAdapter asd = new SqlDataAdapter("select TAS.ID,TAS.ACCO_SUBCAT_TITLE from T_ACCOUNTING_SUBCATEGORY TAS,T_ACCOUNTING_CATEGORY TAC where TAC.ID=TAS.ACCO_CAT_ID and TAC.ID='" + TextDeleteCatId.Text + "' and TAS.ACCO_SUBCAT_TITLE='" + lbldeletesubcattitle.Text + "'", connect);
            DataTable dt = new DataTable("tb");
            asd.Fill(dt);
            TextDeleteSubCatId.Text = dt.Rows[0]["ID"].ToString();

            connect.Close();
        }
        protected void findListSubCatid()
        {
            connect.Open();
            SqlDataAdapter asd = new SqlDataAdapter("select TAS.ID,TAS.ACCO_SUBCAT_TITLE from T_ACCOUNTING_SUBCATEGORY TAS,T_ACCOUNTING_CATEGORY TAC where TAC.ID=TAS.ACCO_CAT_ID and TAC.ID='" + TextListCatId.Text + "' and TAS.ACCO_SUBCAT_TITLE='" + lbllistsubcattitle.Text + "'", connect);
            DataTable dt = new DataTable("tb");
            asd.Fill(dt);
            TextListSubCatId.Text = dt.Rows[0]["ID"].ToString();

            connect.Close();
        }

        private void getspendid()
        {
            DataTable dt = null;
            DataSet ds = new DataSet();
            SqlConnection db_baglanti;
            SqlCommand db_komut;
            SqlDataAdapter db_adapter = null;
            db_baglanti = new SqlConnection("Data Source=desktop-oqk00gg;Initial Catalog=MNWEBDB;Integrated Security=True");
            db_baglanti.Open();
            string sorgu = "SELECT * FROM T_ACCOUNTING_SPEND WHERE ACCO_SPEND_TITLE=@ACCO_SPEND_TITLE AND ACCO_SPEND_COMMENT=@ACCO_SPEND_COMMENT AND ACCO_SPEND_AMOUNT=@ACCO_SPEND_AMOUNT AND ACCO_SPEND_DATE=@ACCO_SPEND_DATE";
            db_komut = new SqlCommand(sorgu, db_baglanti);
            db_komut.Parameters.Add("@ACCO_SPEND_TITLE", SqlDbType.VarChar).Value = TextSpendTitle.Text;
            db_komut.Parameters.Add("@ACCO_SPEND_COMMENT", SqlDbType.VarChar).Value = TextSpendContent.Text;
            db_komut.Parameters.Add("@ACCO_SPEND_AMOUNT", SqlDbType.VarChar).Value = TextSpendAmount.Text;
            db_komut.Parameters.Add("@ACCO_SPEND_DATE", SqlDbType.Date).Value = TextSpendDate.Text;
            db_adapter = new SqlDataAdapter();
            db_adapter.SelectCommand = db_komut;
            db_adapter.Fill(ds);
            dt = ds.Tables[0];
            db_adapter = null;
            db_baglanti.Close();
            db_baglanti = null;
            if (dt.Rows.Count > 0)
            {
                lblspendid.Text = dt.Rows[0]["ID"].ToString();

            }
        }

        //DROPDOWNLIST SECTIONS
        protected void DropAddCatTitle_SelectedIndexChanged(object sender, EventArgs e)
        {
            string CatID = DropAddCatTitle.SelectedValue.ToString();

            connect.Open();
            SqlDataAdapter dsa = new SqlDataAdapter("select ACCO_CAT_TITLE from T_ACCOUNTING_CATEGORY where ID='" + CatID + "'", connect);
            DataTable dt = new DataTable("td");
            dsa.Fill(dt);
            connect.Close();

            if (dt != null && dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                if (dr["ACCO_CAT_TITLE"] != DBNull.Value)
                    lblAddcattitle.Text = dr["ACCO_CAT_TITLE"].ToString();
            }
            TextAddSubCatid.Text = "0";
            lblAddsubcattitle.Text = null;
            findAddCatid();
            AddSubCattitle();
        }
        protected void DropUpdateCatTitle_SelectedIndexChanged(object sender, EventArgs e)
        {
            string CatID = DropUpdateCatTitle.SelectedValue.ToString();

            connect.Open();
            SqlDataAdapter dsa = new SqlDataAdapter("select ACCO_CAT_TITLE from T_ACCOUNTING_CATEGORY where ID='" + CatID + "'", connect);
            DataTable dt = new DataTable("td");
            dsa.Fill(dt);
            connect.Close();

            if (dt != null && dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                if (dr["ACCO_CAT_TITLE"] != DBNull.Value)
                    lblupdatecattitle.Text = dr["ACCO_CAT_TITLE"].ToString();
            }
            findUpdateCatid();
            UpdateSubCattitle();
        }
        protected void DropDeleteCatTitle_SelectedIndexChanged(object sender, EventArgs e)
        {
            string CatID = DropDeleteCatTitle.SelectedValue.ToString();

            connect.Open();
            SqlDataAdapter dsa = new SqlDataAdapter("select ACCO_CAT_TITLE from T_ACCOUNTING_CATEGORY where ID='" + CatID + "'", connect);
            DataTable dt = new DataTable("td");
            dsa.Fill(dt);
            connect.Close();

            if (dt != null && dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                if (dr["ACCO_CAT_TITLE"] != DBNull.Value)
                    lbldeletecattitle.Text = dr["ACCO_CAT_TITLE"].ToString();
            }
            findDeleteCatid();
            DeleteSubCattitle();
        }
        protected void DropListCatTitle_SelectedIndexChanged(object sender, EventArgs e)
        {
            string CatID = DropListCatTitle.SelectedValue.ToString();

            connect.Open();
            SqlDataAdapter dsa = new SqlDataAdapter("select ACCO_CAT_TITLE from T_ACCOUNTING_CATEGORY where ID='" + CatID + "'", connect);
            DataTable dt = new DataTable("td");
            dsa.Fill(dt);
            connect.Close();

            if (dt != null && dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                if (dr["ACCO_CAT_TITLE"] != DBNull.Value)
                    lbllistcattitle.Text = dr["ACCO_CAT_TITLE"].ToString();
            }
            findListCatid();
            ListSubCattitle();
        }

        protected void DropAddSubCatTitle_SelectedIndexChanged(object sender, EventArgs e)
        {
            string SubCatID = DropAddSubCatTitle.SelectedValue.ToString();

            connect.Open();
            SqlDataAdapter dsa = new SqlDataAdapter("select ACCO_SUBCAT_TITLE from T_ACCOUNTING_SUBCATEGORY where ID='" + SubCatID + "'", connect);
            DataTable dt = new DataTable("td");
            dsa.Fill(dt);
            connect.Close();

            if (dt != null && dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                if (dr["ACCO_SUBCAT_TITLE"] != DBNull.Value)
                    lblAddsubcattitle.Text = dr["ACCO_SUBCAT_TITLE"].ToString();
            }
            findAddSubCatid();
        }
        protected void DropUpdateSubCatTitle_SelectedIndexChanged(object sender, EventArgs e)
        {
            string SubCatID = DropUpdateSubCatTitle.SelectedValue.ToString();

            connect.Open();
            SqlDataAdapter dsa = new SqlDataAdapter("select ACCO_SUBCAT_TITLE from T_ACCOUNTING_SUBCATEGORY where ID='" + SubCatID + "'", connect);
            DataTable dt = new DataTable("td");
            dsa.Fill(dt);
            connect.Close();

            if (dt != null && dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                if (dr["ACCO_SUBCAT_TITLE"] != DBNull.Value)
                    lblupdatesubcattitle.Text = dr["ACCO_SUBCAT_TITLE"].ToString();
            }
            findUpdateSubCatid();
        }
        protected void DropDeleteSubCatTitle_SelectedIndexChanged(object sender, EventArgs e)
        {
            string SubCatID = DropDeleteSubCatTitle.SelectedValue.ToString();

            connect.Open();
            SqlDataAdapter dsa = new SqlDataAdapter("select ACCO_SUBCAT_TITLE from T_ACCOUNTING_SUBCATEGORY where ID='" + SubCatID + "'", connect);
            DataTable dt = new DataTable("td");
            dsa.Fill(dt);
            connect.Close();

            if (dt != null && dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                if (dr["ACCO_SUBCAT_TITLE"] != DBNull.Value)
                    lbldeletesubcattitle.Text = dr["ACCO_SUBCAT_TITLE"].ToString();
            }
            findDeleteSubCatid();
        }
        protected void DropListSubCatTitle_SelectedIndexChanged(object sender, EventArgs e)
        {
            string SubCatID = DropListSubCatTitle.SelectedValue.ToString();

            connect.Open();
            SqlDataAdapter dsa = new SqlDataAdapter("select ACCO_SUBCAT_TITLE from T_ACCOUNTING_SUBCATEGORY where ID='" + SubCatID + "'", connect);
            DataTable dt = new DataTable("td");
            dsa.Fill(dt);
            connect.Close();

            if (dt != null && dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                if (dr["ACCO_SUBCAT_TITLE"] != DBNull.Value)
                    lbllistsubcattitle.Text = dr["ACCO_SUBCAT_TITLE"].ToString();
            }
            findListSubCatid();
        }

        //ADD SECTION
        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            connect.Open();
            string query = "insert into T_ACCOUNTING_SPEND (ACCO_SPEND_TITLE,ACCO_SPEND_COMMENT,ACCO_SPEND_AMOUNT,ACCO_SPEND_DATE)values(@ACCO_SPEND_TITLE,@ACCO_SPEND_COMMENT,@ACCO_SPEND_AMOUNT,@ACCO_SPEND_DATE)";
            SqlCommand asd = new SqlCommand(query, connect);
            asd.Parameters.Add("@ACCO_SPEND_TITLE", SqlDbType.VarChar).Value = TextSpendTitle.Text;
            asd.Parameters.Add("@ACCO_SPEND_COMMENT", SqlDbType.VarChar).Value = TextSpendContent.Text;
            asd.Parameters.Add("@ACCO_SPEND_AMOUNT", SqlDbType.VarChar).Value = TextSpendAmount.Text;
            asd.Parameters.Add("@ACCO_SPEND_DATE", SqlDbType.Date).Value = TextSpendDate.Text;
            asd.ExecuteNonQuery();
            lbladdmsg.Text = "İşlem Başarılı";
            connect.Close();

            getspendid();
  
            connect.Open();

            if (DropAddCatTitle.SelectedIndex == 0)
            {
                lbladdmsg.Text = "Lütfen Bir Kategori Seçiniz";
            }
            else
            {
                if (DropAddSubCatTitle.SelectedIndex == 0)
                {
                    string query2 = "insert into T_ACCOUNTING_TAKE (ACCO_CAT_ID,ACCO_SUBCAT_ID,ACCO_SPEND_ID)values(@ACCO_CAT_ID,@ACCO_SUBCAT_ID,@ACCO_SPEND_ID)";
                    SqlCommand asdf = new SqlCommand(query2, connect);
                    asdf.Parameters.Add("@ACCO_CAT_ID", SqlDbType.VarChar).Value = TextAddCatid.Text;
                    asdf.Parameters.Add("@ACCO_SUBCAT_ID", SqlDbType.VarChar).Value = "0";
                    asdf.Parameters.Add("@ACCO_SPEND_ID", SqlDbType.VarChar).Value = lblspendid.Text;
                    asdf.ExecuteNonQuery();
                }
                else
                {
                    string query2 = "insert into T_ACCOUNTING_TAKE (ACCO_CAT_ID,ACCO_SUBCAT_ID,ACCO_SPEND_ID)values(@ACCO_CAT_ID,@ACCO_SUBCAT_ID,@ACCO_SPEND_ID)";
                    SqlCommand asdf = new SqlCommand(query2, connect);
                    asdf.Parameters.Add("@ACCO_CAT_ID", SqlDbType.VarChar).Value = TextAddCatid.Text;
                    asdf.Parameters.Add("@ACCO_SUBCAT_ID", SqlDbType.VarChar).Value = TextAddSubCatid.Text;
                    asdf.Parameters.Add("@ACCO_SPEND_ID", SqlDbType.VarChar).Value = lblspendid.Text;
                    asdf.ExecuteNonQuery();
                }
            }
            
            connect.Close();
        }

        //UPDATE SECTIONS
        protected void BtnUpdateOpen_Click(object sender, EventArgs e)
        {
            lblupdatemsg.Visible = false;
            connect.Open();
            if (DropUpdateCatTitle.SelectedIndex == 0 && DropUpdateSubCatTitle.SelectedIndex == 0)
            {
                GridView1.Visible = false;
                lblupdateopenmsg.Visible = true;
                lblupdateopenmsg.Text = "Lütfen Kategori Seçimlerini Yapınız...";
            }
            else if (DropUpdateSubCatTitle.SelectedIndex == 0)
            {
                lblupdateopenmsg.Visible = false;
                GridView1.Visible = true;
                SqlDataAdapter asd = new SqlDataAdapter("select TAS.ID,TAS.ACCO_SPEND_TITLE,TAS.ACCO_SPEND_COMMENT,TAS.ACCO_SPEND_AMOUNT,TAS.ACCO_SPEND_DATE from T_ACCOUNTING_CATEGORY TAC, T_ACCOUNTING_TAKE TAK,T_ACCOUNTING_SPEND TAS where TAC.ID = TAK.ACCO_CAT_ID and TAS.ID = TAK.ACCO_SPEND_ID and TAC.ID =" + TextUpdateCatId.Text + " order by TAS.ACCO_SPEND_DATE desc", connect);
                DataTable dt = new DataTable("tb");
                asd.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
                dtUpdate.SelectedDate = (DateTime)dt.Rows[0]["ACCO_SPEND_DATE"];
            }
            else if (DropUpdateCatTitle.SelectedIndex == 0)
            {
                GridView1.Visible = false;
                lblupdateopenmsg.Visible = true;
                lblupdateopenmsg.Text = "Lütfen Kategori Seçimlerini Yapınız...";
            }
            else
            {
                lblupdateopenmsg.Visible = false;
                GridView1.Visible = true;
                SqlDataAdapter asd = new SqlDataAdapter("select TAS.ID,TAS.ACCO_SPEND_TITLE,TAS.ACCO_SPEND_COMMENT,TAS.ACCO_SPEND_AMOUNT,TAS.ACCO_SPEND_DATE from T_ACCOUNTING_CATEGORY TAC,T_ACCOUNTING_SUBCATEGORY TASC,T_ACCOUNTING_TAKE TAK,T_ACCOUNTING_SPEND TAS where TAC.ID=TAK.ACCO_CAT_ID and TASC.ID=TAK.ACCO_SUBCAT_ID and TAS.ID=TAK.ACCO_SPEND_ID and TAC.ID=" + TextUpdateCatId.Text + " and TASC.ID=" + TextUpdateSubCatId.Text + " order by TAS.ACCO_SPEND_DATE desc ", connect);
                DataTable dt = new DataTable("tb");
                asd.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
                dtUpdate.SelectedDate = (DateTime)dt.Rows[0]["ACCO_SPEND_DATE"];
            }
            connect.Close();
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label lblId = (Label)GridView1.SelectedRow.FindControl("lblspendid");
            Label lblTitle = (Label)GridView1.SelectedRow.FindControl("lblspendtitle");
            Label lblAmount = (Label)GridView1.SelectedRow.FindControl("lblspendamount");
            Label lblComment = (Label)GridView1.SelectedRow.FindControl("lblspendcomment");
            Label lblDate = (Label)GridView1.SelectedRow.FindControl("lblspenddate");

            Session["RecordId"] = lblId.Text;
            title.Text = lblTitle.Text;
            amount.Text = lblAmount.Text;
            comment.Text = lblComment.Text;
           // date.Text = lblDate.Text;

            

            Session["BASLIK"] = title.Text;
            texttitle.Text = Session["BASLIK"].ToString();

            Session["UCRET"] = amount.Text;
            textamount.Text = Session["UCRET"].ToString();

            Session["ACIKLAMA"] = comment.Text;
            textcomment.Text = Session["ACIKLAMA"].ToString();

            //Session["TARIH"] = date.Text;
            //textdate.Text = Session["TARIH"].ToString();

            Pnlupdate.Visible = true;
            lblupdatemsg.Visible = false;
        } 
        protected void BtnUpdate_Click(object sender, EventArgs e)
        {

            connect.Open();
            SqlCommand cmd = new SqlCommand("update T_ACCOUNTING_SPEND set ACCO_SPEND_TITLE=@TITLE ,ACCO_SPEND_AMOUNT=@AMOUNT ,ACCO_SPEND_COMMENT=@COMMENT , ACCO_SPEND_DATE= @DATE where ID= @Id", connect);
            cmd.Parameters.Add("@Id", SqlDbType.Int).Value = int.Parse((string)Session["RecordId"]);
            cmd.Parameters.Add("@TITLE", SqlDbType.VarChar).Value = texttitle.Text;
            cmd.Parameters.Add("@AMOUNT", SqlDbType.VarChar).Value = textamount.Text;
            cmd.Parameters.Add("@COMMENT", SqlDbType.VarChar).Value = textcomment.Text;
            cmd.Parameters.Add("@DATE", SqlDbType.DateTime).Value = dtUpdate.SelectedDate;
            cmd.ExecuteNonQuery();
            lblupdatemsg.Visible = true;
            lblupdatemsg.Text = "İşlem Başarılı";
            Pnlupdate.Visible = false;
            connect.Close();


            connect.Open();
            if (DropUpdateCatTitle.SelectedIndex == 0 && DropUpdateSubCatTitle.SelectedIndex == 0)
            {
                GridView1.Visible = false;
                lblupdateopenmsg.Visible = true;
                lblupdateopenmsg.Text = "Lütfen Kategori Seçimlerini Yapınız...";
            }
            else if (DropUpdateSubCatTitle.SelectedIndex == 0)
            {
                lblupdateopenmsg.Visible = false;
                GridView1.Visible = true;
                SqlDataAdapter asd = new SqlDataAdapter("select TAS.ID,TAS.ACCO_SPEND_TITLE,TAS.ACCO_SPEND_COMMENT,TAS.ACCO_SPEND_AMOUNT,TAS.ACCO_SPEND_DATE from T_ACCOUNTING_CATEGORY TAC, T_ACCOUNTING_TAKE TAK,T_ACCOUNTING_SPEND TAS where TAC.ID = TAK.ACCO_CAT_ID and TAS.ID = TAK.ACCO_SPEND_ID and TAC.ID =" + TextUpdateCatId.Text + " order by TAS.ACCO_SPEND_DATE desc", connect);
                DataTable dt1 = new DataTable("tb");
                asd.Fill(dt1);
                GridView1.DataSource = dt1;
                GridView1.DataBind();
            }
            else if (DropUpdateCatTitle.SelectedIndex == 0)
            {
                GridView1.Visible = false;
                lblupdateopenmsg.Visible = true;
                lblupdateopenmsg.Text = "Lütfen Kategori Seçimlerini Yapınız...";
            }
            else
            {
                lblupdateopenmsg.Visible = false;
                GridView1.Visible = true;
                SqlDataAdapter asd = new SqlDataAdapter("select TAS.ID,TAS.ACCO_SPEND_TITLE,TAS.ACCO_SPEND_COMMENT,TAS.ACCO_SPEND_AMOUNT,TAS.ACCO_SPEND_DATE from T_ACCOUNTING_CATEGORY TAC,T_ACCOUNTING_SUBCATEGORY TASC,T_ACCOUNTING_TAKE TAK,T_ACCOUNTING_SPEND TAS where TAC.ID=TAK.ACCO_CAT_ID and TASC.ID=TAK.ACCO_SUBCAT_ID and TAS.ID=TAK.ACCO_SPEND_ID and TAC.ID=" + TextUpdateCatId.Text + " and TASC.ID=" + TextUpdateSubCatId.Text + " order by TAS.ACCO_SPEND_DATE desc ", connect);
                DataTable dt2 = new DataTable("tb");
                asd.Fill(dt2);
                GridView1.DataSource = dt2;
                GridView1.DataBind();
            }
            connect.Close();
        }
        protected void BtnUpdateCancel_Click(object sender, EventArgs e)
        {
            Pnlupdate.Visible = false;
            lblupdatemsg.Visible = true;
            lblupdatemsg.Text = "Hiçbir İşlem Yapılmadı";
            lblupdateopenmsg.Visible = false;
        }


        //DELETE SECTIONS
        protected void BtnDeleteOpen_Click(object sender, EventArgs e)
        {
            lbldeletemsg.Visible = false;
            connect.Open();
            if (DropDeleteCatTitle.SelectedIndex == 0 && DropDeleteSubCatTitle.SelectedIndex == 0)
            {
                GridView2.Visible = false;
                lbldeleteopenmsg.Visible = true;
                lbldeleteopenmsg.Text = "Lütfen Kategori Seçimlerini Yapınız...";
            }
            else if (DropDeleteSubCatTitle.SelectedIndex == 0)
            {
                lbldeleteopenmsg.Visible = false;
                GridView2.Visible = true;
                SqlDataAdapter asd = new SqlDataAdapter("select TAS.ID,TAS.ACCO_SPEND_TITLE,TAS.ACCO_SPEND_COMMENT,TAS.ACCO_SPEND_AMOUNT,TAS.ACCO_SPEND_DATE from T_ACCOUNTING_CATEGORY TAC, T_ACCOUNTING_TAKE TAK,T_ACCOUNTING_SPEND TAS where TAC.ID = TAK.ACCO_CAT_ID and TAS.ID = TAK.ACCO_SPEND_ID and TAC.ID =" + TextDeleteCatId.Text + " order by TAS.ACCO_SPEND_DATE desc", connect);
                DataTable dt = new DataTable("tb");
                asd.Fill(dt);
                GridView2.DataSource = dt;
                GridView2.DataBind();
            }
            else if (DropDeleteCatTitle.SelectedIndex == 0)
            {
                GridView2.Visible = false;
                lbldeleteopenmsg.Visible = true;
                lbldeleteopenmsg.Text = "Lütfen Kategori Seçimlerini Yapınız...";
            }
            else
            {
                lbldeleteopenmsg.Visible = false;
                GridView2.Visible = true;
                SqlDataAdapter asd = new SqlDataAdapter("select TAS.ID,TAS.ACCO_SPEND_TITLE,TAS.ACCO_SPEND_COMMENT,TAS.ACCO_SPEND_AMOUNT,TAS.ACCO_SPEND_DATE from T_ACCOUNTING_CATEGORY TAC,T_ACCOUNTING_SUBCATEGORY TASC,T_ACCOUNTING_TAKE TAK,T_ACCOUNTING_SPEND TAS where TAC.ID=TAK.ACCO_CAT_ID and TASC.ID=TAK.ACCO_SUBCAT_ID and TAS.ID=TAK.ACCO_SPEND_ID and TAC.ID=" + TextDeleteCatId.Text + " and TASC.ID=" + TextDeleteSubCatId.Text + " order by TAS.ACCO_SPEND_DATE desc", connect);
                DataTable dt = new DataTable("tb");
                asd.Fill(dt);
                GridView2.DataSource = dt;
                GridView2.DataBind();
            }
            connect.Close();
        }
        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label lblId = (Label)GridView2.SelectedRow.FindControl("lblId");
            Label lblTitle = (Label)GridView2.SelectedRow.FindControl("lblTitle");
            Label lblAmount = (Label)GridView2.SelectedRow.FindControl("lblAmount");
            Label lblComment = (Label)GridView2.SelectedRow.FindControl("lblComment");
            Label lblDate = (Label)GridView2.SelectedRow.FindControl("lblDate");

            lbldeleteid.Text = lblId.Text;
            lbldeletetitle.Text = lblTitle.Text;
            lbldeleteamount.Text = lblAmount.Text;
            lbldeletecomment.Text = lblComment.Text;
            lbldeletedate.Text = lblDate.Text;

            Session["LBLDELETEID"] = lbldeleteid.Text;
            Textdeleteid.Text = Session["LBLDELETEID"].ToString();

            Session["LBLDELETETITLE"] = lbldeletetitle.Text;
            Textdeletetitle.Text = Session["LBLDELETETITLE"].ToString();

            Session["LBLDELETEAMOUNT"] = lbldeleteamount.Text;
            Textdeleteamount.Text = Session["LBLDELETEAMOUNT"].ToString();

            Session["LBLDELETECOMMENT"] = lbldeletecomment.Text;
            Textdeletecomment.Text = Session["LBLDELETECOMMENT"].ToString();
            Pnldelete.Visible = true;
            lbldeletemsg.Visible = false;
        }
        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            connect.Open();
            DataTable dt2 = new DataTable();
            SqlDataAdapter query2 = new SqlDataAdapter("delete from T_ACCOUNTING_TAKE where ACCO_SPEND_ID = '" + Textdeleteid.Text + "' ", connect);
            query2.Fill(dt2);
            connect.Close();

            connect.Open();
            DataTable dt1 = new DataTable();
            SqlDataAdapter query1 = new SqlDataAdapter("delete from T_ACCOUNTING_SPEND where ID = '" + Textdeleteid.Text + "' ", connect);
            query1.Fill(dt1);
            lbldeletemsg.Visible = true;
            lbldeletemsg.Text = "İşlem Başarılı";
            connect.Close();


            connect.Open();
            if (DropDeleteCatTitle.SelectedIndex == 0 && DropDeleteSubCatTitle.SelectedIndex == 0)
            {
                GridView2.Visible = false;
                lbldeleteopenmsg.Visible = true;
                lbldeleteopenmsg.Text = "Lütfen Kategori Seçimlerini Yapınız...";
            }
            else if (DropDeleteSubCatTitle.SelectedIndex == 0)
            {
                lbldeleteopenmsg.Visible = false;
                GridView2.Visible = true;
                SqlDataAdapter asd = new SqlDataAdapter("select TAS.ID,TAS.ACCO_SPEND_TITLE,TAS.ACCO_SPEND_COMMENT,TAS.ACCO_SPEND_AMOUNT,TAS.ACCO_SPEND_DATE from T_ACCOUNTING_CATEGORY TAC, T_ACCOUNTING_TAKE TAK,T_ACCOUNTING_SPEND TAS where TAC.ID = TAK.ACCO_CAT_ID and TAS.ID = TAK.ACCO_SPEND_ID and TAC.ID =" + TextDeleteCatId.Text + " order by TAS.ACCO_SPEND_DATE desc", connect);
                DataTable dt = new DataTable("tb");
                asd.Fill(dt);
                GridView2.DataSource = dt;
                GridView2.DataBind();
            }
            else if (DropDeleteCatTitle.SelectedIndex == 0)
            {
                GridView2.Visible = false;
                lbldeleteopenmsg.Visible = true;
                lbldeleteopenmsg.Text = "Lütfen Kategori Seçimlerini Yapınız...";
            }
            else
            {
                lbldeleteopenmsg.Visible = false;
                GridView2.Visible = true;
                SqlDataAdapter asd = new SqlDataAdapter("select TAS.ID,TAS.ACCO_SPEND_TITLE,TAS.ACCO_SPEND_COMMENT,TAS.ACCO_SPEND_AMOUNT,TAS.ACCO_SPEND_DATE from T_ACCOUNTING_CATEGORY TAC,T_ACCOUNTING_SUBCATEGORY TASC,T_ACCOUNTING_TAKE TAK,T_ACCOUNTING_SPEND TAS where TAC.ID=TAK.ACCO_CAT_ID and TASC.ID=TAK.ACCO_SUBCAT_ID and TAS.ID=TAK.ACCO_SPEND_ID and TAC.ID=" + TextDeleteCatId.Text + " and TASC.ID=" + TextDeleteSubCatId.Text + " order by TAS.ACCO_SPEND_DATE desc", connect);
                DataTable dt = new DataTable("tb");
                asd.Fill(dt);
                GridView2.DataSource = dt;
                GridView2.DataBind();
            }
            connect.Close();

            Pnldelete.Visible = false;
        }
        protected void BtnDeleteCancel_Click(object sender, EventArgs e)
        {
            Pnldelete.Visible = false;
            lbldeleteopenmsg.Visible = false;
            lbldeletemsg.Visible = true;
            lbldeletemsg.Text = "Hiçbir İşlem Yapılmadı";
        }


        //LIST SECTIONS
        protected void BtnListOpen_Click(object sender, EventArgs e)
        {
            connect.Open();
            if (DropListCatTitle.SelectedIndex == 0 && DropListSubCatTitle.SelectedIndex == 0)
            {
                GridView3.Visible = false;
                BtnWordTransfer.Visible = false;
                BtnExcelTransfer.Visible = false;
                lbllistopenmsg.Visible = true;
                lbllistopenmsg.Text = "Lütfen Kategori Seçimlerini Yapınız...";
            }
            else if (DropListSubCatTitle.SelectedIndex == 0)
            {
                lbllistopenmsg.Visible = false;
                BtnWordTransfer.Visible = true;
                BtnExcelTransfer.Visible = true;
                GridView3.Visible = true;
                
                SqlDataAdapter asd = new SqlDataAdapter("Select TAS.ID,TAS.ACCO_SPEND_TITLE,TAS.ACCO_SPEND_COMMENT,TAS.ACCO_SPEND_AMOUNT,TAS.ACCO_SPEND_DATE from T_ACCOUNTING_CATEGORY TAC, T_ACCOUNTING_TAKE TAK, T_ACCOUNTING_SPEND TAS where TAC.ID = TAK.ACCO_CAT_ID and TAS.ID = TAK.ACCO_SPEND_ID and TAC.ID = " + TextListCatId.Text + " order by TAS.ACCO_SPEND_DATE desc", connect);
                DataTable dt = new DataTable("tb");
                asd.Fill(dt);
                GridView3.DataSource = dt;
                GridView3.DataBind();
            }
            else if (DropListCatTitle.SelectedIndex == 0)
            {
                GridView3.Visible = false;
                lbllistopenmsg.Visible = true;
                lbllistopenmsg.Text = "Lütfen Kategori Seçimlerini Yapınız...";
            }
            else
            {
                lbllistopenmsg.Visible = false;
                BtnWordTransfer.Visible = true;
                BtnExcelTransfer.Visible = true;
                GridView3.Visible = true;
                SqlDataAdapter asd = new SqlDataAdapter("select TAS.ID,TAS.ACCO_SPEND_TITLE,TAS.ACCO_SPEND_COMMENT,TAS.ACCO_SPEND_AMOUNT,TAS.ACCO_SPEND_DATE from T_ACCOUNTING_CATEGORY TAC,T_ACCOUNTING_SUBCATEGORY TASC,T_ACCOUNTING_TAKE TAK,T_ACCOUNTING_SPEND TAS where TAC.ID=TAK.ACCO_CAT_ID and TASC.ID=TAK.ACCO_SUBCAT_ID and TAS.ID=TAK.ACCO_SPEND_ID and TAC.ID=" + TextListCatId.Text + " and TASC.ID=" + TextListSubCatId.Text + " order by TAS.ACCO_SPEND_DATE desc", connect);
                DataTable dt = new DataTable("tb");
                asd.Fill(dt);
                GridView3.DataSource = dt;
                GridView3.DataBind();
            }
            connect.Close();
        }
        protected void BtnWordTransfer_Click(object sender, EventArgs e)
        {
            HtmlForm form = new HtmlForm();
            string dosya = "attackhment;filename=harcama_wordbelgesi.doc";
            Response.ClearContent();
            Response.AddHeader("content-disposition", dosya);
            Response.ContentType = "application/ms-doc";
            HttpContext.Current.Response.ContentEncoding = System.Text.Encoding.GetEncoding("windows-1254");
            HttpContext.Current.Response.Charset = "windows-1254";
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            form.Controls.Add(GridView3);
            this.Controls.Add(form);
            form.RenderControl(hw);
            Response.Write(sw.ToString());
            Response.End();
        }
        protected void BtnExcelTransfer_Click(object sender, EventArgs e)
        {
            HtmlForm form = new HtmlForm();
            string dosya = "attackhment;filename=harcama_excelbelgesi.xls";
            Response.ClearContent();
            Response.AddHeader("content-disposition", dosya);
            Response.ContentType = "application/ms-xls";
            HttpContext.Current.Response.ContentEncoding = System.Text.Encoding.GetEncoding("windows-1254");
            HttpContext.Current.Response.Charset = "windows-1254";
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            form.Controls.Add(GridView3);
            this.Controls.Add(form);
            form.RenderControl(hw);
            Response.Write(sw.ToString());
            Response.End();
        }
    }
}