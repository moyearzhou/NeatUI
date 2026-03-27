import 'package:flutter/material.dart';

/// GTUI 底部选择器演示页（纯 Material）
class GTUIPickerDemoPage extends StatelessWidget {
  const GTUIPickerDemoPage({super.key});

  static const Color _appBarFg = Color(0xFF222222);

  static const List<String> _items = ['选项一', '选项二', '选项三', '选项四', '选项五'];

  void _snack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  void _showNoTitle(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (ctx) => _SingleColumnPickerSheet(
        items: _items,
        initialIndex: 3,
        title: null,
        onConfirm: (i) {
          Navigator.pop(ctx);
          _snack(context, '已选择：${_items[i]}');
        },
      ),
    );
  }

  void _showTitled(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (ctx) => _SingleColumnPickerSheet(
        items: _items,
        initialIndex: 0,
        title: '请选择',
        onConfirm: (i) {
          Navigator.pop(ctx);
          _snack(context, '已选择：${_items[i]}');
        },
      ),
    );
  }

  void _showDual(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (ctx) => _DualColumnPickerSheet(
        leftItems: _items,
        rightItems: const ['甲', '乙', '丙', '丁', '戊'],
        onConfirm: (li, ri) {
          Navigator.pop(ctx);
          _snack(context, '左：${_items[li]}，右：${['甲', '乙', '丙', '丁', '戊'][ri]}');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          '选择器 Picker',
          style: TextStyle(color: _appBarFg, fontWeight: FontWeight.w600),
        ),
        elevation: 0.5,
        backgroundColor: Colors.white,
        foregroundColor: _appBarFg,
        surfaceTintColor: Colors.transparent,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        children: [
          ListTile(
            title: const Text('无标题单列'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showNoTitle(context),
          ),
          const Divider(height: 1),
          ListTile(
            title: const Text('有标题单列'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showTitled(context),
          ),
          const Divider(height: 1),
          ListTile(
            title: const Text('双列选择'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showDual(context),
          ),
        ],
      ),
    );
  }
}

class _SingleColumnPickerSheet extends StatefulWidget {
  const _SingleColumnPickerSheet({
    required this.items,
    required this.initialIndex,
    required this.title,
    required this.onConfirm,
  });

  final List<String> items;
  final int initialIndex;
  final String? title;
  final void Function(int index) onConfirm;

  @override
  State<_SingleColumnPickerSheet> createState() => _SingleColumnPickerSheetState();
}

class _SingleColumnPickerSheetState extends State<_SingleColumnPickerSheet> {
  late int _index;

  @override
  void initState() {
    super.initState();
    _index = widget.initialIndex.clamp(0, widget.items.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.title != null) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                widget.title!,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF333333)),
              ),
            ),
          ],
          SizedBox(
            height: 240,
            child: ListView.builder(
              itemCount: widget.items.length,
              itemBuilder: (_, i) {
                final on = i == _index;
                return Material(
                  color: on ? const Color(0xFF4A6EF0).withOpacity(0.08) : Colors.transparent,
                  child: InkWell(
                    onTap: () => setState(() => _index = i),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      child: Text(
                        widget.items[i],
                        style: TextStyle(
                          fontSize: 16,
                          color: on ? const Color(0xFF4A6EF0) : const Color(0xFF333333),
                          fontWeight: on ? FontWeight.w600 : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const Divider(height: 1),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('取消', style: TextStyle(color: Color(0xFF999999))),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () => widget.onConfirm(_index),
                  child: const Text('确定', style: TextStyle(color: Color(0xFF4A6EF0), fontWeight: FontWeight.w600)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DualColumnPickerSheet extends StatefulWidget {
  const _DualColumnPickerSheet({
    required this.leftItems,
    required this.rightItems,
    required this.onConfirm,
  });

  final List<String> leftItems;
  final List<String> rightItems;
  final void Function(int leftIndex, int rightIndex) onConfirm;

  @override
  State<_DualColumnPickerSheet> createState() => _DualColumnPickerSheetState();
}

class _DualColumnPickerSheetState extends State<_DualColumnPickerSheet> {
  int _left = 0;
  int _right = 0;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height * 0.42;
    return SafeArea(
      child: SizedBox(
        height: h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Text(
                '双列选择',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF333333)),
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: _col(widget.leftItems, _left, (i) => setState(() => _left = i))),
                  const VerticalDivider(width: 1, thickness: 1),
                  Expanded(child: _col(widget.rightItems, _right, (i) => setState(() => _right = i))),
                ],
              ),
            ),
            const Divider(height: 1),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('取消', style: TextStyle(color: Color(0xFF999999))),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () => widget.onConfirm(_left, _right),
                    child: const Text('确定', style: TextStyle(color: Color(0xFF4A6EF0), fontWeight: FontWeight.w600)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _col(List<String> items, int selected, void Function(int) onSelect) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (_, i) {
        final on = i == selected;
        return Material(
          color: on ? const Color(0xFF4A6EF0).withOpacity(0.08) : Colors.transparent,
          child: InkWell(
            onTap: () => onSelect(i),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Text(
                items[i],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: on ? const Color(0xFF4A6EF0) : const Color(0xFF333333),
                  fontWeight: on ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
