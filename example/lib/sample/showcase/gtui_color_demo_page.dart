import 'package:flutter/material.dart';

import '../appbar/demo_app_bar.dart';

/// GTUI 色彩演示页（对应 Android GTUIColorDemoActivity）
class GTUIColorDemoPage extends StatelessWidget {
  const GTUIColorDemoPage({super.key});

  static const Color _sectionColor = Color(0xFF333333);
  static const Color _hexColor = Color(0xFF999999);

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: _sectionColor),
      ),
    );
  }

  Widget _swatchRow(Color color, String name, String hex) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE8E8E8)),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: _sectionColor)),
                Text(hex, style: const TextStyle(fontSize: 12, color: _hexColor)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _gradientRow(Gradient gradient, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 48,
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE8E8E8)),
            ),
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: _sectionColor)),
          Text(subtitle, style: const TextStyle(fontSize: 12, color: _hexColor)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DemoAppBar('色彩 Color'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _sectionHeader('品牌色 Brand'),
            _swatchRow(const Color(0xFFFF5750), '主色 Primary', '#FF5750'),
            _swatchRow(const Color(0xFFFF443D), '品牌 500（组件常用）', '#FF443D'),
            _swatchRow(const Color(0xFFFFF2F1), '品牌浅 Brand 50', '#FFF2F1'),
            _sectionHeader('中性色 Neutral'),
            _swatchRow(const Color(0xFF222222), '中性 1', '#222222'),
            _swatchRow(const Color(0xFF333333), '中性 2', '#333333'),
            _swatchRow(const Color(0xFF666666), '中性 3', '#666666'),
            _swatchRow(const Color(0xFF999999), '中性 4', '#999999'),
            _swatchRow(const Color(0xFFCCCCCC), '中性 5', '#CCCCCC'),
            _swatchRow(const Color(0xFFF5F5F5), '背景浅', '#F5F5F5'),
            _sectionHeader('文字色 Text'),
            _swatchRow(const Color(0xFF23252D), '主文案', '#23252D'),
            _swatchRow(const Color(0xFF666666), '次要文案', '#666666'),
            _swatchRow(const Color(0xFF999999), '辅助说明', '#999999'),
            _swatchRow(const Color(0xFFCCCCCC), '禁用 / 占位', '#CCCCCC'),
            _sectionHeader('渐变色 Gradient'),
            _gradientRow(
              const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFFFF5750), Color(0xFFFF958A)],
              ),
              '品牌暖色渐变',
              '#FF5750 → #FF958A',
            ),
            _gradientRow(
              const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF4A6EF0), Color(0xFF8FA8F5)],
              ),
              '信息蓝渐变',
              '#4A6EF0 → #8FA8F5',
            ),
            _sectionHeader('扩展色 Expand'),
            _swatchRow(const Color(0xFF00B578), '成功 Success', '#00B578'),
            _swatchRow(const Color(0xFFFFB020), '警告 Warning', '#FFB020'),
            _swatchRow(const Color(0xFFFF3141), '错误 Error', '#FF3141'),
            _swatchRow(const Color(0xFF4A6EF0), '信息 Info', '#4A6EF0'),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
