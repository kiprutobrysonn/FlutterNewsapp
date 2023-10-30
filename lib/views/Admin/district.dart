import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';

class Home1 extends StatefulWidget {
  const Home1({required Key key}) : super(key: key);

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  late double _distanceToField;
  late TextfieldTagsController _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = TextfieldTagsController();
  }

  static const List<String> _pickLanguage = <String>[
    'Amreli',
    'Aravalli',
    'Bharuch',
    'Junagadh',
    'Gir Somnath',
    'Kheda',
    'Narmada',
    'Mehsana',
    'Panchmahal',
    'Sabarkantha',
    'Porbandar',
    'Surendranagar',
    'Ahmedabad',
    'Surat',
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "wellcome",
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "District",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Autocomplete<String>(
                optionsViewBuilder: (context, onSelected, options) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 4.0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Material(
                        elevation: 4.0,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxHeight: 200),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: options.length,
                            itemBuilder: (BuildContext context, int index) {
                              final dynamic option = options.elementAt(index);
                              return TextButton(
                                onPressed: () {
                                  onSelected(option);
                                },
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0),
                                    child: Text(
                                      '#$option',
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == '') {
                    return const Iterable<String>.empty();
                  }
                  return _pickLanguage.where((String option) {
                    return option.contains(textEditingValue.text.toLowerCase());
                  });
                },
                onSelected: (String selectedTag) {
                  _controller.addTag = selectedTag;
                },
                fieldViewBuilder: (context, ttec, tfn, onFieldSubmitted) {
                  return TextFieldTags(
                    textEditingController: ttec,
                    focusNode: tfn,
                    textfieldTagsController: _controller,
                    initialTags: const [
                      // 'pick',
                      // 'your',
                      // 'favorite',
                      // 'programming',
                      // 'language',
                    ],
                    textSeparators: const [' ', ','],
                    letterCase: LetterCase.normal,
                    // validator: (String tag) {
                    //   if (tag == 'php') {
                    //     return 'No, please just no';
                    //   } else if (_controller.getTags!.contains(tag)) {
                    //     return 'you already entered that';
                    //   }
                    //   return null;
                    // },
                    inputfieldBuilder:
                        (context, tec, fn, error, onChanged, onSubmitted) {
                      return ((context, sc, tags, onTagDelete) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Global Distict Tags",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // Container(
                                //   height: 35,
                                //   child: OutlinedButton(
                                //     style: ButtonStyle(
                                //         // backgroundColor: MaterialStateProperty.all(Colors.blue),
                                //         side: MaterialStateProperty.all(
                                //             BorderSide(color: Colors.blue))),
                                //     onPressed: () {},
                                //     child: Row(
                                //       children: [
                                //         Icon(
                                //           Icons.add,
                                //           color: Colors.blue,
                                //         ),
                                //         SizedBox(
                                //           width: 3,
                                //         ),
                                //         Text(
                                //           "Add District",
                                //           style: TextStyle(
                                //               color: Colors.blue, fontSize: 15),
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // )
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: TextField(
                                controller: tec,
                                focusNode: fn,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  // focusedBorder: const UnderlineInputBorder(
                                  //   borderSide: BorderSide(
                                  //       color: Color.fromARGB(255, 74, 137, 92),
                                  //       width: 3.0),
                                  // ),
                                  helperText: 'Enter District...',
                                  helperStyle: const TextStyle(
                                    color: Colors.blue,
                                  ),
                                  hintText:
                                      _controller.hasTags ? '' : "Add tag...",
                                  errorText: error,
                                  prefixIconConstraints: BoxConstraints(
                                      maxWidth: _distanceToField * 0.74),
                                  prefixIcon: tags.isNotEmpty
                                      ? SingleChildScrollView(
                                          controller: sc,
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                              children: tags.map((String tag) {
                                            return Container(
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(20.0),
                                                ),
                                                color: Colors.blue,
                                              ),
                                              margin: const EdgeInsets.only(
                                                  right: 10.0),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10.0,
                                                      vertical: 4.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  InkWell(
                                                    child: Text(
                                                      '#$tag',
                                                      style: const TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    onTap: () {
                                                      //print("$tag selected");
                                                    },
                                                  ),
                                                  const SizedBox(width: 4.0),
                                                  InkWell(
                                                    child: const Icon(
                                                      Icons.cancel,
                                                      size: 14.0,
                                                      color: Color.fromARGB(
                                                          255, 233, 233, 233),
                                                    ),
                                                    onTap: () {
                                                      onTagDelete(tag);
                                                    },
                                                  )
                                                ],
                                              ),
                                            );
                                          }).toList()),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child:
                                              Icon(Icons.local_offer_outlined),
                                        ),
                                ),
                                onChanged: onChanged,
                                onSubmitted: onSubmitted,
                              ),
                            ),
                          ],
                        );
                      });
                    },
                  );
                },
              ),
              Container(
                width: 200,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.blue,
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('ADD DISTRICT'),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 200,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.blue,
                    ),
                  ),
                  onPressed: () {
                    _controller.clearTags();
                  },
                  child: const Text('CLEAR TAGS'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
