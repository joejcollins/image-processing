"""Utilities for displaying images in a window."""
from matplotlib import pyplot


def show(image, cmap=None, title=None, hide_axis=True):
    """ Display an image using Matplotlib."""
    plot = pyplot.imshow(image, cmap=cmap)
    if title:
        pyplot.title(title)
    if hide_axis:
        pyplot.axis('off')
    return plot
