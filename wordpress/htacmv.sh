#!/bin/bash

# Script to move all .htaccess files to a separate folder

# Set the destination folder name
DEST_FOLDER="htaccess_backup"

# Create the destination folder if it doesn't exist
if [ ! -d "$DEST_FOLDER" ]; then
    mkdir -p "$DEST_FOLDER"
    echo "Created destination folder: $DEST_FOLDER"
fi

# Counter for moved files
moved_count=0

# Find and move all .htaccess files
echo "Searching for .htaccess files..."

# Use find to locate all .htaccess files recursively
while IFS= read -r -d '' file; do
    if [ -f "$file" ]; then
        # Get the directory path of the .htaccess file
        dir_path=$(dirname "$file")
        
        # Create a unique name to avoid conflicts
        # Replace directory separators with underscores
        unique_name=$(echo "$dir_path" | sed 's|/|_|g' | sed 's|^_||')_htaccess
        
        # If the file is in the current directory, use a simpler name
        if [ "$dir_path" = "." ]; then
            unique_name="root_htaccess"
        fi
        
        # Move the file
        mv "$file" "$DEST_FOLDER/$unique_name"
        echo "Moved: $file -> $DEST_FOLDER/$unique_name"
        ((moved_count++))
    fi
done < <(find . -name ".htaccess" -type f -print0)

# Summary
if [ $moved_count -eq 0 ]; then
    echo "No .htaccess files found."
else
    echo ""
    echo "Summary: Moved $moved_count .htaccess file(s) to $DEST_FOLDER/"
    echo "Files in destination folder:"
    ls -la "$DEST_FOLDER/"
fi