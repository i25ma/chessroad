import 'package:flutter/material.dart';
import '../cchess/cc-base.dart';
import '../common/color-consts.dart';
import '../board/painter-base.dart';
import '../cchess/phase.dart';
import 'board-widget.dart';

class PiecePaintStub {
  final String piece;
  final Offset pos; // 棋子呈现位置
  PiecePaintStub({this.piece, this.pos});
}

class PiecesPainter extends PainterBase  {
  // 棋盘的宽度， 横盘上线格的总宽度，每一个格子的边长
  final Phase phase;
  double pieceSide;

  PiecesPainter({@required double width, @required this.phase}) :
        super(width: width) {
        //
        pieceSide = squareSide * 0.9;
  }
  
  @override
  void paint(Canvas canvas, Size size) {
    //
    doPaint(
     canvas,
     thePaint,
     phase: phase,
     gridWidth: gridWidth,
     squareSide: squareSide,
     pieceSide: pieceSide,
     offsetX: BoardWidget.Padding + squareSide / 2,
     offsetY: BoardWidget.Padding + BoardWidget.DigitsHeight + squareSide / 2,
  );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    //
    return false;
  }

    static doPaint(
    Canvas canvas,
    Paint paint, {
    Phase phase,
    double gridWidth,
    double squareSide,
    double pieceSide,
    double offsetX,
    double offsetY,
  }) {
    //.
    final left = offsetX, top = offsetY;

    final shadowPath = Path();
    final piecesToDraw = <PiecePaintStub>[];

    for (var row = 0; row < 10; row++) {
      //
      for (var column = 0; column < 9; column++) {
        //
        final piece = phase.pieceAt(row * 9 + column);
        if (piece == Piece.Empty) continue;

        var pos = Offset(left + squareSide * column, top + squareSide * row);

        piecesToDraw.add(PiecePaintStub(piece: piece, pos: pos));

        shadowPath.addOval(
          Rect.fromCenter(center: pos, width: pieceSide, height: pieceSide),
        );
      }
    }

    canvas.drawShadow(shadowPath, Colors.black, 2, true);

    paint.style = PaintingStyle.fill;

    final textStyle = TextStyle(
      color: ColorConsts.PieceTextColor,
      fontSize: pieceSide * 0.8,
      fontFamily: 'QiTi',
      height: 1.0,
    );

    piecesToDraw.forEach((pps) {
      //
      paint.color = Piece.isRed(pps.piece) ? ColorConsts.RedPieceBorderColor : ColorConsts.BlackPieceBorderColor;

      canvas.drawCircle(pps.pos, pieceSide / 2, paint);

      paint.color = Piece.isRed(pps.piece) ? ColorConsts.RedPieceColor : ColorConsts.BlackPieceColor;

      canvas.drawCircle(pps.pos, pieceSide * 0.8 / 2, paint);

      final textSpan = TextSpan(text: Piece.Names[pps.piece], style: textStyle);
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      )..layout();

      // final metric = textPainter.computeLineMetrics()[0];
      final textSize = textPainter.size;

      // // 从顶上算，文字的 Baseline 在 2/3 高度线上
      final textOffset = pps.pos - Offset(textSize.width / 2, 2 - textSize.height / 3);

      textPainter.paint(canvas, textOffset);
    });
  }
}