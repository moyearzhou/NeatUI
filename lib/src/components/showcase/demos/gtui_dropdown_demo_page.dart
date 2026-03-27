import 'package:flutter/material.dart';

/// GTUI 下拉筛选条演示（纯 Material）
class GTUIDropdownDemoPage extends StatefulWidget {
  const GTUIDropdownDemoPage({super.key});

  @override
  State<GTUIDropdownDemoPage> createState() => _GTUIDropdownDemoPageState();
}

class _GTUIDropdownDemoPageState extends State<GTUIDropdownDemoPage> {
  static const Color _appBarFg = Color(0xFF222222);

  static const List<String> _options = [
    '全部选项',
    '子级选项1',
    '子级选项2',
    '子级选项3',
  ];

  String _tab1Value = _options[0];
  String _tab2Value = _options[0];
  String _filterValue = _options[0];

  final GlobalKey _tab1Key = GlobalKey();
  final GlobalKey _tab2Key = GlobalKey();
  final GlobalKey _filterKey = GlobalKey();

  Future<void> _openMenu({
    required BuildContext context,
    required GlobalKey anchorKey,
    required ValueChanged<String> onPicked,
  }) async {
    final box = anchorKey.currentContext?.findRenderObject() as RenderBox?;
    if (box == null || !box.hasSize) return;
    final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    final pos = box.localToGlobal(Offset.zero, ancestor: overlay);
    final rect = Rect.fromLTWH(pos.dx, pos.dy, box.size.width, box.size.height);
    final chosen = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        rect.left,
        rect.bottom,
        rect.right,
        MediaQuery.sizeOf(context).height,
      ),
      items: _options
          .map(
            (e) => PopupMenuItem<String>(
              value: e,
              child: Text(e),
            ),
          )
          .toList(),
    );
    if (chosen != null) onPicked(chosen);
  }

  Widget _tabChip({
    required GlobalKey key,
    required String label,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: Material(
        key: key,
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14, color: Color(0xFF333333)),
                  ),
                ),
                const SizedBox(width: 4),
                Icon(Icons.keyboard_arrow_down, size: 18, color: Colors.grey.shade600),
              ],
            ),
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
        title: const Text('下拉筛选 Dropdown', style: TextStyle(color: _appBarFg)),
        elevation: 0.5,
        backgroundColor: Colors.white,
        foregroundColor: _appBarFg,
        iconTheme: const IconThemeData(color: _appBarFg),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            '双 Tab 筛选条',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF333333)),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFEEEEEE)),
            ),
            child: Row(
              children: [
                _tabChip(
                  key: _tab1Key,
                  label: _tab1Value,
                  onTap: () => _openMenu(
                    context: context,
                    anchorKey: _tab1Key,
                    onPicked: (v) => setState(() => _tab1Value = v),
                  ),
                ),
                Container(width: 1, height: 40, color: const Color(0xFFEEEEEE)),
                _tabChip(
                  key: _tab2Key,
                  label: _tab2Value,
                  onTap: () => _openMenu(
                    context: context,
                    anchorKey: _tab2Key,
                    onPicked: (v) => setState(() => _tab2Value = v),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            '筛选图标 + 下拉',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF333333)),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFEEEEEE)),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 4),
                  child: Icon(Icons.filter_list, size: 22, color: Colors.grey.shade700),
                ),
                Expanded(
                  child: Material(
                    key: _filterKey,
                    color: Colors.white,
                    child: InkWell(
                      onTap: () => _openMenu(
                        context: context,
                        anchorKey: _filterKey,
                        onPicked: (v) => setState(() => _filterValue = v),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                        child: Row(
                          children: [
                            Text(
                              '筛选',
                              style: TextStyle(fontSize: 14, color: Colors.grey.shade800),
                            ),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                _filterValue,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 14, color: Color(0xFF333333)),
                              ),
                            ),
                            Icon(Icons.keyboard_arrow_down, size: 18, color: Colors.grey.shade600),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
