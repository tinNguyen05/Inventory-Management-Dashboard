# Build a Fullstack Inventory Management Dashboard

## Tech Stack

- **Next JS**
- **Tailwind**
- **Redux Toolkit**
- **Redux Toolkit Query**
- **Material UI Data Grid**
- **Node.js**
- **Prisma**
- **AWS EC2**
- **AWS RDS**
- **AWS API Gateway**
- **AWS Amplify**
- **AWS S3**

# Deployment & Cloud Architecture

![AWS-Diagram](https://github.com/tinNguyen05/Inventory-Management-Dashboard/blob/main/AWS-Diagram/Screenshot%202026-01-03%20105701.png)

- **Frontend:** Hosted on **AWS Amplify** (Continuous Deployment).
- **Backend:** Node.js/Express server on **AWS EC2** instance.
- **Database:** **AWS RDS (PostgreSQL/MySQL)** managed service with Prisma ORM.
- **API Management:** **AWS API Gateway** for routing and security.
- **File Storage:** **AWS S3** for inventory images.
- **Networking:** Configured **VPC, Security Groups** to restrict unauthorized access to the database.

