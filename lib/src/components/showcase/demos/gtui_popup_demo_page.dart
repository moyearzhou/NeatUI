import 'package:flutter/material.dart';

/// GTUI 底部弹出层演示（纯 Material）
class GTUIPopupDemoPage extends StatelessWidget {
  const GTUIPopupDemoPage({super.key});

  static const Color _appBarFg = Color(0xFF222222);

  Widget _dragHandle() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 8),
      child: Center(
        child: Container(
          width: 36,
          height: 4,
          decoration: BoxDecoration(
            color: const Color(0xFFE0E0E0),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
    );
  }

  Widget _sheetShell({required Widget child}) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: child,
    );
  }

  void _showMaxHeight(BuildContext context) {
    final maxSheetH = MediaQuery.sizeOf(context).height * 0.92;
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(ctx).bottom),
        child: SizedBox(
          height: maxSheetH,
          child: _sheetShell(
            child: Column(
              children: [
                _dragHandle(),
                Expanded(
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: 1000,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              '最大高度（内容 1000px）',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF333333),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          ...List.generate(
                            40,
                            (i) => ListTile(
                              dense: true,
                              title: Text('列表项 ${i + 1}'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showMinHeight(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => _sheetShell(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _dragHandle(),
            SizedBox(
              height: 100,
              width: double.infinity,
              child: Center(
                child: Text(
                  '最小高度（内容 100px）',
                  style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAutoHeight(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => _sheetShell(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _dragHandle(),
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '自适应高度（内容 400px）',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333333),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: Text(
                        '用于演示中等高度内容区域。',
                        style: TextStyle(fontSize: 14, color: Colors.grey.shade700, height: 1.5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('弹出层 Popup', style: TextStyle(color: _appBarFg)),
        elevation: 0.5,
        backgroundColor: Colors.white,
        foregroundColor: _appBarFg,
        iconTheme: const IconThemeData(color: _appBarFg),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        children: [
          FilledButton(
            onPressed: () => _showMaxHeight(context),
            child: const Text('最大高度'),
          ),
          const SizedBox(height: 12),
          FilledButton(
            onPressed: () => _showMinHeight(context),
            child: const Text('最小高度'),
          ),
          const SizedBox(height: 12),
          FilledButton(
            onPressed: () => _showAutoHeight(context),
            child: const Text('自适应高度'),
          ),
        ],
      ),
    );
  }
}
