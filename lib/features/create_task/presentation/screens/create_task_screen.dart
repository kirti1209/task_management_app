import 'package:flutter/material.dart';
import 'package:task_management_app/constants/color_constants.dart';
import '../widgets/labeled_text_field.dart';
import '../widgets/labeled_dropdown.dart';
import '../widgets/note_box.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _amountController = TextEditingController();
  String? _patsanstha;

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  bool get _isValid =>
      _titleController.text.trim().isNotEmpty && _patsanstha != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: AppBar(
        title: const Text('Create manual task'),
        backgroundColor: ColorConstants.white,
        surfaceTintColor: Colors.transparent,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LabeledTextField(
              label: 'Task Title',
              placeholder: 'Enter task title',
              controller: _titleController,
            ),
            const SizedBox(height: 16),
            LabeledDropdown<String>(
              label: 'Select Patsanstha',
              hint: 'Patsanstha',
              value: _patsanstha,
              items: const [
                DropdownMenuItem(value: 'A', child: Text('Patsanstha A')),
                DropdownMenuItem(value: 'B', child: Text('Patsanstha B')),
                DropdownMenuItem(value: 'C', child: Text('Patsanstha C')),
              ],
              onChanged: (v) => setState(() => _patsanstha = v),
            ),
            const SizedBox(height: 16),
            LabeledTextField(
              label: 'Task Description',
              placeholder: 'Enter Task Description',
              controller: _descController,
              maxLines: 4,
            ),
            const SizedBox(height: 16),
            LabeledTextField(
              label: 'Amount (Optional)',
              placeholder: '₹ 000000',
              controller: _amountController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            const NoteBox(
              text:
                  'Note: Location will be captured automatically when you start the task',
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: InkWell(
                onTap: _isValid ? () {} : null,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: _isValid ? ColorConstants.primaryGradient : null,
                    color: _isValid ? null : ColorConstants.disabledButtonGray,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      color: ColorConstants.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
