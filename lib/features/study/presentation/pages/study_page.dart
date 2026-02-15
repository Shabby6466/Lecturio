import 'package:flutter/material.dart';
import 'package:lecturio/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lecturio/features/study/presentation/widgets/ai_note_generator_sheet.dart';
import 'package:lecturio/injection_container.dart';
import 'package:lecturio/core/data/repositories/note_repository.dart';
import 'package:lecturio/features/study/domain/models/note.dart';

class StudyPage extends StatefulWidget {
  const StudyPage({super.key});

  @override
  State<StudyPage> createState() => _StudyPageState();
}

class _StudyPageState extends State<StudyPage> {
  final _noteRepository = sl<NoteRepository>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Study'),
        actions: [
          IconButton(icon: const Icon(Icons.history_rounded), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildActionCard(
              title: 'AI Note Generator',
              subtitle: 'Summarize lectures into bullet points',
              icon: FontAwesomeIcons.bolt,
              color: Colors.deepPurpleAccent,
              onTap: () => _overlayGenerator(context),
            ),
            const SizedBox(height: 20),
            _buildActionCard(
              title: 'Voice to Note',
              subtitle: 'Upload audio/video recordings',
              icon: Icons.mic_rounded,
              color: Colors.blueAccent,
              onTap: () {},
            ),
            const SizedBox(height: 32),
            Text(
              'Recent Notes',
              style: GoogleFonts.outfit(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _buildRecentNotesList(),
          ],
        ),
      ),
    );
  }

  void _overlayGenerator(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const AiNoteGeneratorSheet(),
    ).then((_) => setState(() {})); // Refresh notes after sheet closes
  }

  Widget _buildActionCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.8), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.outfit(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: GoogleFonts.outfit(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
            Icon(icon, color: Colors.white, size: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentNotesList() {
    final notes = _noteRepository.getAllNotes();

    if (notes.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Text(
            'No notes yet. Generate some with AI!',
            style: GoogleFonts.outfit(color: AppColors.textSecondary),
          ),
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: notes.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final note = notes[index];
        return Card(
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: AppColors.primaryNavy,
              child: Icon(Icons.description, color: AppColors.accentCoral),
            ),
            title: Text(note.title),
            subtitle: Text(
              note.content.length > 50
                  ? note.content.substring(0, 50) + '...'
                  : note.content,
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 14),
            onTap: () {},
          ),
        );
      },
    );
  }
}
