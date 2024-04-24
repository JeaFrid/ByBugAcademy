import 'package:flutter/material.dart';
import 'package:highlighting/highlighting.dart';
import 'package:highlighting/languages/dart.dart';

class SyntaxTextEditingController extends TextEditingController {
  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    bool? withComposing,
  }) {
    final highlighted = highlight.parse(text, languageId: dart.id);

    return TextSpan(
      style: style,
      children: _buildList(
        nodes: highlighted.nodes,
        styles: byBugLabTheme,
        ancestorStyle: style,
      ),
    );
  }

  List<TextSpan>? _buildList({
    required List<Node>? nodes,
    required Map<String, TextStyle> styles,
    TextStyle? ancestorStyle,
  }) {
    return nodes
        ?.map(
          (node) => _buildNode(
            node: node,
            styles: styles,
            ancestorStyle: ancestorStyle,
          ),
        )
        .toList(growable: false);
  }

  TextSpan _buildNode({
    required Node node,
    required Map<String, TextStyle> styles,
    TextStyle? ancestorStyle,
  }) {
    final style = styles[node.className] ?? ancestorStyle;

    return TextSpan(
      text: node.value,
      children: _buildList(
        nodes: node.children,
        styles: styles,
        ancestorStyle: style,
      ),
      style: style,
    );
  }
}

const byBugLabTheme = {
  'root': TextStyle(
      color: Color.fromARGB(208, 201, 209, 217),
      backgroundColor: Color.fromARGB(0, 13, 17, 23)),
  'doctag': TextStyle(color: Color(0xffff7b72)),
  'keyword': TextStyle(color: Color(0xffff7b72)),
  'template-tag': TextStyle(color: Color(0xffff7b72)),
  'template-variable': TextStyle(color: Color(0xffff7b72)),
  'type': TextStyle(color: Color(0xffff7b72)),
  'variable.language': TextStyle(color: Color(0xffff7b72)),
  'title': TextStyle(color: Color.fromARGB(255, 187, 123, 255)),
  'title.class': TextStyle(color: Color(0xffd2a8ff)),
  'title.class.inherited': TextStyle(color: Color(0xffd2a8ff)),
  'title.function': TextStyle(color: Color(0xffd2a8ff)),
  'attr': TextStyle(color: Color(0xff79c0ff)),
  'attribute': TextStyle(color: Color(0xff79c0ff)),
  'literal': TextStyle(color: Color(0xff79c0ff)),
  'meta': TextStyle(color: Color(0xff79c0ff)),
  'number': TextStyle(color: Color(0xff79c0ff)),
  'operator': TextStyle(color: Color(0xff79c0ff)),
  'selector-attr': TextStyle(color: Color(0xff79c0ff)),
  'selector-class': TextStyle(color: Color(0xff79c0ff)),
  'selector-id': TextStyle(color: Color(0xff79c0ff)),
  'variable': TextStyle(color: Color(0xff79c0ff)),
  'regexp': TextStyle(color: Color(0xffa5d6ff)),
  'string': TextStyle(color: Color(0xffa5d6ff)),
  'builtin': TextStyle(color: Color(0xffffa657)),
  'symbol': TextStyle(color: Color(0xffffa657)),
  'code': TextStyle(color: Color(0xff8b949e)),
  'comment': TextStyle(color: Color(0xff8b949e)),
  'formula': TextStyle(color: Color(0xff8b949e)),
  'name': TextStyle(color: Color(0xff7ee787)),
  'quote': TextStyle(color: Color(0xff7ee787)),
  'selector-pseudo': TextStyle(color: Color(0xff7ee787)),
  'selector-tag': TextStyle(color: Color(0xff7ee787)),
  'subst': TextStyle(color: Color(0xffc9d1d9)),
  'section': TextStyle(color: Color(0xff1f6feb), fontWeight: FontWeight.w700),
  'bullet': TextStyle(color: Color(0xfff2cc60)),
  'emphasis': TextStyle(color: Color(0xffc9d1d9), fontStyle: FontStyle.italic),
  'strong': TextStyle(color: Color(0xffc9d1d9), fontWeight: FontWeight.w700),
  'addition':
      TextStyle(color: Color(0xffaff5b4), backgroundColor: Color(0xff033a16)),
  'deletion':
      TextStyle(color: Color(0xffffdcd7), backgroundColor: Color(0xff67060c)),
};
