<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashbord" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>

<style>
/* ===== RESET ===== */
body {
    margin: 0;
    font-family: 'Segoe UI', Arial;
    background: #f4f6f9;
}

/* ===== SIDEBAR ===== */
.sidebar {
    position: fixed;
    width: 240px;
    height: 100vh;
    background: linear-gradient(180deg, #111, #2c2c2c);
    color: #fff;
    display: flex;
    flex-direction: column;
}

.menu {
    flex: 1;
}

.logo {
    padding: 20px;
    font-size: 20px;
    font-weight: bold;
    background: #000;
    text-align: center;
}

.menu a {
    display: block;
    padding: 14px 22px;
    color: #ddd;
    text-decoration: none;
    transition: 0.3s;
}

.menu a:hover {
    background: #3498db;
    padding-left: 30px;
    color: #fff;
}

/* ===== MAIN ===== */
.main {
    margin-left: 240px;
}

/* ===== TOP NAVBAR ===== */
.topbar {
    height: 55px;
    background: #ddd;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 25px;
    animation: fadeDown 0.8s ease;
}

.topbar a {
    margin-left: 18px;
    text-decoration: none;
    color: #333;
    font-size: 14px;
}

/* ===== CONTENT ===== */
.content {
    padding: 25px;
    animation: fadeUp 1s ease;
}

h2 {
    margin: 0;
}

.cards {
    margin-top: 30px;
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(220px,1fr));
    gap: 20px;
}

.card {
    background: #fff;
    padding: 25px;
    border-radius: 14px;
    box-shadow: 0 20px 35px rgba(0,0,0,0.15);
    transition: 0.4s;
    animation: zoomIn 0.9s ease;
}

.card:hover {
    transform: translateY(-10px);
}

.card h3 {
    margin: 0;
    font-size: 16px;
    color: #555;
}

.card p {
    font-size: 30px;
    color: #3498db;
    margin-top: 10px;
}
/* ===== LOGOUT BUTTON ===== */
.logout-btn {
    padding: 14px;
    text-align: center;
    text-decoration: none;
    color: #fff;
    background: linear-gradient(45deg, #e74c3c, #c0392b);
    margin: 15px;
    border-radius: 8px;
    transition: 0.3s;
    font-weight: 600;
}

.logout-btn:hover {
    background: linear-gradient(45deg, #c0392b, #922b21);
    transform: translateY(-3px);
}


/* ===== ANIMATIONS ===== */
@keyframes slideLeft {
    from { transform: translateX(-100%); }
    to { transform: translateX(0); }
}

@keyframes fadeDown {
    from { opacity: 0; transform: translateY(-20px); }
    to { opacity: 1; transform: translateY(0); }
}

@keyframes fadeUp {
    from { opacity: 0; transform: translateY(30px); }
    to { opacity: 1; transform: translateY(0); }
}

@keyframes zoomIn {
    from { opacity: 0; transform: scale(0.7); }
    to { opacity: 1; transform: scale(1); }
}
</style>
</head>

<body>
<form id="Form1" runat="server">

<!-- SIDEBAR -->
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
           <asp:LinkButton ID="btnLogout" runat="server"
                CssClass="logout-btn"
                OnClick="btnLogout_Click">
                🚪 Logout
           </asp:LinkButton>

</div>

</div>

<!-- MAIN -->
<div class="main">

    <!-- TOP BAR -->
    <div class="topbar">
        <div>Dashboard</div>
        <div>
            <a href="Default.aspx">Home</a>
            <a href="Dashboard.aspx">Dashboard</a>
            <a href="Register.aspx">Register</a>
            <a href="Login.aspx">Account ▼</a>
        </div>
    </div>

    <!-- CONTENT -->
    <div class="content">
        <h2>Admin Dashboard</h2>
        <p>Welcome, Admin!</p>

        <div class="cards">

    <div class="card">
        <h3>Total Students</h3>
        <p><asp:Label ID="lblStudents" runat="server"></asp:Label></p>
    </div>

    <div class="card">
        <h3>Total Teachers</h3>
        <p><asp:Label ID="lblTeachers" runat="server"></asp:Label></p>
    </div>

    <div class="card">
        <h3>Total Courses</h3>
        <p><asp:Label ID="lblCourses" runat="server"></asp:Label></p>
    </div>

    <div class="card">
        <h3>Total Subjects</h3>
        <p><asp:Label ID="lblSubjects" runat="server"></asp:Label></p>
    </div>

</div>

    </div>

</div>

</form>
</body>
</html>
