import 'package:flutter/material.dart';
import '../showcase/ntui_component_showcase_page.dart';
import '../showcase/ntui_showcase_data.dart';

/// GTUI 组件展示首页
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NTUIComponentShowcasePage(
      title: 'NeatDesign',
      categories: NTUIShowcaseData.getAllCategories(),
    );
  }
}
