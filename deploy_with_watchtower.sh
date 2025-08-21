# ==============================================
# Deployment script for MyApp with Watchtower
# ==============================================

# CONFIGURATION
APP_NAME="cicd_test_container"
IMAGE_NAME="oheeteik/cicd_test:latest"
PORT="3000"

echo "🚀 Starting deployment of $APP_NAME using image $IMAGE_NAME..."

# Step 1: Pull the latest image from Docker Hub
echo "👉 Pulling latest image..."
docker pull $IMAGE_NAME

# Step 2: Stop and remove any existing container
echo "👉 Stopping old container (if running)..."
docker rm -f $APP_NAME || true

# Step 3: Run the new container
echo "👉 Running new container..."
docker run -d \
  --name $APP_NAME \
  -p ${PORT}:3000 \
  $IMAGE_NAME

# Step 4: Start (or restart) Watchtower
echo "👉 Setting up Watchtower to auto-update $APP_NAME..."
docker rm -f watchtower || true
docker run -d \
  --name watchtower \
  -v /var/run/docker.sock:/var/run/docker.sock \
  containrrr/watchtower \
  $APP_NAME \
  --interval 60

echo "✅ Deployment completed! Your app is running on http://localhost:${PORT}"
