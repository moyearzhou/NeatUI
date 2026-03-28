import 'package:flutter/material.dart';

import '../appbar/demo_app_bar.dart';

/// GTUI 圆角演示页（对应 Android GTUIRadiusDemoActivity）
class GTUIRadiusDemoPage extends StatelessWidget {
  const GTUIRadiusDemoPage({super.key});

  static const Color _chip = Color(0xFF4A6EF0);
  static const Color _labelColor = Color(0xFF333333);

  Widget _radiusTile(double radiusLogical, String label) {
    final isCircle = radiusLogical >= 999;
    return Column(
      children: [
        Container(
          width: 64,
          height: isCircle ? 64 : 48,
          decoration: BoxDecoration(
            color: _chip,
            borderRadius: isCircle ? null : BorderRadius.circular(radiusLogical),
            shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 13, color: _labelColor, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    const radii = <Map<String, Object>>[
      {'r': 0.0, 'l': '0'},
      {'r': 2.0, 'l': '2'},
      {'r': 4.0, 'l': '4'},
      {'r': 8.0, 'l': '8'},
      {'r': 12.0, 'l': '12'},
      {'r': 16.0, 'l': '16'},
      {'r': 24.0, 'l': '24'},
      {'r': 999.0, 'l': '999'},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DemoAppBar('圆角 Radius'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '圆角规格',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: _labelColor),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 20,
                crossAxisSpacing: 12,
                childAspectRatio: 0.72,
              ),
              itemCount: radii.length,
              itemBuilder: (context, i) {
                final m = radii[i];
                return _radiusTile(m['r']! as double, m['l']! as String);
              },
            ),
          ],
        ),
      ),
    );
  }
}
