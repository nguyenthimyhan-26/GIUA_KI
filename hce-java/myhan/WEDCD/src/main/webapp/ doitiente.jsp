<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>

<title>USD → VND Converter</title>

<style>

body{
    margin:0;
    font-family:Segoe UI;
    background:#0f172a;
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
}

.card{

    width:450px;

    background:white;

    padding:30px;

    border-radius:20px;

    box-shadow:0 10px 30px rgba(0,0,0,.3);

}

h1{

    color:#0ea5e9;

    text-align:center;

}

input{

    width:100%;

    padding:12px;

    margin-top:10px;

    margin-bottom:20px;

    border:1px solid #ccc;

    border-radius:10px;

}

button{

    width:100%;

    padding:12px;

    border:none;

    border-radius:10px;

    background:#0ea5e9;

    color:white;

    font-size:16px;

    cursor:pointer;

}

.result{

    margin-top:20px;

    padding:15px;

    background:#ecfeff;

    border-radius:10px;

}

.back{

    margin-top:15px;

    text-align:center;

}

a{

    text-decoration:none;

    color:#0ea5e9;

}

</style>

</head>

<body>

<div class="card">

<h1>USD → VND</h1>

<form action="convert" method="post">

    <label>Nhập số USD:</label>

    <input
        type="number"
        name="usd"
        step="0.01"
        required>

    <button type="submit">

        Chuyển đổi

    </button>

</form>

<%
if(request.getAttribute("vnd") != null){
%>

<div class="result">

    <h3>

        <%=request.getAttribute("usd")%> USD

        =

        <%=String.format("%,.0f",
        (Double)request.getAttribute("vnd"))%>

        VND

    </h3>

</div>

<%
}
%>

<%
if(request.getAttribute("error") != null){
%>

<p style="color:red">

<%=request.getAttribute("error")%>

</p>

<%
}
%>

<div class="back">

<a href="index.jsp">

← Quay lại trang chủ

</a>

</div>

</div>

</body>
</html>