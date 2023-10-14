import 'dart:async';

import 'package:catch_me/cubit/cubit.dart';
import 'package:catch_me/cubit/states.dart';
import 'package:catch_me/score.dart';

import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/container.dart';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

main() {
  runApp(const Anumation1());
}

class Anumation1 extends StatefulWidget {
  const Anumation1({super.key});

  @override
  State<Anumation1> createState() => _Anumation1State();
}

class _Anumation1State extends State<Anumation1> {
  @override
  void initState() {
    Timer.periodic(const Duration(milliseconds: 700), (timer) {
      setState(() {
        var c = Random();
        x = b.nextDouble();
        y = b.nextDouble();
        //w = c.nextInt(50).toDouble() > 30.0 ? c.nextInt(50).toDouble() : 30.0;
        //h = c.nextInt(50).toDouble() > 30.0 ? c.nextInt(50).toDouble() : 30.0;
        z = Color.fromRGBO(c.nextInt(256), c.nextInt(256), c.nextInt(256), 1);
        // br = BorderRadius.circular(c.nextInt(100).toDouble());
      });
    });
    super.initState();
  }

  bool vis = false;
  var w = 30.0;
  var h = 30.0;
  var b = Random();
  var x = 0.5;
  var y = 0.5;
  BorderRadiusGeometry br = BorderRadius.circular(8);
  Color z = Colors.black;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => Cacthcubit(),
        child: BlocConsumer<Cacthcubit, Catchstates>(
            listener: (context, state) {},
            builder: (context, state) {
              var cub = Cacthcubit.get(context);
              return Scaffold(
                appBar: AppBar(
                  actions: [
                    Builder(
                      builder: (cz) => IconButton(
                          onPressed: () {
                            Navigator.push(cz, MaterialPageRoute(builder: (_) {
                              return Score(score: cub.i);
                            }));
                            cub.restart();
                          },
                          icon: const Icon(
                            Icons.play_arrow,
                            color: Colors.black,
                          )),
                    )
                  ],
                  title: Text(
                    "Level 1 Catch me ${cub.i}",
                    style: const TextStyle(color: Colors.black),
                  ),
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  elevation: 0,
                ),
                body: Center(
                  child: AnimatedAlign(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.bounceInOut,
                      alignment: FractionalOffset(x, y),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.bounceInOut,
                        height: h,
                        width: w,
                        decoration: BoxDecoration(
                          color: z,
                          borderRadius: br,
                        ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(z)),
                          onPressed: () {
                            cub.plus(context, 1);
                          },
                          child: null,
                        ),
                      )),
                ),
              );
            }),
      ),
    );
  }
}
