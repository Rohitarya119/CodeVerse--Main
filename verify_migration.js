/**
 * Verify Database Migration
 */

const { Client } = require('pg');

const config = {
    host: 'aws-1-ap-southeast-1.pooler.supabase.com',
    port: 5432,
    user: 'postgres.vfrqhbhkawmfacjenjiy',
    password: 'D2qCstgRoIp7nrue',
    database: 'postgres',
    ssl: { rejectUnauthorized: false }
};

async function verify() {
    const client = new Client(config);

    try {
        await client.connect();
        console.log('🔍 Verifying Database Upgrade...\n');
        console.log('='.repeat(60));

        // 1. Check table count
        const tables = await client.query(`
            SELECT table_name 
            FROM information_schema.tables 
            WHERE table_schema = 'public' AND table_type = 'BASE TABLE'
            ORDER BY table_name
        `);
        console.log('\n📊 TABLES:');
        tables.rows.forEach(r => console.log(`   ✓ ${r.table_name}`));

        // 2. Check indexes
        const indexes = await client.query(`
            SELECT tablename, indexname 
            FROM pg_indexes 
            WHERE schemaname = 'public'
            AND indexname LIKE 'idx_%'
            ORDER BY tablename, indexname
        `);
        console.log(`\n📁 INDEXES (${indexes.rows.length} total):`);
        const indexByTable = {};
        indexes.rows.forEach(r => {
            if (!indexByTable[r.tablename]) indexByTable[r.tablename] = [];
            indexByTable[r.tablename].push(r.indexname);
        });
        Object.entries(indexByTable).forEach(([table, idxs]) => {
            console.log(`   ${table}: ${idxs.length} indexes`);
        });

        // 3. Check views
        const views = await client.query(`
            SELECT table_name 
            FROM information_schema.views 
            WHERE table_schema = 'public'
            ORDER BY table_name
        `);
        console.log(`\n👁️  VIEWS (${views.rows.length}):`);
        views.rows.forEach(r => console.log(`   ✓ ${r.table_name}`));

        // 4. Check materialized views
        const matViews = await client.query(`
            SELECT matviewname 
            FROM pg_matviews 
            WHERE schemaname = 'public'
        `);
        console.log(`\n📊 MATERIALIZED VIEWS (${matViews.rows.length}):`);
        matViews.rows.forEach(r => console.log(`   ✓ ${r.matviewname}`));

        // 5. Check functions
        const funcs = await client.query(`
            SELECT proname, pg_get_function_arguments(p.oid) as args
            FROM pg_proc p
            JOIN pg_namespace n ON p.pronamespace = n.oid
            WHERE n.nspname = 'public'
            AND proname NOT LIKE 'pg_%'
            ORDER BY proname
        `);
        console.log(`\n⚙️  FUNCTIONS (${funcs.rows.length}):`);
        funcs.rows.forEach(r => console.log(`   ✓ ${r.proname}(${r.args.substring(0, 40)}...)`));

        // 6. Check triggers
        const triggers = await client.query(`
            SELECT trigger_name, event_object_table 
            FROM information_schema.triggers 
            WHERE trigger_schema = 'public'
        `);
        console.log(`\n⚡ TRIGGERS (${triggers.rows.length}):`);
        triggers.rows.forEach(r => console.log(`   ✓ ${r.trigger_name} on ${r.event_object_table}`));

        // 7. Check constraints
        const constraints = await client.query(`
            SELECT conname, conrelid::regclass as table_name
            FROM pg_constraint 
            WHERE connamespace = 'public'::regnamespace
            AND conname LIKE 'chk_%'
        `);
        console.log(`\n✅ CHECK CONSTRAINTS (${constraints.rows.length}):`);
        constraints.rows.forEach(r => console.log(`   ✓ ${r.conname} on ${r.table_name}`));

        // 8. Check RLS status
        const rls = await client.query(`
            SELECT relname, relrowsecurity 
            FROM pg_class 
            WHERE relnamespace = 'public'::regnamespace
            AND relkind = 'r'
            AND relrowsecurity = true
        `);
        console.log(`\n🔒 ROW LEVEL SECURITY (${rls.rows.length} tables):`);
        rls.rows.forEach(r => console.log(`   ✓ ${r.relname}`));

        // 9. Check new columns on problems
        const problemCols = await client.query(`
            SELECT column_name, data_type 
            FROM information_schema.columns 
            WHERE table_name = 'problems'
            AND column_name IN ('created_at', 'updated_at', 'is_active', 'frequency', 'companies')
        `);
        console.log(`\n📝 AUDIT/NEW COLUMNS on problems:`);
        problemCols.rows.forEach(r => console.log(`   ✓ ${r.column_name} (${r.data_type})`));

        // 10. Quick data stats
        const stats = await client.query(`
            SELECT 
                (SELECT COUNT(*) FROM users) as user_count,
                (SELECT COUNT(*) FROM problems) as problem_count,
                (SELECT COUNT(*) FROM test_cases) as testcase_count,
                (SELECT COUNT(*) FROM user_solved_problem) as solved_count
        `);
        const s = stats.rows[0];
        console.log(`\n📈 DATA STATISTICS:`);
        console.log(`   Users: ${s.user_count}`);
        console.log(`   Problems: ${s.problem_count}`);
        console.log(`   Test Cases: ${s.testcase_count}`);
        console.log(`   Solved Records: ${s.solved_count}`);

        console.log('\n' + '='.repeat(60));
        console.log('✅ Database verification complete!');
        console.log('='.repeat(60));

    } catch (err) {
        console.error('❌ Error:', err.message);
    } finally {
        await client.end();
    }
}

verify();
