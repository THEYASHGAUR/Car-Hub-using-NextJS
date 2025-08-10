#!/bin/bash

# Set your Google Cloud project ID
PROJECT_ID="your-project-id"
REGION="us-central1"
SERVICE_NAME="car-hub"

echo "🚀 Starting deployment to Google Cloud Run..."

# Check if gcloud is installed
if ! command -v gcloud &> /dev/null; then
    echo "❌ gcloud CLI is not installed. Please install it first."
    exit 1
fi

# Check if docker is running
if ! docker info &> /dev/null; then
    echo "❌ Docker is not running. Please start Docker first."
    exit 1
fi

# Set the project
echo "📋 Setting Google Cloud project to: $PROJECT_ID"
gcloud config set project $PROJECT_ID

# Enable required APIs
echo "🔧 Enabling required APIs..."
gcloud services enable cloudbuild.googleapis.com
gcloud services enable run.googleapis.com

# Build and push the Docker image
echo "🐳 Building and pushing Docker image..."
gcloud builds submit --tag gcr.io/$PROJECT_ID/$SERVICE_NAME

# Deploy to Cloud Run
echo "🚀 Deploying to Cloud Run..."
gcloud run deploy $SERVICE_NAME \
    --image gcr.io/$PROJECT_ID/$SERVICE_NAME \
    --platform managed \
    --region $REGION \
    --allow-unauthenticated \
    --port 3000 \
    --memory 512Mi \
    --cpu 1 \
    --max-instances 10 \
    --timeout 300

echo "✅ Deployment completed!"
echo "🌐 Your app is available at:"
gcloud run services describe $SERVICE_NAME --region=$REGION --format="value(status.url)"
