import 'dart:math';

import 'package:randomist/image/doutula_pic.dart';

class RandPic{

  static final List randomPicGenList = [
    DouTuLaPicRand()
  ];

  //pick a gen
  static String getRandomPic(){
     int len = randomPicGenList.length;
     Random random = Random.secure();
     int genIndex = random.nextInt(len);
     return randomPicGenList[genIndex].getRandomPicUrl();
  }
}