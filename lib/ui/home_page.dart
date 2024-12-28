import 'package:flut_to_do/constants.dart';
import 'package:flut_to_do/data/todo_item.dart';
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
        leading: Icon(Icons.menu),
        title: Text("FlutToDo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              AlertCard(),
              SizedBox(height: 24),
              ...([TodoItem(title: 'Develop presentation for GMRIT')].map((
                item,
              ) {
                return ToDoItemElement(item.title.toString(), onToggle: (_) {});
              })),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ToDoItemElement extends StatelessWidget {
  final String title;
  final bool isCompleted;
  final Function(bool) onToggle;
  const ToDoItemElement(
    this.title, {
    super.key,
    this.isCompleted = false,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(24),
                onTap: () {
                  onToggle(!isCompleted);
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.only(top: 6),
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                    border: isCompleted ? null : Border.all(),
                    shape: BoxShape.circle,
                    color: isCompleted ? navyBlueColor : null,
                  ),
                  child:
                      isCompleted
                          ? Icon(Icons.check, color: Colors.white, size: 16)
                          : null,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Develop presentation for GMRIT",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    Text("28th December 2024 • 6:00 AM"),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          TodoFilterChip('projectk'),
                          SizedBox(width: 8),
                          TodoFilterChip(
                            'Kavya Chandana',
                            type: TodoFilter.person,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}

enum TodoFilter { person, tag, location }

class TodoFilterChip extends StatelessWidget {
  final TodoFilter type;
  final String child;
  const TodoFilterChip(this.child, {super.key, this.type = TodoFilter.tag});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar:
          type == TodoFilter.tag
              ? null
              : type == TodoFilter.person
              ? Icon(Icons.account_circle_outlined, color: Colors.black)
              : Icon(Icons.location_on_outlined, color: Colors.black),
      avatarBoxConstraints: BoxConstraints.tightFor(width: 16, height: 24),
      label: Text(
        type == TodoFilter.tag ? "#$child" : child,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
      ),
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
      shape: RoundedRectangleBorder(
        side: BorderSide(),
        borderRadius: BorderRadius.circular(48),
      ),
    );
  }
}

class AlertCard extends StatelessWidget {
  const AlertCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 24, bottom: 8),
      decoration: BoxDecoration(
        color: Color(0x3080D9F4),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset('assets/images/dash-meet.png', width: 145),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.arrow_outward)),
                Text(
                  "Meeting".toUpperCase(),
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: navyBlueColor,
                  ),
                ),
                Text(
                  "Shramasa Client Connect",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: 8),
                Text(
                  "8:00 PM",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    height: 1,
                    color: navyBlueColor,
                  ),
                ),
                Text(
                  "9:00 PM",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: navyBlueColor.withValues(alpha: 0.7),
                  ),
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ],
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
