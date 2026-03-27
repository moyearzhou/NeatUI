import 'package:flutter/material.dart';

/// GTUI 字体 / 排版演示页（对应 Android GTUI 文本样式）
class GTUITextDemoPage extends StatelessWidget {
  const GTUITextDemoPage({super.key});

  static const Color _titleColor = Color(0xFF222222);
  static const Color _metaColor = Color(0xFF666666);
  static const Color _descColor = Color(0xFF999999);

  Widget _styleRow({
    required TextStyle style,
    required String nameEn,
    required String sizeLine,
    required String descLine,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 44,
            child: Text('Ag', style: style),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(nameEn, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: _titleColor)),
                    Text(' $sizeLine', style: const TextStyle(fontSize: 13, color: _metaColor)),
                  ],
                ),
                const SizedBox(height: 6),
                Text(descLine, style: const TextStyle(fontSize: 12, color: _descColor, height: 1.35)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('文字 Text'),
        elevation: 0.5,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF222222),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 20, 16, 8),
              child: Text(
                '字体样式',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
              ),
            ),
            _styleRow(
              style: const TextStyle(
                fontSize: 22,
                height: 30 / 22,
                fontWeight: FontWeight.bold,
                color: _titleColor,
              ),
              nameEn: 'Title Large',
              sizeLine: '· 22/30',
              descLine: '--- Title Large · Bold 700',
            ),
            _styleRow(
              style: const TextStyle(
                fontSize: 18,
                height: 26 / 18,
                fontWeight: FontWeight.w500,
                color: _titleColor,
              ),
              nameEn: 'Title 1',
              sizeLine: '· 18/26',
              descLine: '--- Title 1 · Medium 500',
            ),
            _styleRow(
              style: const TextStyle(
                fontSize: 16,
                height: 24 / 16,
                fontWeight: FontWeight.w500,
                color: _titleColor,
              ),
              nameEn: 'Title 2',
              sizeLine: '· 16/24',
              descLine: '--- Title 2 · Medium 500',
            ),
            _styleRow(
              style: const TextStyle(
                fontSize: 14,
                height: 20 / 14,
                fontWeight: FontWeight.w500,
                color: _titleColor,
              ),
              nameEn: 'Title 3',
              sizeLine: '· 14/20',
              descLine: '--- Title 3 · Medium 500',
            ),
            _styleRow(
              style: const TextStyle(
                fontSize: 12,
                height: 16 / 12,
                fontWeight: FontWeight.w500,
                color: _titleColor,
              ),
              nameEn: 'Title 4',
              sizeLine: '· 12/16',
              descLine: '--- Title 4 · Medium 500',
            ),
            _styleRow(
              style: const TextStyle(
                fontSize: 16,
                height: 24 / 16,
                fontWeight: FontWeight.normal,
                color: _titleColor,
              ),
              nameEn: 'Body 1',
              sizeLine: '· 16/24',
              descLine: '--- Body 1 · Regular 400',
            ),
            _styleRow(
              style: const TextStyle(
                fontSize: 14,
                height: 20 / 14,
                fontWeight: FontWeight.normal,
                color: _titleColor,
              ),
              nameEn: 'Body 2',
              sizeLine: '· 14/20',
              descLine: '--- Body 2 · Regular 400',
            ),
            _styleRow(
              style: const TextStyle(
                fontSize: 12,
                height: 16 / 12,
                fontWeight: FontWeight.normal,
                color: _titleColor,
              ),
              nameEn: 'Body 3',
              sizeLine: '· 12/16',
              descLine: '--- Body 3 · Regular 400',
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
