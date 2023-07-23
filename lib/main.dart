import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pngtopdf/home%20page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'cached_network_image sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static const _url = 'https://cdn.eso.org/images/large/eso1031b.jpg';

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('cached_network_image sample'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(
            left: 24.0,
            right: 24.0,
          ),
          child: CachedNetworkImage(
            imageUrl: _url,
            progressIndicatorBuilder: (context, url, progress) =>
            const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Center(
              child: Icon(
                Icons.error,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}