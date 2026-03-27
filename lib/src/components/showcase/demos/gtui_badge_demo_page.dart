import 'package:flutter/material.dart';

/// GTUI 徽标演示页（对应 Android GTUIBadgeDemoActivity）
class GTUIBadgeDemoPage extends StatelessWidget {
  const GTUIBadgeDemoPage({super.key});

  static const Color _badgeRed = Color(0xFFFF3141);
  static const Color _iconBg = Color(0xFFE8E8ED);

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
      ),
    );
  }

  Widget _dotBadge() {
    return Container(
      width: 8,
      height: 8,
      decoration: const BoxDecoration(color: _badgeRed, shape: BoxShape.circle),
    );
  }

  Widget _countBadge(String text, {double minWidth = 16}) {
    return Container(
      constraints: BoxConstraints(minWidth: minWidth, minHeight: 16),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
        color: _badgeRed,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500, height: 1.1),
      ),
    );
  }

  Widget _badgedIcon({
    required Alignment badgeAlignment,
    required Widget badge,
  }) {
    return SizedBox(
      width: 48,
      height: 48,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: _iconBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.notifications_none, size: 26, color: Color(0xFF666666)),
          ),
          Positioned(
            top: badgeAlignment.y < 0 ? -4 : null,
            bottom: badgeAlignment.y > 0 ? -4 : null,
            left: badgeAlignment.x < 0 ? -4 : null,
            right: badgeAlignment.x > 0 ? -4 : null,
            child: badge,
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
        title: const Text('徽标 Badge'),
        elevation: 0.5,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF222222),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionHeader('红点徽标'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _badgedIcon(
                    badgeAlignment: Alignment.topRight,
                    badge: _dotBadge(),
                  ),
                ],
              ),
            ),
            _sectionHeader('数字徽标'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                spacing: 20,
                runSpacing: 16,
                children: [
                  _badgedIcon(badgeAlignment: Alignment.topRight, badge: _countBadge('1')),
                  _badgedIcon(badgeAlignment: Alignment.topRight, badge: _countBadge('9')),
                  _badgedIcon(badgeAlignment: Alignment.topRight, badge: _countBadge('99')),
                  _badgedIcon(
                    badgeAlignment: Alignment.topRight,
                    badge: _countBadge('99+', minWidth: 22),
                  ),
                ],
              ),
            ),
            _sectionHeader('图标上的徽标'),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '铃铛通知示例',
                style: TextStyle(fontSize: 13, color: Color(0xFF666666)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Row(
                children: [
                  _badgedIcon(badgeAlignment: Alignment.topRight, badge: _countBadge('5')),
                  const SizedBox(width: 24),
                  _badgedIcon(badgeAlignment: Alignment.topRight, badge: _dotBadge()),
                ],
              ),
            ),
            _sectionHeader('徽标位置'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('右上', style: TextStyle(fontSize: 12, color: Color(0xFF999999))),
                      const SizedBox(height: 8),
                      _badgedIcon(badgeAlignment: Alignment.topRight, badge: _countBadge('3')),
                    ],
                  ),
                  const SizedBox(width: 32),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('左上', style: TextStyle(fontSize: 12, color: Color(0xFF999999))),
                      const SizedBox(height: 8),
                      _badgedIcon(
                        badgeAlignment: Alignment.topLeft,
                        badge: _countBadge('3'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
