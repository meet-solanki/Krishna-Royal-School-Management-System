<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Grades.aspx.cs" Inherits="Grades" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Grades - Krishna Science School</title>
    <style>
        body{font-family:Segoe UI, Arial;margin:0;background:#eef1f5;}
        .sidebar{position:fixed;left:0;top:0;width:240px;height:100%;background:#1e2a38;color:white;padding-top:20px;}
        .logo{text-align:center;font-size:20px;font-weight:bold;padding-bottom:20px;border-bottom:1px solid #2f3e4e;}
        .sidebar a{display:block;padding:14px 20px;color:#cfd8dc;text-decoration:none;transition:0.3s;}
        .sidebar a:hover{background:#263544;color:white;padding-left:30px;}
        .main{margin-left:240px;padding:30px;}
        .card{background:white;padding:25px;border-radius:8px;box-shadow:0 4px 15px rgba(0,0,0,0.1);width:420px;}
        .card h3{margin-top:0;color:#1e2a38;}
        input, select{width:100%;padding:8px;margin-bottom:12px;border:1px solid #ccc;border-radius:4px;font-size:14px;}
        .saveBtn{width:100%;padding:10px;background:#1e2a38;color:white;border:none;border-radius:4px;cursor:pointer;transition:0.3s;}
        .saveBtn:hover{background:#2f3e4e;}
        .grid{margin-top:30px;background:white;padding:15px;border-radius:8px;box-shadow:0 4px 15px rgba(0,0,0,0.1);}
        .grid table{width:100%;border-collapse:collapse;}
        .grid th{background:#1e2a38;color:white;padding:10px;text-align:center;}
        .grid td{padding:8px;text-align:center;border-bottom:1px solid #ddd;}
        .grid tr:hover{background:#f1f1f1;}
    </style>
</head>
<body>
    <form id="Form1" runat="server">
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

        <div class="main">
            <h2>Grades Management</h2>
            <div class="card">
                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                <label>Student</label>
                <asp:DropDownList ID="ddlStudentName" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlStudentName_SelectedIndexChanged"></asp:DropDownList>
                <label>Class</label>
                <asp:TextBox ID="txtClassName" runat="server" ReadOnly="true" />
                <label>Average Grade</label>
                <asp:TextBox ID="txtAverageGrade" runat="server" ReadOnly="true" />
                <label>Status</label>
                <asp:TextBox ID="txtStatus" runat="server" ReadOnly="true" />
                <asp:Button ID="btnAdd" runat="server" Text="Save Grade" CssClass="saveBtn" OnClick="btnAdd_Click" />
                <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="saveBtn" OnClick="btnClear_Click" />
            </div>

            <div class="grid">
               <asp:GridView ID="gvGrades" runat="server" AutoGenerateColumns="False" 
                                DataKeyNames="GradeId" 
                                OnRowCommand="gvGrades_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="GradeId" HeaderText="ID" />
                        <asp:BoundField DataField="StudentName" HeaderText="Student" />
                        <asp:BoundField DataField="ClassName" HeaderText="Class" />
                        <asp:BoundField DataField="AverageGrade" HeaderText="Average Grade" DataFormatString="{0:0.00}" />
                        <asp:BoundField DataField="Status" HeaderText="Status" />
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:Button ID="btnDetails" runat="server" Text="Details" CommandName="ViewDetails" CommandArgument='<%# Container.DataItemIndex %>' BackColor="#007bff" ForeColor="White" BorderStyle="None" Width="70px" />
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="DeleteRow" CommandArgument='<%# Container.DataItemIndex %>' BackColor="#dc3545" ForeColor="White" BorderStyle="None" Width="70px" OnClientClick="return confirm('Are you sure to delete?');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
