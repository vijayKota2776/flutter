import 'package:cloud_firestore/cloud_firestore.dart';

/// Flower Model Class
class Flower {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final String pdfUrl;
  final String pdfFileName;
  final DateTime? createdAt;

  Flower({
    required this.id,
    required this.name,
    required this.description,
    this.imageUrl = '',
    this.pdfUrl = '',
    this.pdfFileName = '',
    this.createdAt,
  });

  /// Factory constructor to create a Flower from a Firestore Document
  factory Flower.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    DateTime? createdDateTime;

    if (data['createdAt'] is Timestamp) {
      createdDateTime = (data['createdAt'] as Timestamp).toDate();
    }

    return Flower(
      id: doc.id,
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      pdfUrl: data['pdfUrl'] ?? '',
      pdfFileName: data['pdfFileName'] ?? '',
      createdAt: createdDateTime,
    );
  }
}
