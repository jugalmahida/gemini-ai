import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini/presentation/home/bloc/ask_ai_bloc.dart';
import 'package:gemini/presentation/home/widgets/chatlayout.dart';
import 'package:gemini/presentation/home/widgets/initlayout.dart';
import 'package:gemini/presentation/home/widgets/mainbottomlayout.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AskAiBloc, AskAiState>(
        builder: (context, state) {
          return switch (state) {
            AskAiInitial() => buildMainBottomLayot(
                centeredContent: buildInitLayot(),
                controller: _controller,
                context: context,
              ),
            AskAiLoading() => buildMainBottomLayot(
                centeredContent: Expanded(
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                controller: _controller,
                context: context,
              ),
            AskAiError() => const Center(
                child: Text("Unknown error occurred "),
              ),
            AskAiLoaded() => buildMainBottomLayot(
                centeredContent: buildChatLayot(
                  data: state.messages,
                ),
                controller: _controller,
                context: context,
              ),
              _ => SizedBox.shrink()
          };
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
