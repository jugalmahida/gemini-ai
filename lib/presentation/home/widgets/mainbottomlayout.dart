import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini/presentation/home/bloc/ask_ai_bloc.dart';

Widget buildMainBottomLayot({
  required Widget centeredContent,
  required TextEditingController controller,
  required BuildContext context,
}) {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          centeredContent,
          Row(
            children: [
              Flexible(
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              IconButton(
                iconSize: 30,
                icon: Icon(
                  Icons.send,
                  color: Colors.white,
                ),
                onPressed: () {
                  final String query = controller.text.trim();
                  if (query.isNotEmpty) {
                    context.read<AskAiBloc>().add(AskAIQuery(query));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Please write query",
                        ),
                      ),
                    );
                  }
                  controller.clear();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  backgroundColor: Colors.blueAccent,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
