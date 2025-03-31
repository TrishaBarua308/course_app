import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/login_page.dart'; 

void main() async {
  
  await Supabase.initialize(
    url: 'https://ekxjcshjigfwrcdkarby.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVreGpjc2hqaWdmd3JjZGthcmJ5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDMwODU3MDksImV4cCI6MjA1ODY2MTcwOX0.Qr2VKn3T7SumFT4Iirr34TWZC6kZkPRong15_Q-kCss', // Supabase এর `anonKey` বসান
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(), 
    );
  }
}
