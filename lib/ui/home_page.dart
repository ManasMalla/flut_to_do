import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,

        title: Text("FlutToDo"),
      ),
      body: Center(child: NoTodoWidget()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class NoTodoWidget extends StatelessWidget {
  const NoTodoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 225,
          child: Stack(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
            children: [
              ClipOval(
                child: Container(
                  height: 50,
                  width: 180,
                  decoration: BoxDecoration(
                    color: Color(0x50D9D9D9),
                    backgroundBlendMode: BlendMode.multiply,
                  ),
                ),
              ),
              Positioned(
                bottom: 25,
                left: 0,
                child: Image.asset(
                  'assets/images/dash-search.png',
                  height: 200,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 24),
        Text('No TODOs added', style: Theme.of(context).textTheme.titleLarge),
        SizedBox(height: 12),
        SizedBox(
          width: 360,
          child: const Text(
            'Add a TODO by clicking on the floating action button with the plus at the bottom right.',
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
