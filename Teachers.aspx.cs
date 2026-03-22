using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Teachers : System.Web.UI.Page
{
    string cs=(@"Data Source=.\SQLEXPRESS;
    AttachDbFilename=D:\Meet Project Sem-6\Krishna Royal School\App_Data\KrishnaDB.mdf;
    Integrated Security=True;
    User Instance=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadSubjects();
            LoadTeachers();
        }
    }

    void LoadSubjects()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT SubjectID FROM Subjects", con);

            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlSubject.DataSource = dt;
            ddlSubject.DataTextField = "SubjectID";
            ddlSubject.DataValueField = "SubjectID";
            ddlSubject.DataBind();
        }

        ddlSubject.Items.Insert(0, "-- Select Subject --");
    }

    void LoadTeachers()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT * FROM Teachers", con);

            DataTable dt = new DataTable();
            da.Fill(dt);

            gvTeachers.DataSource = dt;
            gvTeachers.DataBind();
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();

            if (hfTeacherID.Value == "")
            {
                SqlCommand cmd = new SqlCommand(
                "INSERT INTO Teachers (TeacherName, SubjectID, MobileNo, Email, Address, CreatedDate) " +
                "VALUES (@name,@sub,@mobile,@email,@address,GETDATE())", con);

                cmd.Parameters.AddWithValue("@name", txtName.Text);
                cmd.Parameters.AddWithValue("@sub", ddlSubject.SelectedValue);
                cmd.Parameters.AddWithValue("@mobile", txtMobile.Text);
                cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@address", txtAddress.Text);

                cmd.ExecuteNonQuery();
            }
            else
            {
                SqlCommand cmd = new SqlCommand(
                "UPDATE Teachers SET TeacherName=@name, SubjectID=@sub, MobileNo=@mobile, Email=@email, Address=@address WHERE TeacherID=@id",
                con);

                cmd.Parameters.AddWithValue("@name", txtName.Text);
                cmd.Parameters.AddWithValue("@sub", ddlSubject.SelectedValue);
                cmd.Parameters.AddWithValue("@mobile", txtMobile.Text);
                cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@id", hfTeacherID.Value);

                cmd.ExecuteNonQuery();

                hfTeacherID.Value = "";
                btnSave.Text = "Save Teacher";
            }
        }

        ClearForm();
        LoadTeachers();
    }

    protected void gvTeachers_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();

            if (e.CommandName == "EditRow")
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT * FROM Teachers WHERE TeacherID=@id", con);

                cmd.Parameters.AddWithValue("@id", e.CommandArgument);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    hfTeacherID.Value = dr["TeacherID"].ToString();
                    txtName.Text = dr["TeacherName"].ToString();
                    ddlSubject.SelectedValue = dr["SubjectID"].ToString();
                    txtMobile.Text = dr["MobileNo"].ToString();
                    txtEmail.Text = dr["Email"].ToString();
                    txtAddress.Text = dr["Address"].ToString();

                    btnSave.Text = "Update Teacher";
                }

                dr.Close();
            }

            if (e.CommandName == "DeleteRow")
            {
                SqlCommand cmd = new SqlCommand(
                    "DELETE FROM Teachers WHERE TeacherID=@id", con);

                cmd.Parameters.AddWithValue("@id", e.CommandArgument);
                cmd.ExecuteNonQuery();

                LoadTeachers();
            }
        }
    }

    void ClearForm()
    {
        txtName.Text = "";
        ddlSubject.SelectedIndex = 0;
        txtMobile.Text = "";
        txtEmail.Text = "";
        txtAddress.Text = "";
    }
}
