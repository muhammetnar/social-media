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
    public partial class about_tr : System.Web.UI.Page
    {
        SqlConnection connect = new SqlConnection("Data Source=desktop-oqk00gg;Initial Catalog=MNWEBDB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            getaboutinfo();
        }
        protected void getaboutinfo()
        {
            connect.Open();
            SqlDataAdapter asd = new SqlDataAdapter("select * from T_ABOUT ", connect);
            DataTable dt = new DataTable("tb");
            asd.Fill(dt);
            FormView1.DataSource = dt;
            FormView1.DataBind();
            connect.Close();
        }

    }
}