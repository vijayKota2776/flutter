import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../services/firebase_service.dart';
import '../utils/custom_alert_box.dart';

/// Simple Screen to Add a Flower
class AddFlowerScreen extends StatefulWidget {
  const AddFlowerScreen({super.key});

  @override
  State<AddFlowerScreen> createState() => _AddFlowerScreenState();
}

class _AddFlowerScreenState extends State<AddFlowerScreen> {
  final _nameController = TextEditingController();
  final _descController = TextEditingController();

  PlatformFile? _pickedImage;
  PlatformFile? _pickedPdf;
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    super.dispose();
  }

  /// Pick Image
  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true,
    );
    if (result != null) {
      setState(() => _pickedImage = result.files.first);
    }
  }

  /// Pick PDF
  Future<void> _pickPdf() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      withData: true,
    );
    if (result != null) {
      setState(() => _pickedPdf = result.files.first);
    }
  }

  /// Save Flower to Firebase
  Future<void> _saveFlower() async {
    final name = _nameController.text.trim();
    final desc = _descController.text.trim();

    if (name.isEmpty || desc.isEmpty) {
      CustomAlertBox.showWarning(
        context,
        'Required Fields',
        'Please enter flower name and description.',
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      await FirebaseService().addFlower(
        name: name,
        description: desc,
        imageFile: (!kIsWeb && _pickedImage?.path != null) ? File(_pickedImage!.path!) : null,
        imageBytes: _pickedImage?.bytes,
        imageFileName: _pickedImage?.name,
        pdfFile: (!kIsWeb && _pickedPdf?.path != null) ? File(_pickedPdf!.path!) : null,
        pdfBytes: _pickedPdf?.bytes,
        pdfFileName: _pickedPdf?.name,
      );

      if (mounted) {
        Navigator.pop(context); // Go back to flower list
      }
    } catch (e) {
      if (mounted) {
        CustomAlertBox.showError(
          context,
          'Save Failed',
          'Failed to add flower: $e',
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Flower'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Flower Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _descController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton.icon(
                    icon: const Icon(Icons.image),
                    label: Text(_pickedImage == null
                        ? 'Pick Image'
                        : 'Image: ${_pickedImage!.name}'),
                    onPressed: _pickImage,
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                    icon: const Icon(Icons.picture_as_pdf),
                    label: Text(_pickedPdf == null
                        ? 'Pick PDF'
                        : 'PDF: ${_pickedPdf!.name}'),
                    onPressed: _pickPdf,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _saveFlower,
                    child: const Text('Save Flower'),
                  ),
                ],
              ),
            ),
    );
  }
}
