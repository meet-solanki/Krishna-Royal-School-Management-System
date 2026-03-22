<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Students.aspx.cs" Inherits="StudentForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title>Students -Krishna Science School</title>

<style>
body{
    margin:0;
    font-family:Segoe UI, Arial;
    background:#eef1f5;
}

/* Sidebar */
.sidebar{
    position:fixed;
    left:0;
    top:0;
    width:240px;
    height:100%;
    background:#1e2a38;
    color:white;
    padding-top:20px;
}

.logo{
    text-align:center;
    font-size:20px;
    font-weight:bold;
    padding-bottom:20px;
    border-bottom:1px solid #2f3e4e;
}

.sidebar a{
    display:block;
    padding:14px 20px;
    color:#cfd8dc;
    text-decoration:none;
    transition:0.3s;
}

.sidebar a:hover{
    background:#263544;
    color:white;
    padding-left:30px;
}

/* Main */
.main{
    margin-left:240px;
    padding:30px;
    animation:fadeIn 0.6s ease;
}

/* Card */
.card{
    background:white;
    padding:25px;
    border-radius:8px;
    box-shadow:0 4px 15px rgba(0,0,0,0.1);
    width:420px;
}

.card h3{
    margin-top:0;
    color:#1e2a38;
}

/* Input */
input, select{
    width:100%;
    padding:8px;
    margin-bottom:12px;
    border:1px solid #ccc;
    border-radius:4px;
    font-size:14px;
}

/* Button */
.saveBtn{
    width:100%;
    padding:10px;
    background:#1e2a38;
    color:white;
    border:none;
    border-radius:4px;
    cursor:pointer;
    transition:0.3s;
}

.saveBtn:hover{
    background:#2f3e4e;
}

/* Grid */
.grid{
    margin-top:30px;
    background:white;
    padding:15px;
    border-radius:8px;
    box-shadow:0 4px 15px rgba(0,0,0,0.1);
}

.grid table{
    width:100%;
    border-collapse:collapse;
}

.grid th{
    background:#1e2a38;
    color:white;
    padding:10px;
    text-align:center;
}

.grid td{
    padding:8px;
    text-align:center;
    border-bottom:1px solid #ddd;
}

.grid tr:hover{
    background:#f1f1f1;
}

@keyframes fadeIn{
    from{opacity:0;transform:translateY(15px);}
    to{opacity:1;transform:translateY(0);}
}
</style>

</head>

<body>

<form id="Form1" runat="server">

<!-- Sidebar -->
<div class="sidebar">
<div class="logo">Krishna Science School</div>

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
<a href="Teachers.aspx">👩‍🏫 Teachers</a>
</div>

<!-- Main -->
<div class="main">

<h2>Students Management</h2>

<div class="card">

<h3>Add Student</h3>

Student Name
<asp:TextBox ID="txtName" runat="server" />

Gender
<asp:DropDownList ID="ddlGender" runat="server">
    <asp:ListItem Text="Male" Value="Male" />
    <asp:ListItem Text="Female" Value="Female" />
</asp:DropDownList>

Date Of Birth
<asp:TextBox ID="txtDOB" runat="server" />

Class Id
<asp:DropDownList ID="ddlClassId" runat="server"></asp:DropDownList>

<asp:Button ID="btnSave" runat="server"
    Text="Save Student"
    CssClass="saveBtn"
    OnClick="btnSave_Click" />

</div>

<!-- GridView -->
<div class="grid">

<asp:GridView ID="gvStudents" runat="server"
    AutoGenerateColumns="False"
    DataKeyNames="StudentId"
    OnRowCommand="gvStudents_RowCommand">

    <Columns>

        <asp:BoundField DataField="StudentId" HeaderText="ID" />
        <asp:BoundField DataField="StudentName" HeaderText="Student Name" />
        <asp:BoundField DataField="Gender" HeaderText="Gender" />
        <asp:BoundField DataField="DateOfBirth" HeaderText="Date Of Birth" 
            DataFormatString="{0:dd-MM-yyyy}" />
        <asp:BoundField DataField="ClassId" HeaderText="Class ID" />

        <asp:TemplateField HeaderText="Action">
            <ItemTemplate>

                <asp:Button ID="Button1" runat="server"
                    Text="Edit"
                    CommandName="EditRow"
                    CommandArgument='<%# Eval("StudentId") %>'
                    BackColor="#28a745"
                    ForeColor="White"
                    BorderStyle="None"
                    Padding="5"
                    Width="60px" />

                <asp:Button ID="Button2" runat="server"
                    Text="Delete"
                    CommandName="DeleteRow"
                    CommandArgument='<%# Eval("StudentId") %>'
                    BackColor="#dc3545"
                    ForeColor="White"
                    BorderStyle="None"
                    Padding="5"
                    Width="70px"
                    OnClientClick="return confirm('Are you sure to delete?');" />

            </ItemTemplate>
        </asp:TemplateField>

    </Columns>

</asp:GridView>

</div>

</div>

</form>

</body>
</html>
