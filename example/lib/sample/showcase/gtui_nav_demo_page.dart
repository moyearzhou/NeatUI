import 'package:flutter/material.dart';

import '../appbar/demo_app_bar.dart';

/// GTUI 导航栏演示页（纯 Material）
class GTUINavDemoPage extends StatefulWidget {
  const GTUINavDemoPage({super.key});

  @override
  State<GTUINavDemoPage> createState() => _GTUINavDemoPageState();
}

class _GTUINavDemoPageState extends State<GTUINavDemoPage> {
  static const Color _appBarFg = Color(0xFF222222);
  static const Color _border = Color(0xFFE5E5E5);
  static const Color _title = Color(0xFF222222);

  int _segmentIndex = 0;

  static Widget _section(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Color(0xFF888888),
        ),
      ),
    );
  }

  static Widget _shell({required Widget child, double height = 56}) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: _border)),
      ),
      child: Material(color: Colors.transparent, child: child),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: DemoAppBar('导航栏 NavBar'),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 24),
        children: [
          _section('返回 + 标题「标题」'),
          _shell(
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Center(
                  child: Text(
                    '标题',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: _title),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, size: 18),
                    color: _title,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          _section('返回 + 标题 + 右侧图标'),
          _shell(
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Center(
                  child: Text(
                    '标题',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: _title),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, size: 18),
                    color: _title,
                    onPressed: () {},
                  ),
                ),
                Positioned(
                  right: 4,
                  top: 0,
                  bottom: 0,
                  child: IconButton(
                    icon: const Icon(Icons.more_horiz),
                    color: _title,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          _section('关闭 + 标题 + 文字按钮「按钮」'),
          _shell(
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Center(
                  child: Text(
                    '标题',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: _title),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: IconButton(
                    icon: const Icon(Icons.close, size: 22),
                    color: _title,
                    onPressed: () {},
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 0,
                  bottom: 0,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('按钮', style: TextStyle(fontSize: 15, color: Color(0xFF4A6EF0))),
                  ),
                ),
              ],
            ),
          ),
          _section('返回 + 大标题「大标题」'),
          _shell(
            height: 64,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 48),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '大标题',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: _title),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, size: 18),
                    color: _title,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          _section('分段：选项1 / 选项2'),
          _shell(
            height: 56,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: _segmentChip(0, '选项1'),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _segmentChip(1, '选项2'),
                  ),
                ],
              ),
            ),
          ),
          _section('返回 + 标题 + 下拉菜单标题'),
          _shell(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: PopupMenuButton<String>(
                    offset: const Offset(0, 40),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          '筛选标题',
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: _title),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.arrow_drop_down, color: _title),
                      ],
                    ),
                    itemBuilder: (context) => [
                      const PopupMenuItem(value: 'a', child: Text('选项 A')),
                      const PopupMenuItem(value: 'b', child: Text('选项 B')),
                    ],
                    onSelected: (_) {},
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, size: 18),
                    color: _title,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _segmentChip(int index, String label) {
    final on = _segmentIndex == index;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => setState(() => _segmentIndex = index),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: on ? const Color(0xFF4A6EF0) : const Color(0xFFF0F0F5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: on ? Colors.white : const Color(0xFF666666),
            ),
          ),
        ),
      ),
    );
  }
}
