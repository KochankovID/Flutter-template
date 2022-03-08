import 'package:business_module/business_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() {
  BlocFabric.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (BuildContext context) {
          return GetIt.I.get<UserBloc>()..loadUsers();
        },
        child: const MyHomePage(title: 'Flutter template'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
          return state.isLoading
              ? const CircularProgressIndicator()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Name: ",
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(color: Colors.blue),
                        ),
                        Text(
                          state.user.name,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Age: ",
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(color: Colors.blue),
                        ),
                        Text(
                          state.user.age.toString(),
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Name: ",
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(color: Colors.blue),
                        ),
                        Text(
                          state.user.salary.toString(),
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ],
                    ),
                  ],
                );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var userBloc = context.read<UserBloc>();
          var user = userBloc.state.user;
          userBloc.updateUser(user.copyWith(age: user.age + 1));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
