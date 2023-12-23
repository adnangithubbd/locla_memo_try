import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:locla_memo_try/stream_details/data_providers.dart';
import 'package:provider/provider.dart';

class StreamHome extends StatelessWidget {
  const StreamHome({super.key});

  @override
  Widget build(BuildContext context) {
      final dataProvider=Provider.of<DataPro>(context,listen: false);
    return MaterialApp(
      title: 'StreamBuilder Example',
      home: Scaffold(
        body: StreamBuilder(
          stream: dataProvider.update(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Text('Data from stream: ${snapshot.data}'),
              );
            } else {
              return const Center(
                child:
                    CircularProgressIndicator(), // Show a loader while waiting for data
              );
            }
          },
        ),
      ),
    );
  }
}




