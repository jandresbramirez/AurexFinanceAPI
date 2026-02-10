// src/config/db.js - VERSIÓN CORREGIDA
import mysql from 'mysql2/promise';
import config from './env.js';  // ← Import default

// Conexión con la base de datos
const db = mysql.createPool({
  host: config.db.host,
  user: config.db.user,
  password: config.db.password,
  database: config.db.name,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

// Prueba de conexión y mensaje de alerta
async function testConnection() {
  try {
    const conn = await db.getConnection();
    console.log('✅ Conexión a MySQL establecida');
    conn.release();
    return true;
  } catch (error) {
    console.error('❌ Error DB:', error.message);
    return false;
  }
}

export { db, testConnection };