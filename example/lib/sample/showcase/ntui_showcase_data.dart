import 'badge/ntui_badge_demo_page.dart';
import 'button/ntui_button_demo_page.dart';
import 'ntui_component_showcase_page.dart';
import 'gtui_text_demo_page.dart';
import 'gtui_shadow_demo_page.dart';
import 'gtui_radius_demo_page.dart';
import 'gtui_color_demo_page.dart';
import 'gtui_toast_demo_page.dart';
import 'gtui_dialog_demo_page.dart';
import 'gtui_tag_demo_page.dart';
import 'gtui_grid_demo_page.dart';
import 'gtui_divider_demo_page.dart';
import 'gtui_nav_demo_page.dart';
import 'gtui_selector_demo_page.dart';
import 'gtui_cascader_demo_page.dart';
import 'gtui_picker_demo_page.dart';
import 'gtui_popup_demo_page.dart';
import 'gtui_popover_demo_page.dart';
import 'gtui_edittext_demo_page.dart';
import 'gtui_searchbar_demo_page.dart';
import 'gtui_actionsheet_demo_page.dart';
import 'gtui_dropdown_demo_page.dart';
import 'gtui_tabs_demo_page.dart';

/// GTUI 组件展示数据配置
///
/// 按照 Android DkGTUIComponentTypeEnum 的 7 大分类组织，
/// 每个分类对应 DkComponentEnum 中的组件条目。
class NTUIShowcaseData {
  static List<NTUIComponentCategory> getAllCategories() {
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
  static NTUIComponentCategory _getCustomCategory() {
    return NTUIComponentCategory(
      title: '通用类',
      items: [
        NTUIComponentItem(
          name: '按钮 Button',
          iconAsset: 'assets/icons/dk_gtui_button.png',
          pageBuilder: (_) => NTUIButtonDemoPage(),
        ),
      ],
    );
  }

  /// 布局类 (DKLayout)
  /// Android: Divider, Grid
  static NTUIComponentCategory _getLayoutCategory() {
    return NTUIComponentCategory(
      title: '布局类',
      items: [
        NTUIComponentItem(
          name: '分割线 Divider',
          iconAsset: 'assets/icons/dk_gtui_divider.png',
          pageBuilder: (_) => GTUIDividerDemoPage(),
        ),
        NTUIComponentItem(
          name: '宫格 Grid',
          iconAsset: 'assets/icons/dk_gtui_gird.png',
          pageBuilder: (_) => GTUIGridDemoPage(),
        ),
      ],
    );
  }

  /// 导航类 (DKNav)
  /// Android: DropDownMenu, NavBar, Tabs
  static NTUIComponentCategory _getNavCategory() {
    return NTUIComponentCategory(
      title: '导航类',
      items: [
        NTUIComponentItem(
          name: '下拉筛选 Dropdown',
          iconAsset: 'assets/icons/dk_gtui_dropdown.png',
          pageBuilder: (_) => GTUIDropdownDemoPage(),
        ),
        NTUIComponentItem(
          name: '导航栏 NavBar',
          iconAsset: 'assets/icons/dk_gtui_nav.png',
          pageBuilder: (_) => GTUINavDemoPage(),
        ),
        NTUIComponentItem(
          name: '选项卡 Tabs',
          iconAsset: 'assets/icons/dk_gtui_tabs.png',
          pageBuilder: (_) => GTUITabsDemoPage(),
        ),
      ],
    );
  }

  /// 数据录入类 (DKData)
  /// Android: PickerDialog, Cascader, TextArea, SearchBar, Selector
  static NTUIComponentCategory _getDataCategory() {
    return NTUIComponentCategory(
      title: '数据录入类',
      items: [
        NTUIComponentItem(
          name: '选择器 Picker',
          iconAsset: 'assets/icons/dk_gtui_picker.png',
          pageBuilder: (_) => GTUIPickerDemoPage(),
        ),
        NTUIComponentItem(
          name: '级联选择 Cascader',
          iconAsset: 'assets/icons/dk_gtui_area.png',
          pageBuilder: (_) => GTUICascaderDemoPage(),
        ),
        NTUIComponentItem(
          name: '文本域 TextArea',
          iconAsset: 'assets/icons/dk_gtui_input.png',
          pageBuilder: (_) => GTUIEdittextDemoPage(),
        ),
        NTUIComponentItem(
          name: '搜索栏 SearchBar',
          iconAsset: 'assets/icons/dk_gtui_search.png',
          pageBuilder: (_) => GTUISearchbarDemoPage(),
        ),
        NTUIComponentItem(
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
  static NTUIComponentCategory _getInformationCategory() {
    return NTUIComponentCategory(
      title: '信息展示类',
      items: [
        NTUIComponentItem(
          name: '文字 Text',
          iconAsset: 'assets/icons/dk_gtui_text_view.png',
          pageBuilder: (_) => GTUITextDemoPage(),
        ),
        NTUIComponentItem(
          name: '阴影 Shadow',
          iconAsset: 'assets/icons/dk_gtui_shadow.png',
          pageBuilder: (_) => GTUIShadowDemoPage(),
        ),
        NTUIComponentItem(
          name: '圆角 Radius',
          iconAsset: 'assets/icons/dk_gtui_radius.png',
          pageBuilder: (_) => GTUIRadiusDemoPage(),
        ),
        NTUIComponentItem(
          name: '色彩 Color',
          iconAsset: 'assets/icons/dk_gtui_color.png',
          pageBuilder: (_) => GTUIColorDemoPage(),
        ),
        NTUIComponentItem(
          name: '标签 Tag',
          iconAsset: 'assets/icons/dk_gtui_tag.png',
          pageBuilder: (_) => GTUITagDemoPage(),
        ),
        NTUIComponentItem(
          name: '浮层 Popover',
          iconAsset: 'assets/icons/dk_gtui_float.png',
          pageBuilder: (_) => GTUIPopoverDemoPage(),
        ),
      ],
    );
  }

  /// 反馈类 (DkFeedback)
  /// Android: ActionSheet, PopupDialog, Toast, Popup
  static NTUIComponentCategory _getFeedbackCategory() {
    return NTUIComponentCategory(
      title: '反馈类',
      items: [
        NTUIComponentItem(
          name: '动作面板 ActionSheet',
          iconAsset: 'assets/icons/dk_gtui_action_sheet.png',
          pageBuilder: (_) => GTUIActionsheetDemoPage(),
        ),
        NTUIComponentItem(
          name: '弹窗 Dialog',
          iconAsset: 'assets/icons/dk_gtui_dialog.png',
          pageBuilder: (_) => GTUIDialogDemoPage(),
        ),
        NTUIComponentItem(
          name: '轻提示 Toast',
          iconAsset: 'assets/icons/dk_gtui_toast.png',
          pageBuilder: (_) => GTUIToastDemoPage(),
        ),
        NTUIComponentItem(
          name: '弹出层 Popup',
          iconAsset: 'assets/icons/dk_gtui_popup.png',
          pageBuilder: (_) => GTUIPopupDemoPage(),
        ),
      ],
    );
  }

  /// 提示类 (DkPrompt)
  /// Android: Badge
  static NTUIComponentCategory _getPromptCategory() {
    return NTUIComponentCategory(
      title: '提示类',
      items: [
        NTUIComponentItem(
          name: '徽标 Badge',
          iconAsset: 'assets/icons/dk_gtui_badge.png',
          pageBuilder: (_) => NTUIBadgeDemoPage(),
        ),
      ],
    );
  }
}
