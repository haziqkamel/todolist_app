import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  static const routeName = 'homepage';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController textController;
  final List<Map<String, dynamic>> _todoList = [
    {'check': false, 'label': 'My first to-do'}
  ];

  @override
  void initState() {
    textController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            )),
            context: context,
            builder: (context) => SizedBox(
              height: 300,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      controller: textController,
                      decoration: const InputDecoration(
                        labelText: 'What do you plan?',
                        focusedBorder: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(),
                        disabledBorder: OutlineInputBorder(),
                      ),
                    ),
                    TextButton(
                      onPressed: () => setState(() {
                        _todoList.add({
                          'check': false,
                          'label': textController.text,
                        });
                        textController.clear();
                        Navigator.pop(context);
                      }),
                      child: const Text(
                        'Add to list',
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: _todoList.isEmpty
          ? const Center(
              child: Text('List is empty! Add one'),
            )
          : ListView.builder(
              itemCount: _todoList.length,
              itemBuilder: (context, i) => ListTile(
                leading: Checkbox(
                  value: _todoList[i]['check'],
                  onChanged: (done) => setState(() {
                    _todoList[i]['check'] = done;
                  }),
                ),
                title: Text(_todoList[i]['label']),
              ),
            ),
    );
  }
}
