import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/home/home_news_provider.dart';

class HomeSelectLocationDialog extends StatelessWidget {
  const HomeSelectLocationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final list = context.read<HomeNewsProvider>().locationsList;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Select Location'),
            const Divider(),
            Container(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height / 2),
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final listItem = list[index];
                  return TextButton(onPressed: () {}, child: Text(listItem));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
