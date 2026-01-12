# Project Structure - Inventory Management Dashboard

## Cây Thư Mục Các File Quan Trọng

```
Inventory-Management-Dashboard/
│
├── README.md                           # Tài liệu chính của dự án
│
├── client/                             # Frontend Next.js
│   ├── package.json                    # Dependencies frontend
│   ├── next.config.mjs                 # Cấu hình Next.js
│   ├── tsconfig.json                   # Cấu hình TypeScript
│   ├── tailwind.config.ts              # Cấu hình Tailwind CSS
│   ├── postcss.config.mjs              # Cấu hình PostCSS
│   │
│   └── src/
│       ├── app/
│       │   ├── layout.tsx              # Layout chính
│       │   ├── page.tsx                # Trang chủ
│       │   ├── globals.css             # CSS toàn cục
│       │   ├── redux.tsx               # Cấu hình Redux
│       │   ├── dashboardWrapper.tsx    # Wrapper cho dashboard
│       │   │
│       │   ├── (components)/           # Các component dùng chung
│       │   │   ├── Header/
│       │   │   │   └── index.tsx
│       │   │   ├── Navbar/
│       │   │   │   └── index.tsx
│       │   │   ├── Sidebar/
│       │   │   │   └── index.tsx
│       │   │   └── Rating/
│       │   │       └── index.tsx
│       │   │
│       │   ├── dashboard/              # Trang Dashboard
│       │   │   ├── page.tsx
│       │   │   ├── CardExpenseSummary.tsx
│       │   │   ├── CardPopularProducts.tsx
│       │   │   ├── CardPurchaseSummary.tsx
│       │   │   ├── CardSalesSummary.tsx
│       │   │   └── StatCard.tsx
│       │   │
│       │   ├── products/               # Quản lý sản phẩm
│       │   │   ├── page.tsx
│       │   │   └── CreateProductModal.tsx
│       │   │
│       │   ├── inventory/              # Quản lý kho
│       │   │   └── page.tsx
│       │   │
│       │   ├── users/                  # Quản lý người dùng
│       │   │   └── page.tsx
│       │   │
│       │   ├── expenses/               # Quản lý chi phí
│       │   │   └── page.tsx
│       │   │
│       │   └── settings/               # Cài đặt
│       │       └── page.tsx
│       │
│       └── state/                      # Quản lý state Redux
│           ├── index.ts                # Store configuration
│           └── api.ts                  # RTK Query API
│
├── server/                             # Backend Node.js/Express
│   ├── package.json                    # Dependencies backend
│   ├── tsconfig.json                   # Cấu hình TypeScript
│   ├── Dockerfile                      # Docker configuration
│   ├── ecosystem.config.js             # PM2 configuration
│   ├── aws-ec2-instructions.md         # Hướng dẫn deploy AWS
│   │
│   ├── prisma/
│   │   ├── schema.prisma               # Database schema
│   │   ├── seed.ts                     # Seed script
│   │   │
│   │   ├── seedData/                   # Dữ liệu mẫu
│   │   │   ├── products.json
│   │   │   ├── users.json
│   │   │   ├── sales.json
│   │   │   ├── salesSummary.json
│   │   │   ├── purchases.json
│   │   │   ├── purchaseSummary.json
│   │   │   ├── expenses.json
│   │   │   ├── expenseSummary.json
│   │   │   └── expenseByCategory.json
│   │   │
│   │   └── migrations/
│   │       ├── migration_lock.toml
│   │       └── 20240711174419_init/
│   │           └── migration.sql
│   │
│   └── src/
│       ├── index.ts                    # Entry point của server
│       │
│       ├── controllers/                # Business logic
│       │   ├── dashboardController.ts
│       │   ├── productController.ts
│       │   ├── userController.ts
│       │   └── expenseController.ts
│       │
│       └── routes/                     # API routes
│           ├── dashboardRoutes.ts
│           ├── productRoutes.ts
│           ├── userRoutes.ts
│           └── expenseRoutes.ts
│
├── terraform/                          # Infrastructure as Code
│
└── AWS-Diagram/                        # Sơ đồ kiến trúc AWS
```

## Mô Tả Các Thư Mục Chính

### 📁 client/
Frontend application sử dụng **Next.js 14+**, **TypeScript**, **Tailwind CSS**, và **Redux Toolkit**

**Các file cấu hình quan trọng:**
- `next.config.mjs` - Cấu hình Next.js
- `tailwind.config.ts` - Cấu hình styling
- `tsconfig.json` - Cấu hình TypeScript

**Cấu trúc src/app:**
- App Router của Next.js
- Components được tổ chức theo feature
- State management với Redux Toolkit

### 📁 server/
Backend API sử dụng **Node.js**, **Express**, **Prisma ORM**, và **PostgreSQL**

**Các file cấu hình quan trọng:**
- `ecosystem.config.js` - PM2 process manager
- `Dockerfile` - Container configuration
- `prisma/schema.prisma` - Database schema definition

**Cấu trúc src:**
- `index.ts` - Server entry point
- `controllers/` - Business logic handlers
- `routes/` - API endpoint definitions

### 📁 terraform/
Infrastructure as Code cho deployment trên AWS

### 📁 AWS-Diagram/
Sơ đồ kiến trúc hệ thống trên AWS

## Tech Stack

**Frontend:**
- Next.js 14+
- TypeScript
- Tailwind CSS
- Redux Toolkit
- RTK Query

**Backend:**
- Node.js
- Express.js
- Prisma ORM
- PostgreSQL
- TypeScript

**DevOps:**
- Docker
- PM2
- AWS (EC2, RDS, S3, etc.)
- Terraform

## Scripts Chính

### Client
```bash
npm run dev        # Development server
npm run build      # Production build
npm start          # Start production server
```

### Server
```bash
npm run dev        # Development server
npm run build      # Compile TypeScript
npm start          # Start production server
npx prisma migrate # Run database migrations
npx prisma seed    # Seed database
```
