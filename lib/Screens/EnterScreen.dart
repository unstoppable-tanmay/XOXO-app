import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Screens/PlayScreen.dart';
import 'package:tic_tac_toe/Screens/PlayerScreen.dart';

class EnterScreen extends StatelessWidget {
  const EnterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    void withAi() {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const PlayerScreen(mode:true)),
      );
    }

    void withFreinds() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PlayerScreen(mode:false)),
      );
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "Tic-Tac-Toe",
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: width,
              height: height * .69,
              child: Stack(children: [
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset(
                    "./assest/giphy3.gif",
                    gaplessPlayback: true,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      // Colors.white,
                      // Colors.transparent,
                      Colors.transparent,
                      Colors.black
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.5, 1],
                  )),
                )
              ]),
            ),
            const Text(
              "Ultimate Grid Battle!",
              style: TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 28,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                width: width * .8,
                child: const Text(
                  "Tic Tac Toe is a classic game played on a 3x3 grid. Two players take turns marking X or O to form a line horizontally, vertically, or diagonally, aiming to win or force a draw.",
                  style: TextStyle(
                      color: Color.fromARGB(255, 193, 193, 193), fontSize: 16),
                  textAlign: TextAlign.center,
                )),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: width * .7,
                child: const Text(
                  "Lets Play with . . .",
                  style: TextStyle(color: Color.fromARGB(255, 193, 193, 193)),
                  textAlign: TextAlign.center,
                )),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: withAi,
                  color: Color.fromARGB(255, 150, 150, 150),
                  highlightElevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  child: const Text("AI",
                      style: TextStyle(color: Color(0xff000000), fontSize: 20)),
                ),
                const SizedBox(
                  width: 20,
                ),
                MaterialButton(
                  onPressed: withFreinds,
                  color: const Color.fromARGB(255, 150, 150, 150),
                  hoverElevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  child: const Text("Friends",
                      style: TextStyle(color: Color(0xff000000), fontSize: 20)),
                ),
              ]
            )
          ]),
    );
  }
}
