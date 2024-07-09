"""Test the image display utilities."""
import numpy
from aqua_marina import image_display
from matplotlib import image


def test_show():
    """Confirm that the show function returns a plot."""
    # ARRANGE
    dummy_image = numpy.random.rand(10, 10)
    # ACT
    plot = image_display.show(dummy_image, cmap='gray',
                              title='Test', hide_axis=True)
    # ASSERT
    assert isinstance(plot, image.AxesImage)
    assert plot.get_cmap().name == 'gray'
    assert plot.axes.get_title() == 'Test'
