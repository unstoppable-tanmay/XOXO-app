import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key, required this.mode});

  final bool mode;

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  List<String>? players = [];
  SharedPreferences? prefs;

  void getPlayers() async {
    try {
      prefs = await SharedPreferences.getInstance();
      players = prefs!.getStringList('players');
    } catch (e) {
      Navigator.pop(context);
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getPlayers();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            widget.mode ? "Enter Name" : "Select Players",
            style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: !widget.mode
            ? Column(
                children: [
                  MaterialButton(
                    onPressed: () async {
                      players!.add("New Member");
                      print(players);
                      prefs!.setStringList('players', players!);
                      setState(() {});
                    },
                    minWidth: width * .8,
                    height: 45,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    color: const Color.fromARGB(255, 69, 69, 69),
                    child: const Icon(CupertinoIcons.add, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Or Select Players",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: Color.fromARGB(255, 195, 195, 195))),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: players == null ? 0 : players!.length,
                      itemBuilder: (context, index) {
                        var name = players![index];
                        return Container(
                          margin: EdgeInsets.only(
                              bottom: 10, left: width * .1, right: width * .1),
                          width: width * .75,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color.fromARGB(255, 69, 69, 69),
                          ),
                          child: Center(
                              child: Text(
                            name,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: width * .8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MaterialButton(
                          onPressed: () {},
                          minWidth: width * .37,
                          height: 45,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          color: const Color.fromARGB(255, 69, 69, 69),
                          child: const Text(
                            "New Two",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            players = [];
                            prefs!.setStringList('players', []);
                            print(players);
                            setState(() {});
                          },
                          minWidth: width * .37,
                          height: 45,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          color: Color.fromARGB(86, 236, 46, 46),
                          child: const Text(
                            "Remove All",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            : Container());
  }
}
