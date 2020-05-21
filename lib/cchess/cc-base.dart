class Side {
  //
  static const Unknown = '-';
  static const Red = 'w';    // 中国象棋的一些理论基础来自于国际象棋
  /// 'w'是国际象棋中的 white 侧，在中国象棋中没有白方，指代红方
  static const Black = 'b'; // 表示黑方

  static String of(String piece) {
    // 中国象棋用大写字母代表红方的棋子，用小定字母代码黑方的框
    // RNBAKCP 依次代码的棋子为：车马象仕将炮兵
    if ('RNBAKCP'.contains(piece)) return Red;
    if ('rnbakcp'.contains(piece)) return Black;
    return Unknown;
  }

  static bool sameSide(String p1, String p2) {
    return of(p1) == of(p2);
  }

  // 红黑双方交换
  static String oppo(String side) {
    if (side == Red) return Black;
    if (side == Black) return Red;
    return side;
  }
}

class Piece {
  //
  static const Empty = ' ';
  //
  static const RedRook = 'R';
  static const RedKnight = 'N';
  static const RedBishop = 'B';
  static const RedAdvisor = 'A';
  static const RedKing = 'K';
  static const RedCanon = 'C';
  static const RedPawn = 'P';
  //
  static const BlackRook = 'r';
  static const BlackKnight = 'n';
  static const BlackBishop = 'b';
  static const BlackAdvisor = 'a';
  static const BlackKing = 'k';
  static const BlackCanon = 'c';
  static const BlackPawn = 'p';

  static const Names = {
    Empty: '',
    //
    RedRook: '车',
    RedKnight: '马',
    RedBishop: '相',
    RedAdvisor: '仕',
    RedKing: '帅',
    RedCanon: '炮',
    RedPawn: '兵',
    //
    BlackRook: '车',
    BlackKnight: '马',
    BlackBishop: '象',
    BlackAdvisor: '士',
    BlackKing: '将',
    BlackCanon: '炮',
    BlackPawn: '卒',
  };

  static bool isRed(String c) => 'RNBAKCP'.contains(c);

  static bool isBlack(String c) => 'rnbakcp'.contains(c);
}