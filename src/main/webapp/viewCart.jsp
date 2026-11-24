<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.food.model.Menu" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Your Cart | Foodie Hub</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>
:root {
    --bg-primary: #0f0f1b;
    --surface-1: #161625;
    --surface-2: #1c1c30;
    --border-subtle: rgba(255,255,255,0.06);
    --accent: #ff6b35;
    --text-primary: #f0f0f0;
    --text-secondary: #a0a0b0;
    --font-display: 'Montserrat', sans-serif;
    --font-body: 'Inter', sans-serif;
    --radius-lg: 20px;
    --radius-pill: 50px;
}
* { margin: 0; padding: 0; box-sizing: border-box; }
body {
    background: var(--bg-primary);
    color: var(--text-primary);
    font-family: var(--font-body);
    min-height: 100vh;
}
.page-container {
    max-width: 1000px;
    margin: 0 auto;
    padding: 60px 20px;
}
.page-title {
    text-align: center;
    margin-bottom: 40px;
}
.page-title h2 {
    font-family: var(--font-display);
    font-size: 32px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 2px;
}
.cart-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
    gap: 24px;
}
.cart-card {
    background: var(--surface-1);
    border: 1px solid var(--border-subtle);
    border-radius: var(--radius-lg);
    overflow: hidden;
}
.cart-card img {
    width: 100%;
    height: 180px;
    object-fit: cover;
}
.card-body {
    padding: 20px;
}
.card-body h3 {
    font-family: var(--font-display);
    font-size: 18px;
    font-weight: 700;
    margin-bottom: 8px;
}
.card-category {
    font-size: 13px;
    color: var(--text-secondary);
    margin-bottom: 12px;
}
.card-price {
    font-family: var(--font-display);
    font-size: 20px;
    font-weight: 800;
    color: var(--accent);
    margin-bottom: 16px;
}
.remove-btn {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 10px 20px;
    background: rgba(255,71,87,0.1);
    color: #ff4757;
    text-decoration: none;
    border-radius: var(--radius-pill);
    font-family: var(--font-display);
    font-size: 12px;
    font-weight: 700;
    text-transform: uppercase;
}
.remove-btn:hover {
    background: #ff4757;
    color: white;
}
.empty-state {
    text-align: center;
    padding: 80px 40px;
    background: var(--surface-1);
    border-radius: var(--radius-lg);
}
.empty-state h3 {
    font-family: var(--font-display);
    font-size: 24px;
    font-weight: 800;
    margin-bottom: 12px;
    text-transform: uppercase;
}
.empty-state p {
    color: var(--text-secondary);
}
</style>
</head>
<body>
<div class="page-container">
<div class="page-title">
    <h2>🛒 Your Cart</h2>
</div>
<%
List<Menu> cart = (List<Menu>) session.getAttribute("cart");
if(cart == null || cart.isEmpty()){
%>
<div class="empty-state">
    <h3>Cart is empty</h3>
    <p>Looks like you haven't added anything yet.</p>
</div>
<%
} else {
%>
<div class="cart-grid">
<%
    for(Menu m : cart){
%>
<div class="cart-card">
    <img src="images/<%= m.getImage() %>" alt="<%= m.getItemName() %>">
    <div class="card-body">
        <h3><%= m.getItemName() %></h3>
        <div class="card-category"><i class="fas fa-tag"></i> <%= m.getCategory() %></div>
        <div class="card-price">₹ <%= m.getPrice() %></div>
        <a href="removeFromCart?id=<%= m.getId() %>" class="remove-btn">
            <i class="fas fa-trash-alt"></i> Remove
        </a>
    </div>
</div>
<%
    }
%>
</div>
<%
}
%>
</div>
</body>
</html>