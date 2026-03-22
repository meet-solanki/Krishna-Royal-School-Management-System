<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SchoolClasses.aspx.cs" Inherits="SchoolClasses" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>School Classes</title>

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
            transition: 0.4s;
        }

        .logo {
            padding: 20px;
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            background: #000;
        }

        .sidebar a {
            display: block;
            padding: 12px 20px;
            color: #ddd;
            text-decoration: none;
            transition: 0.3s;
        }

        .sidebar a:hover {
            background: #22c55e;
            color: black;
            padding-left: 30px;
        }

        /* TOP BAR */
        .topbar {
            margin-left: 230px;
            background: #dcdcdc;
            padding: 15px 25px;
            font-size: 18px;
            font-weight: bold;
        }

        /* CONTENT */
        .content {
            margin-left: 230px;
            padding: 25px;
        }

        .breadcrumb {
            background: #333;
            color: white;
            padding: 8px 15px;
            margin-bottom: 20px;
        }

        .btn-add {
            background: #22c55e;
            color: white;
            padding: 8px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .card {
            background: white;
            padding: 15px;
            border-radius: 6px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .grid th {
            background: #f0f0f0;
            padding: 10px;
            text-align: left;
        }

        .grid td {
            padding: 10px;
            border-bottom: 1px solid #eee;
        }

        .btn-edit {
            background: #facc15;
            padding: 5px 10px;
            border-radius: 4px;
            color: black;
            text-decoration: none;
        }

        .btn-delete {
            background: #ef4444;
            padding: 5px 10px;
            border-radius: 4px;
            color: white;
            text-decoration: none;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <!-- SIDEBAR -->
    <div class="sidebar">
        <div class="logo">Krishna Science School</div>
          <a href="Default.aspx">🏠 Home</a>
        <a href="Dashboard.aspx">📊 Dashboard</a>
        <a href="Register.aspx">📝 Register</a>
        <a href="Courses.aspx">📚 Courses</a>
        <a href="Subjects.aspx">📖 Subjects</a>
        <a href="SchoolClasses.aspx" style="background:#22c55e;color:black;">🏫 School Classes</a>
        <a href="Students.aspx">👨‍🎓 Students</a>
        <a href="StudentMarks.aspx">📊 Student Marks</a>
        <a href="Grades.aspx">🧾 Grades</a>
        <a href="Attendance.aspx">📅 Attendance</a>
        <a href="Teachers.aspx">👩‍🏫 Teachers</a>
    </div>

    <!-- TOP BAR -->
    <div class="topbar">
        Krishna Science School
    </div>

    <!-- CONTENT -->
    <div class="content">
        <div class="breadcrumb">Dashboard / SchoolClasses / Index</div>

        <h2>School Classes</h2>

        <asp:Button ID="btnNew" runat="server" Text="Create New School Class"
            CssClass="btn-add" OnClick="btnNew_Click" />

        <br /><br />

        <div class="card">
            <asp:GridView ID="gvClasses" runat="server" AutoGenerateColumns="False"
                CssClass="grid" Width="100%" OnRowCommand="gvClasses_RowCommand">
                <Columns>
                    <asp:BoundField DataField="ClassName" HeaderText="Class Name" />
                    <asp:BoundField DataField="StartDate" HeaderText="Start Date" />
                    <asp:BoundField DataField="EndDate" HeaderText="End Date" />

                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" Text="Edit"
                                CssClass="btn-edit"
                                CommandName="EditRow"
                                CommandArgument='<%# Eval("ClassId") %>' />
                            &nbsp;
                            <asp:LinkButton ID="LinkButton2" runat="server" Text="Delete"
                                CssClass="btn-delete"
                                CommandName="DeleteRow"
                                CommandArgument='<%# Eval("ClassId") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>

</form>
</body></html>
