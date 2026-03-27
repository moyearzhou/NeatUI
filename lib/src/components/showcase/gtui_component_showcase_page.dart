import 'package:flutter/material.dart';

class GTUIComponentItem {
  final String name;
  final String? iconAsset;
  final IconData? iconData;
  final Widget Function(BuildContext context)? pageBuilder;
  final void Function(BuildContext context)? onTap;

  GTUIComponentItem({
    required this.name,
    this.iconAsset,
    this.iconData,
    this.pageBuilder,
    this.onTap,
  });
}

class GTUIComponentCategory {
  final String title;
  final List<GTUIComponentItem> items;

  GTUIComponentCategory({
    required this.title,
    required this.items,
  });
}

class GTUIComponentShowcasePage extends StatelessWidget {
  final String title;
  final List<GTUIComponentCategory> categories;
  final Color backgroundColor;
  final List<Widget>? actions;

  const GTUIComponentShowcasePage({
    Key? key,
    this.title = 'NeatDesign',
    required this.categories,
    this.backgroundColor = Colors.white,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w400)),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF222222),
        centerTitle: true,
        leading: const SizedBox.shrink(),
        actions: actions,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return _CategorySection(category: categories[index]);
        },
      ),
    );
  }
}

class _CategorySection extends StatelessWidget {
  final GTUIComponentCategory category;

  const _CategorySection({required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 32),
        _buildHeader(),
        const SizedBox(height: 16),
        _buildGrid(context),
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          category.title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF222222),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 30,
          height: 20,
          decoration: BoxDecoration(
            color: const Color(0xFFF0F0F5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              '${category.items.length}',
              style: const TextStyle(
                fontSize: 12,
                color: Color(0x99000000),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGrid(BuildContext context) {
    final rows = <Widget>[];
    for (int i = 0; i < category.items.length; i += 2) {
      final first = category.items[i];
      final second =
          i + 1 < category.items.length ? category.items[i + 1] : null;
      rows.add(
        Padding(
          padding: EdgeInsets.only(top: i > 0 ? 15 : 0),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Expanded(child: _ComponentCard(item: first)),
                const SizedBox(width: 15),
                Expanded(
                  child: second != null
                      ? _ComponentCard(item: second)
                      : const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Column(children: rows);
  }
}

class _ComponentCard extends StatelessWidget {
  final GTUIComponentItem item;

  const _ComponentCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (item.onTap != null) {
          item.onTap!(context);
        } else if (item.pageBuilder != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: item.pageBuilder!),
          );
        }
      },
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5FA),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildIcon(),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Text(
                item.name,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF333333),
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    if (item.iconAsset != null) {
      return Image.asset(
        item.iconAsset!,
        width: 110,
        height: 90,
        fit: BoxFit.contain,
        errorBuilder: (_, __, ___) => _buildFallbackIcon(),
      );
    }
    if (item.iconData != null) {
      return Icon(item.iconData, size: 48, color: const Color(0xFF666666));
    }
    return _buildFallbackIcon();
  }

  Widget _buildFallbackIcon() {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFE0E0F0),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          item.name.isNotEmpty ? item.name[0] : '?',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF666699),
          ),
        ),
      ),
    );
  }
}
