import 'package:cube_timer_oficial/shared/providers/categories.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoryListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('ToDo App')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(labelText: 'Enter task'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () async {
                    // final text = _controller.text.trim();
                    // if (text.isNotEmpty) {
                    //   await ref.read(addTodoProvider)(text);
                    //   _controller.clear();
                    //   ref.invalidate(todoListProvider);
                    // }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: categories.when(
              data: (categoryItem) => ListView.builder(
                itemCount: categoryItem.length,
                itemBuilder: (context, index) {
                  final category = categoryItem[index];
                  return ListTile(
                    title: Text(category.name),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () async {
                        // await ref.read(deleteTodoProvider)(todo.id);
                        // ref.invalidate(todoListProvider);
                      },
                    ),
                  );
                },
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
            ),
          ),
        ],
      ),
    );
  }
}
