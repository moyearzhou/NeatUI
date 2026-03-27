import 'package:flutter/material.dart';

/// GTUI 阴影演示页（对应 Android GTUIShadowDemoActivity）
class GTUIShadowDemoPage extends StatelessWidget {
  const GTUIShadowDemoPage({super.key});

  static const Color _labelColor = Color(0xFF333333);

  Widget _shadowCard({
    required String label,
    required List<BoxShadow> shadows,
    double height = 100,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              label,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: _labelColor),
            ),
          ),
          Container(
            width: double.infinity,
            height: height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: shadows,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('阴影 Shadow'),
        elevation: 0.5,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF222222),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 16, bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _shadowCard(
              label: 'Shadow 1',
              height: 72,
              shadows: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 4,
                  spreadRadius: 0,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            _shadowCard(
              label: 'Shadow 2',
              height: 88,
              shadows: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 8,
                  spreadRadius: 0,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            _shadowCard(
              label: 'Shadow 3',
              height: 100,
              shadows: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 12,
                  spreadRadius: 0,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            _shadowCard(
              label: 'Shadow 4',
              height: 120,
              shadows: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.10),
                  blurRadius: 20,
                  spreadRadius: 0,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            _shadowCard(
              label: 'Shadow 5',
              height: 140,
              shadows: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 28,
                  spreadRadius: 1,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
