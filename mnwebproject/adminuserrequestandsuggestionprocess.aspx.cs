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
    public partial class adminuserrequestandsuggestionprocess : System.Web.UI.Page
    {
        SqlConnection connect = new SqlConnection("Data Source=desktop-oqk00gg;Initial Catalog=MNWEBDB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null)
                lblwelcomemsg.Text = ("Hoşgeldin   " + Session["admin"]);
            else
                Response.Redirect("adminlogin.aspx");

            getsuggestion();
        }

        protected void AdminLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("adminlogin.aspx");
        }

        protected void getsuggestion()
        {
            GridView1.Visible = true;
            connect.Open();
            SqlDataAdapter asd = new SqlDataAdapter("select TS.ID,TU.USER_USERNAME,TU.USER_NAME,TU.USER_SURNAME,TS.USER_EMAIL,TS.TOPIC,TS.MESSAGE from T_USER TU,T_SUGGESTION TS where TU.ID=TS.USER_ID order by TS.ID desc", connect);
            DataTable dt = new DataTable("tb");
            asd.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            connect.Close();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label lblId = (Label)GridView1.SelectedRow.FindControl("lblId");
            Label lblusername = (Label)GridView1.SelectedRow.FindControl("lblusername");
            Label lblname = (Label)GridView1.SelectedRow.FindControl("lblname");
            Label lblsurname = (Label)GridView1.SelectedRow.FindControl("lblsurname");
            Label lblemail = (Label)GridView1.SelectedRow.FindControl("lblemail");
            Label lbltopic = (Label)GridView1.SelectedRow.FindControl("lbltopic");
            Label lblmessage = (Label)GridView1.SelectedRow.FindControl("lblmessage");

            lblmessageid.Text = lblId.Text;
            Textusername.Text = lblusername.Text;
            Textname.Text = lblname.Text;
            TextSurname.Text = lblsurname.Text;
            TextEmail.Text = lblemail.Text;
            TextTopic.Text = lbltopic.Text;
            TextMessage.Text = lblmessage.Text;

            PnlMesaage.Visible = true;
        }
        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            connect.Open();
            DataTable dt = new DataTable();
            SqlDataAdapter query = new SqlDataAdapter("delete from T_SUGGESTION where ID = '" + lblmessageid.Text + "' ", connect);
            query.Fill(dt);
            connect.Close();

            getsuggestion();
            PnlMesaage.Visible = false;
        }
        protected void BtnBack_Click(object sender, EventArgs e)
        {
            PnlMesaage.Visible = false;
        }
    }
}