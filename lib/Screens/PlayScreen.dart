import 'package:flutter/material.dart';

class PlaySceen extends StatefulWidget {
  const PlaySceen(
      {super.key, this.mode = false, this.player1 = "Ai", this.player2});

  final bool mode;
  final String? player1;
  final String? player2;

  @override
  State<PlaySceen> createState() => _PlaySceenState();
}

class _PlaySceenState extends State<PlaySceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.player1 ?? ""),
          Text(widget.player2 ?? ""),
          Text(widget.mode.toString()),
        ],
      ),
    ));
  }
}
