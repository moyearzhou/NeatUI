import 'package:flutter/material.dart';

/// GTUI 选项卡演示（纯 Material）
class GTUITabsDemoPage extends StatelessWidget {
  const GTUITabsDemoPage({super.key});

  static const Color _appBarFg = Color(0xFF222222);
  static const Color _indicator = Color(0xFF4A6EF0);
  static const Color _label = Color(0xFF333333);
  static const Color _unselected = Color(0xFF999999);

  static const List<String> _eight = [
    '选项一',
    '选项二',
    '选项三',
    '选项四',
    '选项五',
    '选项六',
    '选项七',
    '选项八',
  ];

  static const List<String> _six = [
    '选项一',
    '选项二',
    '选项三',
    '选项四',
    '选项五',
    '选项六',
  ];

  Widget _section(String title, Widget child) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: _label,
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }

  static TabBar _underlineTabBar({
    required List<Widget> tabs,
    required bool scrollable,
    double indicatorWeight = 3,
    TextStyle? labelStyle,
    TextStyle? unselectedLabelStyle,
    TabBarIndicatorSize indicatorSize = TabBarIndicatorSize.label,
  }) {
    return TabBar(
      isScrollable: scrollable,
      labelColor: _label,
      unselectedLabelColor: _unselected,
      indicatorColor: _indicator,
      indicatorWeight: indicatorWeight,
      indicatorSize: indicatorSize,
      labelStyle: labelStyle,
      unselectedLabelStyle: unselectedLabelStyle,
      tabs: tabs,
    );
  }

  static Widget _tabView(int count) {
    return SizedBox(
      height: 72,
      child: TabBarView(
        children: List.generate(
          count,
          (i) => Container(
            alignment: Alignment.center,
            color: const Color(0xFFF9F9F9),
            child: Text(
              '第 ${i + 1} 页',
              style: const TextStyle(color: _unselected),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('选项卡 Tabs', style: TextStyle(color: _appBarFg)),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: _appBarFg,
        iconTheme: const IconThemeData(color: _appBarFg),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 24),
        children: [
          _section(
            '大号 Tab + 导航图标（可横向滚动 · 8 项）',
            DefaultTabController(
              length: 8,
              child: Column(
                children: [
                  Material(
                    color: Colors.white,
                    child: _underlineTabBar(
                      scrollable: true,
                      indicatorWeight: 3,
                      labelStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                      unselectedLabelStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                      tabs: _eight
                          .map(
                            (t) => Tab(
                              icon: const Icon(Icons.navigation, size: 18),
                              text: t,
                              height: 52,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  _tabView(8),
                ],
              ),
            ),
          ),
          _section(
            '大号 Tab（无图标 · 8 项）',
            DefaultTabController(
              length: 8,
              child: Column(
                children: [
                  Material(
                    color: Colors.white,
                    child: _underlineTabBar(
                      scrollable: true,
                      indicatorWeight: 3,
                      labelStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                      unselectedLabelStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                      tabs: _eight.map((t) => Tab(text: t)).toList(),
                    ),
                  ),
                  _tabView(8),
                ],
              ),
            ),
          ),
          _section(
            '小号 Tab（6 项）',
            DefaultTabController(
              length: 6,
              child: Column(
                children: [
                  Material(
                    color: Colors.white,
                    child: _underlineTabBar(
                      scrollable: true,
                      indicatorWeight: 2,
                      labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                      unselectedLabelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
                      tabs: _six.map((t) => Tab(text: t)).toList(),
                    ),
                  ),
                  _tabView(6),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _section(
                  '均分 Tab（2 项）',
                  DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        Material(
                          color: Colors.white,
                          child: _underlineTabBar(
                            scrollable: false,
                            indicatorWeight: 2,
                            indicatorSize: TabBarIndicatorSize.tab,
                            labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                            unselectedLabelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                            tabs: const [Tab(text: '选项一'), Tab(text: '选项二')],
                          ),
                        ),
                        _tabView(2),
                      ],
                    ),
                  ),
                ),
                _section(
                  '均分 Tab（3 项）',
                  DefaultTabController(
                    length: 3,
                    child: Column(
                      children: [
                        Material(
                          color: Colors.white,
                          child: _underlineTabBar(
                            scrollable: false,
                            indicatorWeight: 2,
                            indicatorSize: TabBarIndicatorSize.tab,
                            labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                            unselectedLabelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                            tabs: const [
                              Tab(text: '选项一'),
                              Tab(text: '选项二'),
                              Tab(text: '选项三'),
                            ],
                          ),
                        ),
                        _tabView(3),
                      ],
                    ),
                  ),
                ),
                _section(
                  '均分 Tab（4 项）',
                  DefaultTabController(
                    length: 4,
                    child: Column(
                      children: [
                        Material(
                          color: Colors.white,
                          child: _underlineTabBar(
                            scrollable: false,
                            indicatorWeight: 2,
                            indicatorSize: TabBarIndicatorSize.tab,
                            labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                            unselectedLabelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                            tabs: const [
                              Tab(text: '选项一'),
                              Tab(text: '选项二'),
                              Tab(text: '选项三'),
                              Tab(text: '选项四'),
                            ],
                          ),
                        ),
                        _tabView(4),
                      ],
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
