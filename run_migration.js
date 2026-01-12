/**
 * Database Migration Runner for Supabase
 * Run: node run_migration.js
 */

const { Client } = require('pg');
const fs = require('fs');
const path = require('path');

// Supabase connection config from .env
const config = {
    host: 'aws-1-ap-southeast-1.pooler.supabase.com',
    port: 5432,
    user: 'postgres.vfrqhbhkawmfacjenjiy',
    password: 'D2qCstgRoIp7nrue',
    database: 'postgres',
    ssl: { rejectUnauthorized: false }
};

async function runMigration() {
    const client = new Client(config);

    try {
        console.log('🔌 Connecting to Supabase...');
        await client.connect();
        console.log('✅ Connected successfully!\n');

        // Read the SQL file
        const sqlPath = path.join(__dirname, 'database_migration_industry_level.sql');
        const sql = fs.readFileSync(sqlPath, 'utf8');

        console.log('📜 Running migration script...\n');
        console.log('='.repeat(60));

        // Split SQL into individual statements and run them
        // This handles DO blocks, functions, etc. more carefully
        const statements = sql
            .split(/;\s*(?=\n|$)/)
            .filter(stmt => stmt.trim().length > 0);

        let successCount = 0;
        let errorCount = 0;
        const errors = [];

        for (const statement of statements) {
            const trimmed = statement.trim();
            if (!trimmed) continue;

            try {
                await client.query(trimmed);
                successCount++;

                // Log progress for important operations
                if (trimmed.includes('CREATE INDEX')) {
                    console.log('  ✓ Index created');
                } else if (trimmed.includes('CREATE OR REPLACE VIEW')) {
                    const match = trimmed.match(/VIEW\s+(\w+)/i);
                    console.log(`  ✓ View created: ${match ? match[1] : 'unknown'}`);
                } else if (trimmed.includes('CREATE OR REPLACE FUNCTION')) {
                    const match = trimmed.match(/FUNCTION\s+(\w+)/i);
                    console.log(`  ✓ Function created: ${match ? match[1] : 'unknown'}`);
                } else if (trimmed.includes('CREATE TABLE')) {
                    const match = trimmed.match(/TABLE\s+(?:IF NOT EXISTS\s+)?(\w+)/i);
                    console.log(`  ✓ Table created: ${match ? match[1] : 'unknown'}`);
                } else if (trimmed.includes('CREATE TRIGGER')) {
                    console.log('  ✓ Trigger created');
                } else if (trimmed.includes('CREATE MATERIALIZED VIEW')) {
                    console.log('  ✓ Materialized view created');
                } else if (trimmed.includes('ALTER TABLE') && trimmed.includes('ADD COLUMN')) {
                    console.log('  ✓ Column added');
                } else if (trimmed.includes('CREATE POLICY')) {
                    console.log('  ✓ RLS Policy created');
                } else if (trimmed.includes('ENABLE ROW LEVEL SECURITY')) {
                    console.log('  ✓ RLS enabled');
                }
            } catch (err) {
                errorCount++;

                // Some errors are expected (e.g., already exists)
                if (err.message.includes('already exists') ||
                    err.message.includes('does not exist') ||
                    err.message.includes('duplicate key')) {
                    // Skip these - they're expected for idempotent operations
                } else {
                    errors.push({
                        statement: trimmed.substring(0, 100) + '...',
                        error: err.message
                    });
                    console.log(`  ⚠ Warning: ${err.message.substring(0, 80)}...`);
                }
            }
        }

        console.log('\n' + '='.repeat(60));
        console.log('\n📊 Migration Summary:');
        console.log(`   ✅ Successful operations: ${successCount}`);
        console.log(`   ⚠️  Skipped/Warnings: ${errorCount}`);

        if (errors.length > 0) {
            console.log('\n⚠️  Notable Errors (may need attention):');
            errors.slice(0, 5).forEach((e, i) => {
                console.log(`   ${i + 1}. ${e.error}`);
            });
        }

        // Verify the migration
        console.log('\n🔍 Verifying Migration...\n');

        // Check indexes
        const indexResult = await client.query(`
            SELECT COUNT(*) as count 
            FROM pg_indexes 
            WHERE tablename IN ('users', 'problems', 'test_cases', 'user_solved_problem', 'battle', 'battle_submission')
        `);
        console.log(`   📁 Indexes created: ${indexResult.rows[0].count}`);

        // Check views
        const viewResult = await client.query(`
            SELECT COUNT(*) as count 
            FROM information_schema.views 
            WHERE table_schema = 'public' AND table_name LIKE 'v_%'
        `);
        console.log(`   👁️  Views created: ${viewResult.rows[0].count}`);

        // Check functions
        const funcResult = await client.query(`
            SELECT COUNT(*) as count 
            FROM pg_proc 
            WHERE pronamespace = 'public'::regnamespace
            AND proname IN ('search_problems', 'get_user_progress', 'get_recommended_problems', 'get_user_streak', 'update_problem_stats', 'refresh_leaderboard', 'update_daily_stats')
        `);
        console.log(`   ⚙️  Functions created: ${funcResult.rows[0].count}`);

        // Check if audit columns exist
        const auditResult = await client.query(`
            SELECT COUNT(*) as count 
            FROM information_schema.columns 
            WHERE table_name = 'problems' AND column_name IN ('created_at', 'updated_at', 'is_active')
        `);
        console.log(`   📝 Audit columns on problems: ${auditResult.rows[0].count}/3`);

        console.log('\n' + '='.repeat(60));
        console.log('✅ Migration completed successfully!');
        console.log('='.repeat(60));

    } catch (err) {
        console.error('❌ Migration failed:', err.message);
        process.exit(1);
    } finally {
        await client.end();
    }
}

runMigration();
