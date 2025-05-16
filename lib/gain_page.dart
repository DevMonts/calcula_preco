import 'package:calcula_preco/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class gain extends StatefulWidget {
  @override
  State<gain> createState() => _gainState();
}

class _gainState extends State<gain> {
  final TextEditingController sell_price_controller = TextEditingController();
  final TextEditingController buy_price_controller = TextEditingController();
  String sell_price_str = '';
  String buy_price_str = '';
  double gain_margin = 0;
  double gain_percent = 0;
  double gain_value = 0;
  String formatted_gain_value = '0,00';

  void clear_all() {
    sell_price_controller.clear();
    buy_price_controller.clear();
    setState(() {
      sell_price_str = '';
      buy_price_str = '';
      gain_margin = 0;
      gain_percent = 0;
      gain_value = 0;
      formatted_gain_value = '0,00';
    });
  }

  @override
  Widget build(BuildContext context) {
    formatted_gain_value = gain_value.toStringAsFixed(2).replaceAll('.', ',');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Lucro',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder:
                    (BuildContext context) => AlertDialog(
                      content: Text(
                        'O Calcula Preço simplifica a precificação e a análise de lucros, diferenciando a porcentagem e a margem de lucro.\nCalcule preços de venda, analise lucros e compartilhe resultados.\nConsidere custos, impostos, margens e muito mais.\n\nDesenvolvimento Reale Tech\n(75)2102-9200\nwww.realetech.com.br',
                        textAlign: TextAlign.center,
                      ),
                    ),
              );
            },
            icon: Icon(Icons.info),
          ),
          IconButton(
            onPressed: () {
              Share.share(
                'Percentual de Lucro: $gain_percent%\nMargem de Lucro: $gain_margin%\nValor de Lucro: R\$$formatted_gain_value',
              );
            },
            icon: Icon(Icons.share),
          ),
          IconButton(onPressed: clear_all, icon: Icon(Icons.delete)),
        ],
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.surface),
      ),
      drawer: sidebar(),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: sell_price_controller,
              onChanged: (text) {
                sell_price_str = text;
              },
              decoration: InputDecoration(
                labelText: 'Preço de Venda',
                border: OutlineInputBorder(),
                hintText: 'R\$139,99',
                hintStyle: TextStyle(color: Colors.grey),
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: buy_price_controller,
              onChanged: (text) {
                buy_price_str = text;
              },
              decoration: InputDecoration(
                labelText: 'Preço de Custo',
                border: OutlineInputBorder(),
                hintText: 'R\$39,99',
                hintStyle: TextStyle(color: Colors.grey),
              ),
              keyboardType: TextInputType.number,
            ),
            Row(
              children: [
                Container(
                  width: 320,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(3),
                    color: Theme.of(context).colorScheme.onInverseSurface,
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10, height: 50),
                      Text(
                        style: TextStyle(fontSize: 15),
                        'Percentual de Lucro: $gain_percent%',
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder:
                          (BuildContext context) => AlertDialog(
                            content: Text(
                              'O percentual de lucro é um indicador que mostra a relação entre o lucro e a receita total, permitindo avaliar a rentabilidade do negócio.\n\n📌 Fórmula:\nPercentual de Lucro (%) = (Lucro Líquido / Receita Total) × 100\n\nEsse cálculo ajuda a determinar se a empresa está operando de forma lucrativa e a definir estratégias para melhorar seus resultados financeiros.',
                            ),
                          ),
                    );
                  },
                  icon: Icon(Icons.info),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 320,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(3),
                    color: Theme.of(context).colorScheme.onInverseSurface,
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10, height: 50),
                      Text(
                        style: TextStyle(fontSize: 15),
                        'Margem de Lucro: $gain_margin%',
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder:
                          (BuildContext context) => AlertDialog(
                            content: Text(
                              'A margem de lucro é um indicador fundamental para avaliar a rentabilidade de um negócio, demonstrando a porcentagem de lucro obtida sobre as vendas.\n\n📌 Fórmula:\nMargem de Lucro (%) = (Lucro Líquido / Receita Total) × 100\n\nEssa métrica ajuda a entender a eficiência financeira da empresa e a tomar decisões estratégicas para otimizar os ganhos.',
                            ),
                          ),
                    );
                  },
                  icon: Icon(Icons.info),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 320,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(3),
                    color: Theme.of(context).colorScheme.onInverseSurface,
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10, height: 50),
                      Text(
                        style: TextStyle(fontSize: 15),
                        'Valor de Lucro: R\$$formatted_gain_value',
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder:
                          (BuildContext context) => AlertDialog(
                            content: Text(
                              'O valor líquido do lucro representa o montante real que a empresa obtém após deduzir todas as despesas, impostos e custos operacionais.\n\n📌 Fórmula:\nValor Líquido do Lucro = Receita Total - (Custos Totais + Impostos + Despesas Operacionais)\n\nEsse valor é essencial para medir a eficiência financeira do negócio e tomar decisões estratégicas para aumentar a rentabilidade.',
                            ),
                          ),
                    );
                  },
                  icon: Icon(Icons.info),
                ),
              ],
            ),
            SizedBox(
              width: 500,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    double sell_price = double.parse(sell_price_str);
                    double buy_price = double.parse(buy_price_str);
                    gain_percent = sell_price - buy_price;
                    gain_margin = (gain_percent / sell_price) * 100;
                    gain_value = (buy_price * gain_margin) / 100;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                ),
                child: Text('Calcular Lucro'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
