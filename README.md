# EcoLearn - Interactive Environmental Education Platform

A comprehensive full-stack web application for environmental education with gamification features, community interaction, and progress tracking.

## Features

### 🎓 Educational Content
- 12-week structured curriculum covering environmental topics
- Interactive lessons with quizzes and assessments
- Progress tracking and analytics
- Multiple difficulty levels (beginner, intermediate, advanced)

### 🎮 Gamification
- Points and badge system
- Leaderboards and achievements
- Progress milestones
- Eco-friendly rewards system

### 👥 Community Features
- Discussion forums and Q&A
- User profiles and social features
- Community challenges and projects
- Success stories and sharing

### 📊 Analytics & Tracking
- Personal dashboard with progress overview
- Environmental impact metrics
- Learning analytics and insights
- Performance reports

## Tech Stack

### Backend
- **Node.js** with Express.js
- **MongoDB** with Mongoose ODM
- **JWT** authentication
- **Socket.io** for real-time features
- **Multer** for file uploads

### Frontend
- **Next.js** 14 with React 18
- **Material-UI** for components
- **TypeScript** for type safety
- **Axios** for API calls
- **Framer Motion** for animations

## Project Structure

```
ecolearn-platform/
├── backend/                 # Node.js/Express API
│   ├── models/             # Database models
│   │   ├── User.js
│   │   ├── Lesson.js
│   │   ├── Progress.js
│   │   ├── Achievement.js
│   │   ├── UserAchievement.js
│   │   ├── CommunityPost.js
│   │   ├── Comment.js
│   │   └── Curriculum.js
│   ├── routes/             # API routes
│   │   ├── auth.js
│   │   ├── lessons.js
│   │   ├── progress.js
│   │   ├── gamification.js
│   │   ├── community.js
│   │   ├── admin.js
│   │   └── curriculum.js
│   ├── middleware/         # Authentication middleware
│   └── server.js          # Main server file
├── frontend/               # Next.js React application
│   ├── src/
│   │   ├── app/           # Next.js app directory
│   │   │   ├── login/
│   │   │   ├── dashboard/
│   │   │   ├── lessons/
│   │   │   ├── leaderboard/
│   │   │   ├── community/
│   │   │   └── curriculum/
│   │   ├── components/    # Reusable components
│   │   ├── contexts/      # React contexts
│   │   └── styles/        # Global styles
│   └── package.json
└── package.json           # Root package.json
```

## Installation & Setup

### Prerequisites
- Node.js (v18 or higher)
- MongoDB (local or cloud instance)
- npm or yarn

### 1. Clone and Install Dependencies

```bash
# Install root dependencies
npm install

# Install backend dependencies
cd backend && npm install

# Install frontend dependencies
cd ../frontend && npm install

# Return to root
cd ..
```

### 2. Environment Setup

Create a `.env` file in the backend directory:

```env
MONGODB_URI=mongodb://localhost:27017/ecolearn
JWT_SECRET=your-super-secret-jwt-key
CLIENT_URL=http://localhost:3000
PORT=5000
```

### 3. Database Setup

```bash
# Start MongoDB (if using local instance)
mongod

# Populate curriculum data (optional)
cd backend
node scripts/populateCurriculum.js
```

### 4. Run the Application

```bash
# Development mode (runs both frontend and backend)
npm run dev

# Or run separately:
# Backend only
npm run server

# Frontend only
npm run client
```

## API Endpoints

### Authentication
- `POST /api/auth/register` - User registration
- `POST /api/auth/login` - User login
- `GET /api/auth/profile` - Get user profile

### Lessons
- `GET /api/lessons` - Get all lessons
- `GET /api/lessons/:id` - Get specific lesson
- `POST /api/lessons` - Create lesson (admin)

### Progress
- `GET /api/progress/:userId` - Get user progress
- `POST /api/progress` - Update progress

### Curriculum
- `GET /api/curriculum` - Get all curriculum lessons
- `GET /api/curriculum/week/:week` - Get lesson by week
- `GET /api/curriculum/progress/:userId` - Get curriculum progress

### Community
- `GET /api/community/posts` - Get community posts
- `POST /api/community/posts` - Create post
- `POST /api/community/posts/:id/like` - Like/unlike post

## Development

### Available Scripts

```bash
# Root directory
npm run dev          # Start both frontend and backend
npm run install-all  # Install all dependencies
npm run build        # Build both frontend and backend

# Backend only
npm run server       # Start backend server
npm run build        # Build backend (no-op)

# Frontend only
npm run dev          # Start frontend development server
npm run build        # Build for production
npm run start        # Start production server
```

### Testing

```bash
# Backend tests
cd backend && npm test

# Frontend tests
cd frontend && npm test
```

## Deployment

### Build for Production

```bash
npm run build
```

### Environment Variables for Production

```env
NODE_ENV=production
MONGODB_URI=your-production-mongodb-uri
JWT_SECRET=your-production-jwt-secret
CLIENT_URL=https://yourdomain.com
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## License

This project is licensed under the MIT License.

## Support

For support and questions, please open an issue on GitHub.

---

**EcoLearn** - Making environmental education engaging and accessible for everyone! 🌍
