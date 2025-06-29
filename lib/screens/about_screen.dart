import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // We use a theme to easily access colors for consistency.
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("About This App"),
      ),
      // Padding adds space around the content.
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        // A Column to arrange our text widgets vertically.
        child: Column(
          // Aligns all content to the left, which is standard for info pages.
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Section 1: App Purpose ---
            const Text(
              'App Purpose',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'This application fetches and displays the live value of the cryptocurrency XRP (Ripple) in Malaysian Ringgit (MYR). The data is retrieved from a public JSON API.',
              style: TextStyle(fontSize: 16, height: 1.5, color: Colors.white70),
            ),
            
            // A spacer to visually separate the sections.
            const SizedBox(height: 30),

            // --- Section 2: Author ---
            const Text(
              'Author',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Developed by: [Badrul]', // Placeholder for you to edit
              style: TextStyle(fontSize: 16),
            ),
            
            const SizedBox(height: 30),

            // --- Section 3: GitHub Repo (New Section) ---
            const Text(
              'GitHub Repo',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // This is the placeholder for your link.
            // We style it to look like a link for better UI.
            Text(
              '[Your GitHub Repo Link Here]', // Placeholder for you to edit
              style: TextStyle(
                fontSize: 16,
                color: theme.colorScheme.secondary, // Use a theme color for links
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}