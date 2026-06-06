<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Thêm Laptop</title>

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

Thêm Laptop ASUS

</h1>

<form
action="products"
method="post">

<input
type="hidden"
name="action"
value="add">

<br>

Tên Laptop

<br>

<input
style="
width:100%;
padding:10px;"
type="text"
name="name">

<br><br>

Hãng

<br>

<input
style="
width:100%;
padding:10px;"
type="text"
name="brand">

<br><br>

Giá

<br>

<input
style="
width:100%;
padding:10px;"
type="number"
name="price">

<br><br>

Ảnh URL

<br>

<input
style="
width:100%;
padding:10px;"
type="text"
name="imageUrl">

<br><br>

<button
style="
background:#16a34a;
color:white;
padding:12px 20px;
border:none;
border-radius:10px;">

Thêm Sản Phẩm

</button>

</form>

</div>

</body>

</html>