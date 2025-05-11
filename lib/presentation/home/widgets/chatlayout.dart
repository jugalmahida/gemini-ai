import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:gemini/domain/entities/message.dart';

Widget buildChatLayot({required List<Message>? data}) {
  return Expanded(
    child: ListView.builder(
      itemCount: data?.length,
      itemBuilder: (context, index) {
        final message = data?[index];
        return Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.8,
                ),
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.cyan[300],
                  ),
                  child: Text(
                    message?.userQuery ?? "",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.8,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.cyanAccent,
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 5),
                      Image.asset(
                        "assets/images/gemini_logo.png",
                        width: 35,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Markdown(
                            data: message?.resData.candidates?[0].content
                                    ?.parts?[0].text ??
                                "",
                            shrinkWrap: true,
                            styleSheet: MarkdownStyleSheet(
                              p: const TextStyle(fontSize: 14),
                              strong: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        );
      },
    ),
  );
}

// import 'package:flutter/material.dart';
// import 'package:gemini/domain/entities/ai_model.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';
// import 'package:gemini/domain/entities/message.dart';

// Widget buildChatLayot({required AIModel? data}) {
//   final String? responseText = data?.candidates?[0].content?.parts?[0].text;
//   List<Message> messageHist = [
//     Message(message: "hello", whois: "human"),
//     Message(message: "hello there, how i can help you??", whois: "ai"),
//     Message(message: "hello", whois: "human"),
//     Message(message: "hello there, how i can help you??", whois: "ai"),
//   ];
//   return Expanded(
//     child: SingleChildScrollView(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           if (responseText != null && responseText.isNotEmpty)
//             Container(
//               padding: const EdgeInsets.all(12),
//               margin: const EdgeInsets.symmetric(vertical: 8),
//               decoration: BoxDecoration(
//                 color: Colors.blue.shade50,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     "Gemini",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Markdown(
//                     data: responseText,
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     styleSheet: MarkdownStyleSheet(
//                       p: const TextStyle(fontSize: 14),
//                       strong: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           else
//             const Text("No response received"),
//         ],
//       ),
//     ),
//   );
// }
