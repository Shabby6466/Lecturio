import 'package:google_generative_ai/google_generative_ai.dart';
import '../../features/study/domain/models/note.dart';
import 'package:uuid/uuid.dart';

class GeminiService {
  final String apiKey;
  late final GenerativeModel model;

  GeminiService(this.apiKey) {
    model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
  }

  Future<Note> generateNoteFromText(String text, String subjectId) async {
    final prompt =
        '''
    Analyze the following lecture text and provide:
    1. A concise summary in bullet points.
    2. 5-7 key concepts or definitions.
    3. A 2-sentence "Quick Review" for the entry.

    Text: $text

    Format the response clearly with sections.
    ''';

    try {
      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);

      final resultText = response.text ?? "Error generating note.";

      // Basic parsing logic (would be more robust in production)
      return Note(
        id: const Uuid().v4(),
        subjectId: subjectId,
        title:
            "AI Generated Note - ${DateTime.now().hour}:${DateTime.now().minute}",
        content: resultText, // Ideally parsed into sections
        keyConcepts: ["AI Analysis", "Key Concept"], // Mocked for now
        quickReview: "Review this note for upcoming exams.",
        createdAt: DateTime.now(),
      );
    } catch (e) {
      throw Exception('Failed to generate note: $e');
    }
  }
}
