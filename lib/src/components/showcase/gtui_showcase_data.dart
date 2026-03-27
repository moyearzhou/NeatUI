import 'gtui_component_showcase_page.dart';
import 'demos/gtui_button_demo_page.dart';
import 'demos/gtui_text_demo_page.dart';
import 'demos/gtui_shadow_demo_page.dart';
import 'demos/gtui_radius_demo_page.dart';
import 'demos/gtui_color_demo_page.dart';
import 'demos/gtui_badge_demo_page.dart';
import 'demos/gtui_toast_demo_page.dart';
import 'demos/gtui_dialog_demo_page.dart';
import 'demos/gtui_tag_demo_page.dart';
import 'demos/gtui_grid_demo_page.dart';
import 'demos/gtui_divider_demo_page.dart';
import 'demos/gtui_nav_demo_page.dart';
import 'demos/gtui_selector_demo_page.dart';
import 'demos/gtui_cascader_demo_page.dart';
import 'demos/gtui_picker_demo_page.dart';
import 'demos/gtui_popup_demo_page.dart';
import 'demos/gtui_popover_demo_page.dart';
import 'demos/gtui_edittext_demo_page.dart';
import 'demos/gtui_searchbar_demo_page.dart';
import 'demos/gtui_actionsheet_demo_page.dart';
import 'demos/gtui_dropdown_demo_page.dart';
import 'demos/gtui_tabs_demo_page.dart';

/// GTUI 组件展示数据配置
///
/// 按照 Android DkGTUIComponentTypeEnum 的 7 大分类组织，
/// 每个分类对应 DkComponentEnum 中的组件条目。
class GTUIShowcaseData {
  static List<GTUIComponentCategory> getAllCategories() {
    return [
      _getCustomCategory(),
      _getLayoutCategory(),
      _getNavCategory(),
      _getDataCategory(),
      _getInformationCategory(),
      _getFeedbackCategory(),
      _getPromptCategory(),
    ];
  }

  /// 通用类 (DKCustom)
  /// Android: Button
  static GTUIComponentCategory _getCustomCategory() {
    return GTUIComponentCategory(
      title: '通用类',
      items: [
        GTUIComponentItem(
          name: '按钮 Button',
          iconAsset: 'assets/icons/dk_gtui_button.png',
          pageBuilder: (_) => GTUIButtonDemoPage(),
        ),
      ],
    );
  }

  /// 布局类 (DKLayout)
  /// Android: Divider, Grid
  static GTUIComponentCategory _getLayoutCategory() {
    return GTUIComponentCategory(
      title: '布局类',
      items: [
        GTUIComponentItem(
          name: '分割线 Divider',
          iconAsset: 'assets/icons/dk_gtui_divider.png',
          pageBuilder: (_) => GTUIDividerDemoPage(),
        ),
        GTUIComponentItem(
          name: '宫格 Grid',
          iconAsset: 'assets/icons/dk_gtui_gird.png',
          pageBuilder: (_) => GTUIGridDemoPage(),
        ),
      ],
    );
  }

  /// 导航类 (DKNav)
  /// Android: DropDownMenu, NavBar, Tabs
  static GTUIComponentCategory _getNavCategory() {
    return GTUIComponentCategory(
      title: '导航类',
      items: [
        GTUIComponentItem(
          name: '下拉筛选 Dropdown',
          iconAsset: 'assets/icons/dk_gtui_dropdown.png',
          pageBuilder: (_) => GTUIDropdownDemoPage(),
        ),
        GTUIComponentItem(
          name: '导航栏 NavBar',
          iconAsset: 'assets/icons/dk_gtui_nav.png',
          pageBuilder: (_) => GTUINavDemoPage(),
        ),
        GTUIComponentItem(
          name: '选项卡 Tabs',
          iconAsset: 'assets/icons/dk_gtui_tabs.png',
          pageBuilder: (_) => GTUITabsDemoPage(),
        ),
      ],
    );
  }

