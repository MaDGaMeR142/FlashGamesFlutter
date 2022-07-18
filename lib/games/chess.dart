import 'package:flashgames/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'dart:ui';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ChessBoardController controller = ChessBoardController();
  var b = 0 / 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("chess"),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.black87),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: ChessBoard(
                    onMove: gamestate,
                    controller: controller,
                    boardColor: BoardColor.green,
                    boardOrientation: PlayerColor.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        controller.resetBoard();
                      },
                      child: Text("Resest"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.undoMove();
                        var ab = controller.getPossibleMoves();
                        //  print();
                      },
                      child: Text("Undo"),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void gamestate() {
    if (controller.isGameOver()) {
      if (controller.isCheckMate())
        snackBar("Checkmate", "", ContentType.help, context);
      else if (controller.isDraw())
        snackBar("Draw", "", ContentType.help, context);
    } else if (controller.isInCheck()) {
      snackBar("Check", "", ContentType.warning, context);
    }
    

    print(controller.getPossibleMoves()[1].piece);
  }
}
