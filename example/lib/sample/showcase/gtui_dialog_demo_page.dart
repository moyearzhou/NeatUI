import 'package:flutter/material.dart';

import '../appbar/demo_app_bar.dart';

/// GTUI 弹窗演示页（纯 Material）
class GTUIDialogDemoPage extends StatelessWidget {
  const GTUIDialogDemoPage({super.key});

  static const Color _appBarFg = Color(0xFF222222);
  static const Color _primary = Color(0xFF4A6EF0);
  static const Color _cancel = Color(0xFF999999);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DemoAppBar('弹窗 Dialog'),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        children: [
          ListTile(
            title: const Text('单按钮弹窗'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _oneButton(context),
          ),
          const Divider(height: 1),
          ListTile(
            title: const Text('双按钮弹窗'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _twoButtons(context),
          ),
          const Divider(height: 1),
          ListTile(
            title: const Text('带标题弹窗'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _withTitle(context),
          ),
          const Divider(height: 1),
          ListTile(
            title: const Text('自定义内容弹窗'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _customContent(context),
          ),
        ],
      ),
    );
  }

  void _oneButton(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        content: const Text('这是一个仅包含一个操作按钮的提示弹窗。'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('我知道了', style: TextStyle(color: _primary, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }

  void _twoButtons(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        content: const Text('确认执行该操作吗？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('取消', style: TextStyle(color: _cancel)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('确定', style: TextStyle(color: _primary, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }

  void _withTitle(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('提示标题'),
        content: const Text('这里是正文说明，可与标题组合展示较完整的信息。'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('取消', style: TextStyle(color: _cancel)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('确定', style: TextStyle(color: _primary, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }

  void _customContent(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('自定义区域'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5FA),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                '可在 content 中放置任意 Widget，例如图文、表单或列表。',
                style: TextStyle(fontSize: 14, height: 1.4, color: Color(0xFF666666)),
              ),
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: 0.65,
              backgroundColor: Colors.grey.shade200,
              color: _primary,
              minHeight: 6,
              borderRadius: BorderRadius.circular(3),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('关闭', style: TextStyle(color: _primary, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}
