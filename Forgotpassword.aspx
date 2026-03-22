<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Forgotpassword.aspx.cs" Inherits="Forgotpassword" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Forgot Password</title>

    <style>
        body {
            margin:0;
            padding:0;
            font-family:'Segoe UI';
            background: linear-gradient(135deg,#4e73df,#1cc88a);
            height:100vh;
            display:flex;
            justify-content:center;
            align-items:center;
        }

        .box {
            width:400px;
            background:white;
            padding:40px;
            border-radius:15px;
            box-shadow:0 10px 25px rgba(0,0,0,0.3);
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity:0; transform:translateY(-20px); }
            to { opacity:1; transform:translateY(0); }
        }

        h2 {
            text-align:center;
            color:#4e73df;
        }

        .txt {
            width:100%;
            padding:10px;
            margin-top:15px;
            border-radius:8px;
            border:1px solid #ccc;
        }

        .btn {
            width:100%;
            padding:10px;
            margin-top:20px;
            border:none;
            border-radius:8px;
            background:#4e73df;
            color:white;
            font-size:16px;
            cursor:pointer;
        }

        .btn:hover {
            background:#2e59d9;
        }

        .msg {
            text-align:center;
            margin-top:15px;
            font-weight:bold;
        }

        .back {
            text-align:center;
            margin-top:15px;
        }

        .back a {
            text-decoration:none;
            color:#1cc88a;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="box">
            <h2>Forgot Password</h2>

            <asp:TextBox ID="txtUsername"
                runat="server"
                CssClass="txt"
                Placeholder="Enter Username">
            </asp:TextBox>

            <asp:Button ID="btnRecover"
                runat="server"
                Text="Recover Password"
                CssClass="btn"
                OnClick="btnRecover_Click" />

            <asp:Label ID="lblMessage"
                runat="server"
                CssClass="msg">
            </asp:Label>

            <div class="back">
                <a href="Login.aspx">Back to Login</a>
            </div>
        </div>
    </form>
</body>
</html>
