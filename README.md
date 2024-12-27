# NX-MICRORAY

## Project Overview

This project meant for proof of concepts to a full stack web app with microservices architecture which consists of

- **Frontend**: Nx Monorepo with Next.js, Storybook, and Tailwind CSS
- **Backend**: GraphQL server in Golang
- **Database**: MongoDB
- **Web Server**: Nginx for reverse proxy

## Boon of Microservices

- Scalable
- Easy to manage different services

## Setup & Installation

### Prerequisites

Docker

### Steps to Init

1. **Build the application**:
   `nx-microray build`

2. **Import initial data**:
   `nx-microray import`

### Start All Services

To start all services
`nx-microray up`
