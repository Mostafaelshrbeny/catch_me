import 'package:catch_me/cubit/states.dart';
import 'package:catch_me/levels/hard.dart';
import 'package:catch_me/levels/mid.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class Cacthcubit extends Cubit<Catchstates> {
  Cacthcubit() : super(Initstate());
  static Cacthcubit get(context) => BlocProvider.of(context);

  var i = 0;
  var level = 1;

  plus(BuildContext con, int level) {
    i++;

    if (i == 50 && level == 1) {
      Navigator.pushReplacement(con, MaterialPageRoute(builder: (_) {
        return const Mid();
      }));
    } else if (i == 50 && level == 2) {
      Navigator.pushReplacement(con, MaterialPageRoute(builder: (_) {
        return const Hard();
      }));
    }
    emit(Plusstate());
  }

  restart() {
    i = 0;
    emit(Restartstate());
  }

  /*void startTimer() {
    Timer(const Duration(seconds: 5), () {
      f = const Duration(milliseconds: 5500);
      print("done");
      emit(Changestate());
    });
  }*/
}
