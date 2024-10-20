import 'dart:math';

import 'package:flutter/material.dart';

class BlobScreen extends StatefulWidget {
  const BlobScreen({super.key});

  @override
  BlobScreenState createState() => BlobScreenState();
}

class BlobScreenState extends State<BlobScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Blob> _blobs;

  @override
  void initState() {
    super.initState();
    _blobs = List.generate(5, (index) => Blob());

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    _controller.addListener(() {
      setState(() {
        for (var blob in _blobs) {
          blob.update();
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BlobPainter(blobs: _blobs),
        child: Container(),
      ),
    );
  }
}

class BlobPainter extends CustomPainter {
  final List<Blob> blobs;

  BlobPainter({required this.blobs});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    for (var blob in blobs) {
      blob.checkBounds(size);
      canvas.drawCircle(blob.position, blob.size, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class Blob {
  Offset position;
  Offset velocity;
  double size;
  // final Random _random = Random();

  Blob()
      : position = Offset(100 + Random().nextDouble() * 300,
            100 + Random().nextDouble() * 500),
        velocity = Offset(
            2 + Random().nextDouble() * 4, 2 + Random().nextDouble() * 4),
        size = 30 + Random().nextDouble() * 20;

  void update() {
    position += velocity;
  }

  void checkBounds(Size size) {
    if (position.dx - size.width < 0 || position.dx + size.width > size.width) {
      velocity = Offset(-velocity.dx, velocity.dy);
    }
    if (position.dy - size.height < 0 ||
        position.dy + size.height > size.height) {
      velocity = Offset(velocity.dx, -velocity.dy);
    }
  }
}
