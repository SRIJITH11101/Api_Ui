import 'package:flutter/material.dart';
import 'package:task_03/Models/input_details.dart';
import 'package:task_03/Networking/lang_pair.dart';
import 'package:task_03/Screens/display_screen.dart';
import 'package:task_03/Widgets/add_dialog.dart';

class FetchScreen extends StatefulWidget {
  const FetchScreen({super.key});

  @override
  State<FetchScreen> createState() => _FetchScreenState();
}

class _FetchScreenState extends State<FetchScreen> {
  List<String> langNamesList = [];
  List<String> expList = [];
  List<String> comtextList = [];
  List<String> congtextList = [];
  List<String> hdaytextList = [];
  List<String> wdaytextList = [];
  List<String> doctextList = [];
  List<String> lawtextList = [];
  List<String> nottextList = [];
  List<String> privtextList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Interpreting Fees'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return AddDialogWidget(
                    context: context,
                    onSubmittingName: (langPairName,
                        exp,
                        comtext,
                        congtext,
                        hdaytext,
                        wdaytext,
                        doctext,
                        lawtext,
                        nottext,
                        privtext) {
                      setState(() {
                        langNamesList.add(langPairName);
                        expList.add(exp);
                        comtextList.add(comtext);
                        congtextList.add(congtext);
                        hdaytextList.add(hdaytext);
                        wdaytextList.add(wdaytext);
                        doctextList.add(doctext);
                        lawtextList.add(lawtext);
                        nottextList.add(nottext);
                        privtextList.add(privtext);
                      });
                      print(langNamesList);
                      //langNamesList.add(p0);
                    },
                  );
                });
          },
          child: Icon(
            Icons.add,
            color: Colors.orange[300],
          ),
        ),
        body: Center(
            child: langNamesList.isEmpty
                ? Text(
                    'Main display screen',
                    style: TextStyle(fontSize: 20),
                  )
                : ListView.builder(
                    itemCount: langNamesList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        trailing: IconButton(
                            onPressed: () {
                              setState(() {
                                langNamesList.removeAt(index);
                                expList.removeAt(index);
                                comtextList.removeAt(index);
                                congtextList.removeAt(index);
                                hdaytextList.removeAt(index);
                                wdaytextList.removeAt(index);
                                doctextList.removeAt(index);
                                lawtextList.removeAt(index);
                                nottextList.removeAt(index);
                                privtextList.removeAt(index);
                              });
                            },
                            icon: Icon(Icons.delete)),
                        title: TextButton(
                          child: Text(
                            langNamesList[index],
                            style: TextStyle(fontSize: 18),
                          ),
                          onPressed: () async {
                            InputDetails ip = InputDetails(
                              language: langNamesList[index],
                              exp: expList[index],
                              commerce: comtextList[index],
                              congress: congtextList[index],
                              hdr: hdaytextList[index],
                              fdr: wdaytextList[index],
                              doctor: doctextList[index],
                              lawyer: lawtextList[index],
                              notary: nottextList[index],
                              private: privtextList[index],
                            );
                            bool savePressed =
                                await Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return DisplayScreen(
                                  ip: ip,
                                  index: index,
                                );
                              },
                            ));
                            if (savePressed) {
                              DisplayScreen ds = DisplayScreen(
                                ip: ip,
                                index: index,
                              );
                              setState(() {
                                comtextList[index] = DisplayScreen.comtext.text;
                                congtextList[index] =
                                    DisplayScreen.congtext.text;
                                hdaytextList[index] =
                                    DisplayScreen.hdaytext.text;
                                wdaytextList[index] =
                                    DisplayScreen.wdaytext.text;
                                doctextList[index] = DisplayScreen.doctext.text;
                                lawtextList[index] = DisplayScreen.lawtext.text;
                                nottextList[index] = DisplayScreen.nottext.text;
                                privtextList[index] =
                                    DisplayScreen.privtext.text;
                              });
                              print(DisplayScreen.comtext.text);
                            } else {
                              DisplayScreen ds = DisplayScreen(
                                ip: ip,
                                index: index,
                              );
                              //print(DisplayScreen.comtext.text);
                              //print(comtextList[index]);
                            }
                          },
                        ),
                      );
                    },
                  )),
      ),
    );
  }
}
