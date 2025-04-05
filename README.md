<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

# hanzi_writer_data_flutter

A small utility library to load Chinese character stroke order data (as used by Hanzi Writer) from local assets.


## Features

- 📦 Self-contained: includes `.json` files as assets
- ⚡️ Loads data on-demand from `assets/hanzi/[char].json`
- 🔡 Perfect for offline apps or tools using Hanzi animations

## Usage

```dart
import 'package:hanzi_writer_data_flutter/hanzi_writer_data_flutter.dart';

final data = await loadCharData('我');
print(data);
```

## Acknowledgments

This package utilizes stroke order data from the [Make Me A Hanzi](https://github.com/skishore/makemeahanzi) project, which extracted the data from fonts by [Arphic Technology](http://www.arphic.com/), a Taiwanese font forge that released their work under a permissive license in 1999.

You can redistribute and/or modify this data under the terms of the Arphic Public License as published by Arphic Technology Co., Ltd. A copy of this license can be found in the `ARPHICPL.TXT` file included in this package.
