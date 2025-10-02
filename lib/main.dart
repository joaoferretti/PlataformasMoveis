import 'package:flutter/material.dart';
import 'sample.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atividade Flutter',
      home: SamplePage(),
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: const Text('Layout Flutter'),
      //   ),
      //   body: ListView(
      //     children: [
      //       Image.asset(
      //         'images/lago.jpg',
      //         width: 600,
      //         height: 240,
      //         fit: BoxFit.cover,
      //       ),
      //       titleSection,
      //       buttonSection,
      //       textSection,
      //     ],
      //   ),
      // ),
    );
  }
}

Widget titleSection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Lago Campestre',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Oeschinen Lake, Suíça',
              style: TextStyle(color: Colors.grey[500]),
            ),
          ],
        ),
      ),
      Icon(Icons.star, color: Colors.red[500]),
      const Text('41'),
    ],
  ),
);

Color color = Colors.blue;

Widget buttonSection = Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    _buildButtonColumn(color, Icons.call, 'CALL'),
    _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
    _buildButtonColumn(color, Icons.share, 'SHARE'),
  ],
);

Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );
}

Widget textSection = const Padding(
  padding: EdgeInsets.all(32),
  child: Text(
    'O Lago Oeschinen é um dos maiores lagos alpinos. '
    'Situado 1.578 metros acima do nível do mar, é '
    'alimentado por várias geleiras. Caminhadas, canoagem '
    'e pesca são populares durante o verão. ',
    softWrap: true,
  ),
);
