
import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:nomadic/features/auth/repo/auth_repo.dart';
import 'package:nomadic/features/auth/ui/auth_screen.dart';
import 'package:nomadic/features/auth/ui/login_screen.dart';
import 'package:nomadic/features/home/ui/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Client client = Client();
  client = Client()
      .setEndpoint("https://cloud.appwrite.io/v1")
      .setProject("nomadic4517");
  Account account = Account(client);
  runApp(ChangeNotifierProvider(
    create: (context) => AuthServive(),
    child: MyApp(account: account),
  ));
}

class MyApp extends StatelessWidget {
  final Account account;
  const MyApp({
    required this.account,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final value = context.watch<AuthServive>().status;
    print('TOP CHANGE Value changed to: $value!');
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home:value == AuthStatus.uninitialized
            ? const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              )
            : value == AuthStatus.authenticated
                ? const HomeScreen()
                : const AuthScreen(),
    );
  }
}
