import 'package:cube_timer_oficial/features/timer/data/database.dart';

String labelCubeType(CubeType cubeType) {
  switch (cubeType.type) {
    case 'threeByThree':
      return '3x3';
    case 'twoByTwo':
      return '2x2';
    case 'fourByFour':
      return '4x4';
    case 'fiveByFive':
      return '5x5';
    case 'sixBySix':
      return '6x6';
    case 'sevenBySeven':
      return '7x7';
    case 'pyraminx':
      return 'Pyraminx';
    case 'megaminx':
      return 'Megaminx';
    case 'skewb':
      return 'Skewb';
    case 'clock':
      return 'Clock';
    default:
      return cubeType.type;
  }
}