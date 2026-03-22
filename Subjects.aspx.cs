using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Subjects : System.Web.UI.Page
{
    string cs = @"Data Source=.\SQLEXPRESS;AttachDbFilename=D:\Meet Project Sem-6\Krishna Royal School\App_Data\KrishnaDB.mdf;Integrated Security=True;User Instance=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            LoadSubjects();
    }

    void LoadSubjects()
    {
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Subjects", cs);
        DataTable dt = new DataTable();
        da.Fill(dt);
        gvSubjects.DataSource = dt;
        gvSubjects.DataBind();
    }

    protected void gvSubjects_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        SqlConnection con = new SqlConnection(cs);

        if (e.CommandName == "DeleteRow")
        {
            SqlCommand cmd = new SqlCommand(
                "DELETE FROM Subjects WHERE SubjectId=" + e.CommandArgument, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            LoadSubjects();
        }

        if (e.CommandName == "EditRow")
        {
            Response.Redirect("SubjectForm.aspx?id=" + e.CommandArgument);
        }
    }

    protected void btnNew_Click(object sender, EventArgs e)
    {
        Response.Redirect("SubjectForm.aspx");
    }
    protected void gvSubjects_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}