
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Krishna Science School</title>

    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Arial;
            background: url('images/School-bg.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        .overlay {
            width: 100%;
            height: 100vh;
            background: rgba(0,0,0,0.6);
            text-align: center;
        }

        .hero-box {
            position: relative;
            top: 30%;
            color: white;
            animation: fadeSlide 1.5s ease;
        }

        .title {
            font-size: 48px;
            letter-spacing: 2px;
            margin-bottom: 10px;
        }

        .subtitle {
            font-size: 20px;
            margin-bottom: 40px;
            color: #ddd;
        }

        .btn {
            padding: 12px 30px;
            font-size: 16px;
            border: none;
            cursor: pointer;
            margin: 0 10px;
            transition: 0.4s;
        }

        .btn-login {
            background: #1abc9c;
            color: #fff;
        }

        .btn-login:hover {
            background: #16a085;
            transform: scale(1.1);
        }

        .btn-about {
            background: transparent;
            color: #fff;
            border: 2px solid #fff;
        }

        .btn-about:hover {
            background: #fff;
            color: #000;
            transform: scale(1.1);
        }

        @keyframes fadeSlide {
            from {
                opacity: 0;
                top: 40%;
            }
            to {
                opacity: 1;
                top: 30%;
            }
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="overlay">
            <div class="hero-box">
                <h1 class="title">Krishna Science School</h1>
                <p class="subtitle">Knowledge • Discipline • Success</p>

                <asp:Button ID="btnLogin" runat="server" Text="Login"
                    CssClass="btn btn-login"
                    PostBackUrl="Login.aspx" />

                <asp:Button ID="btnAbout" runat="server" Text="About School"
                    CssClass="btn btn-about"
                    PostBackUrl="About.aspx" onclick="btnAbout_Click" />
            </div>
        </div>
    </form>
</body>
</html>
