# hanzi_data Example

This example demonstrates how to use the `hanzi_data` package to load Chinese character stroke order data from local assets and render the animation using the `stroke_order_animator` package.

## Features

- Load stroke order data for a given character from local assets
- Dynamically change the character using a text field and button
- Render the stroke order animation using `StrokeOrderAnimator`

## Running the Example

To run the example:

```bash
cd example
flutter pub get
flutter run
```

## Usage

1. The default character loaded is `我`.
2. Enter a different Chinese character in the text field.
3. Press the "Load" button to view its stroke order animation.

If the stroke data file does not exist under `assets/hanzi/`, an error message will appear.

## Dependencies

This example uses:

- [`hanzi_data`](https://pub.dev/packages/hanzi_data): Loads stroke order JSON data from local assets.
- [`stroke_order_animator`](https://pub.dev/packages/stroke_order_animator): Renders stroke animations from parsed data.

## Acknowledgments

This example and the hanzi_data package utilize stroke order data from the [Make Me A Hanzi](https://github.com/skishore/makemeahanzi) project, which extracted the data from fonts by [Arphic Technology](http://www.arphic.com/). The data is licensed under the Arphic Public License.
