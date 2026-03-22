using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class StudentMarks : System.Web.UI.Page
{
    string cs = @"Data Source=.\SQLEXPRESS;AttachDbFilename=D:\Meet Project Sem-6\Krishna Royal School\App_Data\KrishnaDB.mdf;Integrated Security=True;User Instance=True";

    // For Update
    int EditMarkId
    {
        get { return ViewState["EditMarkId"] == null ? 0 : (int)ViewState["EditMarkId"]; }
        set { ViewState["EditMarkId"] = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadStudents();
            LoadSubjects();
            LoadMarks();
        }
    }

    void LoadStudents()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT StudentId,StudentName FROM Students", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlStudentId.DataSource = dt;
            ddlStudentId.DataTextField = "StudentName";
            ddlStudentId.DataValueField = "StudentId";
            ddlStudentId.DataBind();
        }
    }

    void LoadSubjects()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT SubjectId,SubjectName FROM Subjects", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlSubjectId.DataSource = dt;
            ddlSubjectId.DataTextField = "SubjectName";
            ddlSubjectId.DataValueField = "SubjectId";
            ddlSubjectId.DataBind();
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd;

            if (EditMarkId == 0)
            {
                // INSERT
                cmd = new SqlCommand(
                "INSERT INTO StudentMarks (StudentId, SubjectId, Marks) VALUES (@s,@sub,@m)", con);
            }
            else
            {
                // UPDATE
                cmd = new SqlCommand(
                "UPDATE StudentMarks SET StudentId=@s, SubjectId=@sub, Marks=@m WHERE MarkId=@id", con);
                cmd.Parameters.AddWithValue("@id", EditMarkId);
            }

            cmd.Parameters.AddWithValue("@s", ddlStudentId.SelectedValue);
            cmd.Parameters.AddWithValue("@sub", ddlSubjectId.SelectedValue);
            cmd.Parameters.AddWithValue("@m", txtMarks.Text);

            con.Open();
            cmd.ExecuteNonQuery();
        }

        EditMarkId = 0;
        btnSave.Text = "Save Marks";
        txtMarks.Text = "";

        LoadMarks();
    }

    void LoadMarks()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlDataAdapter da = new SqlDataAdapter(
            "SELECT M.MarkId,S.StudentName,Sub.SubjectName,M.Marks,M.StudentId,M.SubjectId FROM StudentMarks M " +
            "INNER JOIN Students S ON M.StudentId=S.StudentId " +
            "INNER JOIN Subjects Sub ON M.SubjectId=Sub.SubjectId", con);

            DataTable dt = new DataTable();
            da.Fill(dt);
            gvMarks.DataSource = dt;
            gvMarks.DataBind();
        }
    }

    protected void gvMarks_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int markId = Convert.ToInt32(e.CommandArgument);

        if (e.CommandName == "EditRow")
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter(
                "SELECT * FROM StudentMarks WHERE MarkId=@id", con);

                da.SelectCommand.Parameters.AddWithValue("@id", markId);

                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    LoadStudents();
                    LoadSubjects();

                    ddlStudentId.SelectedValue = dt.Rows[0]["StudentId"].ToString();
                    ddlSubjectId.SelectedValue = dt.Rows[0]["SubjectId"].ToString();
                    txtMarks.Text = dt.Rows[0]["Marks"].ToString();

                    EditMarkId = markId;
                    btnSave.Text = "Update Marks";
                }
            }
        }

        if (e.CommandName == "DeleteRow")
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(
                "DELETE FROM StudentMarks WHERE MarkId=@id", con);

                cmd.Parameters.AddWithValue("@id", markId);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            LoadMarks();
        }
    }
}


