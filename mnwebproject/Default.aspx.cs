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
    public partial class Default : System.Web.UI.Page
    {
        SqlConnection connect = new SqlConnection("Data Source=desktop-oqk00gg;Initial Catalog=MNWEBDB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            getslide();
            getannouncement();
            getnews();
        }
        protected void getslide()
        {
            connect.Open();
            SqlDataAdapter  command =new SqlDataAdapter("select * from T_SLIDE",connect);
            DataTable cmd = new DataTable("tb");
            command.Fill(cmd);
            Repeater1.DataSource = cmd;
            Repeater1.DataBind();
            connect.Close();
        }
        protected void getannouncement()
        {
            connect.Open();
            string sorgu = "select * from T_ANNOUNCEMENT where ANNOUNCE_LANGUAGE like 'TR'  order by ANNOUNCE_DATE desc";
            SqlCommand cmd = new SqlCommand(sorgu, connect);
            SqlDataReader dr = cmd.ExecuteReader();
            lstDuyuru.DataSource = dr;
            lstDuyuru.DataBind();
            connect.Close();
        }
        protected void getnews()
        {
            connect.Open();
            string sorgu = "select * from T_NEWS where NEWS_LANGUAGE like 'TR'  order by NEWS_DATE desc";
            SqlCommand cmd = new SqlCommand(sorgu, connect);
            SqlDataReader dr = cmd.ExecuteReader();
            lstHaber.DataSource = dr;
            lstHaber.DataBind();
            connect.Close();
        }
    }
}