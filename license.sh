#!/usr/bin/env bash

add_license(){
    local license_type="$1"

    # Check if the license directory exists
    local license_dir="licenses"
    if [ ! -d "$license_dir" ]; then
        echo "License directory '$license_dir' not found. Make sure to create it and place license files there."
        exit 1
    fi

    case "$license_type" in
        "mit" | "apache" | "gnu" | "unlicense") # if in the list of supported licenses
            license_file="$license_dir/$license_type.txt"
            if [ -f "$license_file" ]; then
                # Ask the user for confirmation to overwrite the LICENSE file
                read -p "A LICENSE file already exists. Do you want to overwrite it? (Y/n) " confirm
                if [ "$confirm" == "n" ]; then
                    echo "Operation aborted."
                    exit 0
                fi
                # Read the license content from the file
                license_content="$(cat "$license_file")"
            else
                echo "License file for $license_type not found in '$license_dir'."
                exit 1
            fi

        ;;
        *) # if not in the list of supported licenses
            echo "Unsupported license type: $license_type"
            exit 1
    esac

    # Create the LICENSE file and write the license content to it
    echo "$license_content" > LICENSE

    echo "Added $license_type LICENSE to your project."
}

# Check if a license type argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: license <license_type>"
    exit 1
fi

# Invoke the add_license function with the provided license type
add_license "$1"