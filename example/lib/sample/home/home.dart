import 'package:neatui/src/components/showcase/gtui_component_showcase_page.dart';
import 'package:neatui/src/components/showcase/gtui_showcase_data.dart';
import 'package:flutter/material.dart';

/// GTUI 组件展示首页
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GTUIComponentShowcasePage(
      title: 'NeatDesign',
      categories: GTUIShowcaseData.getAllCategories(),
    );
  }
}
