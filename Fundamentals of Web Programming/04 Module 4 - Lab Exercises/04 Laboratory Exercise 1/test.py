from PIL import Image, ImageDraw, ImageFont

# Set up image dimensions
width, height = 600, 800
image = Image.new("RGB", (width, height), "black")
draw = ImageDraw.Draw(image)

# Create a vertical gradient background from deep blue to lighter blue
for y in range(height):
    # Calculate a simple gradient between two colors:
    # Deep blue at top (e.g., (10, 10, 80)) to lighter blue at bottom (e.g., (100, 150, 255))
    r = int(10 + (100 - 10) * (y / height))
    g = int(10 + (150 - 10) * (y / height))
    b = int(80 + (255 - 80) * (y / height))
    draw.line([(0, y), (width, y)], fill=(r, g, b))

# Attempt to load a TrueType font (use a fallback if not found)
try:
    title_font = ImageFont.truetype("DejaVuSans-Bold.ttf", 48)
    subtitle_font = ImageFont.truetype("DejaVuSans-Bold.ttf", 28)
except IOError:
    title_font = ImageFont.load_default()
    subtitle_font = ImageFont.load_default()

# Define the text
title_text = "Crown of Olympus:"
subtitle_text = "a Mythological pageant"

# Calculate text sizes for centering
title_w, title_h = draw.textsize(title_text, font=title_font)
subtitle_w, subtitle_h = draw.textsize(subtitle_text, font=subtitle_font)

# Set positions to center the text on the cover
title_x = (width - title_w) // 2
title_y = 150  # Position title a bit down from the top

subtitle_x = (width - subtitle_w) // 2
subtitle_y = title_y + title_h + 20

# Draw text with a slight shadow effect for a bit of depth
shadow_offset = 2
shadow_color = "black"

# Draw shadow for the title
draw.text((title_x + shadow_offset, title_y + shadow_offset), title_text, font=title_font, fill=shadow_color)
# Draw the title text
draw.text((title_x, title_y), title_text, font=title_font, fill="white")

# Draw shadow for the subtitle
draw.text((subtitle_x + shadow_offset, subtitle_y + shadow_offset), subtitle_text, font=subtitle_font, fill=shadow_color)
# Draw the subtitle text
draw.text((subtitle_x, subtitle_y), subtitle_text, font=subtitle_font, fill="white")

# Optionally add a subtle decorative element at the bottom (a simple line)
line_y = height - 100
draw.line([(50, line_y), (width - 50, line_y)], fill="white", width=3)

# Save the image
image.save("magazine_cover.png")
print("Magazine cover created and saved as magazine_cover.png")