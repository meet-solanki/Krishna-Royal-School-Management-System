<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Register | Krishna Science School</title>

<style>
body {
    margin: 0;
    min-height: 100vh;
    font-family: 'Segoe UI', Arial;
    background: url('images/register.jpg') no-repeat center center fixed;
    background-size: cover;
}

/* Dark Overlay */
body::before {
    content: "";
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,0.45);
    z-index: -1;
}

/* Center Wrapper FIX */
.wrapper {
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
}

/* Card */
.card {
    width: 420px;
    background: rgba(255,255,255,0.96);
    padding: 35px;
    border-radius: 16px;
    box-shadow: 0 25px 45px rgba(0,0,0,0.4);
    animation: fadeUp 1.1s ease;
}

h2 {
    text-align: center;
    margin-bottom: 22px;
    color: #333;
}

.txt {
    width: 100%;
    padding: 12px;
    margin-top: 12px;
    border-radius: 8px;
    border: 1px solid #ccc;
    font-size: 14px;
}

.btn {
    width: 100%;
    margin-top: 20px;
    padding: 12px;
    background: linear-gradient(90deg, #8e44ad, #3498db);
    border: none;
    color: #fff;
    font-size: 16px;
    border-radius: 8px;
    cursor: pointer;
    transition: 0.4s;
}

.btn:hover {
    transform: scale(1.05);
}

/* Back Button */
.back-btn {
    width: 100%;
    margin-top: 10px;
    padding: 10px;
    background: #555;
    border: none;
    color: white;
    border-radius: 8px;
    cursor: pointer;
}

.back-btn:hover {
    background: #333;
}

.error {
    color: red;
    font-size: 13px;
}

@keyframes fadeUp {
    from { opacity: 0; transform: translateY(30px); }
    to { opacity: 1; transform: translateY(0); }
}
</style>
</head>

<body>
<form id="form1" runat="server">

<div class="wrapper">
<div class="card">

<h2>New Register</h2>

<!-- First Name -->
<asp:TextBox ID="txtFirstName" runat="server" CssClass="txt" placeholder="First Name" />
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
    ControlToValidate="txtFirstName"
    ErrorMessage="First Name required"
    CssClass="error" />

<!-- Last Name -->
<asp:TextBox ID="txtLastName" runat="server" CssClass="txt" placeholder="Last Name" />
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
    ControlToValidate="txtLastName"
    ErrorMessage="Last Name required"
    CssClass="error" />

<!-- Username -->
<asp:TextBox ID="txtUsername" runat="server" CssClass="txt" placeholder="Username" />
<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
    ControlToValidate="txtUsername"
    ErrorMessage="Username required"
    CssClass="error" />

<!-- Address -->
<asp:TextBox ID="txtAddress" runat="server" CssClass="txt"
    TextMode="MultiLine" Rows="3" placeholder="Address" />
<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
    ControlToValidate="txtAddress"
    ErrorMessage="Address required"
    CssClass="error" />

<!-- Password -->
<asp:TextBox ID="txtPassword" runat="server"
    CssClass="txt" TextMode="Password" placeholder="Password" />
<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
    ControlToValidate="txtPassword"
    ErrorMessage="Password required"
    CssClass="error" />

<!-- Register Button -->
<asp:Button ID="btnRegister" runat="server"
    Text="Register"
    CssClass="btn"
    OnClick="btnRegister_Click" />

<!-- Back Button -->
<asp:Button ID="btnBack" runat="server"
    Text="Back to Login"
    CssClass="back-btn"
    PostBackUrl="Login.aspx"
    CausesValidation="false" />

<asp:Label ID="lblMsg" runat="server"></asp:Label>

</div>
</div>

</form>
</body>
</html>
