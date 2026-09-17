import 'package:flutter/material.dart';
import '../models/flower_model.dart';
import '../services/firebase_service.dart';
import '../utils/custom_alert_box.dart';

/// Simple Real-time Flower List Screen
class FlowerListScreen extends StatelessWidget {
  const FlowerListScreen({super.key});

  /// Simple Delete Logic
  Future<void> _handleDelete(BuildContext context, Flower flower) async {
    try {
      await FirebaseService().deleteFlower(flower);
      if (context.mounted) {
        CustomAlertBox.showSuccess(
          context,
          'Deleted',
          '${flower.name} deleted successfully',
        );
      }
    } catch (e) {
      if (context.mounted) {
        CustomAlertBox.showError(
          context,
          'Error',
          'Failed to delete: $e',
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flowers'),
      ),
      // Real-time listener using StreamBuilder
      body: StreamBuilder<List<Flower>>(
        stream: FirebaseService().getFlowersStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final flowers = snapshot.data ?? [];

          if (flowers.isEmpty) {
            return const Center(
              child: Text('No flowers yet. Click + to add one.'),
            );
          }

          return ListView.builder(
            itemCount: flowers.length,
            itemBuilder: (context, index) {
              final flower = flowers[index];

              return ListTile(
                leading: flower.imageUrl.isNotEmpty
                    ? CircleAvatar(
                        backgroundImage: NetworkImage(flower.imageUrl),
                      )
                    : const CircleAvatar(
                        child: Icon(Icons.local_florist),
                      ),
                title: Text(flower.name),
                subtitle: Text(
                  flower.description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/update',
                          arguments: flower,
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _handleDelete(context, flower),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/detail',
                    arguments: flower,
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
      ),
    );
  }
}
