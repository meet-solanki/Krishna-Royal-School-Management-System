using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (txtUsername.Text.Trim() == "" || txtPassword.Text.Trim() == "")
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Please enter username and password";
            return;
        }

        SqlConnection con = new SqlConnection(
            ConfigurationManager.ConnectionStrings["KRSConnection"].ConnectionString);

        string qry = "SELECT COUNT(*) FROM Admin WHERE Username=@u AND Password=@p";

        SqlCommand cmd = new SqlCommand(qry, con);
        cmd.Parameters.AddWithValue("@u", txtUsername.Text.Trim());
        cmd.Parameters.AddWithValue("@p", txtPassword.Text.Trim());

        con.Open();
        int result = Convert.ToInt32(cmd.ExecuteScalar());
        con.Close();

        if (result == 1)
        {
            Session["Admin"] = txtUsername.Text;
            Response.Redirect("Dashboard.aspx");
        }
        else
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Invalid Username or Password";
        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}