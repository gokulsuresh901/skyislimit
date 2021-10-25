import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:skyislimit/api/service/user_resourse_service.dart';
import 'package:skyislimit/core/apiBridge.dart';
import 'package:skyislimit/pages/home_page.dart';
import 'package:skyislimit/pages/profile_page.dart';
import 'package:skyislimit/pages/search_page.dart';

import 'bloc/repository_bloc.dart';
import 'bloc/search_bloc.dart';
Future<void> setupDependencies() async {

  GetIt.instance.registerSingleton<UserResourceService>(UserResourceService());
  GetIt.instance.registerSingleton<ApiBridge>(ApiBridge());
}
void main()   async {
await setupDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchBloc>(create: (context) => SearchBloc()),
        BlocProvider<RepositoryBloc>(create: (context) => RepositoryBloc()),
      ],

      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {




  @override
  Widget build(BuildContext context) {
    return SearchPage();
  }
}
