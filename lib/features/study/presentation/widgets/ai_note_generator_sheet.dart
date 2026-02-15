import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AiNoteGeneratorSheet extends StatefulWidget {
  const AiNoteGeneratorSheet({super.key});

  @override
  State<AiNoteGeneratorSheet> createState() => _AiNoteGeneratorSheetState();
}

class _AiNoteGeneratorSheetState extends State<AiNoteGeneratorSheet> {
  final TextEditingController _controller = TextEditingController();
  bool _isGenerating = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 20,
        right: 20,
        top: 20,
      ),
      decoration: const BoxDecoration(
        color: AppColors.secondaryNavy,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'AI Note Generator',
                style: GoogleFonts.outfit(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _controller,
            maxLines: 6,
            decoration: InputDecoration(
              hintText: 'Paste your lecture text or transcription here...',
              fillColor: AppColors.primaryNavy,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _isGenerating ? null : _generateNote,
              child: _isGenerating
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('Generate Smart Note'),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  void _generateNote() async {
    if (_controller.text.isEmpty) return;

    setState(() => _isGenerating = true);

    // Simulate API Call
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() => _isGenerating = false);
      Navigator.pop(context);
      // Show success or navigate to result
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Note generated successfully!')),
      );
    }
  }
}
