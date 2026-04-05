#!/usr/bin/env node
/**
 * XRStack rule installer.
 *
 * Copies rules from the plugin directory to ~/.claude/rules/.
 * Rules are not auto-loaded by the Claude Code plugin system,
 * so they must be installed manually.
 *
 * Usage:
 *   node install-apply.js [--dry-run]
 */

const fs = require('fs');
const path = require('path');
const os = require('os');

const DRY_RUN = process.argv.includes('--dry-run');

const SCRIPT_DIR = __dirname;
const PLUGIN_ROOT = path.resolve(SCRIPT_DIR, '..', '..');
const RULES_SOURCE = path.join(PLUGIN_ROOT, '.claude', 'rules');
const CLAUDE_HOME = path.join(os.homedir(), '.claude');
const RULES_DEST = path.join(CLAUDE_HOME, 'rules');

function copyDirRecursive(src, dest) {
    let count = 0;

    if (!fs.existsSync(src)) {
        console.error(`Source not found: ${src}`);
        process.exit(1);
    }

    if (!DRY_RUN) {
        fs.mkdirSync(dest, { recursive: true });
    }

    const entries = fs.readdirSync(src, { withFileTypes: true });
    for (const entry of entries) {
        const srcPath = path.join(src, entry.name);
        const destPath = path.join(dest, entry.name);

        if (entry.isDirectory()) {
            count += copyDirRecursive(srcPath, destPath);
        } else {
            if (DRY_RUN) {
                console.log(`  [dry-run] ${srcPath} -> ${destPath}`);
            } else {
                fs.copyFileSync(srcPath, destPath);
                console.log(`  ${entry.name} -> ${destPath}`);
            }
            count++;
        }
    }

    return count;
}

function main() {
    console.log('XRStack Rule Installer');
    console.log('=====================\n');

    if (DRY_RUN) {
        console.log('Mode: dry-run (no files will be copied)\n');
    }

    if (!fs.existsSync(RULES_SOURCE)) {
        console.error(`Rules directory not found: ${RULES_SOURCE}`);
        console.error('Are you running this from the XRStack plugin directory?');
        process.exit(1);
    }

    const rulesDirs = fs.readdirSync(RULES_SOURCE, { withFileTypes: true })
        .filter(d => d.isDirectory())
        .map(d => d.name);

    console.log(`Source: ${RULES_SOURCE}`);
    console.log(`Destination: ${RULES_DEST}`);
    console.log(`Rule sets: ${rulesDirs.join(', ')}\n`);

    let totalFiles = 0;

    for (const dir of rulesDirs) {
        const src = path.join(RULES_SOURCE, dir);
        const dest = path.join(RULES_DEST, dir);
        console.log(`Installing ${dir}/ rules:`);
        const count = copyDirRecursive(src, dest);
        totalFiles += count;
        console.log();
    }

    if (DRY_RUN) {
        console.log(`Dry run complete. ${totalFiles} files would be copied.`);
    } else {
        console.log(`Done. ${totalFiles} rules installed to ${RULES_DEST}`);
    }
}

main();
