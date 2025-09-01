<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="ASPNetStudentCRUD.Student" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: 40px auto;
            background: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .form-section {
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            gap: 10px;
        }

        .form-section input[type="text"] {
            width: 30%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        .btn {
            background: #0078d7;
            color: white;
            border: none;
            padding: 10px 18px;
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
        }

        .gridview th {
            background: #0078d7;
            color: white;
            padding: 10px;
        }

        .gridview td {
            padding: 10px;
            text-align: center;
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

            <div class="form-section">
                <asp:TextBox ID="txtName" runat="server" placeholder="Enter Student Name"></asp:TextBox>
                <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter Student Email"></asp:TextBox>
                <asp:TextBox ID="txtCourse" runat="server" placeholder="Enter Course"></asp:TextBox>
                <asp:Button ID="btnAdd" runat="server" Text="Add Student" CssClass="btn" OnClick="btnAdd_Click" />
            </div>

            <asp:GridView ID="GridView1" runat="server" CssClass="gridview" AutoGenerateColumns="False" DataKeyNames="Id"
                OnRowEditing="GridView1_RowEditing" 
                OnRowUpdating="GridView1_RowUpdating" 
                OnRowCancelingEdit="GridView1_RowCancelingEdit" 
                OnRowDeleting="GridView1_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="true" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Course" HeaderText="Course" />
                    <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
