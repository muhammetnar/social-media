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
    public partial class gallery_en : System.Web.UI.Page
    {
        SqlConnection connect = new SqlConnection("Data Source=desktop-oqk00gg;Initial Catalog=MNWEBDB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString.Get("ID"));
            // veritabanına bağlanmayı sağlar
            string yol = ("Data Source=desktop-oqk00gg;Initial Catalog=MNWEBDB;Integrated Security=True");
            SqlConnection Con = new SqlConnection(yol);

            //aşağıdaki tümce kapalı durumda olan bağlantıyı açar
            if (Con.State == ConnectionState.Closed)
            {
                Con.Open();
            }
            string sqldetay = "select * from T_PHOTOGALLERY_CATEGORY where ID=" + id + " ";
            SqlCommand com = new SqlCommand(sqldetay, Con);
            com.Parameters.AddWithValue("@ID", id);
            SqlDataReader dr = com.ExecuteReader();
            while (dr.Read())
            {
                lblid.Text = dr["ID"].ToString();
            }
            Con.Close();
            Con.Dispose();

            fotogetir();
        }
        protected void fotogetir()
        {
            connect.Open();
            SqlDataAdapter asd = new SqlDataAdapter("select * from T_PHOTOGALLERY where PCAT_ID=" + lblid.Text + " order by ID desc ", connect);
            DataTable dt = new DataTable("tb");
            asd.Fill(dt);
            DataList1.DataSource = dt;
            DataList1.DataBind();
            connect.Close();
        }
    }
}