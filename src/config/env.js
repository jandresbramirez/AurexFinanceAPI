import dotenv from 'dotenv';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// ==========================================
// 1. Verificar que .env existe y no está vacío
// ==========================================
const envPath = path.resolve(__dirname, '../../.env');

if (!fs.existsSync(envPath)) {
  console.error('\n❌ ERROR: Archivo .env no encontrado');
  console.error(`💡 Crea el archivo en: ${envPath}`);
  console.error('   O copia .env.example si existe\n');
  process.exit(1);
}

const envContent = fs.readFileSync(envPath, 'utf8').trim();
if (envContent.length === 0) {
  console.error('\n❌ ERROR: Archivo .env está vacío');
  console.error('💡 Agrega tus variables de entorno\n');
  process.exit(1);
}

// ==========================================
// 2. Cargar y verificar que se cargaron variables
// ==========================================
const { parsed, error } = dotenv.config({ path: envPath });

if (error) {
  console.error('\n❌ ERROR cargando .env:', error.message);
  process.exit(1);
}

if (!parsed || Object.keys(parsed).length === 0) {
  console.error('\n❌ ERROR: .env cargado pero no contiene variables válidas');
  console.error('💡 Verifica que tengas líneas como:');
  console.error('   DB_HOST=127.0.0.1');
  console.error('   DB_USER=root\n');
  process.exit(1);
}

// ==========================================
// 3. Verificar variables MÍNIMAS indispensables
// ==========================================
const minVars = ['DB_NAME', 'JWT_SECRET']; // Lo absolutamente crítico
const missing = minVars.filter(key => !parsed[key]);

if (missing.length > 0) {
  console.error('\n❌ ERROR: Variables críticas faltantes en .env:');
  missing.forEach(key => console.error(`   - ${key}`));
  console.error('\n💡 Agrega estas variables a tu .env\n');
  process.exit(1);
}

// ==========================================
// 4. Configuración básica (sin defaults peligrosos)
// ==========================================
const config = {
  env: process.env.NODE_ENV || 'development'  ,
  
  db: {
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    name: process.env.DB_NAME
  },
  
  server: {
    port: process.env.PORT || 3000,
    nodeEnv: process.env.NODE_ENV || 'development' 
  },
  
  jwt: {
    secret: process.env.JWT_SECRET,
    expiresIn: process.env.JWT_EXPIRES_IN || '1h'
  }
};

export default config;