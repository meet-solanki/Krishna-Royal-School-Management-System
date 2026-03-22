<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GradeDetails.aspx.cs" Inherits="GradeDetails" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title>Grade Details - Krishna Science School</title>
    <style>
        body {
            font-family: "Segoe UI", Arial, sans-serif;
            margin: 0;
            background: #eef1f5;
        }

        .main {
            margin: 50px auto;
            max-width: 700px;
            animation: fadeIn 0.6s ease;
        }

        h2 {
            color: #1e2a38;
            text-align: center;
            margin-bottom: 20px;
        }

        .card {
            background: white;
            padding: 25px 30px;
            border-radius: 10px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15);
        }

        .labels {
            font-size: 16px;
            margin-bottom: 5px;
            color: #333;
        }

        .grid {
            margin-top: 20px;
        }

        .grid table {
            width: 100%;
            border-collapse: collapse;
        }

        .grid th {
            background: #1e2a38;
            color: white;
            padding: 10px;
            text-align: center;
        }

        .grid td {
            padding: 10px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        .grid tr:hover {
            background: #f1f1f1;
        }

        .backBtn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 18px;
            background: #1e2a38;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            transition: background 0.3s ease;
        }

        .backBtn:hover {
            background: #2f3e4e;
        }

        /* Fade-in animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <form id="Form1" runat="server">
        <div class="main">
            <h2>Grade Details</h2>
            <div class="card">
                <div class="labels"><asp:Label ID="lblStudent" runat="server" Text=""></asp:Label></div>
                <div class="labels"><asp:Label ID="lblClass" runat="server" Text=""></asp:Label></div>
                <div class="labels"><asp:Label ID="lblAverage" runat="server" Text=""></asp:Label></div>
                <div class="labels"><asp:Label ID="lblStatus" runat="server" Text=""></asp:Label></div>

                <div class="grid">
                    <asp:GridView ID="gvSubjects" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="SubjectName" HeaderText="Subject" />
                            <asp:BoundField DataField="Marks" HeaderText="Marks" />
                        </Columns>
                    </asp:GridView>
                </div>

                <a href="Grades.aspx" class="backBtn">← Back to Grades</a>
            </div>
        </div>
    </form>
</body>
</html>
