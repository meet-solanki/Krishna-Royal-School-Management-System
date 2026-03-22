using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class SchoolClassesForm : System.Web.UI.Page
{
    string cs = @"Data Source=.\SQLEXPRESS;
                  AttachDbFilename=D:\Meet Project Sem-6\Krishna Royal School\App_Data\KrishnaDB.mdf;
                  Integrated Security=True;User Instance=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack && Request.QueryString["id"] != null)
        {
            LoadClass();
        }
    }

    void LoadClass()
    {
        SqlConnection con = new SqlConnection(cs);
        SqlCommand cmd = new SqlCommand(
            "SELECT * FROM SchoolClasses WHERE ClassId=@id", con);
        cmd.Parameters.AddWithValue("@id", Request.QueryString["id"]);

        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            txtClassName.Text = dr["ClassName"].ToString();
            txtStartDate.Text = Convert.ToDateTime(dr["StartDate"]).ToShortDateString();
            txtEndDate.Text = Convert.ToDateTime(dr["EndDate"]).ToShortDateString();
        }
        con.Close();
    }

    // TOGGLE START CALENDAR
    protected void lnkStart_Click(object sender, EventArgs e)
    {
        calStart.Visible = !calStart.Visible;
        calEnd.Visible = false;
    }

    // TOGGLE END CALENDAR
    protected void lnkEnd_Click(object sender, EventArgs e)
    {
        calEnd.Visible = !calEnd.Visible;
        calStart.Visible = false;
    }

    protected void calStart_SelectionChanged(object sender, EventArgs e)
    {
        txtStartDate.Text = calStart.SelectedDate.ToShortDateString();
        calStart.Visible = false;
    }

    protected void calEnd_SelectionChanged(object sender, EventArgs e)
    {
        txtEndDate.Text = calEnd.SelectedDate.ToShortDateString();
        calEnd.Visible = false;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(cs);
        SqlCommand cmd;

        DateTime startDate = DateTime.Parse(txtStartDate.Text);
        DateTime endDate = DateTime.Parse(txtEndDate.Text);

        if (Request.QueryString["id"] == null)
        {
            cmd = new SqlCommand(
                "INSERT INTO SchoolClasses (ClassName, StartDate, EndDate) VALUES (@n, @s, @e)", con);
        }
        else
        {
            cmd = new SqlCommand(
                "UPDATE SchoolClasses SET ClassName=@n, StartDate=@s, EndDate=@e WHERE ClassId=@id", con);
            cmd.Parameters.AddWithValue("@id", Request.QueryString["id"]);
        }

        cmd.Parameters.AddWithValue("@n", txtClassName.Text);
        cmd.Parameters.Add("@s", SqlDbType.Date).Value = startDate;
        cmd.Parameters.Add("@e", SqlDbType.Date).Value = endDate;

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        Response.Redirect("SchoolClasses.aspx");
    }
}
