import * as fs from 'fs';
import * as path from 'path';

// Function to read a JSON file and return its content as a string
function readJsonFile(filePath: string): string {
    try {
        const absolutePath = path.resolve(filePath);
        const data = fs.readFileSync(absolutePath, 'utf8');
        return data;
    } catch (error) {
        console.error(`Error reading file from disk: ${error}`);
        return '';
    }
}

// Example usage
const jsonString = readJsonFile('./data.json');
console.log(jsonString);
