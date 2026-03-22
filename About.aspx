<%@ Page Language="C#" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>About Us - Krishna Science School</title>

<style type="text/css">

body {
    margin: 0;
    font-family: 'Segoe UI', Arial;
    background: #f4f8ff;
}

/* Top Navigation */
.top-nav {
    position: absolute;
    top: 20px;
    right: 40px;
}

/* ASP Button Style */
.home-btn {
    background-color: white;
    color: #00264d;
    padding: 10px 22px;
    font-weight: bold;
    border-radius: 25px;
    border: none;
    cursor: pointer;
    transition: 0.3s;
    box-shadow: 0px 4px 10px rgba(0,0,0,0.2);
}

.home-btn:hover {
    background-color: #cce0ff;
    transform: scale(1.05);
}

/* Hero Section */
.hero {
    background: linear-gradient(to right, #00264d, #004080);
    color: white;
    padding: 80px 20px;
    text-align: center;
    animation: fadeIn 2s ease-in-out;
}

.hero h1 {
    font-size: 42px;
    margin-bottom: 20px;
}

.hero p {
    width: 70%;
    margin: auto;
    font-size: 18px;
    line-height: 1.8;
}

/* Content Section */
.section {
    width: 80%;
    margin: 70px auto;
    text-align: center;
    animation: slideUp 1.5s ease-in-out;
}

.section h2 {
    color: #003366;
    font-size: 30px;
    margin-bottom: 20px;
}

.section p {
    font-size: 17px;
    color: #444;
    line-height: 1.8;
}

/* Highlight Box */
.highlight {
    background: white;
    width: 80%;
    margin: 50px auto;
    padding: 40px;
    box-shadow: 0px 8px 20px #d6e0f5;
    text-align: center;
    transition: 0.4s;
}

.highlight:hover {
    transform: translateY(-8px);
}

.highlight h3 {
    color: #004080;
    margin-bottom: 20px;
}

/* Footer */
.footer {
    background: #00264d;
    color: white;
    text-align: center;
    padding: 20px;
    margin-top: 60px;
}

/* Animations */
@keyframes fadeIn {
    from { opacity: 0; }
    to { opacity: 1; }
}

@keyframes slideUp {
    from { transform: translateY(40px); opacity: 0; }
    to { transform: translateY(0); opacity: 1; }
}

</style>
</head>

<body>
<form id="form1" runat="server">

<!-- Home Button -->
<div class="top-nav">
    <asp:Button ID="btnHome" runat="server" Text="Home" 
        CssClass="home-btn" OnClick="btnHome_Click" />
</div>

<!-- Hero Section -->
<div class="hero">
    <h1>Welcome to Krishna Science School</h1>
    <p>
        At Krishna Science School, we believe education is not just about books —
        it is about building character, confidence, creativity, and leadership.
        Our institution is committed to nurturing young minds through innovation,
        discipline, and excellence.
    </p>
</div>

<!-- Who We Are -->
<div class="section">
    <h2>Who We Are</h2>
    <p>
        Established with a vision to transform education, Krishna Science School
        provides a dynamic and inspiring learning environment. We focus on
        academic excellence along with moral values and personality development.
    </p>
</div>

<!-- What Makes Us Different -->
<div class="highlight">
    <h3>What Makes Us Different?</h3>
    <p>
        ✔ Student-Centered Learning<br /><br />
        ✔ Highly Qualified & Dedicated Teachers<br /><br />
        ✔ Modern Classrooms & Smart Technology<br /><br />
        ✔ Safe, Secure & Positive Campus Environment
    </p>
</div>

<!-- Our Commitment -->
<div class="section">
    <h2>Our Commitment</h2>
    <p>
        We are dedicated to shaping responsible global citizens who are prepared
        to face future challenges with confidence and integrity.
        Our mission is to empower every student to discover their true potential.
    </p>
</div>

<div class="footer">
    © 2026 Krishna Science School | All Rights Reserved
</div>

</form>
</body>
</html>
