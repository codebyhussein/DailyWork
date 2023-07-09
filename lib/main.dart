// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_basic1/Screens/splashScreen.dart';
import 'package:flutter_application_basic1/Screens/HomeScreen.dart';
import 'package:flutter_application_basic1/bolc_observer.dart';
import 'package:flutter_application_basic1/cubit/FetchNotes/fetch_notes_cubit.dart';
import 'package:flutter_application_basic1/cubit/login/login_cubit.dart';
import 'package:flutter_application_basic1/cubit/notes/note_cubit.dart';
import 'package:flutter_application_basic1/cubit/register/register_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/note_model.dart';

void main() async {
  //to insure await
  WidgetsFlutterBinding.ensureInitialized();

  //to listen cubit
  Bloc.observer = SimpleBlocObesrver();

  await Firebase.initializeApp();
  //hive database
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>('notes_box');

//to get uid from SharedPreferences
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  var uid = sharedPreferences.getString('uid');

  Widget? widget;
  if (uid != null) {
    widget = HomeScreen();
  }
  if (uid == null) {
    widget = splashScreen();
  }
  runApp(MyApp(startwidget: widget!));
}

class MyApp extends StatefulWidget {
  MyApp({super.key, required this.startwidget});
  Widget startwidget;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NoteCubit(),
        ),
        BlocProvider(
          create: (context) => FetchNotesCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: widget.startwidget,
      ),
    );
  }
}
