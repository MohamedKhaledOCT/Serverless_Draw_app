# Serverless Draw App

## Project Overview
The **Serverless Draw App** is a scalable, secure, and serverless application that enables users to participate in raffles via a web interface. The project leverages AWS services to provide high availability, performance, and security.
![draw design for Serv](https://github.com/user-attachments/assets/6e8df58b-7522-4eb4-ab41-7fb9ad0ab36a)



---

## Features
- **Static Web Hosting**: Hosted on Amazon S3 with CloudFront for HTTPS support.
- **API Gateway**: A RESTful interface for handling raffle submissions and draws.
- **Lambda Functions**: Serverless functions for processing raffle entries and drawing winners.
- **DynamoDB Integration**: A NoSQL database for storing raffle entries.
- **ACM Certificate**: SSL/TLS certificate for secure communication.
- **Cross-Origin Resource Sharing (CORS)**: Enabled for seamless interaction between S3, API Gateway, and the domain.

---

## Architecture
- **Frontend**: Static HTML/CSS/JS hosted on S3 and served securely via CloudFront.
- **Backend**: API Gateway routes connected to Lambda functions for raffle logic.
- **Database**: DynamoDB for storing and retrieving entries.
- **Certificate Management**: ACM for providing secure HTTPS.
- **Infrastructure as Code**: Entire architecture managed using Terraform.

---

## Technologies Used
- AWS S3 for storage and web hosting
- AWS API Gateway for routing
- AWS Lambda for serverless computing
- AWS DynamoDB for data persistence
- AWS ACM for secure SSL/TLS certificates
- AWS CloudFront for content delivery
- Terraform for Infrastructure as Code (IaC)

---

## Installation & Deployment
1. Clone the repository:
   ```bash
   git clone https://github.com/MohamedKhaledOCT/Serverless_Draw_app.git
