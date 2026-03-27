import 'package:flutter/material.dart';

/// GTUI 按钮演示页（对应 Android GTUIButtonDemoActivity）
class GTUIButtonDemoPage extends StatelessWidget {
  const GTUIButtonDemoPage({super.key});

  static const Color _brand500 = Color(0xFFFF443D);
  static const Color _brand50 = Color(0xFFFFF2F1);
  static const Color _brand200 = Color(0xFFFFBAB0);
  static const Color _gray2 = Color(0xFFF3F3F4);
  static const Color _gy1 = Color(0xFF23252D);
  static const Color _gy4 = Color(0xFF9698A1);
  static const Color _sectionTitleColor = Color(0xFF333F4F);

  static const TextStyle _sectionTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: _sectionTitleColor,
  );

  static const TextStyle _caption = TextStyle(
    fontSize: 13,
    color: _gy4,
    height: 1.35,
  );

  Widget _sectionTitleBar(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
      child: Text(title, style: _sectionTitle),
    );
  }

  Widget _buttonPair({required Widget left, required Widget right}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          left,
          const SizedBox(width: 32),
          right,
        ],
      ),
    );
  }

  Widget _primary({required String text, VoidCallback? onPressed}) {
    final enabled = onPressed != null;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: enabled ? _brand500 : _brand200,
        foregroundColor: Colors.white,
        disabledBackgroundColor: _brand200,
        disabledForegroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        minimumSize: const Size(0, 44),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      ),
      child: Text(text),
    );
  }

  Widget _secondary({required String text, VoidCallback? onPressed}) {
    final enabled = onPressed != null;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: _brand50,
        foregroundColor: enabled ? _brand500 : _brand200,
        disabledBackgroundColor: _brand50,
        disabledForegroundColor: _brand200,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        minimumSize: const Size(0, 44),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      ),
      child: Text(text),
    );
  }

  Widget _normal({required String text, VoidCallback? onPressed}) {
    final enabled = onPressed != null;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: _gray2,
        foregroundColor: enabled ? _gy1 : _gy4,
        disabledBackgroundColor: _gray2,
        disabledForegroundColor: _gy4,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        minimumSize: const Size(0, 44),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      ),
      child: Text(text),
    );
  }

  Widget _line({required String text, VoidCallback? onPressed}) {
    final enabled = onPressed != null;
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: enabled ? _brand500 : _brand200,
        disabledForegroundColor: _brand200,
        side: BorderSide(color: enabled ? _brand500 : _brand200, width: 1),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        minimumSize: const Size(0, 44),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      ),
      child: Text(text),
    );
  }

  Widget _assist({required String text, VoidCallback? onPressed}) {
    final enabled = onPressed != null;
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: enabled ? _brand500 : _brand200,
        disabledForegroundColor: _brand200,
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        minimumSize: const Size(0, 44),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      ),
      child: Text(text),
    );
  }

  Widget _label({required String text, VoidCallback? onPressed}) {
    final enabled = onPressed != null;
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: enabled ? _gy1 : _gy4,
        disabledForegroundColor: _gy4,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
        minimumSize: const Size(0, 44),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(text),
    );
  }

  Widget _sizeCell({
    required String label,
    required double height,
    required double radius,
    required double fontSize,
    required String heightPx,
    required String radiusPx,
    required String fontPx,
    required String hint1,
    required String hint2,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Column(
        children: [
          SizedBox(
            height: 70,
            child: Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: _brand500,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: height < 30 ? 10 : 16, vertical: 0),
                  minimumSize: Size(0, height),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius),
                  ),
                  textStyle: TextStyle(fontSize: fontSize),
                ),
                child: Text(label),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text('高度：$heightPx', style: const TextStyle(fontSize: 14, color: _sectionTitleColor)),
          const SizedBox(height: 8),
          Text('圆角：$radiusPx', style: const TextStyle(fontSize: 14, color: _sectionTitleColor)),
          const SizedBox(height: 8),
          Text('字号：$fontPx', style: const TextStyle(fontSize: 14, color: _sectionTitleColor)),
          const SizedBox(height: 8),
          Text(hint1, style: _caption),
          Text(hint2, style: _caption),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('按钮 Button'),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF222222),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _sectionTitleBar('基础样式'),
            _buttonPair(
              left: _primary(text: '主要按钮', onPressed: () {}),
              right: _primary(text: '禁用状态', onPressed: null),
            ),
            _buttonPair(
              left: _secondary(text: '次要按钮', onPressed: () {}),
              right: _secondary(text: '禁用状态', onPressed: null),
            ),
            _buttonPair(
              left: _normal(text: '普通按钮', onPressed: () {}),
              right: _normal(text: '禁用状态', onPressed: null),
            ),
            _buttonPair(
              left: _line(text: '线性按钮', onPressed: () {}),
              right: _line(text: '禁用状态', onPressed: null),
            ),
            _buttonPair(
              left: _assist(text: '辅助按钮', onPressed: () {}),
              right: _assist(text: '辅助按钮', onPressed: null),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Center(child: _label(text: '文字按钮', onPressed: () {})),
            ),
            _sectionTitleBar('固定按钮尺寸'),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Text(
                '注：图例为各尺寸按钮最小宽度值；按钮尺寸仅限定了按钮高度，未限定按钮宽度，宽度以实际应用场景为准。',
                style: TextStyle(fontSize: 13, color: _gy4, height: 1.4),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _sizeCell(
                    label: '极小',
                    height: 24,
                    radius: 12,
                    fontSize: 12,
                    heightPx: '24px',
                    radiusPx: '12px',
                    fontPx: '12',
                    hint1: '-最小按钮',
                    hint2: '-常用于发现关注',
                  ),
                ),
                Container(width: 1, margin: const EdgeInsets.symmetric(vertical: 8), color: const Color(0xFFD8D8D8)),
                Expanded(
                  child: _sizeCell(
                    label: '小按钮',
                    height: 28,
                    radius: 14,
                    fontSize: 12,
                    heightPx: '28px',
                    radiusPx: '14px',
                    fontPx: '12',
                    hint1: '-常用小按钮',
                    hint2: '-模块中引导按钮',
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _sizeCell(
                    label: '中按钮',
                    height: 38,
                    radius: 19,
                    fontSize: 14,
                    heightPx: '38px',
                    radiusPx: '19px',
                    fontPx: '14',
                    hint1: '-中按钮',
                    hint2: '-常用于空状态引导按钮',
                  ),
                ),
                Container(width: 1, margin: const EdgeInsets.symmetric(vertical: 8), color: const Color(0xFFD8D8D8)),
                Expanded(
                  child: _sizeCell(
                    label: '大按钮',
                    height: 44,
                    radius: 22,
                    fontSize: 16,
                    heightPx: '44px',
                    radiusPx: '22px',
                    fontPx: '16',
                    hint1: '-大按钮',
                    hint2: '-常用于对话框内按钮',
                  ),
                ),
              ],
            ),
            _sectionTitleBar('全局按钮'),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Text('吸底通栏样式', style: TextStyle(fontSize: 14, color: Color(0xFF666666))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: _brand500,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                ),
                child: const Text('通栏按钮'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 20, 16, 12),
              child: Text('底部单按钮+icon', style: TextStyle(fontSize: 14, color: Color(0xFF666666))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: _brand500,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 52),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.chat_bubble_outline, size: 20),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text('咨询', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                        Text('按钮', style: TextStyle(fontSize: 12, height: 1.2)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 20, 16, 12),
              child: Text('吸底通栏双按钮', style: TextStyle(fontSize: 14, color: Color(0xFF666666))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: _brand500,
                        side: const BorderSide(color: _brand500),
                        minimumSize: const Size(0, 48),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                      ),
                      child: const Text('线性按钮'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: _brand500,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(0, 48),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                      ),
                      child: const Text('主要按钮'),
                    ),
                  ),
                ],
              ),
            ),
            _sectionTitleBar('组合按钮'),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add, size: 18),
                    label: const Text('文字按钮'),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: _brand500,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      minimumSize: const Size(0, 24),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      textStyle: const TextStyle(fontSize: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add, size: 20),
                    label: const Text('文字按钮'),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: _brand500,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      minimumSize: const Size(0, 44),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
                    ),
                  ),
                ],
              ),
            ),
            _sectionTitleBar('加载中按钮'),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: null,
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: _brand200,
                          foregroundColor: Colors.white,
                          minimumSize: const Size(120, 36),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                        ),
                        child: const SizedBox.shrink(),
                      ),
                      const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
              child: Container(
                height: 48,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: _brand200,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
