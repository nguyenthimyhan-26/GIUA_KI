<%@ page import="java.util.*"%>
<%@ page import="model.Product"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>ASUS Store</title>

<link rel="stylesheet"
href="css/style.css">

</head>

<body>

<header>

<div class="logo">

ASUS STORE

</div>

<div class="menu">

<a href="index.jsp">

Trang Chủ

</a>

<a href="doitiente.jsp">

Đổi Tiền

</a>

</div>

</header>

<div class="banner">

<h1>

ASUS GAMING LAPTOP

</h1>

</div>

<div class="container">

<div class="search-box">

<form action="products">

<input
type="text"
name="search"
placeholder="Tìm kiếm laptop...">

<button>

Tìm kiếm

</button>

<a
class="add-btn"
href="addproduct.jsp">

Thêm Laptop

</a>

</form>

</div>

<div class="products">

<%

List<Product> list =
(List<Product>)
request.getAttribute(
"products");

if(list != null){

for(Product p:list){

%>

<div class="card">

<img src="<%=p.getImageUrl()%>">

<div class="card-body">

<h2>

<%=p.getName()%>

</h2>

<p>

Hãng:
<%=p.getBrand()%>

</p>

<p class="price">

<%=String.format(
"%,.0f",
p.getPrice())%>

VNĐ

</p>

<div class="action">

<a
class="edit"
href="products?action=edit&id=<%=p.getId()%>">

Sửa

</a>

<a
class="delete"
href="products?action=delete&id=<%=p.getId()%>">

Xóa

</a>

</div>

</div>

</div>

<%
}
}
%>

</div>

</div>

</body>

</html>