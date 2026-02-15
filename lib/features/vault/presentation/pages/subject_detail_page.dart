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
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            title: Text('Lecture ${index + 1}: Key Concepts'),
            subtitle: Text('Created on Oct ${12 + index}, 2023'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
        );
      },
    );
  }

  Widget _buildFilesList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: Icon(
              index % 2 == 0 ? Icons.picture_as_pdf : Icons.image,
              color: index % 2 == 0 ? Colors.redAccent : Colors.blueAccent,
            ),
            title: Text(
              index % 2 == 0
                  ? 'Handout_$index.pdf'
                  : 'Whiteboard_Snap_$index.jpg',
            ),
            subtitle: const Text('Added 2 days ago • 2.4 MB'),
            trailing: const Icon(Icons.download_rounded),
          ),
        );
      },
    );
  }
}
