import 'package:flutter/material.dart';

import '../appbar/demo_app_bar.dart';

/// GTUI 级联选择演示页（纯 Material）
class GTUICascaderDemoPage extends StatelessWidget {
  const GTUICascaderDemoPage({super.key});

  static const Color _appBarFg = Color(0xFF222222);

  void _open(BuildContext context, _CascaderVariant v) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (ctx) => _CascaderBottomSheet(variant: v),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DemoAppBar('级联选择 Cascader'),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        children: [
          _tile('默认样式', () => _open(context, _CascaderVariant.defaultStyle)),
          _tile('隐藏定位按钮', () => _open(context, _CascaderVariant.noLocation)),
          _tile('展示社区', () => _open(context, _CascaderVariant.community)),
          _tile('第四种样式', () => _open(context, _CascaderVariant.fourth)),
        ],
      ),
    );
  }

  static Widget _tile(String title, VoidCallback onTap) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontSize: 16, color: Color(0xFF333333))),
        trailing: const Icon(Icons.chevron_right, color: Color(0xFFCCCCCC)),
        onTap: onTap,
      ),
    );
  }
}

enum _CascaderVariant { defaultStyle, noLocation, community, fourth }

class _CascaderBottomSheet extends StatefulWidget {
  const _CascaderBottomSheet({required this.variant});

  final _CascaderVariant variant;

  @override
  State<_CascaderBottomSheet> createState() => _CascaderBottomSheetState();
}

class _CascaderBottomSheetState extends State<_CascaderBottomSheet> {
  static const _three = <String, Map<String, List<String>>>{
    '北京市': {
      '市辖区': ['东城区', '西城区', '朝阳区'],
    },
    '上海市': {
      '市辖区': ['黄浦区', '徐汇区', '浦东新区'],
    },
    '广东省': {
      '广州市': ['天河区', '越秀区', '海珠区'],
      '深圳市': ['南山区', '福田区', '罗湖区'],
    },
  };

  static const _four = <String, Map<String, Map<String, List<String>>>>{
    '广东省': {
      '广州市': {
        '天河区': ['体育东社区', '石牌社区', '猎德社区'],
        '越秀区': ['北京街社区', '光塔社区'],
      },
      '深圳市': {
        '南山区': ['粤海社区', '蛇口社区'],
        '福田区': ['园岭社区', '华强北社区'],
      },
    },
  };

  int _tab = 0;
  String? _p;
  String? _c;
  String? _d;
  String? _cm;

  @override
  void initState() {
    super.initState();
    if (widget.variant == _CascaderVariant.community) {
      _p = '广东省';
      _c = '广州市';
      _d = '天河区';
      _cm = _four[_p]![_c]![_d]!.first;
    } else {
      _p = _three.keys.first;
      _c = _three[_p]!.keys.first;
      _d = _three[_p]![_c]!.first;
    }
  }

  bool get _isCommunity => widget.variant == _CascaderVariant.community;
  bool get _isFourth => widget.variant == _CascaderVariant.fourth;

  int get _tabCount {
    if (_isCommunity) return 4;
    return 3;
  }

  List<String> _columnItems() {
    if (_isCommunity) {
      switch (_tab) {
        case 0:
          return _four.keys.toList();
        case 1:
          return _p != null ? _four[_p]!.keys.toList() : [];
        case 2:
          return _p != null && _c != null ? _four[_p]![_c]!.keys.toList() : [];
        case 3:
          return _p != null && _c != null && _d != null ? _four[_p]![_c]![_d] ?? [] : [];
      }
    }
    switch (_tab) {
      case 0:
        return _three.keys.toList();
      case 1:
        return _p != null ? _three[_p]!.keys.toList() : [];
      case 2:
        return _p != null && _c != null ? _three[_p]![_c] ?? [] : [];
    }
    return [];
  }

  String? _selectedInColumn() {
    if (_isCommunity) {
      switch (_tab) {
        case 0:
          return _p;
        case 1:
          return _c;
        case 2:
          return _d;
        case 3:
          return _cm;
      }
    }
    switch (_tab) {
      case 0:
        return _p;
      case 1:
        return _c;
      case 2:
        return _d;
    }
    return null;
  }

