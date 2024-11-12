import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/quiz_materials/quiz.dart';
import 'package:quiz/quiz_materials/setup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Games App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> games = [
    {'name': 'Constitutional Quiz', 'icon': Icons.quiz , 'screen' : TriviaSetupScreen()},
    {'name': 'Spin Wheel', 'icon': Icons.circle_rounded,'screen' : TriviaSetupScreen()},
    {'name': 'Roleplay', 'icon': Icons.person,'screen' : TriviaSetupScreen()},
    {'name': 'Puzzle', 'icon': Icons.extension,'screen' : TriviaSetupScreen()},
    // Add more games as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Games'),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SizedBox(
            height: 400,
            width: 350,
            child: GridView.builder(
              itemCount: games.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final game = games[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => game['screen']),
                      );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${game['name']} screen coming soon!',style: GoogleFonts.lato(color: Colors.black,fontSize: 24),))
                    );
                  },
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(game['icon'], size: 40, color: Colors.blue),
                        SizedBox(height: 10),
                        Text(
                          game['name'],
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
