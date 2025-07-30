import 'package:flutter/material.dart';
import 'package:image_loader_flutter/image_loader_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Image Loader Flutter'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            //load from internet
            ImageLoaderFlutterWidgets(
              radius: 10,
              onTap: true,
              height: 100,
              width: 150,
              circle: false,
              fit: BoxFit.contain,
              image:
                  "https://avatars.githubusercontent.com/u/84148157?s=64&v=4",
            ),
            SizedBox(
              height: 10,
            ),
            //load from internet
            ImageLoaderFlutterWidgets(
              radius: 10,
              height: 150,
              width: 150,
              onTap: true,
              circle: true,
              image: "http",
            ),
            UserProfileImage(
              userName: "demo",
              height: 100,
              width: 100,
              imageUrl: '',
            )
          ],
        ),
      ),
    );
  }
}
