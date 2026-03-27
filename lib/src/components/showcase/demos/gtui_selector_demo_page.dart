import 'package:flutter/material.dart';

/// GTUI 选择器 / 多选演示页（纯 Material）
class GTUISelectorDemoPage extends StatefulWidget {
  const GTUISelectorDemoPage({super.key});

  @override
  State<GTUISelectorDemoPage> createState() => _GTUISelectorDemoPageState();
}

class _GTUISelectorDemoPageState extends State<GTUISelectorDemoPage> {
  static const Color _appBarFg = Color(0xFF222222);
  static const Color _primary = Color(0xFF4A6EF0);
  static const Color _border = Color(0xFFCCCCCC);

  static const List<String> _labels = ['选项一', '选项二', '选项三', '选项四'];

  int _singleIndex = 0;
  final Set<int> _multi = {0};

  static TextStyle _section() => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color(0xFF333333),
      );

  Widget _h(String t) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
      child: Text(t, style: _section()),
    );
  }

  Widget _horizontalChips({
    required List<String> labels,
    required bool single,
  }) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: List.generate(labels.length, (i) {
          if (single) {
            final sel = i == _singleIndex;
            return Padding(
              padding: EdgeInsets.only(right: i < labels.length - 1 ? 10 : 0),
              child: ChoiceChip(
                label: Text(labels[i]),
                selected: sel,
                onSelected: (_) => setState(() => _singleIndex = i),
                selectedColor: _primary,
                backgroundColor: Colors.white,
                side: BorderSide(color: sel ? _primary : _border),
                labelStyle: TextStyle(
                  color: sel ? Colors.white : _appBarFg,
                  fontSize: 14,
                ),
              ),
            );
          }
          final sel = _multi.contains(i);
          return Padding(
            padding: EdgeInsets.only(right: i < labels.length - 1 ? 10 : 0),
            child: FilterChip(
              label: Text(labels[i]),
              selected: sel,
              onSelected: (v) {
                setState(() {
                  if (v) {
                    _multi.add(i);
                  } else {
                    _multi.remove(i);
                  }
                });
              },
              selectedColor: _primary,
              checkmarkColor: Colors.white,
              backgroundColor: Colors.white,
              side: BorderSide(color: sel ? _primary : _border),
              labelStyle: TextStyle(
                color: sel ? Colors.white : _appBarFg,
                fontSize: 14,
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _disabledRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: _labels.map((l) {
          return ChoiceChip(
            label: Text(l, style: const TextStyle(color: Color(0xFFBBBBBB))),
            selected: false,
            onSelected: null,
            disabledColor: const Color(0xFFF5F5F5),
            side: const BorderSide(color: Color(0xFFE8E8E8)),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          '选择器 Selector',
          style: TextStyle(color: _appBarFg, fontWeight: FontWeight.w600),
        ),
        elevation: 0.5,
        backgroundColor: Colors.white,
        foregroundColor: _appBarFg,
        surfaceTintColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          _h('横向单选'),
          _horizontalChips(labels: _labels, single: true),
          _h('横向多选'),
          _horizontalChips(labels: _labels, single: false),
          _h('禁用状态'),
          _disabledRow(),
          _h('长文案溢出（固定宽度 + 省略）'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: 220,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ChoiceChip(
                      label: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 140),
                        child: const Text(
                          '这是一段非常长的选项文案用于演示溢出',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      selected: true,
                      onSelected: (_) {},
                      selectedColor: _primary,
                      labelStyle: const TextStyle(color: Colors.white, fontSize: 13),
                      side: const BorderSide(color: _primary),
                    ),
                    const SizedBox(width: 8),
                    ChoiceChip(
                      label: const Text('短'),
                      selected: false,
                      onSelected: (_) {},
                      side: const BorderSide(color: _border),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
