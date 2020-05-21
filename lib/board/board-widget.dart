
import 'package:flutter/material.dart';
import '../common/color-consts.dart';
import 'board-painter.dart';
import '../cchess/phase.dart';
import 'pieces-painter.dart';
import 'words-on-board.dart';

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
      // 棋盘的背景木纹颜色是通过给 Container 指定背景色和圆角实现的
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: ColorConsts.BoardBackground,
      ),
      child: CustomPaint(
        // 背景一层绘制横盘上的线格
        painter: BoardPainter(width: width),
        // 前景一层绘制棋子
        foregroundPainter: PiecesPainter(
          width: width,
          phase: Phase.defaultPhase(),
        ),
        // CustomPaint 的 child 用于布置其上的子组件，这里放置是我们的「河界」、「路数」等文字信息
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: Padding,
            horizontal: (width - Padding * 2) / 9 / 2 + 
              Padding - WordsOnBoard.DigitsFontSize / 2,
          ),
          child: WordsOnBoard(),
        ),
      ),
    );
  }
}