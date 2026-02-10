import './src/config/env.js';  // Cargar archivo con .env ya cargado
import app from './src/app.js';
import { testConnection } from './src/config/db.js';

const PORT = process.env.PORT || 3000;

async function startServer() {
  console.log('🚀 Iniciando API...');
  
  if (!await testConnection()) {
    console.error('❌ Error de base de datos');
    process.exit(1);
  }
  
  app.listen(PORT, () => {
    console.log(`✅ Servidor en http://localhost:${PORT}`);
  });
}

startServer().catch(console.error);