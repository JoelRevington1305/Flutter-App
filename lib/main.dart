import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: LoginPage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  final _formKey = GlobalKey<FormState>();
  final _usernameController =   TextEditingController();
  final _passwordController =   TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: "username"),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Enter your UserName';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16,),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: "password"),
                obscureText: true,
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Enter your Password";
                  }
                  return null;
                },
              ),
              SizedBox(height: 32,),
              ElevatedButton(
                onPressed: (){
                  if(_formKey.currentState!.validate()){
                    print('Username: ${_usernameController.text}');
                    print('Password: ${_passwordController.text}');
                  }
                },  
                child: Text("Login")
              )
            ],
          )
        ),
      ),
    );
  }
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
