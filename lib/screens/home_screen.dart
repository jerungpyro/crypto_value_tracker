import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../services/api_service.dart';
import '../models/xrp_price_model.dart';
import '../widgets/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<XrpPrice> _futureXrpPrice;

  @override
  void initState() {
    super.initState();
    _futureXrpPrice = fetchXrpPrice();
  }

  void _refreshData() {
    setState(() {
      _futureXrpPrice = fetchXrpPrice();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text("Live XRP Price (MYR)"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh',
            onPressed: _refreshData,
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder<XrpPrice>(
          future: _futureXrpPrice,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Error: ${snapshot.error}', textAlign: TextAlign.center),
              );
            } else if (snapshot.hasData) {
              final price = snapshot.data!.price;
              final currencyFormatter = NumberFormat.currency(locale: 'en_MY', symbol: 'RM ');
              final formattedPrice = currencyFormatter.format(price);

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('1 XRP equals', style: TextStyle(fontSize: 24, color: Colors.white70)),
                    const SizedBox(height: 16),
                    Text(
                      formattedPrice,
                      style: const TextStyle(fontSize: 52, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                     const SizedBox(height: 24),
                    Text(
                      'Last updated: ${DateFormat.yMd().add_Hms().format(DateTime.now())}',
                      style: const TextStyle(fontSize: 14, color: Colors.white54),
                    ),
                  ],
                ),
              );
            }
            return const Text('Press refresh to fetch data.');
          },
        ),
      ),
    );
  }
}