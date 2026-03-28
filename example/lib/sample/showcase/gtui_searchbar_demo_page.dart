import 'package:flutter/material.dart';

import '../appbar/demo_app_bar.dart';

/// GTUI 搜索条演示（纯 Material）
class GTUISearchbarDemoPage extends StatefulWidget {
  const GTUISearchbarDemoPage({super.key});

  @override
  State<GTUISearchbarDemoPage> createState() => _GTUISearchbarDemoPageState();
}

class _GTUISearchbarDemoPageState extends State<GTUISearchbarDemoPage> {
  static const Color _appBarFg = Color(0xFF222222);
  static const Color _fieldBg = Color(0xFFF5F5F5);

  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  static const List<String> _mockAll = [
    '苹果',
    '香蕉',
    '搜索演示一',
    '搜索演示二',
    '课程',
    '直播',
    '资料',
    '练习',
  ];

  List<String> get _filtered {
    final q = _searchController.text.trim();
    if (q.isEmpty) return [];
    return _mockAll.where((e) => e.contains(q)).toList();
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: DemoAppBar('搜索条 SearchBar'),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _searchController,
                focusNode: _focusNode,
                textInputAction: TextInputAction.search,
                onTapOutside: (_) => FocusScope.of(context).unfocus(),
                style: const TextStyle(fontSize: 15, color: Color(0xFF333333)),
                decoration: InputDecoration(
                  hintText: '搜索',
                  hintStyle: TextStyle(fontSize: 15, color: Colors.grey.shade600),
                  isDense: true,
                  filled: true,
                  fillColor: _fieldBg,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.search, size: 22, color: Colors.grey.shade600),
                  prefixIconConstraints: const BoxConstraints(minWidth: 44, minHeight: 40),
                  suffixIcon: _searchController.text.isEmpty
                      ? null
                      : IconButton(
                          icon: const Icon(Icons.clear, size: 20),
                          onPressed: () {
                            _searchController.clear();
                            setState(() {});
                          },
                        ),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: _filtered.isEmpty
                    ? Center(
                        child: Text(
                          _searchController.text.isEmpty ? '输入关键字查看模拟结果' : '无匹配结果',
                          style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                        ),
                      )
                    : ListView.separated(
                        itemCount: _filtered.length,
                        separatorBuilder: (_, __) => const Divider(height: 1),
                        itemBuilder: (_, i) {
                          return ListTile(
                            title: Text(_filtered[i]),
                            onTap: () => FocusScope.of(context).unfocus(),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
