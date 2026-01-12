const { Client } = require('pg');
const fs = require('fs');

const c = new Client({
    host: 'aws-1-ap-southeast-1.pooler.supabase.com',
    port: 5432,
    user: 'postgres.vfrqhbhkawmfacjenjiy',
    password: 'D2qCstgRoIp7nrue',
    database: 'postgres',
    ssl: { rejectUnauthorized: false }
});

c.connect().then(async () => {
    let output = [];
    output.push("DATABASE STATUS REPORT");
    output.push("=".repeat(50));

    // Count indexes
    const idx = await c.query(`SELECT COUNT(*) as count FROM pg_indexes WHERE schemaname='public' AND indexname LIKE 'idx_%'`);
    output.push(`Performance Indexes: ${idx.rows[0].count}`);

    // Count views
    const views = await c.query(`SELECT COUNT(*) as count FROM information_schema.views WHERE table_schema='public'`);
    output.push(`Database Views: ${views.rows[0].count}`);

    // Count functions
    const funcs = await c.query(`SELECT COUNT(*) as count FROM pg_proc WHERE pronamespace='public'::regnamespace`);
    output.push(`Custom Functions: ${funcs.rows[0].count}`);

    // Count RLS tables
    const rls = await c.query(`SELECT COUNT(*) as count FROM pg_class WHERE relnamespace='public'::regnamespace AND relrowsecurity=true`);
    output.push(`RLS Enabled Tables: ${rls.rows[0].count}`);

    // Count triggers
    const triggers = await c.query(`SELECT COUNT(*) as count FROM information_schema.triggers WHERE trigger_schema='public'`);
    output.push(`Triggers: ${triggers.rows[0].count}`);

    // Data stats
    const stats = await c.query(`SELECT (SELECT COUNT(*) FROM users) as users, (SELECT COUNT(*) FROM problems) as problems, (SELECT COUNT(*) FROM test_cases) as test_cases, (SELECT COUNT(*) FROM user_solved_problem) as solved`);
    output.push("");
    output.push("DATA STATISTICS:");
    output.push(`  Users: ${stats.rows[0].users}`);
    output.push(`  Problems: ${stats.rows[0].problems}`);
    output.push(`  Test Cases: ${stats.rows[0].test_cases}`);
    output.push(`  User Solved Records: ${stats.rows[0].solved}`);

    // Check new columns
    const cols = await c.query(`SELECT column_name FROM information_schema.columns WHERE table_name='problems' AND column_name IN ('created_at','updated_at','is_active','frequency','companies') ORDER BY column_name`);
    output.push("");
    output.push("NEW COLUMNS ON PROBLEMS TABLE:");
    cols.rows.forEach(r => output.push(`  - ${r.column_name}`));

    // List indexes
    const idxList = await c.query(`SELECT indexname FROM pg_indexes WHERE schemaname='public' AND indexname LIKE 'idx_%' ORDER BY indexname LIMIT 20`);
    output.push("");
    output.push("SAMPLE INDEXES:");
    idxList.rows.forEach(r => output.push(`  - ${r.indexname}`));

    output.push("");
    output.push("=".repeat(50));
    output.push("INDUSTRY-LEVEL UPGRADE COMPLETE!");

    const result = output.join("\n");
    fs.writeFileSync("db_status_report.txt", result);
    console.log(result);

    await c.end();
}).catch(err => {
    console.error("Error:", err.message);
});
