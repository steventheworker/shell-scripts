# CHATGPT version:
# made to determine the correct DPI (dots per inch) for your PDF conversion, you can use a combination of the original PDF's metadata and the desired output size to calculate the DPI dynamically. Here's a modified script that calculates the DPI based on the desired output dimensions in inches:

# Check if an argument is supplied
if [ -z "$1" ]; then
   echo "No argument supplied"
   exit 1
fi

# Input PDF file
input_pdf="$1"

# Output PDF file
output_pdf="inverted.pdf"

# Temporary directory to store image files
temp_dir="temp_images"

# Output dimensions in inches (adjust these values as needed)
output_width=8.5
output_height=11

# Calculate DPI based on output dimensions and desired quality
dpi=$(convert -ping "$input_pdf" -format "%x" info:)
desired_width_pixels=$(echo "$output_width * $dpi / 1" | bc)
desired_height_pixels=$(echo "$output_height * $dpi / 1" | bc)

# Create a temporary directory if it doesn't exist
mkdir -p "$temp_dir"

# Convert each page of the PDF to an image and invert it
convert -density "$dpi" -quality 100 "$input_pdf" -resize "${desired_width_pixels}x${desired_height_pixels}" "$temp_dir/page_%04d.jpg"
mogrify -negate "$temp_dir"/*.jpg

# Convert the inverted images back to a PDF
convert "$temp_dir"/*.jpg "$output_pdf"

# Clean up temporary files
rm -r "$temp_dir"
