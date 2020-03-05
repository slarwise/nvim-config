import argparse

import numpy as np
import matplotlib.pyplot as plt
import matplotlib.image as mpimg

def create_image(input_path, colors, output_path):
    img = mpimg.imread(input_path)
    img = img[:, :, 0:3]
    width, height, channels = img.shape

    new_img = np.zeros(img.shape)

    available_colors = {
            'bg': [242, 229, 188],
            'fg': [60, 56, 54],
            'black': [251, 241, 199],
            'red': [157, 0, 6],
            'green': [121, 116, 14],
            'yellow': [181, 118, 20],
            'blue': [7, 102, 120],
            'magenta': [143, 63, 113],
            'cyan': [66, 123, 88],
            'white': [124, 111, 100],
            'brightred': [204, 36, 29],
            'brightgreen': [152, 151, 26],
            'brightyellow': [215, 153, 33],
            'brightblue': [69, 133, 136],
            'brightmagenta': [177, 98, 134],
            'brightcyan': [104, 157, 106],
            }

    color_scheme = np.zeros((len(colors), 3))
    for i, c_name in enumerate(colors):
        color_scheme[i, :] = available_colors[c_name]

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

    plt.imsave(output_path, new_img)

def parse_arguments():
    parser = argparse.ArgumentParser(
            description='Change input to closest gruvbox colors')
    parser.add_argument('input_path')
    parser.add_argument('-c')
    parser.add_argument('-o')
    args = parser.parse_args()
    colors = args.c.split(',')
    return (args.input_path, colors, args.o)

if __name__ == '__main__':
    (input_path, colors, output_path) = parse_arguments()
    create_image(input_path, colors, output_path)
