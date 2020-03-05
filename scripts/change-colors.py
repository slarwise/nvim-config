import numpy as np
import matplotlib.pyplot as plt
import matplotlib.image as mpimg

def color_distance(c1, c2):
    return (c1[0]-c2[0])**2 + (c2[1]-c2[1])**2 + (c2[1]-c2[1])**2

# img = mpimg.imread('/Users/arvidbjurklint/Dropbox/dotfiles/scripts/catalina.png')
img = mpimg.imread('/Users/arvidbjurklint/Dropbox/dotfiles/scripts/win95gruvbox.png')
img = img[:, :, 0:3]
width, height, channels = img.shape

new_img = np.zeros(img.shape)

# color_scheme = np.array([
#         [242, 229, 188], # background
#        # [60, 56, 54], # foreground
#         [251, 241, 199], # black
#         [157, 0, 6], # red
#         # [121, 116, 14], # green
#         [181, 118, 20], # yellow
#         # [7, 102, 120], # blue
#         # [143, 63, 113], # magenta
#         # [66, 123, 88], # cyan
#         # [124, 111, 100], # white
    # ])
color_scheme = np.array([
        [242, 229, 188], # background
        [60, 56, 54], # foreground
        # [251, 241, 199], # black
        # [157, 0, 6], # red
        # [121, 116, 14], # green
        [181, 118, 20], # yellow
        [7, 102, 120], # blue
        # [143, 63, 113], # magenta
        # [66, 123, 88], # cyan
        [124, 111, 100], # white
    ])
color_scheme = color_scheme / 255

distances = np.zeros((width, height, 3, len(color_scheme)))
for i, c in enumerate(color_scheme):
    distances[:, :, :, i] = img - c
distances = distances**2
distances = np.sum(distances, axis=2)

closest_color_index = np.argmin(distances, axis=2)

for x in range(width):
    for y in range(height):
        new_img[x, y, :] = color_scheme[closest_color_index[x, y], :]

# distances = np.zeros(len(color_scheme))
# for x in range(width):
#     for y in range(height):
#         pixel_value = img[x, y, 0:3]
#         for i, c in enumerate(color_scheme):
#             distances[i] = color_distance(pixel_value, c)
#         closest_color_index = np.argmin(distances)
#         closest_color = color_scheme[closest_color_index]
#         new_img[x, y, 0:3] = closest_color

plt.imsave('new_img.pdf', new_img)
