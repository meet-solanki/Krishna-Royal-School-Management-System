using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Courses : System.Web.UI.Page
{
    string cs = @"Data Source=.\SQLEXPRESS;AttachDbFilename=D:\Meet Project Sem-6\Krishna Royal School\App_Data\KrishnaDB.mdf;Integrated Security=True;User Instance=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            LoadCourses();
    }

    void LoadCourses()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Courses", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvCourses.DataSource = dt;
            gvCourses.DataBind();
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd;

            if (hfCourseId.Value == "")
            {
                cmd = new SqlCommand("INSERT INTO Courses VALUES(@n,@d,@du)", con);
            }
            else
            {
                cmd = new SqlCommand("UPDATE Courses SET CourseName=@n,Description=@d,Duration=@du WHERE CourseId=@id", con);
                cmd.Parameters.AddWithValue("@id", hfCourseId.Value);
            }

            cmd.Parameters.AddWithValue("@n", txtCourseName.Text);
            cmd.Parameters.AddWithValue("@d", txtDescription.Text);
            cmd.Parameters.AddWithValue("@du", txtDuration.Text);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            lblMsg.Text = "Course Updated Successfully";
            Clear();
            LoadCourses();
        }
    }

    protected void gvCourses_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        if (e.CommandName == "EditRow")
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Courses WHERE CourseId=@id", con);
                cmd.Parameters.AddWithValue("@id", e.CommandArgument);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    hfCourseId.Value = dr["CourseId"].ToString();
                    txtCourseName.Text = dr["CourseName"].ToString();
                    txtDescription.Text = dr["Description"].ToString();
                    txtDuration.Text = dr["Duration"].ToString();
                }
            }
        }

        if (e.CommandName == "DeleteRow")
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Courses WHERE CourseId=@id", con);
                cmd.Parameters.AddWithValue("@id", e.CommandArgument);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                LoadCourses();
            }
        }
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        Clear();
    }

    void Clear()
    {
        hfCourseId.Value = "";
        txtCourseName.Text = "";
        txtDescription.Text = "";
        txtDuration.Text = "";
    }
}