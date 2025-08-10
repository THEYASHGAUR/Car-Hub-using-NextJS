# Car Hub - Car Showcase Application

A modern car showcase application built with Next.js, TypeScript, and Tailwind CSS.

## 🚀 Features

- Modern, responsive UI built with Tailwind CSS
- TypeScript for type safety
- Docker containerization
- Google Cloud Run ready
- Health check endpoints
- Optimized for production

## 🛠️ Tech Stack

- **Frontend**: Next.js 13, React 18, TypeScript
- **Styling**: Tailwind CSS
- **UI Components**: Headless UI
- **Containerization**: Docker
- **Cloud Platform**: Google Cloud Run

## 📋 Prerequisites

- Node.js 18+ 
- Docker and Docker Compose
- Google Cloud CLI (for deployment)
- Git

## 🐳 Local Development with Docker

### Quick Start

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd car-hub
   ```

2. **Build and run with Docker Compose**
   ```bash
   docker-compose up -d
   ```

3. **Access the application**
   - Main app: http://localhost:3000
   - Health check: http://localhost:3000/api/health

4. **Stop the application**
   ```bash
   docker-compose down
   ```

### Manual Docker Commands

```bash
# Build the image
docker build -t car-hub:latest .

# Run the container
docker run -p 3000:3000 car-hub:latest

# Run in detached mode
docker run -d -p 3000:3000 --name car-hub-app car-hub:latest
```

## ☁️ Deployment to Google Cloud Run

### Prerequisites

1. **Install Google Cloud CLI**
   ```bash
   # macOS
   brew install google-cloud-sdk
   
   # Or download from: https://cloud.google.com/sdk/docs/install
   ```

2. **Authenticate and set project**
   ```bash
   gcloud auth login
   gcloud config set project YOUR_PROJECT_ID
   ```

### Automated Deployment

1. **Update the project ID in deploy.sh**
   ```bash
   # Edit deploy.sh and change PROJECT_ID="your-project-id"
   ```

2. **Run the deployment script**
   ```bash
   chmod +x deploy.sh
   ./deploy.sh
   ```

### Manual Deployment

1. **Build and push the image**
   ```bash
   gcloud builds submit --tag gcr.io/YOUR_PROJECT_ID/car-hub
   ```

2. **Deploy to Cloud Run**
   ```bash
   gcloud run deploy car-hub \
     --image gcr.io/YOUR_PROJECT_ID/car-hub \
     --platform managed \
     --region us-central1 \
     --allow-unauthenticated \
     --port 3000 \
     --memory 512Mi \
     --cpu 1
   ```

## 🔧 Configuration

### Environment Variables

- `NODE_ENV`: Set to `production` for production builds
- `PORT`: Port number (default: 3000)
- `HOSTNAME`: Host binding (default: 0.0.0.0)

### Next.js Configuration

The application is configured with:
- `output: 'standalone'` for Docker optimization
- Experimental output file tracing for smaller container size
- Health check endpoint at `/api/health`

## 📁 Project Structure

```
car-hub/
├── app/                    # Next.js 13 app directory
├── components/            # React components
├── types/                # TypeScript type definitions
├── utils/                # Utility functions
├── public/               # Static assets
├── Dockerfile            # Multi-stage Docker build
├── docker-compose.yml    # Local development setup
├── cloud-run.yaml        # Cloud Run configuration
├── deploy.sh             # Deployment script
└── README.md            # This file
```

## 🧪 Testing

### Health Check
```bash
curl http://localhost:3000/api/health
```

Expected response:
```json
{
  "status": "healthy",
  "timestamp": "2025-08-10T22:06:25.304Z",
  "service": "car-hub"
}
```

### Container Health
```bash
docker ps
docker logs car-hub-car-hub-1
```

## 🚀 Performance Optimizations

- Multi-stage Docker build for smaller image size
- Next.js standalone output for optimized containers
- Alpine Linux base image for minimal footprint
- Health checks for container orchestration
- Resource limits configured for Cloud Run

## 🔒 Security

- Non-root user execution in containers
- Minimal attack surface with Alpine Linux
- Environment variable isolation
- Secure defaults for production deployment

## 📊 Monitoring

The application includes:
- Health check endpoints for load balancers
- Structured logging
- Resource usage monitoring via Cloud Run metrics

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test with Docker
5. Submit a pull request

## 📝 License

This project is licensed under the MIT License.

## 🆘 Support

For issues and questions:
1. Check the Docker logs: `docker logs <container-name>`
2. Verify the health endpoint: `curl /api/health`
3. Check Cloud Run logs: `gcloud logs read --service=car-hub`

## 🔄 Updates

To update the application:
1. Pull the latest changes
2. Rebuild the Docker image
3. Redeploy to Cloud Run using the deploy script

---

**Happy coding! 🚗✨**
