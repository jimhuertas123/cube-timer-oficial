import 'package:cube_timer_oficial/features/timer/data/database.dart';
import 'package:cube_timer_oficial/shared/providers/providers.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart' hide Column;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter_svg/svg.dart';

class IosCategorySelection extends ConsumerWidget {
  final int? selectedCategoryId;
  const IosCategorySelection({super.key, required this.selectedCategoryId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoriesByCubeTypeProvider);
    return Center(
      child: Container(
        width: 400,
        margin: const EdgeInsets.symmetric(horizontal: 42, vertical: 64),
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: CupertinoColors.systemBackground,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.black.withAlpha(80),
              blurRadius: 16,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(left: 24, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Select a category",
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: CupertinoColors.black,
                    ),
                  ),
                  // const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () => showCustomModal(
                      context,
                      'Create new category',
                      const IOSCategoryForm(),
                    ),
                    child: Container(
                      width: 95,
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: CupertinoColors.activeBlue,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/icons/ic_add_category_ios.svg',
                            width: 22,
                            height: 22,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "New",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Quicksand',
                              color: const Color.fromRGBO(0, 122, 255, 1),
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
            SizedBox(height: 10),
            Divider(height: 0, color: CupertinoColors.lightBackgroundGray),
            ...categories.map(
              (category) => IosCategoryButton(
                selectedCategoryId: selectedCategoryId ?? 0,
                category: category,
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
                  Navigator.of(context).pop();
                  showCustomModal(
                    context,
                    'Edit category',
                    IOSCategoryForm(categoryDefaults: category),
                  );
                },
                onDeletePressed: () {
                  Navigator.of(context).pop();
                  showCupertinoDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                      title: Text('Delete category'),
                      content: Text(
                        'Are you sure you want to delete the category "${category.name}"? This action cannot be undone.',
                      ),
                      actions: [
                        CupertinoDialogAction(
                          isDefaultAction: true,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel'),
                        ),
                        CupertinoDialogAction(
                          isDestructiveAction: true,
                          onPressed: () {
                            ref.read(deleteCategoryProvider)(category.id);
                            Navigator.of(context).pop();
                          },
                          child: Text('Delete'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Divider(height: 6, color: CupertinoColors.lightBackgroundGray),
            SizedBox(height: 10),
            Center(
              child: Text(
                'Long-press an entry to edit',
                style: TextStyle(fontSize: 12, color: CupertinoColors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showCustomModal(BuildContext context, String title, Widget content) {
  showCupertinoModalBottomSheet(
    context: context,
    isDismissible: true,
    expand: false,
    bounce: true,
    animationCurve: Curves.easeInOut,
    builder: (context) {
      return CupertinoPageScaffold(
        backgroundColor: CupertinoColors.extraLightBackgroundGray,
        navigationBar: CupertinoNavigationBar(
          padding: EdgeInsetsDirectional.only(top: 10, start: 20, end: 20),
          middle: Text(title, style: TextStyle(color: CupertinoColors.black)),
          leading: const SizedBox.shrink(),
          trailing: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              CupertinoIcons.clear_circled_solid,
              color: CupertinoColors.activeBlue,
              size: 25,
            ),
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            controller: ModalScrollController.of(context),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: content,
            ),
          ),
        ),
      );
    },
  );
}

class IOSCategoryForm extends ConsumerStatefulWidget {
  final Category? categoryDefaults;

  const IOSCategoryForm({super.key, this.categoryDefaults});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _IOSCategoryFormState();
}

class _IOSCategoryFormState extends ConsumerState<IOSCategoryForm> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.centerRight,
          children: [
            CupertinoTextField(
              controller: _textController,
              placeholder: 'Enter category name',
              placeholderStyle: TextStyle(
                color: CupertinoColors.inactiveGray,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              maxLength: 32,
              maxLines: 1,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: CupertinoColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              style: const TextStyle(
                color: CupertinoColors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (_textController.text.isNotEmpty)
              Positioned(
                right: 10,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _textController.clear();
                    });
                  },
                  child: const Icon(
                    CupertinoIcons.clear_circled,
                    color: CupertinoColors.systemGrey,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(width: 12),
            Expanded(
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: _actualLength / 32),
                duration: const Duration(milliseconds: 300),
                builder: (context, value, child) {
                  return LinearProgressIndicator(
                    value: value,
                    backgroundColor: CupertinoColors.systemGrey4,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      _actualLength != 32
                          ? CupertinoColors.activeBlue
                          : CupertinoColors.systemRed,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            Text(
              '$_actualLength/32',
              style: TextStyle(
                color: _actualLength != 32
                    ? CupertinoColors.activeBlue
                    : CupertinoColors.systemRed,
                decoration: TextDecoration.none,
                fontFamily: 'Arial',
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Center(
          child: CupertinoButton(
            alignment: Alignment.center,
            color: CupertinoColors.activeBlue,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            onPressed: () async {
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
            child: Text(
              widget.categoryDefaults == null ? 'Create' : 'Update',
              style: TextStyle(
                color: CupertinoColors.white,
                fontSize: 18,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class IosCategoryButton extends StatelessWidget {
  final int selectedCategoryId;
  final Category category;
  final VoidCallback onPressed;
  final VoidCallback onEditPressed;
  final VoidCallback onDeletePressed;

  const IosCategoryButton({
    super.key,
    required this.onPressed,
    required this.category,
    required this.selectedCategoryId,
    required this.onEditPressed,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoContextMenu(
      actions: [
        CupertinoContextMenuAction(
          trailingIcon: CupertinoIcons.pencil,
          onPressed: onEditPressed,
          child: const Text('Edit'),
        ),
        CupertinoContextMenuAction(
          isDestructiveAction: true,
          trailingIcon: CupertinoIcons.delete,
          onPressed: onDeletePressed,
          child: const Text('Delete'),
        ),
      ],
      child: CupertinoButton(
        borderRadius: BorderRadius.circular(10),
        color: CupertinoColors.white,
        sizeStyle: CupertinoButtonSize.medium,
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: Container(
          width: 355,
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
          child: Row(
            children: <Widget>[
              Icon(
                CupertinoIcons.tag,
                size: 20,
                color: CupertinoColors.darkBackgroundGray,
              ),
              SizedBox(width: 30),
              Expanded(
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  category.name.isNotEmpty
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
            ],
          ),
        ),
      ),
    );
  }
}
