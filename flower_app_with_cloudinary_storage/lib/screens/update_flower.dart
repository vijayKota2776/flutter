import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/flower_model.dart';
import '../services/firebase_service.dart';
import '../utils/custom_alert_box.dart';

/// Simple Screen to Update a Flower
class UpdateFlowerScreen extends StatefulWidget {
  final Flower flower;

  const UpdateFlowerScreen({super.key, required this.flower});

  @override
  State<UpdateFlowerScreen> createState() => _UpdateFlowerScreenState();
}

class _UpdateFlowerScreenState extends State<UpdateFlowerScreen> {
  late TextEditingController _nameController;
  late TextEditingController _descController;

  PlatformFile? _newImage;
  PlatformFile? _newPdf;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.flower.name);
    _descController = TextEditingController(text: widget.flower.description);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    super.dispose();
  }

  /// Pick new Image
  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true,
    );
    if (result != null) {
      setState(() => _newImage = result.files.first);
    }
  }

  /// Pick new PDF
  Future<void> _pickPdf() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      withData: true,
    );
    if (result != null) {
      setState(() => _newPdf = result.files.first);
    }
  }

  /// Update Flower in Firebase
  Future<void> _updateFlower() async {
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
      await FirebaseService().updateFlower(
        id: widget.flower.id,
        name: name,
        description: desc,
        newImageFile: (!kIsWeb && _newImage?.path != null) ? File(_newImage!.path!) : null,
        newImageBytes: _newImage?.bytes,
        newImageFileName: _newImage?.name,
        existingImageUrl: widget.flower.imageUrl,
        newPdfFile: (!kIsWeb && _newPdf?.path != null) ? File(_newPdf!.path!) : null,
        newPdfBytes: _newPdf?.bytes,
        newPdfFileName: _newPdf?.name,
        existingPdfUrl: widget.flower.pdfUrl,
        existingPdfFileName: widget.flower.pdfFileName,
      );

      if (mounted) {
        Navigator.pop(context); // Go back to list
      }
    } catch (e) {
      if (mounted) {
        CustomAlertBox.showError(
          context,
          'Update Failed',
          'Failed to update flower: $e',
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
        title: const Text('Update Flower'),
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
                    label: Text(
                      _newImage != null
                          ? 'New Image: ${_newImage!.name}'
                          : (widget.flower.imageUrl.isNotEmpty
                              ? 'Change Image'
                              : 'Pick Image'),
                    ),
                    onPressed: _pickImage,
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                    icon: const Icon(Icons.picture_as_pdf),
                    label: Text(
                      _newPdf != null
                          ? 'New PDF: ${_newPdf!.name}'
                          : (widget.flower.pdfUrl.isNotEmpty
                              ? 'Change PDF'
                              : 'Pick PDF'),
                    ),
                    onPressed: _pickPdf,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _updateFlower,
                    child: const Text('Update Flower'),
                  ),
                ],
              ),
            ),
    );
  }
}
