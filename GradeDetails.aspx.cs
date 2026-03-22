using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class GradeDetails : System.Web.UI.Page
{
    string cs = @"Data Source=.\SQLEXPRESS;AttachDbFilename=D:\Meet Project Sem-6\Krishna Royal School\App_Data\KrishnaDB.mdf;Integrated Security=True;User Instance=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["GradeId"] != null)
            {
                int gradeID = Convert.ToInt32(Request.QueryString["GradeId"]);
                LoadGradeDetails(gradeID);
            }
        }
    }

    private void LoadGradeDetails(int gradeID)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            // Get student info from Grades table
            SqlCommand cmd = new SqlCommand("SELECT StudentName, ClassName, AverageGrade, Status FROM Grades WHERE GradeId=@GradeID", con);
            cmd.Parameters.AddWithValue("@GradeID", gradeID);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                lblStudent.Text = "Student: " + dr["StudentName"].ToString();
                lblClass.Text = "Class: " + dr["ClassName"].ToString();
                lblAverage.Text = "Average Grade: " + Convert.ToDecimal(dr["AverageGrade"]).ToString("0.00");
                lblStatus.Text = "Status: " + dr["Status"].ToString();
            }
            dr.Close();

            // Get all subjects & marks from StudentMarks
            SqlCommand cmdMarks = new SqlCommand(
                "SELECT Sub.SubjectName, M.Marks FROM StudentMarks M INNER JOIN Subjects Sub ON M.SubjectId=Sub.SubjectId " +
                "INNER JOIN Students S ON M.StudentId=S.StudentId " +
                "INNER JOIN Grades G ON S.StudentName=G.StudentName " +
                "WHERE G.GradeId=@GradeID", con);

            cmdMarks.Parameters.AddWithValue("@GradeID", gradeID);
            SqlDataAdapter da = new SqlDataAdapter(cmdMarks);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvSubjects.DataSource = dt;
            gvSubjects.DataBind();
        }
    }
}
