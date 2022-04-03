/*
1. Paramparagat Krishi Vikas Yojana (PKVY)

Paramparagat Krishi Vikas Yojana promotes cluster based organic farming with PGS (Participatory Guarantee System) certification. Cluster formation, training, certification and marketing are supported under the scheme. Assistance of Rs. 50,000 per ha /3 years is provided out of which 62 percent (Rs. 31,000) is given as incentive to a farmer towards organic inputs.
https://pgsindia-ncof.gov.in/PKVY/Introduction.aspx

2. Mission Organic Value Chain Development for North Eastern Region (MOVCDNER)

The scheme promotes third party certified organic farming of niche crops of north east region through Farmer Producer Organisations (FPOs) with focus on exports. Farmers are given assistance of Rs 25,000 per hectare for three years for organic inputs including organic manure and bio-fertilisers among other inputs. Support for formation of FPOs, capacity building, post-harvest infrastructure up to Rs 2 crore are also provided in the scheme.
https://asfac.assam.gov.in/frontimpotentdata/mission-organic-value-chain-development

3.Capital Investment Subsidy Scheme (CISS) under Soil Health Management Scheme

Under this scheme, 100 percent assistance is provided to state government, government agencies for setting up of mechanised fruit and vegetable market waste, agro waste compost production unit up to a maximum limit of Rs 190 lakh per unit (3000 Total Per Annum TPA capacity). Similarly, for individuals and private agencies assistance up to 33 percent of cost limit to Rs 63 lakh per unit as capital investment is provided.
https://pib.gov.in/FactsheetDetails.aspx?Id=148597

4. National Food Security Mission (NFSM)

Under NFSM, financial assistance is provided for promotion of bio-fertiliser (Rhizobium/PSB) at 50 percent of the cost limited to Rs 300 per hectare.
https://www.nfsm.gov.in/
As per international resource data from Research Institute of Organic Agriculture (FiBL) and the International Federation of Organic Agriculture Movements (IFOAM) Statistics 2020, India stands at 9th position in terms of certified agricultural land with 1.94 million hectare (2018-19).
*/
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter/widgets.dart';
import 'package:hashd/model/maps.dart';

class GovMissions {
  static List<String> mission = [
    'Farmers Portal by Govt Of India',
    'Paramparagat Krishi Vikas Yojana (PKVY)',
    ' Mission Organic Value Chain Development for North Eastern Region (MOVCDNER)',
    'Capital Investment Subsidy Scheme (CISS) under Soil Health Management Scheme',
    'National Food Security Mission (NFSM)',
  ];
  static List<String> urls = [
    'https://farmer.gov.in/',
    'https://pgsindia-ncof.gov.in/PKVY/Introduction.aspx',
    'https://asfac.assam.gov.in/frontimpotentdata/mission-organic-value-chain-development',
    'https://pib.gov.in/FactsheetDetails.aspx?Id=148597',
    'https://www.nfsm.gov.in/'
  ];
  static List<String> desc = [
    'A government of India website for the welfare and support to the farmers in India',
    'Paramparagat Krishi Vikas Yojana promotes cluster based organic farming with PGS (Participatory Guarantee System) certification. Cluster formation, training, certification and marketing are supported under the scheme. Assistance of Rs. 50,000 per ha /3 years is provided out of which 62 percent (Rs. 31,000) is given as incentive to a farmer towards organic inputs.',
    'The scheme promotes third party certified organic farming of niche crops of north east region through Farmer Producer Organisations (FPOs) with focus on exports. Farmers are given assistance of Rs 25,000 per hectare for three years for organic inputs including organic manure and bio-fertilisers among other inputs. Support for formation of FPOs, capacity building, post-harvest infrastructure up to Rs 2 crore are also provided in the scheme.',
    'Under this scheme, 100 percent assistance is provided to state government, government agencies for setting up of mechanised fruit and vegetable market waste, agro waste compost production unit up to a maximum limit of Rs 190 lakh per unit (3000 Total Per Annum TPA capacity). Similarly, for individuals and private agencies assistance up to 33 percent of cost limit to Rs 63 lakh per unit as capital investment is provided.',
    'Under NFSM, financial assistance is provided for promotion of bio-fertiliser (Rhizobium/PSB) at 50 percent of the cost limited to Rs 300 per hectare.'
  ];

  static Future<bool> callHelpline(String number) async {
    try {
      print("calling number " + number);
      await FlutterPhoneDirectCaller.callNumber(number);
      return true;
    } catch (e) {
      print('cannot call');
      return false;
    }
  }
}

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: Icon(Icons.arrow_back_ios),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Color(0xff587308),
          centerTitle: true,
          title: Text(
            "Info",
            style: TextStyle(fontSize: 40),
          ),
        ),
        body: Container(
          child: ListView.builder(
            itemBuilder: (ctx, index) {
              String heading = GovMissions.mission[index];
              String description = GovMissions.desc[index];
              List<String> descList = description.split(".");
              print(descList);
              return Container(
                margin: EdgeInsets.all(6),
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      )
                    ]),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Flexible(
                            child: Text(
                                heading,
                                maxLines: 5,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: ElevatedButton(child: Icon(Icons.language),onPressed:()async{
                                WebView.openLink(GovMissions.urls[index]);
                          })
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    // StringList(descList),
              
                    Text(
                        description,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: GovMissions.desc.length,
          ),
        ));
  }
}

class StringList extends StatelessWidget {

  late List<String> descList;
  StringList(List<String> descList) {
    this.descList = descList;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context,index) {
          return ListTile(
              title: Text(
                  descList[index],
                style: TextStyle(
                  color: Colors.blue
                ),
              )
          );
        });
  }
}

