import colorsys

def hex_to_rgb(hex):
    return tuple(int(hex[i:i+2], 16) for i in (0, 2, 4))

def color_distance(color1, color2):
    r1, g1, b1 = color1
    r2, g2, b2 = color2
    return ((r1 - r2) ** 2 + (g1 - g2) ** 2 + (b1 - b2) ** 2) ** 0.5

colors = ["1D2B53", "7E2553", "008751", "AB5236", "5F574F", "C2C3C7", "FFF1E8", "FF004D", "FFA300", "FFEC27", "00E436", "29ADFF", "83769C", "FF77A8", "FFCCAA", "291814", "111D35", "422136", "125359", "742F29", "49333B", "A28879", "F3EF7D", "BE1250", "FF6C24", "A8E72E", "00B543", "065AB5", "754665", "FF6E59", "FF9D81"]
target_color = hex_to_rgb("00C8C8")

closest_color = min(colors, key=lambda color: color_distance(hex_to_rgb(color), target_color))

print(f"The closest color to #3296C8 is #{closest_color}")