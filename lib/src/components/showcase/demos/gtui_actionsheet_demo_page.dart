import 'package:flutter/material.dart';

/// GTUI 操作面板演示（纯 Material）
class GTUIActionsheetDemoPage extends StatelessWidget {
  const GTUIActionsheetDemoPage({super.key});

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

  Widget _listRow(BuildContext ctx, String label) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () => Navigator.pop(ctx),
        child: SizedBox(
          width: double.infinity,
          height: 52,
          child: Center(
            child: Text(label, style: const TextStyle(fontSize: 16, color: Color(0xFF333333))),
          ),
        ),
      ),
    );
  }

  void _showListStyle(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isDismissible: true,
      enableDrag: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _dragHandle(),
                  _listRow(ctx, '选项一'),
                  const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),
                  _listRow(ctx, '选项二'),
                  const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),
                  _listRow(ctx, '选项三'),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                onTap: () => Navigator.pop(ctx),
                borderRadius: BorderRadius.circular(12),
                child: const SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: Center(
                    child: Text('取消', style: TextStyle(fontSize: 16, color: Color(0xFF666666))),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showTitledList(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isDismissible: true,
      enableDrag: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _dragHandle(),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
                    child: Text(
                      '标题',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333333),
                      ),
                    ),
                  ),
                  const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),
                  _listRow(ctx, '选项一'),
                  const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),
                  _listRow(ctx, '选项二'),
                  const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),
                  _listRow(ctx, '选项三'),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                onTap: () => Navigator.pop(ctx),
                borderRadius: BorderRadius.circular(12),
                child: const SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: Center(
                    child: Text('取消', style: TextStyle(fontSize: 16, color: Color(0xFF666666))),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showGridStyle(BuildContext context) {
    const labels = ['标题文本', '标题文本', '标题文本', '标题文本', '标题文本', '标题文本', '标题文本', '标题文本'];
    final iconColors = [
      const Color(0xFFFF5750),
      const Color(0xFF4A6EF0),
      const Color(0xFF2BCB96),
      const Color(0xFFFFB020),
      const Color(0xFF9B59B6),
      const Color(0xFF34495E),
      const Color(0xFFE67E22),
      const Color(0xFF1ABC9C),
    ];
    showModalBottomSheet<void>(
      context: context,
      isDismissible: true,
      enableDrag: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(
          left: 12,
          right: 12,
          bottom: 12 + MediaQuery.viewInsetsOf(ctx).bottom,
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _dragHandle(),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.82,
                  ),
                  itemCount: labels.length,
                  itemBuilder: (_, i) {
                    final c = iconColors[i % iconColors.length];
                    return InkWell(
                      onTap: () => Navigator.pop(ctx),
                      borderRadius: BorderRadius.circular(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: c.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(Icons.apps, color: c, size: 26),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            labels[i],
                            style: const TextStyle(fontSize: 12, color: Color(0xFF666666)),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('操作面板 ActionSheet', style: TextStyle(color: _appBarFg)),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: _appBarFg,
        iconTheme: const IconThemeData(color: _appBarFg),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 32),
        children: [
          FilledButton(
            onPressed: () => _showListStyle(context),
            child: const Text('列表样式'),
          ),
          const SizedBox(height: 12),
          FilledButton(
            onPressed: () => _showTitledList(context),
            child: const Text('带标题列表'),
          ),
          const SizedBox(height: 12),
          FilledButton(
            onPressed: () => _showGridStyle(context),
            child: const Text('宫格样式'),
          ),
        ],
      ),
    );
  }
}
