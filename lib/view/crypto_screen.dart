
import 'package:alot/model/crypto_model.dart';
import 'package:flutter/material.dart';
import 'package:alot/view_model/network.dart';
class CryptoScreen extends StatefulWidget {

  @override
  _CryptoScreenState createState() => _CryptoScreenState();
}



class _CryptoScreenState extends State<CryptoScreen> {


  late Future<Crypto> futureCrypto;

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
      body: Center(
        child: RefreshIndicator(
          onRefresh:() => futureCrypto,
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
}
