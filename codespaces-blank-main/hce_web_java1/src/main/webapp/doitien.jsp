
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Đổi tiền tệ</title>
</head>
<body>

<h2>Chuyển đổi VND sang USD</h2>

<form action="currency" method="post">

    <label>Nhập số tiền VND:</label>

    <input type="number"
           name="vnd"
           step="0.01"
           required>

    <button type="submit">
        Chuyển đổi
    </button>

</form>

<%
if(request.getAttribute("usd") != null){
%>

<h3>
    <%= request.getAttribute("vnd") %> VND
    =
    <%= request.getAttribute("usd") %> USD
</h3>

<%
}
%>

</body>
</html>