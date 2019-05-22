import 'dart:io';
import 'dart:math' as math;
import 'package:fab_errands/classes/errand_class.dart';
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
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  $AppPostErrandTag _$appPostErrandTag = $AppPostErrandTag();

  _PostErrandComponentState() {
    _initializeErrandClass();
  }
  @override
  void initState() {
    _fecthUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
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
          key: _errandFormKey,
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
                  width: getWidth(context),
                  child: Wrap(
                    children: <Widget>[
                      Container(
                          child: StreamBuilder(
                        stream: _$appPostErrandTag.state,
                        builder: (BuildContext context, AsyncSnapshot data) {
                          print('New Data O ${data.data}');
                          if (data.hasData) {
                            return Wrap(
                              spacing: 5,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              children: [
                                ...data.data.map((e) {
                                  return Chip(
                                    label: Text(e.toString()),
                                    deleteIconColor: Colors.white,
                                    labelStyle: TextStyle(color: Colors.white),
                                    backgroundColor: Colors.grey,
                                    onDeleted: () {
                                      _onDeleteErrandTag(e);
                                    },
                                  );
                                }).toList()
                              ],
                            );
                          }
                          return isLoading(context);
                        },
                      )),
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

  void _initializeErrandClass() async {
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
    _fecthUser();
  }

  void _postErrand() async {
    _progress(true);
    var _state = _errandFormKey.currentState;
    if (_state.validate() == false) {
      _progress(false);
      return null;
    }

    // if (_errandClass.tag.length < 1) {
    //   showSnackBar(_scaffoldState, 'Must enter at least one tag');
    //   _progress(false);
    //   return null;
    // }

    _state.save();
    print(_errandClass.toString());
    _errandClass.tag = [..._errandClass.tag, ..._errandClass.title.split(' ')];

    try {
      await db
          .collection('errand')
          .document(getID(length: 26))
          .setData(ErrandClass.toJson(_errandClass));
      Navigator.of(context).pop();
    } catch (err) {
      showSnackBar(_scaffoldState, err.message);

      _progress(false);
      print(err);
    }

    return null;
  }

  void _fecthUser() async {
    final _user = await auth.currentUser();
    if (_user == null) return null;

    final _owner = UsersProfileClass(
      email: _user.email,
      uid: _user.uid,
      address: null,
    );
    _errandClass.owner = UsersProfileClass.toJson(_owner);
    print('auth complete ${_errandClass.owner}');
  }

  void _addErrandTag() {
    var _state = _errandTagFromKey.currentState;
    if (_state.validate() == false &&
        _$appPostErrandTag.currentState.length >= _$appPostErrandTag.max)
      return;

    _state.save();
    _errandClass.tag = _$appPostErrandTag.currentState;
    _errandTagInputController.clear();
    return;
  }

  void _onDeleteErrandTag(e) {
    e = e.trim().toLowerCase();
    setState(() {
      _$appPostErrandTag.dispatch({'type': 'remove', 'data': e});
    });
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
        maxLength: 500,
        maxLines: 5,
        onSaved: (val) {
          _errandClass.errandDesc = val;
        },
        autocorrect: true,
        validator: isNotNull,
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
        minLines: 1,
        maxLength: 5,
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
        onSaved: (val) async {
          val = val.trim().toLowerCase();
          if (_$appPostErrandTag.currentState.contains(val)) return;
          setState(() {
            _$appPostErrandTag.dispatch({'type': 'add', 'data': val});
          });
        },
        textCapitalization: TextCapitalization.none,
        decoration: const InputDecoration(
          isDense: true,
          hintText: "Enter tag",
        ),
      );

//endregion  Widget Section
}