  /// 数据录入类 (DKData)
  /// Android: PickerDialog, Cascader, TextArea, SearchBar, Selector
  static GTUIComponentCategory _getDataCategory() {
    return GTUIComponentCategory(
      title: '数据录入类',
      items: [
        GTUIComponentItem(
          name: '选择器 Picker',
          iconAsset: 'assets/icons/dk_gtui_picker.png',
          pageBuilder: (_) => GTUIPickerDemoPage(),
        ),
        GTUIComponentItem(
          name: '级联选择 Cascader',
          iconAsset: 'assets/icons/dk_gtui_area.png',
          pageBuilder: (_) => GTUICascaderDemoPage(),
        ),
        GTUIComponentItem(
          name: '文本域 TextArea',
          iconAsset: 'assets/icons/dk_gtui_input.png',
          pageBuilder: (_) => GTUIEdittextDemoPage(),
        ),
        GTUIComponentItem(
          name: '搜索栏 SearchBar',
          iconAsset: 'assets/icons/dk_gtui_search.png',
          pageBuilder: (_) => GTUISearchbarDemoPage(),
        ),
        GTUIComponentItem(
          name: '选择组 Selector',
          iconAsset: 'assets/icons/dk_gtui_selector.png',
          pageBuilder: (_) => GTUISelectorDemoPage(),
        ),
      ],
    );
  }

  /// 信息展示类 (DkInformation)
  /// Android: Tag, Popover
  /// 额外: Text, Shadow, Radius, Color
  static GTUIComponentCategory _getInformationCategory() {
    return GTUIComponentCategory(
      title: '信息展示类',
      items: [
        GTUIComponentItem(
          name: '文字 Text',
          iconAsset: 'assets/icons/dk_gtui_text_view.png',
          pageBuilder: (_) => GTUITextDemoPage(),
        ),
        GTUIComponentItem(
          name: '阴影 Shadow',
          iconAsset: 'assets/icons/dk_gtui_shadow.png',
          pageBuilder: (_) => GTUIShadowDemoPage(),
        ),
        GTUIComponentItem(
          name: '圆角 Radius',
          iconAsset: 'assets/icons/dk_gtui_radius.png',
          pageBuilder: (_) => GTUIRadiusDemoPage(),
        ),
        GTUIComponentItem(
          name: '色彩 Color',
          iconAsset: 'assets/icons/dk_gtui_color.png',
          pageBuilder: (_) => GTUIColorDemoPage(),
        ),
        GTUIComponentItem(
          name: '标签 Tag',
          iconAsset: 'assets/icons/dk_gtui_tag.png',
          pageBuilder: (_) => GTUITagDemoPage(),
        ),
        GTUIComponentItem(
          name: '浮层 Popover',
          iconAsset: 'assets/icons/dk_gtui_float.png',
          pageBuilder: (_) => GTUIPopoverDemoPage(),
        ),
      ],
    );
  }

  /// 反馈类 (DkFeedback)
  /// Android: ActionSheet, PopupDialog, Toast, Popup
  static GTUIComponentCategory _getFeedbackCategory() {
    return GTUIComponentCategory(
      title: '反馈类',
      items: [
        GTUIComponentItem(
          name: '动作面板 ActionSheet',
          iconAsset: 'assets/icons/dk_gtui_action_sheet.png',
          pageBuilder: (_) => GTUIActionsheetDemoPage(),
        ),
        GTUIComponentItem(
          name: '弹窗 Dialog',
          iconAsset: 'assets/icons/dk_gtui_dialog.png',
          pageBuilder: (_) => GTUIDialogDemoPage(),
        ),
        GTUIComponentItem(
          name: '轻提示 Toast',
          iconAsset: 'assets/icons/dk_gtui_toast.png',
          pageBuilder: (_) => GTUIToastDemoPage(),
        ),
        GTUIComponentItem(
          name: '弹出层 Popup',
          iconAsset: 'assets/icons/dk_gtui_popup.png',
          pageBuilder: (_) => GTUIPopupDemoPage(),
        ),
      ],
    );
  }

  /// 提示类 (DkPrompt)
  /// Android: Badge
  static GTUIComponentCategory _getPromptCategory() {
    return GTUIComponentCategory(
      title: '提示类',
      items: [
        GTUIComponentItem(
          name: '徽标 Badge',
          iconAsset: 'assets/icons/dk_gtui_badge.png',
          pageBuilder: (_) => GTUIBadgeDemoPage(),
        ),
      ],
    );
  }
}
