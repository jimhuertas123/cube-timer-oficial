import 'package:cube_timer_oficial/shared/platform_device/platform_device.dart';
import 'package:flutter/cupertino.dart';

import 'platform_specific/android_category_selection.dart';
import 'platform_specific/ios_category_selection.dart';

class CategorySelection extends StatelessWidget {
  final int selectedCategoryId;

  const CategorySelection({super.key, required this.selectedCategoryId});

  @override
  Widget build(BuildContext context) {
    if (isIOSDevice) {
      return IosCategorySelection(selectedCategoryId: selectedCategoryId);
    } else if (isAndroidDevice) {
      return AndroidCategorySelection(selectedCategoryId: selectedCategoryId);
    } else {
      return AndroidCategorySelection(selectedCategoryId: selectedCategoryId);
    }
  }
}
