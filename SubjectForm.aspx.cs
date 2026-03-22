using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class SubjectForm : System.Web.UI.Page
{
    string cs = @"Data Source=.\SQLEXPRESS;AttachDbFilename=D:\Meet Project Sem-6\Krishna Royal School\App_Data\KrishnaDB.mdf;Integrated Security=True;User Instance=True";
    int id = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            id = Convert.ToInt32(Request.QueryString["id"]);
            if (!IsPostBack)
                LoadSubject();
        }
    }

    void LoadSubject()
    {
        SqlConnection con = new SqlConnection(cs);
        SqlCommand cmd = new SqlCommand(
            "SELECT * FROM Subjects WHERE SubjectId=@id", con);
        cmd.Parameters.AddWithValue("@id", id);

        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            txtName.Text = dr["SubjectName"].ToString();
            txtDesc.Text = dr["Description"].ToString();
            txtCredits.Text = dr["Credits"].ToString();
        }
        con.Close();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(cs);
        SqlCommand cmd;

        if (Request.QueryString["id"] == null)
        {
            cmd = new SqlCommand(
                "INSERT INTO Subjects VALUES (@n,@d,@c)", con);
        }
        else
        {
            cmd = new SqlCommand(
                "UPDATE Subjects SET SubjectName=@n, Description=@d, Credits=@c WHERE SubjectId=@id", con);
            cmd.Parameters.AddWithValue("@id", id);
        }

        cmd.Parameters.AddWithValue("@n", txtName.Text);
        cmd.Parameters.AddWithValue("@d", txtDesc.Text);
        cmd.Parameters.AddWithValue("@c", txtCredits.Text);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        Response.Redirect("Subjects.aspx");
    }
}