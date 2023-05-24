import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loan Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Loan Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final loanAmount = 100000.0;
  final interestRate = 0.035;
  final termsInMonth = 12;

  @override
  Widget build(BuildContext context) {
    final monthlyPayment = calculateMonthly();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Loan Amount: ₱$loanAmount',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              'Terms: $termsInMonth months',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              'Interest Rate: ${interestRate * 100}%',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              'Monthly Installment: ₱$monthlyPayment',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }

  double calculateMonthly() {
    final ratePerPeriod = interestRate / termsInMonth;
    return loanAmount * ratePerPeriod / (1 - pow(1 + ratePerPeriod, -termsInMonth));
  }
}
