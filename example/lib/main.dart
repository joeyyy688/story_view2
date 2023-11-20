import 'package:flutter/material.dart';
import 'package:story_view2/controller/story_controller.dart';
import 'package:story_view2/widgets/story_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'story_view2 Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const MyHomePage(title: 'story_view2 Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final StoryController controller = StoryController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delicious Ghanaian Meals'),
      ),
      body: Container(
        margin: const EdgeInsets.all(
          8,
        ),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 300,
              child: StoryView(
                controller: controller,
                storyItems: [
                  StoryItem.text(
                    title:
                        'Hello world!\nHave a look at some great Ghanaian delicacies. I\'m sorry if your mouth waters. \n\nTap!',
                    backgroundColor: Colors.orange,
                    roundedTop: true,
                  ),
                  StoryItem.inlineImage(
                    const NetworkImage(
                        'https://image.ibb.co/gCZFbx/Banku-and-tilapia.jpg'),
                    url: 'https://image.ibb.co/gCZFbx/Banku-and-tilapia.jpg',
                    controller: controller,
                    caption: const Text(
                      'Banku & Tilapia. The food to keep you charged whole day.\n#1 Local food.',
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  StoryItem.inlineImage(
                    const NetworkImage(
                        'https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg'),
                    url:
                        'https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg',
                    controller: controller,
                    caption: const Text(
                      'Omotuo & Nkatekwan; You will love this meal if taken as supper.',
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  StoryItem.inlineImage(
                    const NetworkImage(
                        'https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif'),
                    url:
                        'https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif',
                    controller: controller,
                    caption: const Text(
                      'Hektas, sektas and skatad',
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                        fontSize: 17,
                      ),
                    ),
                  )
                ],
                onStoryShow: (s) {
                  print('Showing a story');
                },
                onComplete: () {
                  print('Completed a cycle');
                },
                progressPosition: ProgressPosition.bottom,
                repeat: false,
                inline: true,
              ),
            ),
            Material(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MoreStories()));
                },
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.black54,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(8))),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        'View more stories',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MoreStories extends StatefulWidget {
  const MoreStories({super.key});

  @override
  _MoreStoriesState createState() => _MoreStoriesState();
}

class _MoreStoriesState extends State<MoreStories> {
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('More'),
      ),
      body: StoryView(
        storyItems: [
          StoryItem.text(
            title: "I guess you'd love to see more of our food. That's great.",
            backgroundColor: Colors.blue,
          ),
          StoryItem.text(
            title: 'Nice!\n\nTap to continue.',
            backgroundColor: Colors.red,
            textStyle: const TextStyle(
              fontFamily: 'Dancing',
              fontSize: 40,
            ),
          ),
          StoryItem.pageImage(
            url:
                'https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg',
            caption: 'Still sampling',
            controller: storyController,
          ),
          StoryItem.pageImage(
              url: 'https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif',
              caption: 'Working with gifs',
              controller: storyController),
          StoryItem.pageImage(
            url: 'https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif',
            caption: 'Hello, from the other side',
            controller: storyController,
          ),
          StoryItem.pageImage(
            url: 'https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif',
            caption: 'Hello, from the other side2',
            controller: storyController,
          ),
        ],
        onStoryShow: (s) {
          print('Showing a story');
        },
        onComplete: () {
          print('Completed a cycle');
        },
        progressPosition: ProgressPosition.top,
        repeat: false,
        controller: storyController,
      ),
    );
  }
}
