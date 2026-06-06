<%@ page import="java.util.List"%>
<%@ page import="model.Product"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Cửa Hàng Laptop ASUS</title>
    <style>
        * { margin:0; padding:0; box-sizing:border-box; font-family:'Segoe UI', sans-serif; }
        body { background:#f1f5f9; }
        header { background:linear-gradient(135deg,#0f172a,#1e3a8a,#2563eb); padding:18px 40px; display:flex; justify-content:space-between; align-items:center; color: white; }
        .container { width:90%; max-width:1200px; margin:30px auto; }
        
        /* Cấu trúc thanh tìm kiếm */
        .search-box { text-align: center; margin: 25px 0; }
        .search-box input { padding: 12px; width: 350px; border: 2px solid #cbd5e1; border-radius: 6px 0 0 6px; outline: none; }
        .search-box button { padding: 12px 20px; background: #2563eb; color: white; border: none; border-radius: 0 6px 6px 0; cursor: pointer; font-weight: bold; }
        
        /* Grid sản phẩm */
        .products { display:grid; grid-template-columns:repeat(auto-fit, minmax(280px, 1fr)); gap:25px; }
        .card { background:white; border-radius:12px; overflow:hidden; box-shadow:0 4px 15px rgba(0,0,0,0.05); transition: 0.3s; }
        .card:hover { transform: translateY(-5px); }
        .card img { width:100%; height:180px; object-fit:cover; }
        .card-body { padding:15px; }
        .card-body h3 { font-size:18px; color:#1e3a8a; margin-bottom:8px; }
        .price { font-size:16px; font-weight:bold; color:#ef4444; margin-top:10px; }
        .no-data { text-align:center; width:100%; grid-column:1/-1; color:#64748b; font-size:18px; padding: 50px 0; }
    </style>
</head>
<body>

<header>
    <h2>💻 ASUS LAPTOP STORE</h2>
    <a href="index.jsp" style="color:white; text-decoration:none; font-weight:bold;">Trang chủ</a>
</header>

<div class="container">

    <div class="search-box">
        <form action="products" method="GET">
            <input type="text" name="search" value="${oldSearch != null ? oldSearch : ''}" placeholder="Nhập tên laptop ASUS cần tìm...">
            <button type="submit">Tìm kiếm</button>
        </form>
    </div>

    <div class="products">
    <%
        List<Product> list = (List<Product>) request.getAttribute("products");
        if(list != null && !list.isEmpty()){
            for(Product p : list){
    %>
                <div class="card">
                    <img src="<%=p.getImageUrl()%>" alt="Laptop Image">
                    <div class="card-body">
                        <h3><%=p.getName()%></h3>
                        <p style="color:#64748b; font-size:14px;">Hãng: <%=p.getBrand()%></p>
                        <div class="price">💰 <%=String.format("%,.0f", p.getPrice())%> VNĐ</div>
                    </div>
                </div>
    <%
            }
        } else {
    %>
            <div class="no-data">❌ Không tìm thấy sản phẩm laptop nào khớp với từ khóa!</div>
    <%
        }
    %>
    </div>
</div>

</body>
</html>