import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// PreferredSizeWidget DemoAppBar(String title) {
//   return AppBar(
//     title: Text(
//         title,
//         style: const TextStyle(fontWeight: FontWeight.w400)
//     ),
//     leading: BackButton(
//       color: Colors.red,        // 自定义颜色
//       onPressed: () {           // 可选：自定义返回逻辑
//         // todo 拿不到context
//         Navigator.of(context).pop();
//       },
//     ),
//     elevation: 0,
//     backgroundColor: Colors.white,
//     foregroundColor: const Color(0xFF222222),
//   );
// }


class DemoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const DemoAppBar(this.title, {Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w400)),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          // 自定义返回逻辑，例如弹出当前页面
          Navigator.of(context).pop();
        },
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      foregroundColor: const Color(0xFF222222),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

