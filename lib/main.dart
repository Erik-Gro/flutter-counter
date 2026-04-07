import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advanced Counter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _modifyCounter(int amount) {
    setState(() {
      _counter += amount;
    });
  }

  void _multiplyCounter() {
    setState(() {
      _counter *= 2;
    });
  }

  void _halveCounter() {
    setState(() {
      _counter ~/= 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Candy Counter'),
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Current Counter Value:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$_counter',
              style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),

            _buildAdditionSubtractionRows(),
            const SizedBox(height: 20),
            _buildMultiplicationDivisionRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildAdditionSubtractionRows() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomActionBtn(
              label: '+1',
              color: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              onPressed: () => _modifyCounter(1),
            ),
            const SizedBox(width: 10),
            CustomActionBtn(
              label: '-1',
              color: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              onPressed: () => _modifyCounter(-1),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomActionBtn(
              label: '+2',
              color: Colors.lightGreen,
              shape: const StadiumBorder(),
              onPressed: () => _modifyCounter(2),
            ),
            const SizedBox(width: 10),
            CustomActionBtn(
              label: '-2',
              color: Colors.orange,
              shape: const StadiumBorder(),
              onPressed: () => _modifyCounter(-2),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMultiplicationDivisionRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomActionBtn(
          label: '* 2',
          color: Colors.purple,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20),
          onPressed: _multiplyCounter,
        ),
        const SizedBox(width: 10),
        CustomActionBtn(
          label: '/ 2',
          color: Colors.blue,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20),
          onPressed: _halveCounter,
        ),
      ],
    );
  }
}

class CustomActionBtn extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onPressed;
  final OutlinedBorder shape;
  final EdgeInsetsGeometry? padding;

  const CustomActionBtn({
    super.key,
    required this.label,
    required this.color,
    required this.onPressed,
    required this.shape,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: shape,
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}


//flutter run -d web-server --web-port=8080 --web-hostname=0.0.0.0