import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/flower_model.dart';
import '../utils/custom_alert_box.dart';

/// Simple Flower Detail View Screen
class FlowerDetailView extends StatelessWidget {
  final Flower flower;

  const FlowerDetailView({super.key, required this.flower});

  /// Open PDF link in browser/PDF viewer
  Future<void> _openPdf(BuildContext context, String url) async {
    try {
      final uri = Uri.parse(url);
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
        webOnlyWindowName: '_blank',
      );
    } catch (e) {
      if (context.mounted) {
        CustomAlertBox.showError(context, 'Error', 'Could not open PDF: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(flower.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Flower Image
            if (flower.imageUrl.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  flower.imageUrl,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 16),

            // Flower Name
            Text(
              flower.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Flower Description
            Text(
              flower.description,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 20),

            // Open PDF Button
            if (flower.pdfUrl.isNotEmpty)
              ElevatedButton.icon(
                icon: const Icon(Icons.picture_as_pdf, color: Colors.red),
                label: Text(
                  flower.pdfFileName.isNotEmpty
                      ? 'Open ${flower.pdfFileName}'
                      : 'Open PDF',
                ),
                onPressed: () => _openPdf(context, flower.pdfUrl),
              ),
          ],
        ),
      ),
    );
  }
}
