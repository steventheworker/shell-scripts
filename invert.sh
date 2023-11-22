if [ -z "$1" ]
then
   echo "No argument supplied"
   exit 1
fi
arg1=$1

# Input PDF file
input_pdf="$1"

# Output PDF file
output_pdf="$1-inverted.pdf"

# Temporary directory to store image files
temp_dir="temp_images"

# Create a temporary directory if it doesn't exist
mkdir -p "$temp_dir"

# Convert each page of the PDF to an image and invert it
convert -density 300 -quality 100 "$input_pdf" "$temp_dir/page_%04d.jpg"
mogrify -negate "$temp_dir"/*.jpg

# Convert the inverted images back to a PDF
convert "$temp_dir"/*.jpg "$output_pdf"

# Clean up temporary files
rm -r "$temp_dir"
