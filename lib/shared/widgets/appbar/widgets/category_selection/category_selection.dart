import 'dart:io';
import 'package:flutter/cupertino.dart';

import 'platform_specific/android_category_selection.dart';
import 'platform_specific/ios_category_selection.dart';

class CategorySelection extends StatelessWidget {
  final int selectedCategoryId;

  const CategorySelection({super.key, required this.selectedCategoryId});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return IosCategorySelection(selectedCategoryId: selectedCategoryId);
    } else if (Platform.isAndroid) {
      return AndroidCategorySelection(selectedCategoryId: selectedCategoryId);
    } else {
      return AndroidCategorySelection(selectedCategoryId: selectedCategoryId);
    }
  }
}
