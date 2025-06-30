import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {

  AboutScreen({super.key});

  final Uri _githubUri =
      Uri.parse('https://github.com/jerungpyro/crypto_value_tracker');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_githubUri)) {
      throw 'Could not launch $_githubUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("About This App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'App Purpose',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'This application fetches and displays the live value of the cryptocurrency XRP (Ripple) in Malaysian Ringgit (MYR). The data is retrieved from a public JSON API.',
              style: TextStyle(fontSize: 16, height: 1.5, color: Colors.white70),
            ),
            const SizedBox(height: 30),
            const Text(
              'Author',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Developed by: Badrul Muhammad Akasyah',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'Matric Number: 2023131279',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            const Text(
              'GitHub Repo',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: _launchUrl,
              child: Text(
                _githubUri.toString(),
                style: TextStyle(
                  fontSize: 16,
                  color: theme.colorScheme.secondary,
                  decoration: TextDecoration.underline,
                  decorationColor: theme.colorScheme.secondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}