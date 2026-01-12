import fs from 'fs';
import path from 'path';

function getFiles(dir) {
    if (!fs.existsSync(dir)) return [];
    const dirents = fs.readdirSync(dir, { withFileTypes: true });
    const files = dirents.map((dirent) => {
        const res = path.resolve(dir, dirent.name);
        return dirent.isDirectory() ? getFiles(res) : res;
    });
    return Array.prototype.concat(...files);
}

const files = getFiles('src');

files.forEach(file => {
    if (!file.endsWith('.jsx') && !file.endsWith('.js')) return;

    let content = fs.readFileSync(file, 'utf8');
    let originalContent = content;

    // Regex to find Link components and replace href with to
    // This is a bit naive but should work for most cases in this codebase
    // It looks for <Link followed by any characters until href=

    // Strategy: Split by <Link, then process each chunk
    const chunks = content.split('<Link');
    if (chunks.length > 1) {
        const newChunks = [chunks[0]];
        for (let i = 1; i < chunks.length; i++) {
            let chunk = chunks[i];
            // Check if this chunk actually belongs to a Link tag (it should start with props)
            // We assume the tag closes with > or />
            // We want to replace href= with to= ONLY before the tag closes

            // Find the end of the opening tag
            const tagEndIndex = chunk.indexOf('>');
            if (tagEndIndex !== -1) {
                const tagContent = chunk.substring(0, tagEndIndex);
                const rest = chunk.substring(tagEndIndex);

                // Replace href= with to= in tagContent
                // Handle href="...", href='...', href={...}
                const newTagContent = tagContent.replace(/href=(['"{])/g, 'to=$1');

                newChunks.push(newTagContent + rest);
            } else {
                newChunks.push(chunk);
            }
        }
        content = newChunks.join('<Link');
    }

    if (content !== originalContent) {
        fs.writeFileSync(file, content);
        console.log(`Fixed Link props in ${path.basename(file)}`);
    }
});
