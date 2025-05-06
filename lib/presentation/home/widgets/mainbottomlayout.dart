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
          TextField(
            controller: controller,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: double.maxFinite,
            child: ElevatedButton(
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
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: Colors.blueAccent,
              ),
              child: const Text(
                "Ask",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
