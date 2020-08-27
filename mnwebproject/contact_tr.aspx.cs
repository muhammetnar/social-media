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
    public partial class contact_tr : System.Web.UI.Page
    {
        SqlConnection connect = new SqlConnection("Data Source=desktop-oqk00gg;Initial Catalog=MNWEBDB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSend_Click(object sender, EventArgs e)
        {
            connect.Open();
            if (textname.Text == "" || textsurname.Text == "" || textemail.Text == "" || textmessage.Text == "")
            {
                lblmsg.Text = "Mesajınız Gönderilemedi. Lütfen Gerekli Alanları Doldurunuz.";

                if (textname.Text == "")
                {  namechecklabel.Visible = true;  }
                else { namechecklabel.Visible = false; }

                if (textsurname.Text == "")
                {  surnamechecklabel.Visible = true;  }
                else { surnamechecklabel.Visible = false; }

                if (textemail.Text == "")
                { emailchecklabel.Visible = true; }
                else { emailchecklabel.Visible = false; }

                if (textmessage.Text == "")
                { messagechecklabel.Visible = true; }
                else { messagechecklabel.Visible = false; }
            }
            else
            {
                namechecklabel.Visible = false;
                surnamechecklabel.Visible = false;
                emailchecklabel.Visible = false;
                messagechecklabel.Visible = false;
                string sorgu = "insert into T_CONTACT (CONTACT_NAME,CONTACT_SURNAME,CONTACT_EMAIL,CONTACT_MESSAGE)values(@CONTACT_NAME,@CONTACT_SURNAME,@CONTACT_EMAIL,@CONTACT_MESSAGE)";
                SqlCommand asd = new SqlCommand(sorgu, connect);
                asd.Parameters.Add("@CONTACT_NAME", SqlDbType.VarChar).Value = textname.Text;
                asd.Parameters.Add("@CONTACT_SURNAME", SqlDbType.VarChar).Value = textsurname.Text;
                asd.Parameters.Add("@CONTACT_EMAIL", SqlDbType.VarChar).Value = textemail.Text;
                asd.Parameters.Add("@CONTACT_MESSAGE", SqlDbType.VarChar).Value = textmessage.Text;
                asd.ExecuteNonQuery();
                lblmsg.Text = "Mesajınız Gönderildi";
            }
            connect.Close();
        }
    }
}