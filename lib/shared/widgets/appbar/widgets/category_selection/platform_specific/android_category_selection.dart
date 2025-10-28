import 'package:cube_timer_oficial/features/timer/data/database.dart';
import 'package:cube_timer_oficial/shared/providers/categories.provider.dart';
import 'package:cube_timer_oficial/shared/widgets/custom_show_dialog/custom_show_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class AndroidCategorySelection extends ConsumerWidget {
  final int? selectedCategoryId;

  const AndroidCategorySelection({super.key, required this.selectedCategoryId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoriesByCubeTypeProvider);

    return CustomAlertDialog(
      enableHeight: false,
      insetPadding: EdgeInsets.symmetric(horizontal: 50),
      context: context,
      tittleContent: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Select a category",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            GestureDetector(
              onTap: () => showDialog(
                barrierColor: Colors.black.withValues(alpha: 0.5),
                context: context,
                builder: (context) => AndroidNewCategoryAlertDialog(),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF2962ff), width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      'assets/icons/ic_add_category.svg',
                      width: 22,
                      height: 22,
                    ),
                    SizedBox(width: 7),
                    Text(
                      "New",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF2962ff),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      content: <Widget>[
        // Divider(),
        // Consumer(
        //   builder: (context, ref, child) {
        //     final categoryState = ref.watch(cate);
        //     return categoryState.when(
        //       loading: () => const CircularProgressIndicator.adaptive(
        //         valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        //       ),
        //       error: (err, stack) => Center(
        //         child: Text(
        //           'Error loading categories',
        //           style: const TextStyle(color: Colors.red),
        //         ),
        //       ),
        //       data: (categories) {
        //         categories.sort((a, b) => a.name.compareTo(b.name));
        //         return CategorySelection(categories: categories);
        //       },
        //     );
        //   },
        // ),
        Divider(),
        Center(
          child: Text(
            'Long-press an entry to edit',
            style: TextStyle(fontSize: 12, color: Colors.black),
          ),
        ),
        SizedBox(height: 5),
      ],
    );
  }
}

class AndroidNewCategoryAlertDialog extends ConsumerStatefulWidget {
  const AndroidNewCategoryAlertDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AndroidNewCategoryAlertDialogState();
}

class _AndroidNewCategoryAlertDialogState
    extends ConsumerState<AndroidNewCategoryAlertDialog> {
  final TextEditingController _textController = TextEditingController();
  int _actualLength = 0;
  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      setState(() {
        _actualLength = _textController.text.length;
      });
      if (_textController.text.length > 32) {
        _textController.text = _textController.text.substring(0, 32);
        _textController.selection = TextSelection.fromPosition(
          TextPosition(offset: _textController.text.length),
        );
      }
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      enableHeight: false,
      tittleContent: Center(
        child: Container(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Text(
            "Enter category name",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      fontTittleSize: 24.0,
      context: context,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      contentPadding: const EdgeInsets.only(
        right: 0,
        left: 0,
        top: 0,
        bottom: 0,
      ),
      content: <Widget>[
        SingleChildScrollView(
          child: IntrinsicHeight(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _textController,
                    cursorColor: Colors.green,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: 'Enter category name',
                      border: InputBorder.none,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 2.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 2.0),
                      ),
                      labelStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: "Arial",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(width: 10),
            Text(
              _actualLength.toString(),
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontFamily: "Arial",
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '/32',
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontFamily: "Arial",
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 23),
          ],
        ),
      ],
      actions: [
        TextButton(
          onPressed: () async {
            // if (_textController.text.isEmpty) {
            //     return;
            // }
            // final CubeTypeModel currentCubeType =
            //     ref.read(cubeTypeProvider).actualCubeType;
            // final dbHelper = CategoryRepository();
            // final CategoryModel newCategory = CategoryModel(
            //   name: _textController.text,
            //   cubeTypeId: currentCubeType.id,
            //   shortestTime: null,
            //   mean: null,
            //   m_2: null,
            //   deviation: null,
            //   count: null,
            // );
            // await dbHelper.insertCategory(newCategory);

            // // ignore: unused_result
            // ref.refresh(categoryFutureProvider);
            //
            // if(mounted) {
            //   Navigator.of(context).pop();
            // }
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
              side: BorderSide.none,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'OK',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CategorySelection extends ConsumerWidget {
  final List<Category> categories;
  final int? selectedCategoryId;

  const CategorySelection({
    super.key,
    required this.categories,
    this.selectedCategoryId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: categories
          .map(
            (category) => ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                overlayColor: Colors.grey,
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                  side: BorderSide(color: Colors.red, width: 0.1),
                ),
              ),
              onPressed: () {},
              child: Row(
                children: <Widget>[
                  const SizedBox(width: 20),
                  Icon(Icons.label_outline, size: 22, color: Colors.black38),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      categories.isNotEmpty
                          ? category.name.length > 22
                                ? '${category.name.substring(0, 22)}...'
                                : category.name
                          : 'No categories available (This must be a error loading categories)',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  selectedCategoryId == category.id
                      ? Icon(
                          CupertinoIcons.check_mark,
                          color: CupertinoColors.activeBlue,
                        )
                      : const SizedBox.shrink(),
                  SizedBox(width: 15),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
