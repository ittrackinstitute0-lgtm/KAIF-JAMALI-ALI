# ⚡ Kaif Jamali Sports - Pro Athletic Equipment & Store Admin

A modern e-commerce sports equipment website and administration backend built with **HTML5, CSS3, Vanilla JavaScript**, and integrated with **Supabase Cloud Database**.

---

## 🌟 Key Highlights

### 🛒 Customer Storefront (`index.html`)
- **Athletic Pro Theme**: Sleek obsidian dark/light aesthetic designed specifically for sporting gear.
- **Comprehensive Sports Catalog**: 
  - Cricket (Grade 1 English Willow bats, leather match balls, protective gear)
  - Football / Soccer (FIFA match balls, goalkeeper spines, agility gear)
  - Basketball (Composite leather balls, breakaway rims)
  - Badminton & Tennis (Carbon fiber aero rackets, tournament balls)
  - Fitness & Gym (Dial adjustable dumbbells 40kg, resistance bands)
  - Combat & Boxing (Pro leather sparring gloves)
  - Athletics & Running (Carbon-plate energy return running shoes)
- **Live Search & Autocomplete**: Real-time filtering by sports type, item title, or keywords.
- **Multi-Currency Support**: Switch between **USD ($)**, **INR (₹)**, **EUR (€)**, and **GBP (£)**.
- **Interactive Sports Bag (Slide-Out Cart)**:
  - Add/remove items with stock quantity protection.
  - Promo discount codes (`CHAMPION20` for 20% off, `KJSPORTS10` for 10% off, `FREE99` for free shipping).
  - Free shipping threshold progress bar ($99+).
- **Quick View Modal**: High-definition photos, tech specs, stock indicators, and instant Add-to-Cart.
- **Full Athlete Checkout**:
  - Contact & delivery details.
  - Payment method selection (Cash on Delivery, Credit/Debit Card, UPI / Instant Transfer).
  - Instant order invoice and confirmation screen with printable receipt.
- **Direct Club Inquiry Form**: Inquiries sync straight to the Admin Backend messages table.

---

### 🛡️ Admin Management Panel (`admin.html`)
- **Admin Authentication**:
  - Secure login portal.
  - **Default Credentials**: `admin@kaifjamali.com` / `admin123` (or click "Auto-Fill" demo button).
- **Executive Analytics Dashboard**:
  - Total Sales Revenue, Total Orders, Active Equipment Count, and Low Stock Alerts.
  - Real-time Category Distribution breakdown.
  - Recent orders feed with status badges.
- **Full Inventory CRUD**:
  - View all sports items with images, stock counts, badges, and prices.
  - **Add New Product**: Name, Category, Price, Original Price, Stock, Image URL, Tech Description, and Featured toggle.
  - **Edit Existing Product**: Inline modal editor.
  - **Delete Product**: With confirmation prompt.
  - **Restore Demo Catalog**: One-click restore to reset the seed catalog.
- **Order Management & Invoicing**:
  - View incoming athlete orders with detailed customer details and cart items.
  - Update order status: `Pending` ➔ `Processing` ➔ `Shipped` ➔ `Delivered` ➔ `Cancelled`.
  - View and Print official invoices with itemized totals.
- **Customer Inquiries Tab**: Review messages submitted through the storefront contact form.
- **Supabase Cloud Setup & Sync**:
  - Live connection diagnostic tester.
  - 1-Click "Copy SQL Schema" button.
  - Direct link to the Supabase SQL editor.
  - 1-Click "Sync Local Products to Cloud" button.

---

## ☁️ Supabase Cloud Configuration

The application is pre-configured with the provided Supabase project credentials:
- **Project Ref**: `jrhbmalutelykmzceywi`
- **Project URL**: `https://jrhbmalutelykmzceywi.supabase.co`
- **Anon Public Key**: `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...`
- **Publishable Key**: `sb_publishable_qQ7LxW3J8M9Ahzm7kA_Smw_wS3xpduE`

### 🚀 Activating Supabase Cloud Database (In 1 Minute):
1. Log in to [Supabase Dashboard](https://supabase.com/dashboard/project/jrhbmalutelykmzceywi/sql/new).
2. Open the **SQL Editor** tab.
3. Open or copy the included [`schema.sql`](file:///c:/Users/Admin/Desktop/kaif%20jamali/schema.sql) file.
4. Click **Run**.
5. Go to the Admin Panel (`admin.html`) ➔ **Supabase Cloud** tab ➔ Click **Sync Local Products to Cloud**.
6. That's it! Your store is now running on a live Postgres cloud database with Row Level Security (RLS) configured.

> **Note**: Even before running the SQL script, the website is 100% functional out of the box using smart fallback storage, ensuring zero downtime!

---

## 💻 How to Run the Website Locally

You can open `index.html` directly in any web browser, or run a local Python HTTP server:

```powershell
# Navigate to the project directory
cd "c:\Users\Admin\Desktop\kaif jamali"

# Start a local web server on port 8000
python -m http.server 8000
```

Then visit:
- **Customer Store**: `http://localhost:8000/index.html`
- **Admin Panel**: `http://localhost:8000/admin.html`
