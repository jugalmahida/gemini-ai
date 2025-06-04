import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:gemini/domain/entities/message.dart';

Widget buildChatLayot({required List<Message>? data}) {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  return Expanded(
    child: AnimatedList(
      key: _listKey,
      initialItemCount: data?.length ?? 0,
      itemBuilder: (context, index, animation) {
        final message = data?[index];
        return SizeTransition(
          sizeFactor: animation,
          child: Column(
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
          ),
        );
      },
    ),
  );
}