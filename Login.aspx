<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Admin Login | Krishna Science School</title>

<style>
body {
    margin: 0;
    min-height: 100vh;
    font-family: 'Segoe UI', Arial;
    background: linear-gradient(120deg, #1abc9c, #3498db);
}

.login-wrapper {
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
}

.login-card {
    width: 380px;
    background: rgba(255,255,255,0.95);
    border-radius: 18px;
    padding: 35px;
    box-shadow: 0 30px 60px rgba(0,0,0,0.3);
    animation: popIn 1.1s ease;
}

h2 {
    text-align: center;
    margin-bottom: 25px;
    color: #333;
}

.txt {
    width: 100%;
    padding: 14px;
    margin-top: 14px;
    border-radius: 8px;
    border: 1px solid #ccc;
    font-size: 15px;
}

.password-box {
    position: relative;
}

.eye {
    position: absolute;
    right: 12px;
    top: 50%;
    transform: translateY(-50%);
    cursor: pointer;
    font-size: 18px;
    opacity: 0.6;
}

.eye:hover {
    opacity: 1;
}

.btn-login {
    width: 100%;
    margin-top: 22px;
    padding: 14px;
    background: linear-gradient(90deg, #1abc9c, #16a085);
    border: none;
    color: white;
    font-size: 16px;
    border-radius: 8px;
    cursor: pointer;
    transition: 0.4s;
}

.btn-login:hover {
    transform: scale(1.06);
    box-shadow: 0 10px 20px rgba(26,188,156,0.5);
}

/* Back Button Style */
.btn-back {
    width: 100%;
    margin-top: 10px;
    padding: 12px;
    background: #555;
    border: none;
    color: white;
    font-size: 15px;
    border-radius: 8px;
    cursor: pointer;
    transition: 0.3s;
}

.btn-back:hover {
    background: #333;
}

.links {
    text-align: center;
    margin-top: 18px;
}

.links a {
    color: #3498db;
    text-decoration: none;
    margin: 0 8px;
    font-size: 14px;
}

.error {
    text-align: center;
    margin-top: 12px;
    color: red;
}

@keyframes popIn {
    from {
        opacity: 0;
        transform: scale(0.7) translateY(40px);
    }
    to {
        opacity: 1;
        transform: scale(1) translateY(0);
    }
}
</style>

<script type="text/javascript">
    function togglePassword() {
        var pwd = document.getElementById('<%= txtPassword.ClientID %>');
        pwd.type = (pwd.type === "password") ? "text" : "password";
    }
</script>

</head>

<body>
<form id="form1" runat="server">
<div class="login-wrapper">
<div class="login-card">

<h2>Admin Login</h2>

<!-- Username -->
<asp:TextBox ID="txtUsername" runat="server"
    CssClass="txt" placeholder="Username"></asp:TextBox>

<asp:RequiredFieldValidator ID="rfvUser" runat="server"
    ControlToValidate="txtUsername"
    ErrorMessage="Username is required"
    ForeColor="Red"
    Display="Dynamic" />

<!-- Password -->
<div class="password-box">
    <asp:TextBox ID="txtPassword" runat="server"
        CssClass="txt" TextMode="Password"
        placeholder="Password"></asp:TextBox>

    <span class="eye" onclick="togglePassword()">👁️</span>
</div>

<asp:RequiredFieldValidator ID="rfvPass" runat="server"
    ControlToValidate="txtPassword"
    ErrorMessage="Password is required"
    ForeColor="Red"
    Display="Dynamic" />

<!-- Login Button -->
<asp:Button ID="btnLogin" runat="server"
    Text="Login"
    CssClass="btn-login"
    OnClick="btnLogin_Click" />

<!-- Back Button (No Validation) -->
<asp:Button ID="btnBack" runat="server"
    Text="Back"
    CssClass="btn-back"
    PostBackUrl="Default.aspx"
    CausesValidation="false" onclick="btnBack_Click" />

<div class="links">
    <a href="ForgotPassword.aspx">Forgot Password?</a> |
    <a href="Register.aspx">New Register</a>
</div>

<asp:Label ID="lblMsg" runat="server" CssClass="error"></asp:Label>

</div>
</div>
</form>
</body>
</html>
