<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Courses.aspx.cs" Inherits="Courses" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <title>Course Management</title>

    <style>
        body {
            font-family: 'Segoe UI', Arial;
            background: #f3f4f6;
            margin: 0;
            padding: 0;
        }

        .container {
            margin-left: 260px;
            padding: 30px;
        }

        .card {
            background: #fff;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
            margin-bottom: 25px;
            animation: fadeIn 0.6s ease;
        }
        .sidebar {
    position: fixed;
    left: 0;
    top: 0;
    width: 240px;
    height: 100%;
    background: linear-gradient(180deg, #111827, #1f2933);
    color: white;
    padding-top: 20px;
    box-shadow: 4px 0 15px rgba(0,0,0,0.3);
}

.logo {
    text-align: center;
    margin-bottom: 30px;
}

.logo span {
    font-size: 32px;
    color: #22c55e;
}

.logo h3 {
    margin: 5px 0 0;
    font-size: 18px;
}

.menu {
    list-style: none;
    padding: 0;
}

.menu li {
    margin: 5px 0;
}

.menu li a {
    display: block;
    padding: 12px 20px;
    color: #d1d5db;
    text-decoration: none;
    font-size: 14px;
    transition: 0.3s;
}

.menu li a:hover {
    background: #2563eb;
    color: white;
    border-radius: 0 25px 25px 0;
}

.menu .active a {
    background: #22c55e;
    color: black;
    font-weight: bold;
    border-radius: 0 25px 25px 0;
}
.container {
    margin-left: 260px;
    padding: 30px;
}



        h2 {
            margin-top: 0;
            border-bottom: 2px solid #e5e7eb;
            padding-bottom: 10px;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .form-control {
            width: 100%;
            padding: 12px;
            border-radius: 6px;
            border: 1px solid #d1d5db;
            font-size: 14px;
        }

        .form-control:focus {
            outline: none;
            border-color: #2563eb;
            box-shadow: 0 0 5px rgba(37,99,235,0.4);
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }

        .btn-save {
            background: #22c55e;
            color: white;
        }

        .btn-clear {
            background: #6b7280;
            color: white;
            margin-left: 10px;
        }

        .msg {
            margin-top: 15px;
            color: green;
            font-weight: 600;
        }

        /* Grid */
        .grid {
            width: 100%;
            border-collapse: collapse;
        }

        .grid th {
            background: #2563eb;
            color: white;
            padding: 10px;
        }

        .grid td {
            padding: 10px;
            border-bottom: 1px solid #e5e7eb;
        }

        .action-btn {
            padding: 5px 10px;
            border-radius: 4px;
            color: white;
            text-decoration: none;
            font-size: 13px;
        }

        .edit { background: #facc15; color: black; }
        .delete { background: #ef4444; }
        .details { background: #3b82f6; }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>

<body>
<form id="form1" runat="server">
<div class="sidebar">
    <div class="logo">
        <span>&lt;/&gt;</span>
        <h4>Krishna Science School</h4>
    </div>

    <ul class="menu">
        <li> <a href="Default.aspx">🏠 Home</a></li>
        <li><a href="Dashboard.aspx">📊 Dashboard</a></li>
        <li><a href="Register.aspx">👤 Register</a></li>
        <li class="active"><a href="Courses.aspx">📘 Courses</a></li>
        <li><a href="Subjects.aspx">📚 Subjects</a></li>
        <li><a href="SchoolClasses.aspx">🏫 School Classes</a></li>
        <li><a href="Students.aspx">🎓 Students</a></li>
        <li> <a href="StudentMarks.aspx">📊 Student Marks</a></li>
        <li><a href="Grades.aspx">📊 Grades</a></li>
        <li><a href="Attendance.aspx">🕒 Attendance</a></li>
        <li><a href="Teachers.aspx">👩‍🏫 Teachers</a></li>
    </ul>
</div>

    <!-- COURSE FORM -->
    <div class="container">
        <div class="card">
            <h2>Course Form</h2>

            <asp:HiddenField ID="hfCourseId" runat="server" />

            <div class="form-group">
                <asp:TextBox ID="txtCourseName" runat="server" CssClass="form-control" Placeholder="Course Name"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" Placeholder="Description"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:TextBox ID="txtDuration" runat="server" CssClass="form-control" Placeholder="Duration (Weeks)"></asp:TextBox>
            </div>

            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-save" OnClick="btnSave_Click" />
            <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-clear" OnClick="btnClear_Click" />

            <asp:Label ID="lblMsg" runat="server" CssClass="msg"></asp:Label>
        </div>

        <!-- COURSE LIST -->
        <div class="card">
            <h2>Course List</h2>

            <asp:GridView ID="gvCourses" runat="server" CssClass="grid" AutoGenerateColumns="False"
                OnRowCommand="gvCourses_RowCommand">
                <Columns>
                    <asp:BoundField DataField="CourseName" HeaderText="Course Name" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:BoundField DataField="Duration" HeaderText="Duration (Weeks)" />

                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="EditRow"
                                CommandArgument='<%# Eval("CourseId") %>' CssClass="action-btn edit">Edit</asp:LinkButton>

                            <asp:LinkButton ID="LinkButton2" runat="server" CommandName="DeleteRow"
                                CommandArgument='<%# Eval("CourseId") %>' CssClass="action-btn delete"
                                OnClientClick="return confirm('Delete this course?');">Delete</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>

</form>
</body>
</html>
