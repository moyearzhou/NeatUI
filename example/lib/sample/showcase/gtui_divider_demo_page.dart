import 'package:flutter/material.dart';

import '../appbar/demo_app_bar.dart';

/// GTUI 分割线演示页（纯 Material）
class GTUIDividerDemoPage extends StatelessWidget {
  const GTUIDividerDemoPage({super.key});

  static const Color _appBarFg = Color(0xFF222222);

  static TextStyle _section() => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color(0xFF333333),
      );

  Widget _header(String t) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
      child: Text(t, style: _section()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DemoAppBar('分割线 Divider'),
      body: ListView(
        children: [
          _header('通栏分割线（1px）'),
          const Divider(height: 1, thickness: 1, color: Color(0xFFE5E5E5)),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text('上方为全宽 1px 实线', style: TextStyle(fontSize: 13, color: Color(0xFF666666))),
          ),
          _header('左右留白（内缩）'),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Divider(height: 1, thickness: 1, color: Color(0xFFE5E5E5)),
          ),
          _header('虚线分割'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: LayoutBuilder(
              builder: (context, c) {
                return CustomPaint(
                  size: Size(c.maxWidth, 1),
                  painter: _DashedLinePainter(
                    color: const Color(0xFFBDBDBD),
                    dashWidth: 5,
                    dashSpace: 4,
                  ),
                );
              },
            ),
          ),
          _header('不同颜色'),
          const Divider(height: 1, thickness: 1, color: Color(0xFF4A6EF0)),
          const SizedBox(height: 12),
          const Divider(height: 1, thickness: 1, color: Color(0xFFFF7043)),
          const SizedBox(height: 12),
          const Divider(height: 1, thickness: 1, color: Color(0xFF66BB6A)),
          _header('竖向分割线'),
          SizedBox(
            height: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('左侧区域', style: TextStyle(fontSize: 14, color: Color(0xFF333333))),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: VerticalDivider(
                    width: 1,
                    thickness: 1,
                    color: Colors.grey.shade400,
                  ),
                ),
                const Text('右侧区域', style: TextStyle(fontSize: 14, color: Color(0xFF333333))),
              ],
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  _DashedLinePainter({
    required this.color,
    required this.dashWidth,
    required this.dashSpace,
  });

  final Color color;
  final double dashWidth;
  final double dashSpace;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    double start = 0;
    final y = size.height / 2;
    while (start < size.width) {
      final end = (start + dashWidth).clamp(0.0, size.width);
      canvas.drawLine(Offset(start, y), Offset(end, y), paint);
      start += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant _DashedLinePainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.dashWidth != dashWidth ||
        oldDelegate.dashSpace != dashSpace;
  }
}
