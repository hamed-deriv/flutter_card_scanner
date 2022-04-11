import 'package:flutter/material.dart';

import 'package:credit_card_scanner/credit_card_scanner.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CardDetails? _cardDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Scan a credit card'),
            const SizedBox(height: 16),
            Text('Card Number: ${_cardDetails?.cardNumber}'),
            Text('Expiry Date : ${_cardDetails?.expiryDate}'),
            Text('Holder Name: ${_cardDetails?.cardHolderName}'),
            Text('Card Issuer: ${_cardDetails?.cardIssuer}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Scan',
        child: const Icon(Icons.camera_alt),
        onPressed: () async {
          _cardDetails = await CardScanner.scanCard();

          setState(() {});
        },
      ),
    );
  }
}