  void _pick(String v) {
    setState(() {
      if (_isCommunity) {
        if (_tab == 0) {
          _p = v;
          _c = _four[_p]!.keys.first;
          _d = _four[_p]![_c]!.keys.first;
          _cm = _four[_p]![_c]![_d]!.first;
          _tab = 1;
        } else if (_tab == 1) {
          _c = v;
          _d = _four[_p]![_c]!.keys.first;
          _cm = _four[_p]![_c]![_d]!.first;
          _tab = 2;
        } else if (_tab == 2) {
          _d = v;
          _cm = _four[_p]![_c]![_d]!.first;
          _tab = 3;
        } else {
          _cm = v;
          Navigator.pop(context);
        }
        return;
      }
      if (_tab == 0) {
        _p = v;
        _c = _three[_p]!.keys.first;
        _d = _three[_p]![_c]!.first;
        _tab = 1;
      } else if (_tab == 1) {
        _c = v;
        _d = _three[_p]![_c]!.first;
        _tab = 2;
      } else {
        _d = v;
        Navigator.pop(context);
      }
    });
  }

  Color get _accent {
    if (_isFourth) return const Color(0xFFFF7043);
    return const Color(0xFF4A6EF0);
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height * 0.52;
    final showLocate = widget.variant == _CascaderVariant.defaultStyle;

    if (_isFourth) {
      return SafeArea(
        child: SizedBox(
          height: h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _header(showLocate: false, title: '级联（分栏样式）', subtitle: '三列同时展示，点击末级完成'),
              Expanded(child: _fourthColumns()),
            ],
          ),
        ),
      );
    }

    final tabs = _isCommunity
        ? const ['省', '市', '区', '社区']
        : const ['省', '市', '区'];

    return SafeArea(
      child: SizedBox(
        height: h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _header(
              showLocate: showLocate,
              title: '请选择地区',
              subtitle: _isCommunity ? '含社区四级' : '省 / 市 / 区',
            ),
            Row(
              children: List.generate(_tabCount, (i) {
                final on = _tab == i;
                return Expanded(
                  child: InkWell(
                    onTap: () => setState(() => _tab = i),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: on ? _accent : Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                      child: Text(
                        tabs[i],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: on ? FontWeight.w600 : FontWeight.normal,
                          color: on ? _accent : const Color(0xFF666666),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
            const Divider(height: 1),
            Expanded(child: _listColumn()),
          ],
        ),
      ),
    );
  }

  Widget _header({
    required bool showLocate,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 8, 8, 8),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12, color: Color(0xFF999999)),
                ),
              ],
            ),
          ),
          if (showLocate)
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('已模拟定位')),
                );
              },
              child: Text('定位', style: TextStyle(color: _accent)),
            )
          else
            const SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _listColumn() {
    final items = _columnItems();
    final sel = _selectedInColumn();
    return ListView(
      children: items.map((name) {
        final selected = sel == name;
        return Material(
          color: selected ? _accent.withOpacity(0.08) : Colors.transparent,
          child: InkWell(
            onTap: () => _pick(name),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: 15,
                        color: selected ? _accent : const Color(0xFF333333),
                        fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                      ),
                    ),
                  ),
                  if (selected) Icon(Icons.check, size: 20, color: _accent),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _fourthColumns() {
    final cities = _three[_p]!.keys.toList();
    final districts = _three[_p]![_c] ?? [];

    Widget col(List<String> items, String? current, void Function(String) onTap) {
      return Expanded(
        child: Container(
          decoration: BoxDecoration(
            border: Border(right: BorderSide(color: Colors.grey.shade200)),
          ),
          child: ListView(
            children: items.map((name) {
              final on = current == name;
              return Material(
                color: on ? _accent.withOpacity(0.1) : Colors.transparent,
                child: InkWell(
                  onTap: () => onTap(name),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    child: Text(
                      name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        color: on ? _accent : const Color(0xFF333333),
                        fontWeight: on ? FontWeight.w600 : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        col(_three.keys.toList(), _p, (v) {
          setState(() {
            _p = v;
            _c = _three[_p]!.keys.first;
            _d = _three[_p]![_c]!.first;
          });
        }),
        col(cities, _c, (v) {
          setState(() {
            _c = v;
            _d = _three[_p]![_c]!.first;
          });
        }),
        col(districts, _d, (v) {
          setState(() => _d = v);
          Navigator.pop(context);
        }),
      ],
    );
  }
}
