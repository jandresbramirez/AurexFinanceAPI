import mysql from "mysql2/promise"

// Conexión con la base de datos
const db = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
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