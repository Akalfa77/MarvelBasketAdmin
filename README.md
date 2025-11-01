# MarvelBasketAdmin

MarvelBasketAdmin is the **Admin Panel module** of the **Marvel Basket** project — a web-based system designed to manage users, sellers, and marketplace operations efficiently.  
This module helps administrators to handle user accounts, verify sellers, moderate products, and track orders from a single dashboard.

---

## Overview

The Admin Panel serves as the control center for Marvel Basket.  
It provides an interface to:

- Manage user and seller accounts
- View and monitor activities, orders, and products
- Handle notifications and system alerts
- Maintain overall platform stability

---

## Tech Stack

| Layer | Technology |
|-------|-------------|
| Backend (REST API) | Spring Boot |
| Frontend | JSP, HTML, CSS, JavaScript, Bootstrap |
| Database | MySQL |
| Build Tool | Maven |
| Server | Apache Tomcat (embedded in Spring Boot) |

---

## Features

- Admin dashboard for managing users and sellers
- CRUD operations for user and product management
- Real-time notifications and system updates
- SendGrid integration for email alerts *(API keys excluded for security)*
- Authentication and session management
- Responsive UI using Bootstrap

---

## Screenshots

### Dashboard
![MarvelBasket Dashboard]

### Notifications Tab
![MarvelBasket Notification Tab]

> The Notifications tab uses a TreeSet for reverse sorting, ensuring the latest notifications appear first.

---

## Project Structure

