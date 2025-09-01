<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="student.aspx.cs" Inherits="LAB9.student" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Management (CRUD)</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: 30px auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .form-section {
            margin-bottom: 20px;
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            justify-content: space-between;
        }

        .form-section input[type="text"] {
            flex: 1;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        .btn {
            background: #0078d7;
            color: white;
            border: none;
            padding: 10px 16px;
            border-radius: 6px;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn:hover {
            background: #005fa3;
        }

        .gridview {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        .gridview th, .gridview td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }

        .gridview th {
            background: #0078d7;
            color: white;
        }

        .gridview tr:nth-child(even) {
            background: #f9f9f9;
        }

        .gridview tr:hover {
            background: #f1f1f1;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Student Management System (CRUD)</h2>

            <!-- Input Fields -->
            <div class="form-section">
                <asp:TextBox ID="txtenroll" runat="server" placeholder="Enrollment No"></asp:TextBox>
                <asp:TextBox ID="txtname" runat="server" placeholder="Student Name"></asp:TextBox>
                <asp:TextBox ID="txtsem" runat="server" placeholder="Semester"></asp:TextBox>
                <asp:TextBox ID="txtspi" runat="server" placeholder="SPI"></asp:TextBox>
                <asp:TextBox ID="txtcpi" runat="server" placeholder="CPI"></asp:TextBox>
                <asp:Button ID="btnsubmit" runat="server" Text="Add Student" CssClass="btn" OnClick="btnsubmit_Click" />
            </div>

            <!-- GridView -->
            <asp:GridView ID="grdData" runat="server" CssClass="gridview" AutoGenerateColumns="False" DataKeyNames="EnrollmentNo"
                AllowPaging="true" PageSize="5"
                OnPageIndexChanging="grdData_PageIndexChanging"
                OnRowEditing="grdData_RowEditing"
                OnRowUpdating="grdData_RowUpdating"
                OnRowCancelingEdit="grdData_RowCancelingEdit"
                OnRowDeleting="grdData_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="EnrollmentNo" HeaderText="Enrollment No" ReadOnly="true" />
                    <asp:BoundField DataField="StudentName" HeaderText="Name" />
                    <asp:BoundField DataField="StudentSemester" HeaderText="Semester" />
                    <asp:BoundField DataField="StudentSPI" HeaderText="SPI" />
                    <asp:BoundField DataField="StudentCPI" HeaderText="CPI" />
                    <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
