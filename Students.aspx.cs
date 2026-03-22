using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;

public partial class StudentForm : System.Web.UI.Page
{
    string cs = @"Data Source=.\SQLEXPRESS;AttachDbFilename=D:\Meet Project Sem-6\Krishna Royal School\App_Data\KrishnaDB.mdf;Integrated Security=True;User Instance=True";

    int EditStudentId
    {
        get { return ViewState["EditStudentId"] == null ? 0 : (int)ViewState["EditStudentId"]; }
        set { ViewState["EditStudentId"] = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadClass();
            LoadStudents();
        }
    }

    void LoadClass()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT ClassId FROM SchoolClasses", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlClassId.DataSource = dt;
            ddlClassId.DataTextField = "ClassId";
            ddlClassId.DataValueField = "ClassId";
            ddlClassId.DataBind();
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd;

            if (EditStudentId == 0)
            {
                cmd = new SqlCommand(
                "INSERT INTO Students (StudentName, Gender, DateOfBirth, ClassId) VALUES (@n,@g,@d,@c)", con);
            }
            else
            {
                cmd = new SqlCommand(
                "UPDATE Students SET StudentName=@n, Gender=@g, DateOfBirth=@d, ClassId=@c WHERE StudentId=@id", con);
                cmd.Parameters.AddWithValue("@id", EditStudentId);
            }

            cmd.Parameters.AddWithValue("@n", txtName.Text);
            cmd.Parameters.AddWithValue("@g", ddlGender.SelectedValue);

            // ✅ FIXED DATE ERROR HERE
            DateTime dob;
            if (DateTime.TryParseExact(txtDOB.Text, "dd-MM-yyyy",
                CultureInfo.InvariantCulture,
                DateTimeStyles.None, out dob))
            {
                cmd.Parameters.Add("@d", SqlDbType.Date).Value = dob;
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                    "alert('Please enter date in dd-MM-yyyy format');", true);
                return;
            }

            cmd.Parameters.AddWithValue("@c", ddlClassId.SelectedValue);

            con.Open();
            cmd.ExecuteNonQuery();
        }

        EditStudentId = 0;
        btnSave.Text = "Save Student";

        ClearForm();
        LoadStudents();
    }

    void LoadStudents()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Students", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvStudents.DataSource = dt;
            gvStudents.DataBind();
        }
    }

    protected void gvStudents_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int studentId = Convert.ToInt32(e.CommandArgument);

        if (e.CommandName == "EditRow")
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Students WHERE StudentId=@id", con);
                da.SelectCommand.Parameters.AddWithValue("@id", studentId);

                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    txtName.Text = dt.Rows[0]["StudentName"].ToString();
                    ddlGender.SelectedValue = dt.Rows[0]["Gender"].ToString();
                    txtDOB.Text = Convert.ToDateTime(dt.Rows[0]["DateOfBirth"]).ToString("dd-MM-yyyy");

                    LoadClass();

                    string classId = dt.Rows[0]["ClassId"].ToString();
                    if (ddlClassId.Items.FindByValue(classId) != null)
                    {
                        ddlClassId.SelectedValue = classId;
                    }

                    EditStudentId = studentId;
                    btnSave.Text = "Update Student";
                }
            }
        }

        if (e.CommandName == "DeleteRow")
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Students WHERE StudentId=@id", con);
                cmd.Parameters.AddWithValue("@id", studentId);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            LoadStudents();
        }
    }

    void ClearForm()
    {
        txtName.Text = "";
        txtDOB.Text = "";
        ddlGender.SelectedIndex = 0;
        ddlClassId.SelectedIndex = 0;
    }
}
