<%@ page import="model.Product"%>

<%

Product p =
(Product)
request.getAttribute(
"product");

%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Sửa Laptop</title>

<link rel="stylesheet"
href="css/style.css">

</head>

<body>

<div
style="
width:600px;
margin:50px auto;
background:white;
padding:30px;
border-radius:20px;">

<h1>

Sửa Laptop

</h1>

<form
action="products"
method="post">

<input
type="hidden"
name="action"
value="update">

<input
type="hidden"
name="id"
value="<%=p.getId()%>">

<br>

Tên Laptop

<br>

<input
style="
width:100%;
padding:10px;"
type="text"
name="name"
value="<%=p.getName()%>">

<br><br>

Hãng

<br>

<input
style="
width:100%;
padding:10px;"
type="text"
name="brand"
value="<%=p.getBrand()%>">

<br><br>

Giá

<br>

<input
style="
width:100%;
padding:10px;"
type="number"
name="price"
value="<%=p.getPrice()%>">

<br><br>

Ảnh URL

<br>

<input
style="
width:100%;
padding:10px;"
type="text"
name="imageUrl"
value="<%=p.getImageUrl()%>">

<br><br>

<button
style="
background:#2563eb;
color:white;
padding:12px 20px;
border:none;
border-radius:10px;">

Cập Nhật

</button>

</form>

</div>

</body>

</html>