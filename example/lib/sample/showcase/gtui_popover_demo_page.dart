import 'package:flutter/material.dart';

import '../appbar/demo_app_bar.dart';

/// GTUI 气泡 / 弹出菜单演示（纯 Material）
class GTUIPopoverDemoPage extends StatelessWidget {
  const GTUIPopoverDemoPage({super.key});

  static const Color _appBarFg = Color(0xFF222222);
  static const Color _accent = Color(0xFFFF5750);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DemoAppBar('气泡 Popover'),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Align(
          alignment: Alignment.topCenter,
          child: PopupMenuButton<String>(
            offset: const Offset(0, 8),
            color: Colors.white,
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            onSelected: (value) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('已选择：$value')),
              );
            },
            itemBuilder: (ctx) => [
              PopupMenuItem<String>(
                value: '内容项一',
                child: Text('内容项一', style: TextStyle(color: _accent, fontWeight: FontWeight.w600)),
              ),
              PopupMenuItem<String>(
                value: '内容项二',
                child: Text('内容项二', style: TextStyle(color: _accent, fontWeight: FontWeight.w600)),
              ),
              PopupMenuItem<String>(
                value: '内容项三',
                child: Text('内容项三', style: TextStyle(color: _accent, fontWeight: FontWeight.w600)),
              ),
            ],
            child: Text(
              '点击此处展开菜单',
              style: TextStyle(
                fontSize: 16,
                color: _accent,
                decoration: TextDecoration.underline,
                decorationColor: _accent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
