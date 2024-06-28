import 'package:flutter/material.dart';
import 'package:task_03/Networking/lang_pair.dart';
import 'package:task_03/Widgets/add_dialog.dart';

class FetchScreen extends StatefulWidget {
  const FetchScreen({super.key});

  @override
  State<FetchScreen> createState() => _FetchScreenState();
}

class _FetchScreenState extends State<FetchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return AddDialogWidget(
                    context: context,
                  );
                });
          },
          child: Icon(
            Icons.add,
            color: Colors.orange[300],
          ),
        ),
        body: Center(
          child: Text(
            'Main display screen',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
