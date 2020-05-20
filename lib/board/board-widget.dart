
import 'package:flutter/material.dart';
import '../common/color-consts.dart';
import 'board-painter.dart';

class BoardWidget extends StatelessWidget {
    // 棋盘内边界 + 棋盘上的路数指定文字高度
  static const Padding = 5.0, DigitsHeight = 36.0;

  // 棋盘的宽高
  final double width, height;

  BoardWidget({@required this.width}) :
    height = (width - Padding * 2) / 9 * 10 + (Padding + DigitsHeight) * 2;

  Widget build(BuildContext context) {
    //
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: ColorConsts.BoardBackground,
      ),
      child: CustomPaint(
        painter: BoardPainter(width: width),
      ),
    );
  }
}