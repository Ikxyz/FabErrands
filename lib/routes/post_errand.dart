import 'dart:io';
import 'dart:math' as math;
import 'package:path/path.dart' as $path;
import 'package:flutter/cupertino.dart';
import 'package:fab_errands/import.dart';
import 'package:http/http.dart' as http;

final _db = Firestore.instance;

class PostErrandComponent extends StatefulWidget {
  @override
  _PostErrandComponentState createState() => _PostErrandComponentState();
}

class _PostErrandComponentState extends State<PostErrandComponent> {
  var _isWorking = false;
  ErrandClass _errandClass = new ErrandClass();
  TextEditingController _errandTagInputController = TextEditingController();
  GlobalKey<FormState> _errandTagFromKey = GlobalKey<FormState>();
  GlobalKey<FormState> _errandFormKey = GlobalKey<FormState>();
  $AppPostErrandTag _$appPostErrandTag = $AppPostErrandTag();

  _PostErrandComponentState() {
    initializeErrandClass();
  }
  @override
  void initState() {
    _fecthUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Post Errand',
          style: Theme.of(context)
              .textTheme
              .headline
              .copyWith(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Visibility(
              visible: _isWorking,
              child: Center(
                  child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                  strokeWidth: 2,
                ),
              )),
              replacement: CupertinoButton(
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
                onPressed: _postErrand,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                Tooltip(
                  message: 'Title of the Errand',
                  child: textInputHeader(
                    title: 'Errand Title',
                    trailing: '',
                  ),
                ),
                _errandTitleTextInput(),
                Tooltip(
                  message:
                      'How much compensation you\'re offering for completing this errand',
                  child: textInputHeader(
                    title: 'Errand Compensation Amount',
                    trailing: '',
                  ),
                ),
                _errandAmountTextInput(),
                // TextHeader(
                //   title: 'StartUp Category',
                //   trailing: '',
                // ),
                // buildSelectCategory(),
                Tooltip(
                  message:
                      'Detailed description of the what the errand entails',
                  child: textInputHeader(
                    title: 'Errand Description',
                    trailing: '',
                  ),
                ),
                _errandDescTextInput(),

                textInputHeader(
                  title: 'Add Tag',
                  trailing: "(e.g 'food')",
                ),
                Form(
                  key: _errandTagFromKey,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: _errandTagTextInput(),
                      ),
                      RaisedButton(
                        onPressed: _addErrandTag,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        shape: CircleBorder(),
                        color: Colors.blueGrey,
                      )
                    ],
                  ),
                ),
                new Container(
                  height: 40.0,
                  width: getWidth(context),
                  child: Wrap(
                    children: <Widget>[
                      Container(
                        height: 80,
                        child: BlocBuilder(
                          bloc: $AppPostErrandTag(),
                          builder: (BuildContext context, List<String> data) {
                            return Wrap(
                              children: data.map((e) {
                                return Chip(
                                  label: Text(e.toString()),
                                  deleteIconColor: Colors.white,
                                  labelStyle: TextStyle(color: Colors.white),
                                  backgroundColor: Colors.grey,
                                  onDeleted: () {
                                    _errandClass.tag.remove(e);
                                  },
                                );
                              }).toList(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50.0,
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 5.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//#region Method Section

  void initializeErrandClass() async {
    _errandClass = new ErrandClass(
        runner: null,
        owner: null,
        image: [],
        amount: null,
        errandLocation: null,
        errandDesc: null,
        title: null,
        postTimeStamp: null,
        tag: []);
    await _fecthUser();
  }

  void _postErrand() async {
    var _state = _errandFormKey.currentState;
    if (_state.validate() == false) return;

    _state.save();

    print('Errnad Tag: ${_errandClass.toString()}');
    return;
  }

  void _fecthUser() async {
    final _user = userAuth;
    if (_user == null) return;
    UsersProfileClass _userInfo = (() async {
      final e = await db.collection('user').document(_user.uid).get();
      return UsersProfileClass.fromJson(Map<String, dynamic>.from(e.data));
    }) as UsersProfileClass;

    _errandClass.owner = UsersProfileClass(
      email: _user.email,
      uid: _user.uid,
      address: _userInfo.address,
    );
  }

  void _addErrandTag() {
    var _state = _errandTagFromKey.currentState;
    if (_state.validate() == false) return;

    _state.save();
    return;
  }

  void onDeleteErrandTag(e) {
    _$appPostErrandTag.mapEventToState({'type': 'remove', 'data': e});
  }

  void _addImage() async {
    File file = await getImage(camera: false);

//    setState(() {
//      _errandClass.image.add({'file': file, 'path': file.path});
//      print(_errandClass.image);
//    });
  }

  void _progress(bool e) {
    setState(() {
      _isWorking = e;
    });
  }

  Future<String> _uploadStartupImage(Map<String, dynamic> e) async {
    final url = await uploadFile(e['file'], $path.basename(e['file'].path));
    return url;
  }

//endregion

//#region Widget Section
  Widget _errandDescTextInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.text,
        textCapitalization: TextCapitalization.sentences,
        maxLength: 260,
        maxLines: 5,
        onSaved: (val) {
          _errandClass.errandDesc = val;
        },
        autocorrect: true,
        decoration: const InputDecoration(
          filled: true,
          isDense: true,
          hintText: "Write a full description of what your errand entails",
        ),
      ),
    );
  }

  Widget _errandTitleTextInput() => TextFormField(
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.text,
        onSaved: (val) {
          _errandClass.title = val;
        },
        textCapitalization: TextCapitalization.sentences,
        decoration: const InputDecoration(
          isDense: true,
          hintText: "Enter errand title",
        ),
        validator: isNotNull,
      );

  Widget _errandAmountTextInput() => TextFormField(
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        onSaved: (val) {
          _errandClass.amount = val;
        },
        textCapitalization: TextCapitalization.words,
        decoration: const InputDecoration(
          isDense: true,
          hintText: "Enter compensation amount",
        ),
        validator: isNumber,
      );

  Widget _errandTagTextInput() => TextFormField(
        textInputAction: TextInputAction.next,
        controller: _errandTagInputController,
        keyboardType: TextInputType.text,
        onSaved: (val) {
          val = val.trim().toLowerCase();
          // if (_errandClass.tag.contains(val)) return;
          _$appPostErrandTag.mapEventToState({'type': 'add', 'data': val});
          print('done mine');
        },
        textCapitalization: TextCapitalization.none,
        decoration: const InputDecoration(
          isDense: true,
          hintText: "Enter tag",
        ),
        validator: isNotNull,
      );

//endregion  Widget Section
}
