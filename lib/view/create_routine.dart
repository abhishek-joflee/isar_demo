import 'package:flutter/material.dart';

enum Days {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

class CreateRoutinePage extends StatefulWidget {
  const CreateRoutinePage({super.key});

  @override
  State<CreateRoutinePage> createState() => _CreateRoutinePageState();
}

class _CreateRoutinePageState extends State<CreateRoutinePage> {
  List<String> categories = ['work', 'school', 'home'];

  String selectedCategory = 'work';
  Days selectedDay = Days.monday;

  final titleController = TextEditingController();
  final timeController = TextEditingController(
    text: TimeOfDay.now().toString(),
  );
  final newCatController = TextEditingController();

  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Routine'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Category'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: DropdownButton<String>(
                      items: categories
                          .map(
                            (e) => DropdownMenuItem<String>(
                              value: e,
                              child: Text(e),
                            ),
                          )
                          .toList(),
                      value: selectedCategory,
                      isExpanded: true,
                      onChanged: (newCat) => (newCat != null)
                          ? setState(() => selectedCategory = newCat)
                          : null,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      final newCat = await showDialog<String>(
                        context: context,
                        builder: (dialogContext) => AlertDialog(
                          title: const Text('Create Category'),
                          content: TextFormField(
                            controller: newCatController,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(
                                dialogContext,
                                newCatController.text,
                              ),
                              child: const Text('Create'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(dialogContext),
                              child: const Text('Cancel'),
                            ),
                          ],
                        ),
                      );
                      if (newCat != null) {
                        setState(() {
                          categories.add(newCat);
                        });
                      }
                    },
                    icon: const Icon(
                      Icons.add,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Title'),
              TextFormField(
                controller: titleController,
              ),
              const SizedBox(height: 20),
              const Text('Start Time'),
              TextFormField(
                controller: timeController,
                readOnly: true,
                onTap: () async {
                  final newTime = await showTimePicker(
                    context: context,
                    initialTime: selectedTime,
                  );
                  if (newTime != null) {
                    setState(() {
                      selectedTime = newTime;
                      timeController.text = selectedTime.toString();
                    });
                  }
                },
              ),
              const SizedBox(height: 20),
              const Text('Day'),
              DropdownButton<Days>(
                items: Days.values
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.name),
                      ),
                    )
                    .toList(),
                value: selectedDay,
                isExpanded: true,
                onChanged: (newDay) => (newDay != null)
                    ? setState(() => selectedDay = newDay)
                    : null,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
