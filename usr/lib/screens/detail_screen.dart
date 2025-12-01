import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/nivedan_model.dart';

class DetailScreen extends StatelessWidget {
  final NivedanModel nivedan;

  const DetailScreen({super.key, required this.nivedan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('निवेदन विवरण'),
        actions: [
          IconButton(
            icon: const Icon(Icons.copy),
            tooltip: 'Copy Text',
            onPressed: () {
              Clipboard.setData(ClipboardData(text: '${nivedan.subject}\n\n${nivedan.body}'));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('निवेदन कपी गरियो (Copied to clipboard)')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nivedan.title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nivedan.subject,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    nivedan.body,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.8,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: '${nivedan.subject}\n\n${nivedan.body}'));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('निवेदन कपी गरियो (Copied to clipboard)')),
                  );
                },
                icon: const Icon(Icons.copy),
                label: const Text('कपी गर्नुहोस् (Copy)'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
