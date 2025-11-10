import 'package:cube_timer_oficial/features/timer/data/database.dart';
import 'package:cube_timer_oficial/shared/providers/providers.dart';
import 'package:cube_timer_oficial/shared/widgets/show_dialogs/android/custom_show_dialog.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:flutter/cupertino.dart' hide Column;
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
      insetPadding: EdgeInsets.symmetric(horizontal: 37, vertical: 0),
      paddingTopDialog: 0,
      context: context,
      content: <Widget>[
        Container(
          height: 48,
          padding: const EdgeInsets.only(
            left: 23.0,
            right: 15,
            bottom: 0,
            top: 2,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "Select a category",
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 14,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => showDialog(
                  barrierColor: Colors.black.withValues(alpha: 0.5),
                  context: context,
                  builder: (context) => AndroidCategoryForm(),
                ),
                child: Container(
                  height: 38,
                  padding: EdgeInsets.only(left: 14, right: 15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF2962ff),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: <Widget>[
                      SvgPicture.asset(
                        'assets/icons/ic_add_category.svg',
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(width: 9),
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
        Divider(height: 0, color: CupertinoColors.lightBackgroundGray),

        ...categories.map(
          (category) => SizedBox(
            height: 40,
            child: CategorySelection(
              category: category,
              selectedCategoryId: selectedCategoryId ?? 0,
              onPressed: () {
                if (selectedCategoryId == category.id) {
                  return;
                }
                final cubeTypeId = category.cubeTypeId;
                ref
                    .read(selectedCategoryProvider(cubeTypeId).notifier)
                    .setSelected(category);
                Navigator.of(context).pop();
              },
              onEditPressed: () {
                showDialog(
                  barrierColor: Colors.black.withValues(alpha: 0.5),
                  context: context,
                  builder: (context) =>
                      AndroidCategoryForm(categoryDefaults: category),
                );
              },
              onDeletePressed: () {
                showDialog(
                  context: context,
                  builder: (context) => Consumer(
                    builder: (context, ref, child) {
                      return AlertDialog(
                        title: Text('Delete category'),
                        content: Text(
                          'Are you sure you want to delete the category "${category.name}"? This action cannot be undone.',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              ref.read(deleteCategoryProvider)(category.id);
                              final _ = ref.refresh(
                                categoriesByCubeTypeProvider,
                              );
                              Navigator.of(context).pop();
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors
                                  .red, // makes the text red for destructive
                            ),
                            child: Text('Delete'),
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),

        Divider(height: 8, color: CupertinoColors.lightBackgroundGray),
        Center(
          child: Text(
            'Long-press an entry to edit',
            style: TextStyle(
              fontSize: 11.5,
              fontFamily: 'Quicksand',
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 5),
      ],
    );
  }
}

class AndroidCategoryForm extends ConsumerStatefulWidget {
  final Category? categoryDefaults;

  const AndroidCategoryForm({super.key, this.categoryDefaults});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AndroidCategoryFormState();
}

class _AndroidCategoryFormState extends ConsumerState<AndroidCategoryForm> {
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

    final categoryName = widget.categoryDefaults?.name ?? '';
    if (categoryName.isNotEmpty) {
      _textController.text = categoryName;
      _actualLength = categoryName.length;
    }
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
      borderRadius: 15,
      tittleContent: Center(
        child: Container(
          padding: const EdgeInsets.only(top: 18, bottom: 1),
          child: Text(
            "Enter category name",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'Quicksand',
            ),
          ),
        ),
      ),
      context: context,
      insetPadding: const EdgeInsets.symmetric(horizontal: 30),
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
                  padding: EdgeInsets.only(
                    left: 25.0,
                    right: 25.0,
                    top: 10,
                    bottom: 10,
                  ),
                  child: TextField(
                    controller: _textController,
                    cursorColor: Colors.green,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontFamily: "Quicksand",
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: 'Enter category name',
                      hintStyle: TextStyle(
                        color: CupertinoColors.inactiveGray,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.only(top: 15, bottom: 3),
                      border: InputBorder.none,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 2.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 2.0),
                      ),
                      labelStyle: TextStyle(
                        fontSize: 15,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(width: 10),
            Text(
              _actualLength.toString(),
              style: TextStyle(
                color: Colors.red,
                fontSize: 12,
                fontFamily: "Arial",
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '/32',
              style: TextStyle(
                color: Colors.red,
                fontSize: 12,
                fontFamily: "Arial",
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 23),
          ],
        ),
        const SizedBox(height: 5),
      ],
      actions: [
        TextButton(
          onPressed: () {
            if (_textController.text.isEmpty) {
              return;
            }
            if (widget.categoryDefaults?.id != null &&
                widget.categoryDefaults!.id != 0) {
              ref.read(updateCategoryProvider)(
                widget.categoryDefaults?.id ?? 0,
                CategoriesCompanion(
                  name: Value(_textController.text),
                  cubeTypeId: Value(
                    ref.read(selectedCubeTypeProvider).value?.id ?? 0,
                  ),
                ),
              );
            } else {
              ref.read(addCategoryProvider)(
                CategoriesCompanion(
                  name: Value(_textController.text),
                  cubeTypeId: Value(
                    ref.read(selectedCubeTypeProvider).value?.id ?? 0,
                  ),
                ),
              );
            }
            final _ = ref.refresh(categoriesByCubeTypeProvider);
            Navigator.of(context).pop();
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
              side: BorderSide.none,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            child: Text(
              'OK',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 15,
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
  final Category category;
  final int selectedCategoryId;
  final VoidCallback onPressed;
  final VoidCallback onEditPressed;
  final VoidCallback onDeletePressed;

  const CategorySelection({
    super.key,
    required this.category,
    required this.selectedCategoryId,
    required this.onPressed,
    required this.onEditPressed,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        overlayColor: Colors.grey,
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          //   side: BorderSide(color: Colors.red, width: 0.1),
        ),
      ),
      onPressed: onPressed,
      onLongPress: () async {
        await _showPopupMenu(context, category).then((selected) {
          if (selected == 'rename') {
            onEditPressed();
          } else if (selected == 'remove') {
            onDeletePressed();
          }
        });
      },
      child: Row(
        children: <Widget>[
          const SizedBox(width: 25),
          Icon(Icons.label_outline_sharp, size: 22, color: Colors.black38),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              overflow: TextOverflow.ellipsis,
              category.name.isNotEmpty
                  ? category.name.length > 22
                        ? '${category.name.substring(0, 22)}...'
                        : category.name
                  : 'No categories available (This must be a error loading categories)',
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          selectedCategoryId == category.id
              ? Icon(Icons.check, color: Color(0xFF2962ff))
              : const SizedBox.shrink(),
          SizedBox(width: 15),
        ],
      ),
    );
  }

  Future<String?> _showPopupMenu(
    BuildContext context,
    Category category,
  ) async {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final Offset position = button.localToGlobal(Offset.zero);

    return await showMenu<String>(
      constraints: BoxConstraints(maxWidth: 195, minWidth: 195),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Color(0xFFBCBCBC), width: 1),
      ),
      color: Colors.white,
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy + 38,
        position.dx + button.size.width,
        position.dy + button.size.height,
      ),
      items: [
        PopupMenuItem(
          padding: EdgeInsets.only(left: 6),
          height: 35,
          value: 'rename',
          child: Row(
            children: [
              Icon(Icons.edit_outlined, color: Color(0xFF4D4D4D)),
              SizedBox(width: 8),
              Text(
                'Rename',
                style: TextStyle(
                  color: Color(0xFF212121),
                  fontSize: 14,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        PopupMenuItem(
          padding: EdgeInsets.only(left: 6, top: 19),
          height: 35,
          value: 'remove',
          child: Row(
            children: [
              Icon(Icons.delete_outline, color: Color(0xFF4D4D4D)),
              SizedBox(width: 8),
              Text(
                'Remove',
                style: TextStyle(
                  color: Color(0xFF212121),
                  fontSize: 14,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
