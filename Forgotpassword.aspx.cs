using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Forgotpassword : System.Web.UI.Page
{
    string cs = @"Data Source=.\SQLEXPRESS;
                  AttachDbFilename=D:\Meet Project Sem-6\Krishna Royal School\App_Data\KrishnaDB.mdf;
                  Integrated Security=True;
                  User Instance=True";

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnRecover_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            string query = "SELECT Password FROM Admin WHERE Username=@Username";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());

            con.Open();

            object result = cmd.ExecuteScalar();

            if (result != null)
            {
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Your Password is: " + result.ToString();
            }
            else
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Username not found!";
            }
        }
    }
}