using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Attendance : System.Web.UI.Page
{
    string cs = @"Data Source=.\SQLEXPRESS;
                  AttachDbFilename=D:\Meet Project Sem-6\Krishna Royal School\App_Data\KrishnaDB.mdf;
                  Integrated Security=True;
                  User Instance=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadStudents();
            LoadAttendance();
        }
    }

    // ==========================
    // Load Students in Dropdown
    // ==========================
    void LoadStudents()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT S.StudentId, S.StudentName, C.ClassName FROM Students S " +
                "INNER JOIN SchoolClasses C ON S.ClassId = C.ClassId", con);

            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlStudent.DataSource = dt;
            ddlStudent.DataTextField = "StudentName";
            ddlStudent.DataValueField = "StudentId";
            ddlStudent.DataBind();
            ddlStudent.Items.Insert(0, new ListItem("-- Select Student --", "0"));
        }
    }

    // ==========================
    // Auto-fill Class & Name
    // ==========================
    protected void ddlStudent_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlStudent.SelectedIndex > 0)
        {
            int studentId = Convert.ToInt32(ddlStudent.SelectedValue);

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT S.StudentName, C.ClassName FROM Students S " +
                    "INNER JOIN SchoolClasses C ON S.ClassId = C.ClassId " +
                    "WHERE S.StudentId=@sid", con);

                cmd.Parameters.AddWithValue("@sid", studentId);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    txtStudentName.Text = dr["StudentName"].ToString();
                    txtClass.Text = dr["ClassName"].ToString();
                }
                dr.Close();
            }
        }
        else
        {
            txtStudentName.Text = "";
            txtClass.Text = "";
        }
    }

    // ==========================
    // Save or Update Attendance
    // ==========================
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (ddlStudent.SelectedIndex == 0)
        {
            lblMsg.Text = "Please select a student!";
            return;
        }

        int studentId = Convert.ToInt32(ddlStudent.SelectedValue);
        int classId = GetClassIdByStudent(studentId);

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd;
            if (string.IsNullOrEmpty(hfAttendanceId.Value))
            {
                // INSERT
                cmd = new SqlCommand("INSERT INTO Attendance (StudentId, ClassId, AttendanceDate, Status) VALUES (@sid,@cid,@date,@status)", con);
            }
            else
            {
                // UPDATE
                cmd = new SqlCommand("UPDATE Attendance SET StudentId=@sid, ClassId=@cid, AttendanceDate=@date, Status=@status WHERE AttendanceId=@aid", con);
                cmd.Parameters.AddWithValue("@aid", hfAttendanceId.Value);
            }

            cmd.Parameters.AddWithValue("@sid", studentId);
            cmd.Parameters.AddWithValue("@cid", classId);
            cmd.Parameters.AddWithValue("@date", txtDate.Text);
            cmd.Parameters.AddWithValue("@status", ddlStatus.SelectedValue);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        lblMsg.Text = "Attendance saved successfully!";
        hfAttendanceId.Value = "";
        btnSave.Text = "Save Attendance";
        ClearForm();
        LoadAttendance();
    }

    // ==========================
    // Get ClassId for a Student
    // ==========================
    int GetClassIdByStudent(int studentId)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("SELECT ClassId FROM Students WHERE StudentId=@sid", con);
            cmd.Parameters.AddWithValue("@sid", studentId);
            con.Open();
            object result = cmd.ExecuteScalar();
            con.Close();
            return result != null ? Convert.ToInt32(result) : 0;
        }
    }

    // ==========================
    // Load Attendance Grid
    // ==========================
    void LoadAttendance()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT A.AttendanceId, S.StudentName, C.ClassName, A.AttendanceDate, A.Status " +
                "FROM Attendance A " +
                "INNER JOIN Students S ON A.StudentId = S.StudentId " +
                "INNER JOIN SchoolClasses C ON A.ClassId = C.ClassId", con);

            DataTable dt = new DataTable();
            da.Fill(dt);
            gvAttendance.DataSource = dt;
            gvAttendance.DataBind();
        }
    }

    // ==========================
    // Edit/Delete Attendance
    // ==========================
    protected void gvAttendance_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument);

        if (e.CommandName == "EditRecord")
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Attendance WHERE AttendanceId=@id", con);
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    hfAttendanceId.Value = dr["AttendanceId"].ToString();
                    ddlStudent.SelectedValue = dr["StudentId"].ToString();
                    ddlStudent_SelectedIndexChanged(null, null);
                    txtDate.Text = Convert.ToDateTime(dr["AttendanceDate"]).ToString("yyyy-MM-dd");
                    ddlStatus.SelectedValue = dr["Status"].ToString();
                    btnSave.Text = "Update Attendance";
                }
                dr.Close();
                con.Close();
            }
        }

        if (e.CommandName == "DeleteRecord")
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Attendance WHERE AttendanceId=@id", con);
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            lblMsg.Text = "Attendance deleted!";
        }

        LoadAttendance();
    }

    // ==========================
    // Clear Form
    // ==========================
    void ClearForm()
    {
        ddlStudent.SelectedIndex = 0;
        txtStudentName.Text = "";
        txtClass.Text = "";
        txtDate.Text = "";
        ddlStatus.SelectedIndex = 0;
    }
}
