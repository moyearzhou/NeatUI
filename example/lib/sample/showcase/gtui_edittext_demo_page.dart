import 'package:flutter/material.dart';

import '../appbar/demo_app_bar.dart';

/// GTUI 输入框样式演示（纯 Material）
class GTUIEdittextDemoPage extends StatefulWidget {
  const GTUIEdittextDemoPage({super.key});

  @override
  State<GTUIEdittextDemoPage> createState() => _GTUIEdittextDemoPageState();
}

class _GTUIEdittextDemoPageState extends State<GTUIEdittextDemoPage> {
  static const Color _appBarFg = Color(0xFF222222);

  final TextEditingController _clearController = TextEditingController();

  @override
  void dispose() {
    _clearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: DemoAppBar('输入框 EditText'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _block(
            title: '带标签的基础输入',
            child: TextField(
              decoration: const InputDecoration(
                labelText: '用户名',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          _block(
            title: '占位提示',
            child: TextField(
              decoration: const InputDecoration(
                hintText: '请输入',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          _block(
            title: '字数统计',
            child: TextField(
              maxLength: 20,
              decoration: const InputDecoration(
                labelText: '最多 20 字',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          _block(
            title: '多行文本',
            child: TextField(
              minLines: 3,
              maxLines: 6,
              decoration: const InputDecoration(
                hintText: '请输入多行内容…',
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          _block(
            title: '禁用状态',
            child: TextFormField(
              enabled: false,
              initialValue: '不可编辑',
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color(0xFFEEEEEE),
              ),
            ),
          ),
          _block(
            title: '带清除按钮',
            child: TextField(
              controller: _clearController,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                labelText: '可一键清空',
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
                suffixIcon: _clearController.text.isEmpty
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _clearController.clear();
                          setState(() {});
                        },
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _block({required String title, required Widget child}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }
}
