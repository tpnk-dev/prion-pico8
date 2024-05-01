def hex_to_rgb(hex):
    return tuple(int(hex[i:i+2], 16) for i in (0, 2, 4))

def rgb_to_hex(rgb):
    return ''.join('{:02x}'.format(int(val)) for val in rgb)

color1 = hex_to_rgb("29ADFF")
color2 = hex_to_rgb("83769C")

average_color = tuple((val1 + val2) / 2 for val1, val2 in zip(color1, color2))

print(f"The average color of #29ADFF and #1D2B53 is #{rgb_to_hex(average_color)}")

#3296C8