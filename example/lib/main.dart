import 'package:flutter/material.dart';
import 'package:hanzi_writer_data_flutter/hanzi_writer_data_flutter.dart';
import 'package:stroke_order_animator/stroke_order_animator.dart';

void main() {
  runApp(const HanziExampleApp());
}

class HanziExampleApp extends StatelessWidget {
  const HanziExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hanzi Data Example',
      home: Scaffold(
        appBar: AppBar(title: const Text('Hanzi Data Example')),
        body: const HanziDataLoader(),
      ),
    );
  }
}

class HanziDataLoader extends StatefulWidget {
  const HanziDataLoader({super.key});

  @override
  State<HanziDataLoader> createState() => _HanziDataLoaderState();
}

class _HanziDataLoaderState extends State<HanziDataLoader>
    with TickerProviderStateMixin {
  final TextEditingController _textController =
      TextEditingController(text: '我');
  StrokeOrderAnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _loadCharacterData(_textController.text);
  }

  Future<void> _loadCharacterData(String character) async {
    try {
      final charData =
          await loadCharData(character); // Load data using hanzi_data
      final strokeOrder = StrokeOrder(charData);

      setState(() {
        _animationController?.dispose();
        _animationController = StrokeOrderAnimationController(
          strokeOrder,
          this,
        );
      });
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Character data for '$character' not found.")),
      );
    }
  }

  @override
  void dispose() {
    _animationController?.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a character',
                  ),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => _loadCharacterData(_textController.text),
                child: const Text('Load'),
              ),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: _animationController == null
                ? const CircularProgressIndicator()
                : StrokeOrderAnimator(
                    _animationController!,
                    size: const Size(300, 300),
                  ),
          ),
        ),
      ],
    );
  }
}
