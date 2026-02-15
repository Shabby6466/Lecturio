import 'package:flutter/material.dart';

class SubjectDetailPage extends StatelessWidget {
  final String subjectName;
  final Color subjectColor;

  const SubjectDetailPage({
    super.key,
    required this.subjectName,
    required this.subjectColor,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(subjectName),
          bottom: TabBar(
            indicatorColor: subjectColor,
            labelColor: subjectColor,
            tabs: const [
              Tab(text: 'Notes', icon: Icon(Icons.notes)),
              Tab(text: 'Files & PDFs', icon: Icon(Icons.picture_as_pdf)),
            ],
          ),
        ),
        body: TabBarView(children: [_buildNotesList(), _buildFilesList()]),
      ),
    );
  }

  Widget _buildNotesList() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.notes, size: 48, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'No notes for this subject yet',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildFilesList() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.picture_as_pdf, size: 48, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'No files for this subject yet',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
