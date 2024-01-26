import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:holohive/screens/launcher.dart';
import 'package:holohive/services/FirebaseServices.dart';
import 'package:holohive/services/MessageService.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Define the default brightness and colors.
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.indigo,
          accentColor: Colors.blueAccent,
          backgroundColor: Colors.black,
          errorColor: Colors.red,
          brightness: Brightness.dark,
        ),
        textTheme: TextTheme(
            bodySmall: GoogleFonts.orbitron(
              color: Colors.indigo,
              shadows: [
                const Shadow(
                  blurRadius: 1.0,
                  color: Colors.blueAccent,
                ),
              ]
            ),
            bodyMedium: GoogleFonts.orbitron(
                color: Colors.indigo,
                shadows: [
                  const Shadow(
                    blurRadius: 1.0,
                    color: Colors.blueAccent,
                  ),
                ]
            ),
            titleLarge: GoogleFonts.orbitron(
              color: Colors.indigo,
                shadows: [
                  const Shadow(
                    blurRadius: 1.00,
                    color: Colors.blueAccent,
                  ),
                ]
            ),
            titleSmall: GoogleFonts.orbitron(color: Colors.indigo),
            bodyLarge: GoogleFonts.orbitron(
              color: Colors.indigo,
                shadows: [
                  const Shadow(
                    blurRadius: 1.0,
                    color: Colors.blueAccent,
                  ),
                ]
            )),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Holo Hive'),
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

  FirebaseServices fb = FirebaseServices();
  MessageService ms = MessageService();


  @override
  void initState(){
    super.initState();
    print("Starting");
    fb.initializeFB();
    ms.getListOfUsers();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: Launcher()));
  }
}
