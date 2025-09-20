#!/bin/bash

echo "🌍 EcoLearn Platform Setup"
echo "=========================="

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js (v18 or higher) and try again."
    exit 1
fi

# Check Node.js version
NODE_VERSION=$(node -v | cut -d'.' -f1 | cut -d'v' -f2)
if [ "$NODE_VERSION" -lt 18 ]; then
    echo "❌ Node.js version 18 or higher is required. Current version: $(node -v)"
    exit 1
fi

echo "✅ Node.js $(node -v) is installed"

# Check if MongoDB is running (optional)
if command -v mongod &> /dev/null; then
    if pgrep mongod > /dev/null; then
        echo "✅ MongoDB is running"
    else
        echo "⚠️  MongoDB is not running. Please start MongoDB or use a cloud instance."
    fi
else
    echo "⚠️  MongoDB not found. Please install MongoDB or use MongoDB Atlas."
fi

echo ""
echo "📦 Installing dependencies..."

# Install root dependencies
echo "Installing root dependencies..."
npm install

# Install backend dependencies
echo "Installing backend dependencies..."
cd backend && npm install
cd ..

# Install frontend dependencies
echo "Installing frontend dependencies..."
cd frontend && npm install
cd ..

echo ""
echo "🔧 Setting up environment..."

# Create .env file if it doesn't exist
if [ ! -f "backend/.env" ]; then
    echo "Creating backend/.env file..."
    cat > backend/.env << EOL
MONGODB_URI=mongodb://localhost:27017/ecolearn
JWT_SECRET=your-super-secret-jwt-key-change-this-in-production
CLIENT_URL=http://localhost:3000
PORT=5000
NODE_ENV=development
EOL
    echo "✅ Created backend/.env file"
else
    echo "✅ Backend .env file already exists"
fi

echo ""
echo "📊 Database setup..."

# Check if we should populate sample data
read -p "Do you want to populate the database with sample curriculum data? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Populating database with sample data..."
    cd backend
    node scripts/populateCurriculum.js
    cd ..
fi

echo ""
echo "🚀 Starting the application..."

echo "To start the development servers:"
echo "  1. Make sure MongoDB is running (or use MongoDB Atlas)"
echo "  2. Run: npm run dev"
echo ""
echo "This will start both the backend (port 5000) and frontend (port 3000)"
echo ""
echo "📱 Access the application at: http://localhost:3000"
echo ""
echo "📚 API documentation available at: http://localhost:5000/api/health"
echo ""
echo "Happy learning! 🌍✨"
