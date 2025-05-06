import 'package:flutter/material.dart';
import 'package:gemini/domain/entities/ai_model.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

Widget buildChatLayot({required AIModel? data}) {
  final String? responseText = data?.candidates?[0].content?.parts?[0].text;

  return Expanded(
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (responseText != null && responseText.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Gemini",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Use Markdown widget instead of Text
                  Markdown(
                    data: responseText,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    styleSheet: MarkdownStyleSheet(
                      p: const TextStyle(fontSize: 14),
                      strong: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            )
          else
            const Text("No response received"),
        ],
      ),
    ),
  );
}
