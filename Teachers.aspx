<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Teachers.aspx.cs" Inherits="Teachers" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  
<title>Teachers - Krishna Science School</title>

<style>

body {
    margin:0;
    font-family:Segoe UI;
    background:#f4f6f9;
}

/* SIDEBAR */
.sidebar {
    width:230px;
    height:100vh;
    position:fixed;
    left:0;
    top:0;
    background:#111;
    color:white;
}

.sidebar h3{
    text-align:center;
    padding:20px 10px;
    border-bottom:1px solid #333;
}

.sidebar a{
    display:block;
    padding:12px 20px;
    color:#bbb;
    text-decoration:none;
    transition:0.3s;
}

.sidebar a:hover{
    background:#4b5cff;
    color:white;
}

/* MAIN */
.main {
    margin-left:230px;
    padding:40px;
}

.box{
    width:650px;
    background:white;
    padding:30px;
    border-radius:10px;
    box-shadow:0 5px 20px rgba(0,0,0,0.15);
}

h2{
    margin-bottom:20px;
    color:#2c5364;
}

label{
    font-weight:bold;
}

input,textarea,select{
    width:100%;
    padding:10px;
    margin:8px 0 15px 0;
    border-radius:6px;
    border:1px solid #ccc;
}

.btn{
    background:#4b5cff;
    color:white;
    border:none;
    padding:10px 20px;
    border-radius:6px;
    cursor:pointer;
}

.btn:hover{
    background:#3547d8;
}

/* GRID */
.gvStyle{
    width:100%;
    margin-top:30px;
    border-collapse:collapse;
    background:white;
    box-shadow:0 5px 15px rgba(0,0,0,0.1);
}

.gvStyle th{
    background:#2c5364;
    color:white;
    padding:10px;
    text-align:center;
}

.gvStyle td{
    padding:8px;
    text-align:center;
    border-bottom:1px solid #eee;
}

.gvStyle tr:hover{
    background:#f2f2f2;
}

/* COLORFUL BUTTONS */
.editBtn{
    background:#27ae60;
    color:white;
    padding:6px 12px;
    border-radius:5px;
    text-decoration:none;
}

.editBtn:hover{
    background:#1e8449;
}

.deleteBtn{
    background:#e74c3c;
    color:white;
    padding:6px 12px;
    border-radius:5px;
    text-decoration:none;
}

.deleteBtn:hover{
    background:#c0392b;
}

</style>
</head>

<body>
<form id="form1" runat="server">

<!-- SIDEBAR -->
<div class="sidebar">
    <h3>Krishna Science School</h3>
   <a href="Default.aspx">🏠 Home</a>
        <a href="Dashboard.aspx">📊 Dashboard</a>
        <a href="Register.aspx">📝 Register</a>
        <a href="Courses.aspx">📚 Courses</a>
        <a href="Subjects.aspx">📖 Subjects</a>
        <a href="SchoolClasses.aspx">🏫 School Classes</a>
        <a href="Students.aspx">👨‍🎓 Students</a>
        <a href="StudentMarks.aspx">📊 Student Marks</a>
        <a href="Grades.aspx">🧾 Grades</a>
        <a href="Attendance.aspx">📅 Attendance</a>
        <a href="Teachers.aspx">👩‍🏫 Teachers</a></div>
<div class="main">

<div class="box">
<h2>Teacher Entry Form</h2>

<label>Teacher Name</label>
<asp:TextBox ID="txtName" runat="server"></asp:TextBox>

<label>Subject</label>
<asp:DropDownList ID="ddlSubject" runat="server"></asp:DropDownList>

<asp:HiddenField ID="hfTeacherID" runat="server" />

<label>Mobile No</label>
<asp:TextBox ID="txtMobile" runat="server"></asp:TextBox>

<label>Email</label>
<asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>

<label>Address</label>
<asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine"></asp:TextBox>

<asp:Button ID="btnSave" runat="server"
    Text="Save Teacher"
    CssClass="btn"
    OnClick="btnSave_Click" />
</div>

<!-- GRID -->
<asp:GridView ID="gvTeachers" runat="server"
    CssClass="gvStyle"
    AutoGenerateColumns="False"
    DataKeyNames="TeacherID"
    OnRowCommand="gvTeachers_RowCommand">

    <Columns>
        <asp:BoundField DataField="TeacherName" HeaderText="Name" />
        <asp:BoundField DataField="SubjectID" HeaderText="Subject" />
        <asp:BoundField DataField="MobileNo" HeaderText="Mobile" />
        <asp:BoundField DataField="Email" HeaderText="Email" />
        <asp:BoundField DataField="Address" HeaderText="Address" />
        <asp:BoundField DataField="CreatedDate"
            HeaderText="Date"
            DataFormatString="{0:dd/MM/yyyy}" />

        <asp:TemplateField>
            <ItemTemplate>
                <asp:LinkButton ID="btnEdit" runat="server"
                    Text="Edit"
                    CommandName="EditRow"
                    CommandArgument='<%# Eval("TeacherID") %>'
                    CssClass="editBtn" />

                &nbsp;

                <asp:LinkButton ID="btnDelete" runat="server"
                    Text="Delete"
                    CommandName="DeleteRow"
                    CommandArgument='<%# Eval("TeacherID") %>'
                    CssClass="deleteBtn"
                    OnClientClick="return confirm('Are you sure?');" />
            </ItemTemplate>
        </asp:TemplateField>

    </Columns>
</asp:GridView>

</div>
</form>
</body>
</html>


