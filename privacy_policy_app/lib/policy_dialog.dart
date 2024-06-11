import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PolicyDialog extends StatefulWidget {
  PolicyDialog({
    Key? key,
    this.radius = 8,
    required this.mdFileName,
  }) : assert(mdFileName.contains('.md'), 'The file must contain the .md extension');

  final double radius;
  final String mdFileName;

  @override
  State<PolicyDialog> createState() => _PolicyDialogState();
}

class _PolicyDialogState extends State<PolicyDialog> {
  final ScrollController _scrollController = ScrollController();
  bool _isAtBottom = false;

  void _scrollListener() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        _isAtBottom = true;
      });
    } else {
      setState(() {
        _isAtBottom = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.radius),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: SingleChildScrollView(
              child: FutureBuilder(
                future: Future.delayed(Duration(milliseconds: 150)).then((value) {
                  return rootBundle.loadString('assets/${widget.mdFileName}');
                }),
                builder: (context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16.0),
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height * 0.7,
                            minHeight: MediaQuery.of(context).size.height * 0.3,
                          ),
                          child: SingleChildScrollView(
                            controller: _scrollController,
                              child: MarkdownBody(data: snapshot.data!)),
                        ),
                        _isAtBottom == true ? ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(widget.radius),
                                bottomRight: Radius.circular(widget.radius),
                              ),
                            ),
                          ),
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              "CLOSE",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ) : SizedBox(),
                      ],
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),

        ],
      ),
    );
  }
}
