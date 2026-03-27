import 'package:flutter/material.dart';

/// GTUI Toast 演示页（对应 Android GTUIToastDemoActivity）
class GTUIToastDemoPage extends StatefulWidget {
  const GTUIToastDemoPage({super.key});

  @override
  State<GTUIToastDemoPage> createState() => _GTUIToastDemoPageState();
}

class _GTUIToastDemoPageState extends State<GTUIToastDemoPage> {
  static const Color _toastBg = Color(0xE6333333);
  static const Color _successBg = Color(0xE600B578);
  static const Color _errorBg = Color(0xE6FF3141);
  static const Color _warnBg = Color(0xE6FFB020);

  void _showToast({
    required Widget child,
    Color backgroundColor = _toastBg,
    Duration duration = const Duration(seconds: 2),
  }) {
    final overlay = Overlay.of(context);
    late OverlayEntry entry;
    entry = OverlayEntry(
      builder: (ctx) => Positioned.fill(
        child: IgnorePointer(
          child: Material(
            color: Colors.transparent,
            child: Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DefaultTextStyle(
                  style: const TextStyle(color: Colors.white, fontSize: 14, height: 1.4),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
    overlay.insert(entry);
    Future<void>.delayed(duration, entry.remove);
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
      ),
    );
  }

  Widget _toastPreview({
    required Widget child,
    Color backgroundColor = _toastBg,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DefaultTextStyle(
        style: const TextStyle(color: Colors.white, fontSize: 14, height: 1.4),
        child: child,
      ),
    );
  }

  Widget _triggerButton(String label, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: onTap,
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFF222222),
            side: const BorderSide(color: Color(0xFFE0E0E0)),
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: Text(label),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('提示 Toast'),
        elevation: 0.5,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF222222),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _sectionHeader('静态示例'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  _toastPreview(child: const Text('这是一条普通提示')),
                  _toastPreview(
                    backgroundColor: _successBg,
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.check_circle, color: Colors.white, size: 20),
                        SizedBox(width: 8),
                        Text('操作成功'),
                      ],
                    ),
                  ),
                  _toastPreview(
                    backgroundColor: _errorBg,
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.close, color: Colors.white, size: 22),
                        SizedBox(width: 8),
                        Text('操作失败'),
                      ],
                    ),
                  ),
                  _toastPreview(
                    backgroundColor: _warnBg,
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.warning_amber_rounded, color: Colors.white, size: 22),
                        SizedBox(width: 8),
                        Text('请注意'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _sectionHeader('点击触发'),
            _triggerButton(
              '普通 Toast',
              () => _showToast(child: const Text('这是一条普通 Toast')),
            ),
            _triggerButton(
              '成功 Toast',
              () => _showToast(
                backgroundColor: _successBg,
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.check_circle, color: Colors.white, size: 20),
                    SizedBox(width: 8),
                    Text('成功'),
                  ],
                ),
              ),
            ),
            _triggerButton(
              '失败 Toast',
              () => _showToast(
                backgroundColor: _errorBg,
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.close, color: Colors.white, size: 22),
                    SizedBox(width: 8),
                    Text('失败'),
                  ],
                ),
              ),
            ),
            _triggerButton(
              '警告 Toast',
              () => _showToast(
                backgroundColor: _warnBg,
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.warning_amber_rounded, color: Colors.white, size: 22),
                    SizedBox(width: 8),
                    Text('警告'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
