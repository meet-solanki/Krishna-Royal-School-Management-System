using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class SchoolClasses : System.Web.UI.Page
{
    string cs = @"Data Source=.\SQLEXPRESS;
                  AttachDbFilename=D:\Meet Project Sem-6\Krishna Royal School\App_Data\KrishnaDB.mdf;
                  Integrated Security=True;User Instance=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            LoadClasses();
    }
    void LoadClasses()
    {
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM SchoolClasses", cs);
        DataTable dt = new DataTable();
        da.Fill(dt);
        gvClasses.DataSource = dt;
        gvClasses.DataBind();
    }

    protected void gvClasses_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        SqlConnection con = new SqlConnection(cs);

        /* DELETE */
        if (e.CommandName == "DeleteRow")
        {
            SqlCommand cmd = new SqlCommand(
                "DELETE FROM SchoolClasses WHERE ClassId=" + e.CommandArgument, con);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            LoadClasses();
        }

        /* EDIT */
        if (e.CommandName == "EditRow")
        {
            Response.Redirect("SchoolClassesForm.aspx?id=" + e.CommandArgument);
        }
    }

    protected void btnNew_Click(object sender, EventArgs e)
    {
        Response.Redirect("SchoolClassesForm.aspx");
    }
    protected void gvClasses_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}