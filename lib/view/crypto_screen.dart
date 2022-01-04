
import 'package:alot/model/crypto_model.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:alot/view_model/network.dart';
class CryptoScreen extends StatefulWidget {

  @override
  _CryptoScreenState createState() => _CryptoScreenState();
}



class _CryptoScreenState extends State<CryptoScreen> {


  late Future<Crypto>? futureCrypto;


  List<String>? selectedCrypto = [];

  @override
  void initState() {
    futureCrypto = Network().fetchCrypto();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto'),
      ),
      floatingActionButton: FloatingActionButton(
      onPressed: _openFilterDialog,
      tooltip: 'Increment',
    child: Icon(Icons.add),
      ),
      body: Center(
        child: RefreshIndicator(
          onRefresh:() => futureCrypto!,
          child: FutureBuilder<Crypto>(
            future: futureCrypto,
            builder: (context,snapshot){
              if(snapshot.hasError){
                return const Center(
                    child: Text('An error has occured!'));
            }else{
                return ListView.builder(
                    itemCount: snapshot.data!.data.length,
                    itemBuilder: (context, index){
                     return ListTile(
                       leading: Text(snapshot.data!.data[index].symbol),
                        title: Text(snapshot.data!.data[index].name),
                        subtitle: Text(snapshot.data!.data[index].metrics.marketData.priceUsd.toString()),
                      );

                    }
                    );
              }
            }
          ),
        )

        ),
      );
  }

  void _openFilterDialog() async {
    await FilterListDialog.display<String>(
        context,
        listData: otherFunction(),
        selectedListData: selectedCrypto,
        height: 480,
        headlineText: "Select Count",
        searchFieldHintText: "Search Here",
        choiceChipLabel: (item) {
          return item;
        },
        validateSelectedItem: (list, val) {
          return list!.contains(val);
        },
        onItemSearch: (list, text) {
          if (list!.any((element) =>
              element.toLowerCase().contains(text.toLowerCase()))) {
            return list
                .where((element) =>
                element.toLowerCase().contains(text.toLowerCase()))
                .toList();
          }
          else{
            return [];
          }
        },
        onApplyButtonClick: (list) {
          if (list != null) {
            setState(() {
              selectedCrypto = List.from(list);
            });
          }
          Navigator.pop(context);
        });
  }

  otherFunction() async{
    final String cryptoID = (await Network().fetchCrypto()) as String;
  }



}
