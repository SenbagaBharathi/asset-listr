# 🏠 Asset-Listr — Simplified Project Brief

## 📋 Overview
**Asset-Listr** is a modern full-stack web app for real estate property management.  
It allows users to **browse, add, edit, and manage property listings** easily.  
The goal is to make property listing **simple, secure, and fast** for both agents and clients.

---

## 🎯 Purpose
To create a **user-friendly** platform for:
- Real estate agents to manage listings  
- Buyers/sellers to browse properties  
- Ensuring secure access and smooth experience  

---

## 🧠 Tech Stack
| Layer | Technologies Used |
|-------|--------------------|
| **Frontend** | React + TypeScript + Tailwind CSS + shadcn/ui |
| **Backend** | Supabase (via Lovable Cloud) |
| **Database** | PostgreSQL with Row Level Security (RLS) |
| **Auth** | Supabase Authentication (email/password) |
| **Build Tool** | Vite |
| **Version Control** | GitHub with CI/CD (Lovable Cloud Deploy) |

---

## 🏗️ Architecture
The app follows a **client-server model**:  
- The **React frontend** communicates with the **Supabase backend** through REST APIs.  
- Data is stored in **PostgreSQL**, protected with **RLS**, so each user sees only their own data.  
- The frontend uses **TypeScript** for type safety and **Tailwind** for responsive UI.

---

## ✨ Core Features
1. 🔐 User Authentication (Login, Register, Logout)  
2. 🏡 Add, Edit, Delete Property Listings  
3. 📊 Dashboard with personalized data  
4. 💬 Responsive UI with clean components (shadcn/ui)  
5. ⚡ Real-time property updates via Supabase APIs  

---

## 🗄️ Database Schema
**Table: `properties`**
| Column | Type | Description |
|--------|------|-------------|
| id | UUID | Primary Key |
| user_id | UUID | Linked to authenticated user |
| title | TEXT | Property Title |
| price | DECIMAL | Price of the property |
| location | TEXT | Property Location |
| property_type | TEXT | Type (Apartment, Villa, Plot) |
| bedrooms | INT | No. of Bedrooms |
| area_sqft | INT | Area in sq.ft |
| image_url | TEXT | Property Image |
| created_at | TIMESTAMP | Creation Time |

---

## ☁️ Deployment
- **Hosted on:** Lovable Cloud  
- **Automatic Deployments:** Enabled with GitHub sync  
- **Security:** SSL + HTTPS  
- **Environment Variables:**
  ```env
  VITE_SUPABASE_URL="https://kxyknohzmxrtxfaqorqc.supabase.co"
  VITE_SUPABASE_ANON_KEY="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt4eWtub2h6bXhydHhmYXFvcnFjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTk0MTM4MzgsImV4cCI6MjA3NDk4OTgzOH0._wv9GtWSKl29rC0xiXIDj6U1TWxqMbrS2mc5iFc4vgg"

