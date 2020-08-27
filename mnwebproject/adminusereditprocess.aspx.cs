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
    public partial class adminusereditprocess : System.Web.UI.Page
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

        protected void search()
        {
            connect.Open();
            SqlDataAdapter asd = new SqlDataAdapter("select TU.ID, TU.USER_USERNAME, TU.USER_NAME, TU.USER_SURNAME, TU.USER_GENDER, TU.USER_EMAIL, TU.USER_EDUCATION, TU.USER_JOB, TCO.COUNTRY_NAME, TCI.CITY_NAME from T_USER TU, T_COUNTRY TCO, T_CITY TCI where TU.USER_COUNTRY_ID = TCO.ID AND TU.USER_CITY_ID = TCI.ID AND TU.ID IN (select ID from T_USER where USER_NAME like '%" + TextSearch.Text + "%' or USER_USERNAME like '%" + TextSearch.Text + "%') order by TU.ID desc", connect);
            DataTable dt = new DataTable("tb");
            asd.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            connect.Close();
        }
        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            search();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label lblId = (Label)GridView1.SelectedRow.FindControl("lblId");
            Label lblusername = (Label)GridView1.SelectedRow.FindControl("lblusername");
            Label lblname = (Label)GridView1.SelectedRow.FindControl("lblname");
            Label lblsurname = (Label)GridView1.SelectedRow.FindControl("lblsurname");
            Label lblemail = (Label)GridView1.SelectedRow.FindControl("lblemail");
            Label lblgender = (Label)GridView1.SelectedRow.FindControl("lblgender");
            Label lbleducation = (Label)GridView1.SelectedRow.FindControl("lbleducation");
            Label lbljob = (Label)GridView1.SelectedRow.FindControl("lbljob");
            Label lblcountry = (Label)GridView1.SelectedRow.FindControl("lblcountry");
            Label lblcity = (Label)GridView1.SelectedRow.FindControl("lblcity");

            TextId.Text = lblId.Text;
            TextUsername.Text = lblusername.Text;
            TextName.Text = lblname.Text;
            TextSurname.Text = lblsurname.Text;
            TextEmail.Text = lblemail.Text;
            TextGender.Text = lblgender.Text;
            TextEducation.Text = lbleducation.Text;
            TextJob.Text = lbljob.Text;
            TextCountry.Text = lblcountry.Text;
            TextCity.Text = lblcity.Text;

            PnlEdit.Visible = true;
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            connect.Open();
            SqlDataAdapter ds = new SqlDataAdapter("update T_USER set  USER_NAME='" + TextName.Text + "',USER_SURNAME='" + TextSurname.Text + "',USER_GENDER='"+TextGender.Text+"',USER_EMAIL='" + TextEmail.Text + "',USER_EDUCATION='" +TextEducation.Text + "',USER_JOB='" + TextJob.Text + "' where ID='" + TextId.Text + "'", connect);
            DataTable dt = new DataTable();
            ds.Fill(dt);
            ds.Dispose();
            connect.Close();

            PnlEdit.Visible = false;

            search();
        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            PnlEdit.Visible = false;
        }
    }
}