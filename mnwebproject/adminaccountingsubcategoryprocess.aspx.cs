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
    public partial class adminaccountingsubcategoryprocess : System.Web.UI.Page
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
            }
        }

        protected void AdminLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("adminlogin.aspx");
        }
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
        protected void findAddCatid()
        {
            connect.Open();
            SqlDataAdapter asd = new SqlDataAdapter("select * from T_ACCOUNTING_CATEGORY where ACCO_CAT_TITLE='" + lblAddcattitle.Text + "'", connect);
            DataTable dt = new DataTable("tb");
            asd.Fill(dt);

            TextAddCatid.Text = dt.Rows[0]["ID"].ToString();

            connect.Close();
        }
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
            findAddCatid();
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
                connect.Open();
                SqlDataAdapter asd = new SqlDataAdapter("select TAS.ID,TAC.ACCO_CAT_TITLE,TAS.ACCO_SUBCAT_TITLE from T_ACCOUNTING_CATEGORY TAC,T_ACCOUNTING_SUBCATEGORY TAS where TAC.ID=TAS.ACCO_CAT_ID order by TAC.ACCO_CAT_TITLE asc", connect);
                DataTable dt = new DataTable("tb");
                asd.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
                connect.Close();
            }
            else if (DropDownList1.SelectedIndex == 3)
            {
                lblopenmsg.Visible = false;
                MultiView1.ActiveViewIndex = 2;
                connect.Open();
                SqlDataAdapter asd = new SqlDataAdapter("select TAS.ID,TAC.ACCO_CAT_TITLE,TAS.ACCO_SUBCAT_TITLE from T_ACCOUNTING_CATEGORY TAC,T_ACCOUNTING_SUBCATEGORY TAS where TAC.ID=TAS.ACCO_CAT_ID order by TAC.ACCO_CAT_TITLE asc", connect);
                DataTable dt = new DataTable("tb");
                asd.Fill(dt);
                GridView2.DataSource = dt;
                GridView2.DataBind();
                connect.Close();
            }
            else if (DropDownList1.SelectedIndex == 4)
            {
                lblopenmsg.Visible = false;
                MultiView1.ActiveViewIndex = 3;
                connect.Open();
                SqlDataAdapter asd = new SqlDataAdapter("select TAS.ID,TAC.ACCO_CAT_TITLE,TAS.ACCO_SUBCAT_TITLE from T_ACCOUNTING_CATEGORY TAC,T_ACCOUNTING_SUBCATEGORY TAS where TAC.ID=TAS.ACCO_CAT_ID order by TAC.ACCO_CAT_TITLE asc", connect);
                DataTable dt = new DataTable("tb");
                asd.Fill(dt);
                GridView3.DataSource = dt;
                GridView3.DataBind();
                connect.Close();
            }
            else
            {
                lblopenmsg.Visible = true;
                lblopenmsg.Text = "Lütfen Bir İşlem Seçiniz!";
            }
        }


        //ADD SECTION
        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            connect.Open();
            string sorgu = "insert into T_ACCOUNTING_SUBCATEGORY (ACCO_SUBCAT_TITLE,ACCO_CAT_ID)values(@ACCO_SUBCAT_TITLE,@ACCO_CAT_ID)";
            SqlCommand asd = new SqlCommand(sorgu, connect);
            asd.Parameters.Add("@ACCO_SUBCAT_TITLE", SqlDbType.VarChar).Value = TextCatTitle.Text; 
            asd.Parameters.Add("@ACCO_CAT_ID", SqlDbType.VarChar).Value = TextAddCatid.Text;
            asd.ExecuteNonQuery();
            lbladdmsg.Text = "İşlem Başarılı";
            connect.Close();
        }


        //UPDATE SECTION
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Pnlupdate.Visible = true;
            Label lblCategoryid = (Label)GridView1.SelectedRow.FindControl("lblId");
            Label lblCategory = (Label)GridView1.SelectedRow.FindControl("lblCategory");


            lblcategoryid.Text = lblCategoryid.Text;
            lblcategoryname.Text = lblCategory.Text;


            Session["CATEGORYID"] = lblcategoryid.Text;
            txtcategoryid.Text = Session["CATEGORYID"].ToString();

            Session["CATEGORYNAME"] = lblcategoryname.Text;
            txtcategoryadi.Text = Session["CATEGORYNAME"].ToString();

            lblupdatemsg.Visible = false;
        }
        protected void Btnupdate_Click(object sender, EventArgs e)
        {
            connect.Open();
            SqlDataAdapter ds = new SqlDataAdapter("update T_ACCOUNTING_SUBCATEGORY set  ACCO_SUBCAT_TITLE='" + txtcategoryadi.Text + "' where ID='" + txtcategoryid.Text + "'", connect);

            DataTable dt = new DataTable();
            ds.Fill(dt);
            ds.Dispose();
            //GridView1.DataBind();
            lblupdatemsg.Visible = true;
            lblupdatemsg.Text = "İşlem Başarılı";
            connect.Close();
            Pnlupdate.Visible = false;

            connect.Open();
            SqlDataAdapter asd = new SqlDataAdapter("select TAS.ID,TAC.ACCO_CAT_TITLE,TAS.ACCO_SUBCAT_TITLE from T_ACCOUNTING_CATEGORY TAC,T_ACCOUNTING_SUBCATEGORY TAS where TAC.ID=TAS.ACCO_CAT_ID order by TAC.ACCO_CAT_TITLE asc", connect);
            DataTable dta = new DataTable("tb");
            asd.Fill(dta);
            GridView1.DataSource = dta;
            GridView1.DataBind();
            connect.Close();
        }
        protected void Updatecancelbtn_Click(object sender, EventArgs e)
        {
            Pnlupdate.Visible = false;
            lblupdatemsg.Visible = true;
            lblupdatemsg.Text = "Hiçbir İşlem Yapılmadı";
        }


        //DELETE SECTION
        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            PnlDeleteCategory.Visible = true;

            Label lblDeleteId = (Label)GridView2.SelectedRow.FindControl("lblDeleteId");
            Label lblDeleteCategorytitle = (Label)GridView2.SelectedRow.FindControl("lblDeleteCategorytitle");
            Label lblDeleteCategoryName = (Label)GridView2.SelectedRow.FindControl("lblDeleteCategoryName");
            

            lbldeletecategoryid.Text = lblDeleteId.Text;
            lbldeletecategoryname.Text = lblDeleteCategoryName.Text;


            Session["KATEGORISILID"] = lbldeletecategoryid.Text;
            txtdeletecategoryid.Text = Session["KATEGORISILID"].ToString();

            lbldeletemsg.Visible = false;
        }
        protected void Btndeletecategory_Click(object sender, EventArgs e)
        {
            connect.Open();
            SqlDataAdapter ds3 = new SqlDataAdapter("delete from T_ACCOUNTING_SPEND where ID in(select ACCO_SPEND_ID from T_ACCOUNTING_TAKE where ACCO_SUBCAT_ID=" + txtdeletecategoryid.Text + ")", connect);
            DataTable dt3 = new DataTable();
            ds3.Fill(dt3);
            ds3.Dispose();
            connect.Close();

            connect.Open();
            SqlDataAdapter ds2 = new SqlDataAdapter("delete from T_ACCOUNTING_TAKE where ACCO_SUBCAT_ID=" + txtdeletecategoryid.Text + "", connect);
            DataTable dt2 = new DataTable();
            ds2.Fill(dt2);
            ds2.Dispose();
            connect.Close();

            connect.Open();
            SqlDataAdapter ds = new SqlDataAdapter("delete from T_ACCOUNTING_SUBCATEGORY where  ID=" + txtdeletecategoryid.Text + "", connect);
            DataTable dt = new DataTable();
            ds.Fill(dt);
            ds.Dispose();
            lbldeletemsg.Visible = true;
            lbldeletemsg.Text = "İşlem Başarılı";
            connect.Close();

            PnlDeleteCategory.Visible = false;

            connect.Open();
            SqlDataAdapter asd = new SqlDataAdapter("select TAS.ID,TAC.ACCO_CAT_TITLE,TAS.ACCO_SUBCAT_TITLE from T_ACCOUNTING_CATEGORY TAC,T_ACCOUNTING_SUBCATEGORY TAS where TAC.ID=TAS.ACCO_CAT_ID order by TAC.ACCO_CAT_TITLE asc", connect);
            DataTable dta = new DataTable("tb");
            asd.Fill(dta);
            GridView2.DataSource = dta;
            GridView2.DataBind();
            connect.Close();
        }
        protected void Btndeletecategorycancel_Click(object sender, EventArgs e)
        {
            PnlDeleteCategory.Visible = false;
            lbldeletemsg.Visible = true;
            lbldeletemsg.Text = "Hiçbir İşlem Yapılmadı";
        }
    }
}