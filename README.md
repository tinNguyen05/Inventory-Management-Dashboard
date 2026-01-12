<div align="center">
  <h1>📦 Inventory Management Dashboard</h1>
  <p><strong>Enterprise-grade inventory management system with real-time analytics</strong></p>
  
  <p>
    <a href="#features"><strong>Features</strong></a> ·
    <a href="#architecture"><strong>Architecture</strong></a> ·
    <a href="#getting-started"><strong>Getting Started</strong></a> ·
    <a href="#deployment"><strong>Deployment</strong></a>
  </p>

  ![AWS-Diagram](https://github.com/tinNguyen05/Inventory-Management-Dashboard/blob/main/AWS-Diagram/Screenshot%202026-01-03%20105701.png)
</div>

---

## 📖 Introduction

A full-stack inventory management platform built with modern web technologies and deployed on AWS infrastructure. This system provides businesses with comprehensive tools to track inventory, analyze sales patterns, manage expenses, and monitor key performance metrics in real-time.

The application features a responsive Next.js frontend with server-side rendering, a robust Node.js backend API, and a PostgreSQL database managed through Prisma ORM. The entire infrastructure is provisioned using Terraform for reproducible, scalable cloud deployments.

### Built For

- **Retail businesses** seeking real-time inventory tracking
- **Warehouse operations** requiring multi-location stock management
- **E-commerce platforms** needing integrated sales analytics
- **Small to medium enterprises** looking for cost-effective inventory solutions

---

## ✨ Features

### Core Functionality

- **📊 Real-time Dashboard Analytics**
  - Sales performance metrics with trend visualization
  - Expense tracking and categorization
  - Purchase order summaries
  - Popular products analytics

- **🏷️ Product Management**
  - Complete CRUD operations for product catalog
  - Stock quantity tracking
  - Pricing and rating management
  - Product image storage via AWS S3

- **📦 Inventory Control**
  - Real-time stock level monitoring
  - Low stock alerts and notifications
  - Inventory movement tracking

- **💰 Financial Tracking**
  - Expense management by category
  - Sales and purchase summaries
  - Revenue and cost analysis
  - Date-based financial reports

- **👥 User Management**
  - User role and access control
  - Team member directory
  - Activity tracking

### Technical Features

- **🚀 Performance Optimized**
  - Server-side rendering with Next.js 14
  - API response caching
  - Optimized database queries with Prisma
  - Image optimization with AWS S3

- **🔒 Security First**
  - Helmet.js security headers
  - CORS configuration
  - VPC isolation for database
  - AWS Security Groups

- **📱 Responsive Design**
  - Mobile-first approach
  - Tailwind CSS utility classes
  - Material-UI data grids
  - Dark/light mode support

- **🔄 State Management**
  - Redux Toolkit for predictable state
  - Redux Persist for local storage
  - RTK Query for efficient data fetching

---

## 🏗️ Architecture

### System Overview

```mermaid
graph TB
    subgraph "Client Layer"
        A[Next.js Frontend<br/>AWS Amplify]
    end
    
    subgraph "API Layer"
        B[AWS API Gateway]
        C[Express.js API<br/>AWS EC2]
    end
    
    subgraph "Data Layer"
        D[PostgreSQL<br/>AWS RDS]
        E[Static Assets<br/>AWS S3]
    end
    
    subgraph "Infrastructure"
        F[VPC]
        G[Security Groups]
    end
    
    A -->|HTTPS| B
    B -->|Proxy| C
    C -->|Prisma ORM| D
    C -->|Store/Retrieve| E
    
    F -.->|Isolates| D
    G -.->|Protects| D
    G -.->|Protects| C
    
    style A fill:#0070f3
    style C fill:#68a063
    style D fill:#336791
    style E fill:#ff9900
```

### Technology Stack

#### Frontend
- **Framework:** Next.js 14 (React 18)
- **Styling:** Tailwind CSS 3.4 + Material-UI
- **State Management:** Redux Toolkit 2.2 + Redux Persist
- **Data Fetching:** RTK Query + Axios
- **Charts:** Recharts 3.6
- **Icons:** Lucide React
- **Language:** TypeScript 5

#### Backend
- **Runtime:** Node.js
- **Framework:** Express.js 4.19
- **ORM:** Prisma 5.16
- **Database:** PostgreSQL
- **Security:** Helmet, CORS
- **Logging:** Morgan
- **Language:** TypeScript 5

#### Infrastructure (AWS)
- **Hosting:** AWS Amplify (Frontend)
- **Compute:** AWS EC2 (Backend)
- **Database:** AWS RDS (PostgreSQL)
- **Storage:** AWS S3 (Images)
- **API Gateway:** AWS API Gateway
- **Networking:** VPC, Security Groups
- **IaC:** Terraform

### Database Schema

```mermaid
erDiagram
    Products ||--o{ Sales : "generates"
    Products ||--o{ Purchases : "receives"
    SalesSummary ||--o{ Sales : "aggregates"
    PurchaseSummary ||--o{ Purchases : "aggregates"
    ExpenseSummary ||--o{ ExpenseByCategory : "contains"
    
    Products {
        string productId PK
        string name
        float price
        float rating
        int stockQuantity
    }
    
    Sales {
        string saleId PK
        string productId FK
        datetime timestamp
        int quantity
        float unitPrice
        float totalAmount
    }
    
    Purchases {
        string purchaseId PK
        string productId FK
        datetime timestamp
        int quantity
        float unitCost
        float totalCost
    }
    
    Expenses {
        string expenseId PK
        string category
        float amount
        datetime timestamp
    }
    
    Users {
        string userId PK
        string name
        string email
    }
```

### API Architecture

```mermaid
sequenceDiagram
    participant Client
    participant Gateway as API Gateway
    participant API as Express Server
    participant DB as PostgreSQL
    participant S3 as AWS S3
    
    Client->>Gateway: HTTPS Request
    Gateway->>API: Forward to EC2
    
    alt Data Request
        API->>DB: Prisma Query
        DB->>API: Return Data
    else File Upload
        API->>S3: Store Image
        S3->>API: Return URL
    end
    
    API->>Gateway: JSON Response
    Gateway->>Client: HTTPS Response
```

---

## 🚀 Getting Started

### Prerequisites

Ensure you have the following installed on your system:

- **Node.js** 20.x or higher
- **npm** 9.x or higher (or **yarn** 1.22.x)
- **PostgreSQL** 14.x or higher
- **Git** for version control

Optional (for AWS deployment):
- **AWS CLI** configured with credentials
- **Terraform** 1.0 or higher

### Installation

#### 1. Clone the Repository

```bash
git clone https://github.com/tinNguyen05/Inventory-Management-Dashboard.git
cd Inventory-Management-Dashboard
```

#### 2. Install Dependencies

**Frontend (Client):**
```bash
cd client
npm install
```

**Backend (Server):**
```bash
cd ../server
npm install
```

#### 3. Environment Configuration

Create environment files for both client and server:

**Client (`.env.local`):**
```bash
cd client
```

Create a `.env.local` file:
```env
# API Configuration
NEXT_PUBLIC_API_BASE_URL=http://localhost:8000
```

**Server (`.env`):**
```bash
cd ../server
```

Create a `.env` file:
```env
# Server Configuration
PORT=8000
NODE_ENV=development

# Database Configuration
DATABASE_URL="postgresql://username:password@localhost:5432/inventory_db?schema=public"

# AWS Configuration (Optional for local development)
AWS_REGION=us-east-1
AWS_ACCESS_KEY_ID=your_access_key
AWS_SECRET_ACCESS_KEY=your_secret_key
S3_BUCKET_NAME=your_bucket_name
```

#### 4. Database Setup

**Initialize Prisma and create the database:**

```bash
# Generate Prisma Client
npx prisma generate

# Run migrations to create tables
npx prisma migrate dev --name init

# Seed the database with sample data
npm run seed
```

**Verify database:**
```bash
npx prisma studio
```

This opens a browser-based GUI to view your database at `http://localhost:5555`

---

## 🎮 Running the Project

### Development Mode

Open two terminal windows/tabs:

**Terminal 1 - Backend Server:**
```bash
cd server
npm run dev
```
Server runs on `http://localhost:8000`

**Terminal 2 - Frontend Application:**
```bash
cd client
npm run dev
```
Frontend runs on `http://localhost:3000`

### Production Build

**Backend:**
```bash
cd server
npm run build
npm start
```

**Frontend:**
```bash
cd client
npm run build
npm start
```

### Available Scripts

#### Client Scripts
| Script | Description |
|--------|-------------|
| `npm run dev` | Start development server with hot reload |
| `npm run build` | Create production build |
| `npm start` | Start production server |
| `npm run lint` | Run ESLint for code quality |

#### Server Scripts
| Script | Description |
|--------|-------------|
| `npm run dev` | Start development server with nodemon |
| `npm run build` | Compile TypeScript to JavaScript |
| `npm start` | Start production server |
| `npm run seed` | Populate database with sample data |

---

## ⚙️ Environment Configuration

### Client Environment Variables

Create `client/.env.local`:

```env
# ==============================================
# API ENDPOINTS
# ==============================================
# Base URL for backend API
# Development: http://localhost:8000
# Production: https://api.yourdomain.com
NEXT_PUBLIC_API_BASE_URL=http://localhost:8000

# ==============================================
# FEATURE FLAGS (Optional)
# ==============================================
NEXT_PUBLIC_ENABLE_ANALYTICS=true
NEXT_PUBLIC_ENABLE_DARK_MODE=true

# ==============================================
# AWS AMPLIFY (Production Only)
# ==============================================
# These are automatically set by AWS Amplify
# NEXT_PUBLIC_AWS_REGION=us-east-1
```

### Server Environment Variables

Create `server/.env`:

```env
# ==============================================
# SERVER CONFIGURATION
# ==============================================
PORT=8000
NODE_ENV=development  # development | production

# ==============================================
# DATABASE CONFIGURATION
# ==============================================
# PostgreSQL connection string
# Format: postgresql://USER:PASSWORD@HOST:PORT/DATABASE?schema=SCHEMA
# 
# Local development example:
DATABASE_URL="postgresql://postgres:password@localhost:5432/inventory_db?schema=public"
#
# AWS RDS example:
# DATABASE_URL="postgresql://admin:password@inventory-db.xxx.us-east-1.rds.amazonaws.com:5432/inventory?schema=public"

# ==============================================
# AWS CONFIGURATION
# ==============================================
AWS_REGION=us-east-1
AWS_ACCESS_KEY_ID=your_access_key_id
AWS_SECRET_ACCESS_KEY=your_secret_access_key

# S3 Bucket for product images
S3_BUCKET_NAME=inventory-images-bucket

# ==============================================
# SECURITY (Optional)
# ==============================================
# CORS allowed origins (comma-separated)
CORS_ORIGIN=http://localhost:3000,https://yourdomain.com

# JWT secret for authentication (if implementing auth)
# JWT_SECRET=your-super-secret-key-change-in-production
```

### Environment Variable Reference

| Variable | Required | Default | Description |
|----------|----------|---------|-------------|
| **Client** |
| `NEXT_PUBLIC_API_BASE_URL` | ✅ Yes | - | Backend API endpoint |
| **Server** |
| `PORT` | ❌ No | 3001 | Server port number |
| `NODE_ENV` | ❌ No | development | Runtime environment |
| `DATABASE_URL` | ✅ Yes | - | PostgreSQL connection string |
| `AWS_REGION` | ⚠️ Production | - | AWS region for services |
| `AWS_ACCESS_KEY_ID` | ⚠️ Production | - | AWS access credentials |
| `AWS_SECRET_ACCESS_KEY` | ⚠️ Production | - | AWS secret credentials |
| `S3_BUCKET_NAME` | ⚠️ Production | - | S3 bucket for images |

> **Security Note:** Never commit `.env` files to version control. Add them to `.gitignore`.

---

## 📁 Folder Structure

```
Inventory-Management-Dashboard/
│
├── 📄 README.md                    # Project documentation
├── 📄 PROJECT-STRUCTURE.md         # Detailed structure guide
│
├── 📂 client/                      # Next.js Frontend Application
│   ├── 📄 package.json             # Frontend dependencies
│   ├── 📄 next.config.mjs          # Next.js configuration
│   ├── 📄 tsconfig.json            # TypeScript config
│   ├── 📄 tailwind.config.ts       # Tailwind CSS config
│   ├── 📄 Dockerfile               # Container configuration
│   │
│   ├── 📂 public/                  # Static assets
│   │   └── 🖼️ images, icons...
│   │
│   └── 📂 src/
│       ├── 📂 app/                 # Next.js 14 App Router
│       │   ├── 📄 layout.tsx       # Root layout component
│       │   ├── 📄 page.tsx         # Homepage
│       │   ├── 📄 globals.css      # Global styles
│       │   ├── 📄 redux.tsx        # Redux provider setup
│       │   │
│       │   ├── 📂 (components)/    # Shared components
│       │   │   ├── 📂 Header/      # App header
│       │   │   ├── 📂 Navbar/      # Navigation bar
│       │   │   ├── 📂 Sidebar/     # Sidebar navigation
│       │   │   └── 📂 Rating/      # Rating component
│       │   │
│       │   ├── 📂 dashboard/       # Dashboard page
│       │   │   ├── 📄 page.tsx
│       │   │   ├── 📄 CardExpenseSummary.tsx
│       │   │   ├── 📄 CardPopularProducts.tsx
│       │   │   ├── 📄 CardPurchaseSummary.tsx
│       │   │   ├── 📄 CardSalesSummary.tsx
│       │   │   └── 📄 StatCard.tsx
│       │   │
│       │   ├── 📂 products/        # Product management
│       │   │   ├── 📄 page.tsx
│       │   │   └── 📄 CreateProductModal.tsx
│       │   │
│       │   ├── 📂 inventory/       # Inventory tracking
│       │   ├── 📂 expenses/        # Expense management
│       │   ├── 📂 users/           # User management
│       │   └── 📂 settings/        # App settings
│       │
│       └── 📂 state/               # Redux state management
│           ├── 📄 index.ts         # Store configuration
│           └── 📄 api.ts           # RTK Query API slices
│
├── 📂 server/                      # Node.js Backend API
│   ├── 📄 package.json             # Backend dependencies
│   ├── 📄 tsconfig.json            # TypeScript config
│   ├── 📄 ecosystem.config.js      # PM2 process manager
│   ├── 📄 Dockerfile               # Container configuration
│   │
│   ├── 📂 prisma/                  # Database ORM
│   │   ├── 📄 schema.prisma        # Database schema
│   │   ├── 📄 seed.ts              # Database seeder
│   │   ├── 📂 migrations/          # Database migrations
│   │   └── 📂 seedData/            # Sample data (JSON)
│   │
│   ├── 📂 src/
│   │   ├── 📄 index.ts             # Express server entry
│   │   │
│   │   ├── 📂 controllers/         # Route handlers
│   │   │   ├── 📄 dashboardController.ts
│   │   │   ├── 📄 productController.ts
│   │   │   ├── 📄 expenseController.ts
│   │   │   └── 📄 userController.ts
│   │   │
│   │   └── 📂 routes/              # API route definitions
│   │       ├── 📄 dashboardRoutes.ts
│   │       ├── 📄 productRoutes.ts
│   │       ├── 📄 expenseRoutes.ts
│   │       └── 📄 userRoutes.ts
│   │
│   └── 📂 assets/                  # Server static files
│
├── 📂 terraform/                   # Infrastructure as Code
│   ├── 📄 main.tf                  # Main Terraform config
│   ├── 📄 provider.tf              # AWS provider setup
│   ├── 📄 variables.tf             # Input variables
│   ├── 📄 outputs.tf               # Output values
│   ├── 📄 compute.tf               # EC2 instances
│   ├── 📄 database.tf              # RDS configuration
│   ├── 📄 network.tf               # VPC, subnets
│   ├── 📄 security.tf              # Security groups
│   ├── 📄 storage.tf               # S3 buckets
│   ├── 📄 iam.tf                   # IAM roles/policies
│   ├── 📄 userdata.sh              # EC2 initialization
│   └── 📄 terraform.tfvars         # Variable values
│
└── 📂 AWS-Diagram/                 # Architecture diagrams
```

### Key Directories Explained

| Directory | Purpose |
|-----------|---------|
| **client/src/app** | Next.js 14 App Router pages and components |
| **client/src/state** | Redux store, slices, and RTK Query APIs |
| **server/src/controllers** | Business logic for API endpoints |
| **server/src/routes** | Express route definitions |
| **server/prisma** | Database schema, migrations, and seed data |
| **terraform/** | AWS infrastructure provisioning code |

---

## 🌐 Deployment

### AWS Cloud Architecture

The application is deployed across multiple AWS services for high availability, scalability, and security:

```mermaid
graph LR
    A[Users] -->|HTTPS| B[AWS Amplify<br/>Frontend]
    A -->|HTTPS| C[API Gateway]
    C -->|Forward| D[EC2 Instance<br/>Express API]
    D -->|Query| E[RDS PostgreSQL<br/>Database]
    D -->|Store/Fetch| F[S3 Bucket<br/>Images]
    
    subgraph "VPC - Private Network"
        E
        D
    end
    
    G[Security Groups] -.->|Control Access| D
    G -.->|Control Access| E
    
    style B fill:#ff9900
    style C fill:#ff9900
    style D fill:#ff9900
    style E fill:#ff9900
    style F fill:#ff9900
```

### Infrastructure Components

| Component | Service | Purpose |
|-----------|---------|---------|
| **Frontend Hosting** | AWS Amplify | Continuous deployment, CDN, SSL |
| **API Gateway** | AWS API Gateway | Request routing, rate limiting |
| **Backend Compute** | AWS EC2 | Express.js server hosting |
| **Database** | AWS RDS (PostgreSQL) | Managed relational database |
| **File Storage** | AWS S3 | Product images and static assets |
| **Network** | AWS VPC | Isolated network environment |
| **Security** | Security Groups | Firewall rules and access control |

### Deployment with Terraform

#### 1. Prerequisites

```bash
# Install Terraform
# Windows (using Chocolatey):
choco install terraform

# Verify installation
terraform --version
```

#### 2. Configure AWS Credentials

```bash
# Configure AWS CLI
aws configure

# Enter your credentials:
# AWS Access Key ID: YOUR_ACCESS_KEY
# AWS Secret Access Key: YOUR_SECRET_KEY
# Default region: us-east-1
# Default output format: json
```

#### 3. Initialize Terraform

```bash
cd terraform

# Initialize Terraform providers
terraform init
```

#### 4. Configure Variables

Edit `terraform/terraform.tfvars`:

```hcl
# Project Configuration
project_name = "inventory-dashboard"
environment  = "production"
aws_region   = "us-east-1"

# Network Configuration
vpc_cidr = "10.0.0.0/16"

# Database Configuration
db_instance_class = "db.t3.micro"
db_name          = "inventory"
db_username      = "admin"
db_password      = "YourSecurePassword123!"  # Change this!

# EC2 Configuration
ec2_instance_type = "t2.micro"
key_name         = "your-ec2-key-pair"

# S3 Configuration
s3_bucket_name = "inventory-images-unique-name"
```

#### 5. Review Infrastructure Plan

```bash
# Preview changes before applying
terraform plan
```

#### 6. Deploy Infrastructure

```bash
# Apply configuration to create resources
terraform apply

# Type 'yes' when prompted
```

#### 7. Retrieve Outputs

```bash
# Get important endpoints and IDs
terraform output

# Example outputs:
# ec2_public_ip = "54.xxx.xxx.xxx"
# rds_endpoint = "inventory-db.xxx.rds.amazonaws.com:5432"
# s3_bucket_name = "inventory-images-bucket"
```

### Manual Deployment Steps

#### Deploy Backend to EC2

1. **SSH into EC2 instance:**
```bash
ssh -i "your-key.pem" ec2-user@your-ec2-public-ip
```

2. **Install dependencies:**
```bash
# Update system
sudo yum update -y

# Install Node.js
curl -sL https://rpm.nodesource.com/setup_20.x | sudo bash -
sudo yum install -y nodejs

# Install PM2 process manager
sudo npm install -g pm2
```

3. **Clone and setup application:**
```bash
# Clone repository
git clone https://github.com/tinNguyen05/Inventory-Management-Dashboard.git
cd Inventory-Management-Dashboard/server

# Install dependencies
npm install

# Create .env file
nano .env
# Add your environment variables

# Build application
npm run build

# Start with PM2
pm2 start ecosystem.config.js
pm2 save
pm2 startup
```

#### Deploy Frontend to AWS Amplify

1. **Connect GitHub repository:**
   - Navigate to AWS Amplify Console
   - Click "New app" → "Host web app"
   - Connect your GitHub repository
   - Select the `main` branch

2. **Configure build settings:**
```yaml
version: 1
frontend:
  phases:
    preBuild:
      commands:
        - cd client
        - npm install
    build:
      commands:
        - npm run build
  artifacts:
    baseDirectory: client/.next
    files:
      - '**/*'
  cache:
    paths:
      - client/node_modules/**/*
```

3. **Add environment variables:**
   - In Amplify Console → App settings → Environment variables
   - Add: `NEXT_PUBLIC_API_BASE_URL` = Your API Gateway URL

4. **Deploy:**
   - Click "Save and deploy"
   - Amplify will automatically build and deploy

### Database Migration (Production)

```bash
# On your local machine, update DATABASE_URL to production RDS
# Then run migrations
npx prisma migrate deploy

# Seed production database (optional)
npm run seed
```

### Cleanup Resources

To destroy all AWS resources:

```bash
cd terraform
terraform destroy
# Type 'yes' when prompted
```

---

## 🔧 API Reference

### Base URL
- **Development:** `http://localhost:8000`
- **Production:** `https://api.yourdomain.com`

### Endpoints

#### Dashboard
```http
GET /dashboard
```
Returns aggregated dashboard metrics including sales, purchases, expenses, and popular products.

#### Products
```http
GET    /products          # Get all products
GET    /products/:id      # Get product by ID
POST   /products          # Create new product
PUT    /products/:id      # Update product
DELETE /products/:id      # Delete product
```

#### Users
```http
GET /users                # Get all users
```

#### Expenses
```http
GET /expenses             # Get expenses by category
```

### Example Request

```javascript
// Fetch all products
const response = await fetch('http://localhost:8000/products');
const products = await response.json();

// Create new product
const newProduct = await fetch('http://localhost:8000/products', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({
    productId: 'prod-123',
    name: 'Laptop',
    price: 999.99,
    rating: 4.5,
    stockQuantity: 50
  })
});
```

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. **Fork the repository**
2. **Create a feature branch:** `git checkout -b feature/AmazingFeature`
3. **Commit your changes:** `git commit -m 'Add AmazingFeature'`
4. **Push to the branch:** `git push origin feature/AmazingFeature`
5. **Open a Pull Request**

---

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

## 👤 Author

**Tin Nguyen**

- GitHub: [@tinNguyen05](https://github.com/tinNguyen05)
- Project Link: [Inventory Management Dashboard](https://github.com/tinNguyen05/Inventory-Management-Dashboard)

---

## 🙏 Acknowledgments

- Next.js team for the amazing framework
- Prisma team for the excellent ORM
- AWS for reliable cloud infrastructure
- Open source community for invaluable tools and libraries

---

<div align="center">
  <p>Built with ❤️ using Next.js, Node.js, and AWS</p>
  <p>⭐ Star this repository if you find it helpful!</p>
</div>

