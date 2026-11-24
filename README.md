# 🍔 Foodie Hub - Full Stack Online Food Ordering Application

Foodie Hub is a full-stack web application designed for online food ordering and restaurant discovery. Built using Java Jakarta Servlets, JSP, and MySQL, with a modern, responsive dark-themed user interface.

---

## 🚀 Features

- **Restaurant Discovery:** Browse a diverse list of restaurants with ratings, cuisine details, and visual banners.
- **Dynamic Restaurant Menus:** Explore categorized dishes (Starters, Mains, Desserts, Beverages) with real-time pricing and ratings.
- **Cart & Order Management:** Add items to cart, adjust quantities, calculate totals dynamically, and review orders.
- **Order Placement & History:** Secure checkout with address and payment selection, tracking user order history.
- **User Authentication:** 
  - User Registration & Login with session management.
  - Password Reset via Email OTP verification using Jakarta Mail (Gmail SMTP).
- **Responsive Dark UI:** Styled with modern CSS variables, glassmorphism elements, and mobile-responsive layouts.

---

## 🛠️ Technology Stack

- **Backend:** Java 21, Jakarta Servlet 5.0/6.0, JDBC
- **Frontend:** JSP, HTML5, CSS3 (Modern Dark Theme), FontAwesome 6
- **Database:** MySQL 8.0
- **Server:** Apache Tomcat 10.1+
- **Email Service:** Jakarta Mail 2.0 (Gmail SMTP for OTP)

---

## 🗄️ Database Setup

1. Open your MySQL client or MySQL Workbench.
2. Run the database setup script:
   ```sql
   source schema.sql;
   source insert_menus.sql;
   source rename_menus.sql;
   source rename_menus_2.sql;
   source rename_menus_3.sql;
   source update_images.sql;
   ```
   This will create the `foodiehub` database with the following tables:
   - `users`
   - `restaurant`
   - `menu`
   - `orders`
   - `order_items`

3. Update MySQL credentials in `src/main/java/com/food/util/DBConnection.java` if needed.

---

## 💻 How to Run

1. **Deploy on Apache Tomcat 10.1+:**
   - Copy the web application to Tomcat's `webapps/foodhub` directory.
   - Place compiled classes in `WEB-INF/classes`.
   - Ensure the required libraries (`mysql-connector-j`, `jakarta.mail`, `jakarta.activation`) are in `WEB-INF/lib`.
2. **Start Tomcat:**
   - Run `catalina.bat run` or `startup.bat`.
3. **Open in Browser:**
   - Navigate to: `http://localhost:8080/foodhub/restaurants`
