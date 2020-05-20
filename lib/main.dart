import 'package:flutter/material.dart';

import 'routes/battle-page.dart';

void main() => runApp(ChessRoadApp());

class ChessRoadApp extends StatelessWidget {
  //
  @override
  Widget build(BuildContext context) {
    //
    return MaterialApp(
      /// 使用 Material brown 的主题色，默认情况下最接近我们的品牌色
      /// 一定要指定一个 App 的主题色是因为某些三方插件要显示某个界面时，
      /// 可能没有提供界面控制参数，又不好修改别人的插件代码
      theme: ThemeData(primarySwatch: Colors.brown),
      // 禁止显示 App 右上角的一个「Debug」字样的条幅
      debugShowCheckedModeBanner: false,
      home: BattlePage(),
    );
  }
}