import config from './config/env.js';  // ← Import default

import express from 'express';
import cors from 'cors';
import { db } from './config/db.js';

const app = express();

// ==========================================
// Middlewares
// ==========================================
app.use(cors());  // Habilitar CORS
app.use(express.json());  // Parsear JSON
app.use(express.urlencoded({ extended: true }));  // Parsear URL-encoded

// ==========================================
// Rutas de prueba/health check
// ==========================================
app.get('/', (req, res) => {
  res.json({
    message: '🚀 AurexFinance API está funcionando',
    version: '1.0.0',
    environment: config.server.nodeEnv,
    endpoints: {
      health: '/api/health'
    }
  });
});

app.get('/api/health', (req, res) => {
  res.json({
    status: 'healthy',
    timestamp: new Date().toISOString(),
    service: 'AurexFinance API'
  });
});

// ==========================================
// Manejo de errores
// ==========================================

// Ruta no encontrada (404)
app.use((req, res, next) => {
  res.status(404).json({
    error: 'Ruta no encontrada',
    path: req.path,
    method: req.method
  });
});

// Manejo global de errores
app.use((err, req, res, next) => {
  console.error('💥 Error no manejado:', err.stack);
  
  const statusCode = err.statusCode || 500;
  const message = config.server.nodeEnv === 'production' 
    ? 'Error interno del servidor' 
    : err.message;
  
  res.status(statusCode).json({
    error: message,
    ...(config.server.nodeEnv !== 'production' && { stack: err.stack })
  });
});

export default app;