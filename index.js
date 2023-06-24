import { drizzle } from 'drizzle-orm/node-postgres';
import { migrate } from 'drizzle-orm/node-postgres/migrator';
import dotenv from 'dotenv';
import pkg from 'pg';
const { Pool } = pkg;
const env = dotenv.config();
const pool = new Pool({
    connectionString: `postgres://${process.env.POSTGRES_USER}:${process.env.POSTGRES_PASSWORD}@${process.env.POSTGRES_HOST}:5432/${process.env.POSTGRES_DATABASE}?sslmode=require`
});
const db = drizzle(pool);
migrate(db, { migrationsFolder: "drizzle" }).then((value) => {
    console.log('migration executed');
}, (err) => {
    console.log('Error Occured', err);
});
