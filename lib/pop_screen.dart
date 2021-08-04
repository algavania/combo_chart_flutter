import 'package:chart_testing/search_widget.dart';
import 'package:flutter/material.dart';

class PopScreen extends StatefulWidget {
  const PopScreen({Key? key}) : super(key: key);

  @override
  _PopScreenState createState() => _PopScreenState();
}

class _PopScreenState extends State<PopScreen> {

  late List<CardModel> allList = getCardData();
  late List<CardModel> list = allList;
  String query = '';
  String hintText = 'Cari di sini...';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  buildSearch(),
                  SizedBox(height: 20),
                  buildList(list)
                ],
              ),
            ),
          )
      ),
    );
  }

  Widget buildSearch() => SearchWidget(text: query, onChanged: searchData, hintText: hintText);

  Widget buildList(List<CardModel> list) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final CardModel data = list[index];
        return InkWell(
          onTap: () {
            print("Data: ${data.name}");
          },
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // if you need this
              side: BorderSide(
                color: Colors.grey.withOpacity(0.5),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.network(
                      data.image,
                      height: 50,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                    flex: 2,
                    child: Text(
                      data.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )),
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Text(
                          "1 Year Return",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "+${data.yearReturn}%",
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Text(
                          "Downside Risk",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "${data.risk}%",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Text(
                          "Total AUM",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "${data.aum}T",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        );
      },
      itemCount: list.length,
    );
  }

  List<CardModel> getCardData() {
    return <CardModel>[
      CardModel(
          'https://lh3.googleusercontent.com/gcBfNCH2bWQ7wgeOAPjYwRe_9zW0oTpxVKTnRRPJtVQzq-rL_qVhNJER8DRi4ruxqlE',
          'Batavia Dana Saham',
          31.02,
          3.06,
          4.12),
      CardModel(
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Manulife_logo_%282018%29.svg/2560px-Manulife_logo_%282018%29.svg.png',
          'Manulife Dana Saham Kelas A',
          31.02,
          3.06,
          4.12),
      CardModel(
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Manulife_logo_%282018%29.svg/2560px-Manulife_logo_%282018%29.svg.png',
          'Manulife Dana Saham Kelas A',
          31.02,
          3.06,
          4.12),
      CardModel(
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Manulife_logo_%282018%29.svg/2560px-Manulife_logo_%282018%29.svg.png',
          'Manulife Dana Saham Kelas A',
          31.02,
          3.06,
          4.12),
      CardModel(
          'https://s0.bukalapak.com/rexa-public/product/files/98/original/logo_Sucor_AM.png?1579660602',
          'Sucorinvest Equity Fund',
          31.02,
          3.06,
          4.12),
      CardModel(
          'https://s0.bukalapak.com/rexa-public/product/files/98/original/logo_Sucor_AM.png?1579660602',
          'Sucorinvest Equity Fund',
          31.02,
          3.06,
          4.12),
      CardModel(
          'https://s0.bukalapak.com/rexa-public/product/files/98/original/logo_Sucor_AM.png?1579660602',
          'Sucorinvest Equity Fund',
          31.02,
          3.06,
          4.12),
    ];
  }

  void searchData(String query) {
    final list = allList.where((list) {
      final titleLower = list.name.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.list = list;
    });
  }

}

class CardModel {
  CardModel(this.image, this.name, this.yearReturn, this.risk, this.aum);

  final String image, name;
  final double yearReturn, risk, aum;
}
