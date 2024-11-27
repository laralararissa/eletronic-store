import 'package:flutter/material.dart';
import 'package:store/widgets/appbar.dart';
import 'package:timelines_plus/timelines_plus.dart';

class TrackingPage extends StatefulWidget {
  const TrackingPage({super.key});

  @override
  State<TrackingPage> createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final List<String> events = [
    'Pedido realizado',
    'Pedido em preparo',
    'Pedido despachado',
    'Pedido em transito',
    'Pedido em rota de entrega',
    'Pedido entregue',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: const AppBarWidget(),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Rastreamento',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text(
                  'Acompanhe o seu pedido em tempo real',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Image.asset('assets/1.png'),
                const SizedBox(width: 10),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Produto: TV',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Valor: R\$ 100,00',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Localização: São Paulo, SP'),
                Text('Data: 20/11/2024'),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(24),
            child: Timeline.tileBuilder(
              shrinkWrap: true,
              theme: TimelineTheme.of(context).copyWith(
                nodePosition: 0,
                connectorTheme:
                    TimelineTheme.of(context).connectorTheme.copyWith(
                          thickness: 1.0,
                        ),
                indicatorTheme:
                    TimelineTheme.of(context).indicatorTheme.copyWith(
                          size: 10.0,
                          position: 0.5,
                        ),
              ),
              builder: TimelineTileBuilder(
                indicatorBuilder: (_, index) =>
                    index == 4 ? Indicator.outlined(borderWidth: 5) : null,
                startConnectorBuilder: (_, index) => Connector.solidLine(),
                endConnectorBuilder: (_, index) => Connector.solidLine(),
                contentsBuilder: (_, index) {
                  if (index == 0) {
                    return null;
                  }

                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(events[index - 1].toString()),
                  );
                },
                itemExtentBuilder: (_, index) => index == 0 ? 10.0 : 30.0,
                nodeItemOverlapBuilder: (_, index) => index == 0 ? true : null,
                itemCount: events.length + 1,
              ),
            ),
          )
        ],
      ),
    );
  }
}
