import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';

class SamplePage extends StatefulWidget {
  const SamplePage({super.key});

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  List<List<dynamic>> _abelhas = [];

  @override
  void initState() {
    super.initState();
    _loadCSV();
  }

  Future<void> _loadCSV() async {
    final rawData = await rootBundle.loadString("assets/data/especies.csv");
    List<List<dynamic>> listData = const CsvToListConverter().convert(rawData, eol: '\n');
    setState(() {
      _abelhas = listData.sublist(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Abelhas sem Ferrão 🐝"),
        backgroundColor: Colors.amber[700],
      ),
      body: _abelhas.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _abelhas.length,
              itemBuilder: (context, index) {
                final especie = _abelhas[index][6];
                final nomeComum = _abelhas[index][10];
                final estado = _abelhas[index][20];

                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.bug_report, color: Colors.brown),
                    title: Text(especie),
                    subtitle: Text("$nomeComum - $estado"),
                  ),
                );
              },
            ),
    );
  }
}
