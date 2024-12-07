<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking Report</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f9;
        margin: 20px;
    }
    h1 {
        text-align: center;
        color: #333;
    }
    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
        background-color: #fff;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }
    th, td {
        padding: 10px;
        text-align: left;
        border: 1px solid #ddd;
    }
    th {
        background-color: #007bff;
        color: #fff;
        cursor: pointer;
    }
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    tr:hover {
        background-color: #f1f1f1;
    }
    .highlight {
        background-color: #fffae6 !important;
    }
</style>
<script>
    // Highlight a row on click
    function highlightRow(event) {
        const rows = document.querySelectorAll('tbody tr');
        rows.forEach(row => row.classList.remove('highlight'));
        event.currentTarget.classList.add('highlight');
    }

    // Sort table by column
    function sortTable(columnIndex) {
        const table = document.querySelector('table tbody');
        const rows = Array.from(table.rows);

        rows.sort((row1, row2) => {
            const cell1 = row1.cells[columnIndex].innerText.toLowerCase();
            const cell2 = row2.cells[columnIndex].innerText.toLowerCase();
            return cell1.localeCompare(cell2);
        });

        rows.forEach(row => table.appendChild(row));
    }

    // Add event listeners
    document.addEventListener('DOMContentLoaded', () => {
        const rows = document.querySelectorAll('tbody tr');
        rows.forEach(row => row.addEventListener('click', highlightRow));

        const headers = document.querySelectorAll('thead th');
        headers.forEach((header, index) => header.addEventListener('click', () => sortTable(index)));
    });
</script>
</head>
<body>
	<h1>Booking Report</h1>
    <table>
        <thead>
            <tr>
                <th>Username</th>
                <th>Name</th>
                <th>Email</th>
                <th>Role</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="customer" items="${customers}">
                <tr>
                    <td>${customer.username}</td>
                    <td>${customer.name}</td>
                    <td>${customer.email}</td>
                    <td>${customer.role}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
