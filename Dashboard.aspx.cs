using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Dashbord : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadCounts();
        }
    }

    void LoadCounts()
    {
        SqlConnection con = new SqlConnection(
            ConfigurationManager.ConnectionStrings["KRSConnection"].ConnectionString);

        con.Open();

        // STUDENTS
        SqlCommand cmdStudents = new SqlCommand("SELECT COUNT(*) FROM Students", con);
        lblStudents.Text = cmdStudents.ExecuteScalar().ToString();

        // TEACHERS
        SqlCommand cmdTeachers = new SqlCommand("SELECT COUNT(*) FROM Teachers", con);
        lblTeachers.Text = cmdTeachers.ExecuteScalar().ToString();

        // COURSES
        SqlCommand cmdCourses = new SqlCommand("SELECT COUNT(*) FROM Courses", con);
        lblCourses.Text = cmdCourses.ExecuteScalar().ToString();

        // SUBJECTS
        SqlCommand cmdSubjects = new SqlCommand("SELECT COUNT(*) FROM Subjects", con);
        lblSubjects.Text = cmdSubjects.ExecuteScalar().ToString();

        con.Close();
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Redirect("Default.aspx");
    }

}