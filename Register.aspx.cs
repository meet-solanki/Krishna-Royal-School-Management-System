using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Register : System.Web.UI.Page
{

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid)
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Please fill all fields correctly";
            return;
        }

        SqlConnection con = new SqlConnection(
            ConfigurationManager.ConnectionStrings["KRSConnection"].ConnectionString);

        string qry = @"INSERT INTO Admin
                   (FirstName, LastName, Username, Address, Password)
                   VALUES (@fn, @ln, @un, @ad, @pw)";

        SqlCommand cmd = new SqlCommand(qry, con);
        cmd.Parameters.AddWithValue("@fn", txtFirstName.Text.Trim());
        cmd.Parameters.AddWithValue("@ln", txtLastName.Text.Trim());
        cmd.Parameters.AddWithValue("@un", txtUsername.Text.Trim());
        cmd.Parameters.AddWithValue("@ad", txtAddress.Text.Trim());
        cmd.Parameters.AddWithValue("@pw", txtPassword.Text.Trim());

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        // ✅ SUCCESS MESSAGE
        lblMsg.ForeColor = System.Drawing.Color.Green;
        lblMsg.Text = "Registration Successful! Redirecting to Login Page...";

       }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
}