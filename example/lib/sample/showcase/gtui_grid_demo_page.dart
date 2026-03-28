import 'package:flutter/material.dart';

import '../appbar/demo_app_bar.dart';

/// GTUI 宫格演示页（纯 Material）
class GTUIGridDemoPage extends StatelessWidget {
  const GTUIGridDemoPage({super.key});

  static const Color _appBarFg = Color(0xFF222222);

  static const List<IconData> _icons = [
    Icons.home_outlined,
    Icons.mail_outline,
    Icons.photo_outlined,
    Icons.music_note_outlined,
    Icons.map_outlined,
    Icons.calendar_today_outlined,
    Icons.shopping_bag_outlined,
    Icons.account_balance_wallet_outlined,
    Icons.settings_outlined,
    Icons.chat_bubble_outline,
    Icons.videocam_outlined,
    Icons.folder_outlined,
  ];

  Widget _cell(int index) {
    final icon = _icons[index % _icons.length];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFFF0F0F5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, size: 26, color: Colors.grey.shade800),
        ),
        const SizedBox(height: 8),
        Text(
          '应用${index + 1}',
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 12, color: Color(0xFF333333)),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DemoAppBar('宫格 Grid'),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        children: [
          const Text(
            '四列宫格（4×3）',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 16),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            mainAxisSpacing: 20,
            crossAxisSpacing: 12,
            childAspectRatio: 0.72,
            children: List.generate(12, _cell),
          ),
        ],
      ),
    );
  }
}
