#!/usr/bin/env node

const path = require("path");
const fs = require("fs");

const licenses_path = path.join(__dirname, "./licenses");
const licenses = fs.readdirSync(licenses_path); // this outputs the list of files in the licenses directory
// ['apache.txt', 'mit.txt', 'gnu.txt', 'unlicense.txt']

// Parse the command line arguments
const args = process.argv.slice(2);

if (args.length === 0) {
    console.log("Usage: license <license_type>");
    process.exit(1);
}

const license_type = args[0];

const main = async () => {
    if (licenses.includes(`${license_type}.txt`)) {
        const license_path = path.join(licenses_path, `${license_type}.txt`);
        const license = fs.readFileSync(license_path, "utf-8");
        // console.log(license);

        // Write the license to a file
        const output_path = path.join(process.cwd(), "LICENSE");
        fs.writeFileSync(output_path, license);

        console.log(`License file written to ${output_path}`);
    } else {
        console.log("License type not available.");
    }
};

main();
