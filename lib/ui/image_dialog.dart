import 'package:YetAnotherInfiScroll/ui/image_container.dart';
import 'package:flutter/material.dart';

class ImageDialog extends StatefulWidget {
  const ImageDialog({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  State<ImageDialog> createState() => _ImageDialogState();
}

class _ImageDialogState extends State<ImageDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        backgroundColor: Colors.pink.shade900,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageContainer(
              index: widget.index,
            )
          ]),
    );
  }
}
