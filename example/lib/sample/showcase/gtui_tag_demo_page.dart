import 'package:flutter/material.dart';

import '../appbar/demo_app_bar.dart';

/// GTUI 标签演示页（纯 Material）
class GTUITagDemoPage extends StatelessWidget {
  const GTUITagDemoPage({super.key});

  static const Color _appBarFg = Color(0xFF222222);

  static const Color _red = Color(0xFFE53935);
  static const Color _blue = Color(0xFF1E88E5);
  static const Color _green = Color(0xFF43A047);
  static const Color _orange = Color(0xFFFB8C00);

  static TextStyle _sectionTitle() => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color(0xFF333333),
      );

  Widget _section(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
      child: Text(title, style: _sectionTitle()),
    );
  }

  Widget _tag(
    String text, {
    required double height,
    required double fontSize,
    double horizontalPadding = 10,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? borderColor,
    bool round = false,
    Widget? trailing,
  }) {
    final fg = foregroundColor ?? const Color(0xFF333333);
    return Container(
      height: height,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      decoration: BoxDecoration(
        color: backgroundColor ?? (borderColor != null ? Colors.transparent : null),
        borderRadius: round
            ? BorderRadius.circular(height / 2)
            : BorderRadius.circular(4),
        border: borderColor != null ? Border.all(color: borderColor, width: 1) : null,
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: fontSize, color: fg, height: 1.1),
          ),
          if (trailing != null) ...[
            const SizedBox(width: 4),
            trailing,
          ],
        ],
      ),
    );
  }

  Widget _wrap(List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(spacing: 8, runSpacing: 8, children: children),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DemoAppBar('标签 Tag'),
      body: ListView(
        children: [
          _section('实心标签'),
          _wrap([
            _tag('红色', height: 28, fontSize: 13, backgroundColor: _red, foregroundColor: Colors.white),
            _tag('蓝色', height: 28, fontSize: 13, backgroundColor: _blue, foregroundColor: Colors.white),
            _tag('绿色', height: 28, fontSize: 13, backgroundColor: _green, foregroundColor: Colors.white),
            _tag('橙色', height: 28, fontSize: 13, backgroundColor: _orange, foregroundColor: Colors.white),
          ]),
          _section('线框标签'),
          _wrap([
            _tag('红色', height: 28, fontSize: 13, borderColor: _red, foregroundColor: _red),
            _tag('蓝色', height: 28, fontSize: 13, borderColor: _blue, foregroundColor: _blue),
            _tag('绿色', height: 28, fontSize: 13, borderColor: _green, foregroundColor: _green),
            _tag('橙色', height: 28, fontSize: 13, borderColor: _orange, foregroundColor: _orange),
          ]),
          _section('尺寸：小 / 中 / 大'),
          _wrap([
            _tag('小', height: 22, fontSize: 11, horizontalPadding: 8, backgroundColor: _blue.withOpacity(0.12), foregroundColor: _blue),
            _tag('中', height: 28, fontSize: 13, backgroundColor: _blue.withOpacity(0.12), foregroundColor: _blue),
            _tag('大', height: 36, fontSize: 15, horizontalPadding: 14, backgroundColor: _blue.withOpacity(0.12), foregroundColor: _blue),
          ]),
          _section('可删除标签'),
          _wrap([
            _tag(
              '标签',
              height: 28,
              fontSize: 13,
              backgroundColor: const Color(0xFFF0F0F5),
              foregroundColor: _appBarFg,
              trailing: GestureDetector(
                onTap: () {},
                child: Icon(Icons.close, size: 16, color: Colors.grey.shade700),
              ),
            ),
            _tag(
              '可移除',
              height: 28,
              fontSize: 13,
              borderColor: const Color(0xFFCCCCCC),
              foregroundColor: _appBarFg,
              trailing: Icon(Icons.close, size: 16, color: Colors.grey.shade600),
            ),
          ]),
          _section('圆角标签'),
          _wrap([
            _tag('圆角实心', height: 28, fontSize: 13, backgroundColor: _green, foregroundColor: Colors.white, round: true),
            _tag('圆角线框', height: 28, fontSize: 13, borderColor: _orange, foregroundColor: _orange, round: true),
            _tag('圆角灰底', height: 28, fontSize: 13, backgroundColor: const Color(0xFFEEEEEE), foregroundColor: _appBarFg, round: true),
          ]),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
