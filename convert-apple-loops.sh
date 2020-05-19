temp_dir="~/Desktop/convert-apple-loops-temp"
loop_dir="/Library/Audio/Apple Loops/Apple"

# Create a temporary directory on the Desktop.
mkdir -p "$temp_dir" && cd "$temp_dir"

# Find every .caf file in the loops directory, convert it to .aiff, maintaining directory structure.
# NOTE: Ableton Live requires that AIFF files be in BEI16 format (max 16 bits).
echo "Finding and converting .caf loops..."
fd . \
    --extension .caf \
    -x bash -c 'mkdir -p ".$(dirname "{}")" && afconvert -f AIFF -d BEI16 "{}" ".{}.aiff" && rename "s/.caf//" ".{}.aiff"' \
    "$loop_dir"

# Move converted loops to the Desktop.
echo "Cleaning up..."
mv ".$loop_dir" "~/Desktop/Apple Loops"
rm -rf "$temp_dir"

echo "Complete! All Apple Loops can be found at: ~/Desktop/Apple Loops"
