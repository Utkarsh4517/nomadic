import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Client client = Client();
  client = Client()
      .setEndpoint("https://cloud.appwrite.io/v1")
      .setProject("nomadic4517");
  Account account = Account(client);
  runApp(MyApp(account: account));
}

class MyApp extends StatelessWidget {
  final Account account;
  const MyApp({
    required this.account,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
