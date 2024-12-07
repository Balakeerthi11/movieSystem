<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            color: #333;
        }
        h1 {
            text-align: center;
            color: #444;
            margin: 20px 0;
        }
        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .highlight {
            background-color: #fffae6 !important;
        }
    </style>
    <script>
        // Highlight row on click
        function highlightRow(event) {
            const rows = document.querySelectorAll('tbody tr');
            rows.forEach(row => row.classList.remove('highlight'));
            event.currentTarget.classList.add('highlight');
        }

        // Sort table by column
        function sortTable(columnIndex) {
            const tableBody = document.querySelector('table tbody');
            const rows = Array.from(tableBody.rows);

            rows.sort((row1, row2) => {
                const cell1 = row1.cells[columnIndex].innerText.toLowerCase();
                const cell2 = row2.cells[columnIndex].innerText.toLowerCase();
                return cell1.localeCompare(cell2);
            });

            // Append sorted rows back to table body
            rows.forEach(row => tableBody.appendChild(row));
        }

        // Add event listeners
        document.addEventListener('DOMContentLoaded', () => {
            const rows = document.querySelectorAll('tbody tr');
            rows.forEach(row => row.addEventListener('click', highlightRow));

            const headers = document.querySelectorAll('thead th');
            headers.forEach((header, index) => {
                header.addEventListener('click', () => sortTable(index));
            });
        });
    </script>
</head>
<body>
    <h1>Booking Report</h1>
    <table>
        <thead>
            <tr>
                <th>Ticket ID</th>
                <th>Movie Name</th>
                <th>Show Time</th>
                <th>Seat Type</th>
                <th>Number of Seats</th>
                <th>Amount Payable</th>
                <th>Transaction ID</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="booking" items="${bookings}">
                <tr>
                    <td>${booking.ticketId}</td>
                    <td>${booking.movieName}</td>
                    <td>${booking.showTimeName}</td>
                    <td>${booking.seatType}</td>
                    <td>${booking.numberOfSeatBooking}</td>
                    <td>${booking.amountPayable}</td>
                    <td>${booking.transactionId}</td>
                    <td>${booking.status}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
