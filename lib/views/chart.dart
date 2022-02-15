import 'package:flutter/material.dart';
import 'package:musix_app/provider/chart_provider.dart';
import 'package:provider/provider.dart';

class ChartComp extends StatelessWidget {
  const ChartComp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChartProvider>(
      create: (context) => ChartProvider(),
      child: Consumer<ChartProvider>(
        builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text('Demo provider'),
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Column(
              children: [
                Center(
                  child: Text(
                    'value ' + value.valueChart.toString(),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => value.changeValueChart(value.valueChart + 1),
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
