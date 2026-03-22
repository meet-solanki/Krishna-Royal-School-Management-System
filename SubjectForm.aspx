<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SubjectForm.aspx.cs" Inherits="SubjectForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Subject Form</title>

    <style>
        body {
            margin: 0;
            font-family: Arial;
            background: #f5f6fa;
        }

        /* SIDEBAR */
        .sidebar {
            position: fixed;
            width: 230px;
            height: 100%;
            background: #111;
            color: white;
        }

        .logo {
            padding: 20px;
            text-align: center;
            font-size: 18px;
            font-weight: bold;
        }

        .sidebar a {
            display: block;
            padding: 12px 20px;
            color: #ddd;
            text-decoration: none;
        }

        .sidebar a:hover, .active {
            background: #22c55e;
            color: black;
        }

        /* TOP BAR */
        .topbar {
            margin-left: 230px;
            background: #ddd;
            padding: 15px 25px;
            font-size: 18px;
            font-weight: bold;
        }

        /* CONTENT */
        .content {
            margin-left: 230px;
            padding: 30px;
        }

        .breadcrumb {
            background: #333;
            color: white;
            padding: 8px 15px;
            margin-bottom: 20px;
        }

        /* FORM CARD */
        .card {
            background: white;
            width: 420px;
            padding: 25px;
            border-radius: 8px;
            animation: slideUp 0.6s ease;
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        }

        @keyframes slideUp {
            from { transform: translateY(30px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        .btn-save {
            background: #22c55e;
            border: none;
            padding: 10px 18px;
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-back {
            background: #6b7280;
            border: none;
            padding: 10px 18px;
            color: white;
            border-radius: 5px;
            margin-left: 10px;
        }
    </style>
</head>

<body>
<form id="Form1" runat="server">

   <div class="sidebar">
    <div class="logo">Krishna Science School</div>
    <div class="menu">
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
</div>

    <!-- TOP -->
    <div class="topbar">Krishna Science School</div>

    <!-- CONTENT -->
    <div class="content">
        <div class="breadcrumb">Dashboard / Subjects / Form</div>

        <div class="card">
            <h2>Subject Form</h2>

            <div class="form-group">
                <label>Subject Name</label>
                <asp:TextBox ID="txtName" runat="server" />
            </div>

            <div class="form-group">
                <label>Description</label>
                <asp:TextBox ID="txtDesc" runat="server" />
            </div>

            <div class="form-group">
                <label>Credits</label>
                <asp:TextBox ID="txtCredits" runat="server" />
            </div>

            <asp:Button ID="btnSave" runat="server" Text="Save"
                CssClass="btn-save" OnClick="btnSave_Click" />

            <asp:Button ID="btnBack" runat="server" Text="Back"
                CssClass="btn-back" PostBackUrl="Subjects.aspx" />
        </div>
    </div>

</form>
</body>
</html>
