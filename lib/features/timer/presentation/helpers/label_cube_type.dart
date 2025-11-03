String labelCubeType(String? cubeType) {
  switch (cubeType) {
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
    default:
      return '-';
  }
}
