<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Attendance.aspx.cs" Inherits="Attendance" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Attendance - Krishna Science School</title>
    <style>
        body { margin:0; font-family:'Segoe UI', Arial; background:#f5f6fa; }
        
        /* Sidebar */
        .sidebar { position:fixed; width:220px; height:100%; background:#2f3640; padding-top:20px; }
        .sidebar .logo { text-align:center; color:#f5f6fa; font-size:22px; font-weight:bold; margin-bottom:20px; }
        .sidebar a { display:block; padding:12px 20px; color:#dcdde1; text-decoration:none; transition:0.3s; font-size:14px; }
        .sidebar a:hover { background:#718093; color:#fff; padding-left:30px; }

        /* Main */
        .main { margin-left:220px; padding:30px; }
        h2 { color:#2f3640; }

        /* Card */
        .card { background:#fff; padding:25px; border-radius:10px; box-shadow:0 8px 20px rgba(0,0,0,0.05); max-width:500px; margin-bottom:30px; }
        label { font-weight:600; display:block; margin-bottom:5px; color:#2f3640; }
        input, select, button { width:100%; padding:10px; margin-bottom:15px; border-radius:6px; border:1px solid #ccc; font-size:14px; }
        input:focus, select:focus { outline:none; border-color:#0097e6; }

        .saveBtn { background:#0097e6; color:#fff; border:none; cursor:pointer; font-weight:bold; transition:0.3s; }
        .saveBtn:hover { background:#40739e; }

        /* Grid */
        .grid { background:#fff; border-radius:10px; box-shadow:0 8px 20px rgba(0,0,0,0.05); padding:20px; }
        .grid table { width:100%; border-collapse:collapse; }
        .grid th { background:#0097e6; color:#fff; padding:12px; text-align:center; }
        .grid td { padding:10px; text-align:center; border-bottom:1px solid #eee; }
        .grid tr:hover { background:#f1f2f6; }

        .editBtn { background:#44bd32; color:#fff; padding:5px 10px; border-radius:5px; text-decoration:none; margin-right:5px; }
        .deleteBtn { background:#e84118; color:#fff; padding:5px 10px; border-radius:5px; text-decoration:none; }

        .message { font-weight:bold; margin-bottom:15px; color:#2f3640; }
    </style>
</head>
<body>
<form id="form1" runat="server">

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
        <h2>Attendance Management</h2>

        <asp:Label ID="lblMsg" runat="server" CssClass="message"></asp:Label>

        <!-- Attendance Form -->
        <div class="card">
            <asp:HiddenField ID="hfAttendanceId" runat="server" />

            <label>Select Student</label>
            <asp:DropDownList ID="ddlStudent" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlStudent_SelectedIndexChanged">
                <asp:ListItem Text="-- Select Student --" Value="0"></asp:ListItem>
            </asp:DropDownList>

            <label>Class</label>
            <asp:TextBox ID="txtClass" runat="server" ReadOnly="true" />

            <label>Student Name</label>
            <asp:TextBox ID="txtStudentName" runat="server" ReadOnly="true" />

            <label>Attendance Date</label>
            <asp:TextBox ID="txtDate" runat="server" />
            <script>
                document.getElementById('<%= txtDate.ClientID %>').setAttribute("type", "date");
            </script>

            <label>Status</label>
            <asp:DropDownList ID="ddlStatus" runat="server">
                <asp:ListItem Text="Present" Value="Present" />
                <asp:ListItem Text="Absent" Value="Absent" />
            </asp:DropDownList>

            <asp:Button ID="btnSave" runat="server" Text="Save Attendance" CssClass="saveBtn" OnClick="btnSave_Click" />
        </div>

        <!-- Attendance Grid -->
        <div class="grid">
            <asp:GridView ID="gvAttendance" runat="server" AutoGenerateColumns="False" DataKeyNames="AttendanceId" OnRowCommand="gvAttendance_RowCommand">
                <Columns>
                    <asp:BoundField DataField="AttendanceId" HeaderText="ID" />
                    <asp:BoundField DataField="StudentName" HeaderText="Student Name" />
                    <asp:BoundField DataField="ClassName" HeaderText="Class" />
                    <asp:BoundField DataField="AttendanceDate" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />

                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditRecord" CommandArgument='<%# Eval("AttendanceId") %>' Text="Edit" CssClass="editBtn" />
                            <asp:LinkButton ID="btnDelete" runat="server" CommandName="DeleteRecord" CommandArgument='<%# Eval("AttendanceId") %>' Text="Delete" CssClass="deleteBtn" OnClientClick="return confirm('Are you sure?');" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</form>
</body>
</html>
