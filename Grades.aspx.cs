using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Grades : System.Web.UI.Page
{
    string cs = @"Data Source=.\SQLEXPRESS;AttachDbFilename=D:\Meet Project Sem-6\Krishna Royal School\App_Data\KrishnaDB.mdf;Integrated Security=True;User Instance=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindStudents();
            BindGrid();
        }
    }

    private void BindStudents()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("SELECT StudentId, StudentName FROM Students", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            ddlStudentName.DataSource = dr;
            ddlStudentName.DataTextField = "StudentName";
            ddlStudentName.DataValueField = "StudentId";
            ddlStudentName.DataBind();
            ddlStudentName.Items.Insert(0, new ListItem("--Select Student--", "0"));
            con.Close();
        }
    }

    private decimal CalculateAverageGrade(int studentID)
    {
        decimal average = 0;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("SELECT AVG(Marks) FROM StudentMarks WHERE StudentId=@StudentId", con);
            cmd.Parameters.AddWithValue("@StudentId", studentID);
            con.Open();
            object result = cmd.ExecuteScalar();
            if (result != DBNull.Value)
                average = Convert.ToDecimal(result);
            con.Close();
        }
        return average;
    }

    private string GetStatus(decimal average)
    {
        return average >= 40 ? "Pass" : "Fail";
    }

    private string GetClassNameByStudent(int studentID)
    {
        string className = "";
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT C.ClassName FROM Students S INNER JOIN SchoolClasses C ON S.ClassId=C.ClassId WHERE S.StudentId=@StudentId", con);
            cmd.Parameters.AddWithValue("@StudentId", studentID);
            con.Open();
            object result = cmd.ExecuteScalar();
            if (result != null)
                className = result.ToString();
            con.Close();
        }
        return className;
    }

    protected void ddlStudentName_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlStudentName.SelectedIndex == 0)
        {
            txtClassName.Text = "";
            txtAverageGrade.Text = "";
            txtStatus.Text = "";
            return;
        }

        int studentID = Convert.ToInt32(ddlStudentName.SelectedValue);
        txtClassName.Text = GetClassNameByStudent(studentID);
        decimal avgGrade = CalculateAverageGrade(studentID);
        txtAverageGrade.Text = avgGrade.ToString("0.00");
        txtStatus.Text = GetStatus(avgGrade);
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (ddlStudentName.SelectedIndex == 0)
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Please select a student.";
            return;
        }

        int studentID = Convert.ToInt32(ddlStudentName.SelectedValue);
        string studentName = ddlStudentName.SelectedItem.Text;
        string className = txtClassName.Text;
        decimal avgGrade = CalculateAverageGrade(studentID);
        string status = GetStatus(avgGrade);

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "INSERT INTO Grades (StudentName, ClassName, AverageGrade, Status) VALUES (@StudentName, @ClassName, @AverageGrade, @Status)", con);
            cmd.Parameters.AddWithValue("@StudentName", studentName);
            cmd.Parameters.AddWithValue("@ClassName", className);
            cmd.Parameters.AddWithValue("@AverageGrade", avgGrade);
            cmd.Parameters.AddWithValue("@Status", status);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        lblMsg.ForeColor = System.Drawing.Color.Green;
        lblMsg.Text = "Grade added successfully!";
        ClearForm();
        BindGrid();
    }

    private void BindGrid()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM Grades", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            gvGrades.DataSource = dt;
            gvGrades.DataBind();
        }
    }

    protected void gvGrades_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        int gradeID = Convert.ToInt32(gvGrades.DataKeys[index].Value);

        if (e.CommandName == "DeleteRow")
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Grades WHERE GradeId=@GradeID", con);
                cmd.Parameters.AddWithValue("@GradeID", gradeID);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Record deleted successfully!";
            BindGrid();
        }
        else if (e.CommandName == "ViewDetails")
        {
            // Redirect to GradeDetails page with GradeId
            Response.Redirect("GradeDetails.aspx?GradeId=" + gradeID);
        }
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        ClearForm();
        lblMsg.Text = "";
    }

    private void ClearForm()
    {
        ddlStudentName.SelectedIndex = 0;
        txtClassName.Text = "";
        txtAverageGrade.Text = "";
        txtStatus.Text = "";
    }
}
