import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../main.dart';

class Mid extends StatefulWidget {
  const Mid({super.key});

  @override
  State<Mid> createState() => _MidState();
}

class _MidState extends State<Mid> {
  @override
  void initState() {
    Timer.periodic(const Duration(milliseconds: 400), (timer) {
      setState(() {
        var c = Random();
        x = b.nextDouble();
        y = b.nextDouble();
        //  w = c.nextInt(50).toDouble() > 30 ? c.nextInt(50).toDouble() : 30.0;
        // h = c.nextInt(50).toDouble() > 30 ? c.nextInt(50).toDouble() : 30.0;
        z = Color.fromRGBO(c.nextInt(256), c.nextInt(256), c.nextInt(256), 1);
        // br = BorderRadius.circular(c.nextInt(100).toDouble());
      });
    });
    super.initState();
  }

  bool vis = false;
  var w = 50.0;
  var h = 50.0;
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
                    Builder(builder: (cz) {
                      return IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(cz,
                                MaterialPageRoute(builder: (_) {
                              return const Anumation1();
                            }));
                            cub.restart();
                          },
                          icon: const Icon(Icons.play_arrow));
                    })
                  ],
                  title: Text(
                    "Level 2 Catch me ${cub.i + 50}",
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
                            cub.plus(context, 2);
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
