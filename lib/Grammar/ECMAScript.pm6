use v6;

#
# ANTLR grammar Copyright 2008 Chris Lambrou. All rights reserved.
#

# XXX 'LT!' => LT_bang
# XXX 'EOF!' => EOF_bang

grammar Grammar::ECMAScript {

  rule LT_bang { <LT> } # XXX Need to research the proper definition
  rule EOF_bang { <EOF> } # XXX Need to research the proper definition

#options
#{
#	backtrack=true;
#	memoize=true;
#}

  #rule program {
  rule TOP {
    <LT_bang>* <sourceElements> <LT_bang>* <EOF_bang>
  }

  rule sourceElements {
    <sourceElement> ( <LT_bang>* <sourceElement> )*
  }

  rule sourceElement {
    <functionDeclaration>
  | <statement>
  }

  #
  # functions
  #
  rule functionDeclaration {
    'function' <LT_bang>* <Identifier> <LT_bang>* <formalParameterList> <LT_bang>* <functionBody>
  }

  rule functionExpression {
    'function' <LT_bang>* <Identifier>? <LT_bang>* <formalParameterList> <LT_bang>* <functionBody>
  }

  rule formalParameterList {
    '(' (<LT_bang>* <Identifier> (<LT_bang>* ',' <LT_bang>* <Identifier>)*)? <LT_bang>* ')'
  }

  rule functionBody {
    '{' <LT_bang>* <sourceElements> <LT_bang>* '}'
  }

  #
  # statements
  #
  rule statement {
    <statementBlock>
  | <variableStatement>
  | <emptyStatement>
  | <expressionStatement>
  | <ifStatement>
  | <iterationStatement>
  | <continueStatement>
  | <breakStatement>
  | <returnStatement>
  | <withStatement>
  | <labelledStatement>
  | <switchStatement>
  | <throwStatement>
  | <tryStatement>
  }

  rule statementBlock {
    '{' <LT_bang>* <statementList>? <LT_bang>* '}'
  }

  rule statementList {
    <statement> (<LT_bang>* <statement>)*
  }

  rule variableStatement {
    'var' <LT_bang>* <variableDeclarationList> ( <LT> | ';' ) # ! # XXX Need to represent bang
  }

  rule variableDeclarationList {
    <variableDeclaration> ( <LT_bang>* ',' <LT_bang>* <variableDeclaration> )*
  }

  rule variableDeclarationListNoIn {
    <variableDeclarationNoIn> ( <LT_bang>* ',' <LT_bang>* <variableDeclarationNoIn> )*
  }

  rule variableDeclaration {
    <Identifier> <LT_bang>* <initialiser>?
  }

  rule variableDeclarationNoIn {
    <Identifier> <LT_bang>* <initialiserNoIn>?
  }

  rule initialiser {
    '=' <LT_bang>* <assignmentExpression>
  }

  rule initialiserNoIn {
    '=' <LT_bang>* <assignmentExpressionNoIn>
  }

  #
  # Literal
  #
  rule emptyStatement {
    ';'
  }

  rule expressionStatement {
    <expression> ( <LT> | ';' ) # ! # XXX Need to represent bang
  }

  rule ifStatement {
    'if' <LT_bang>* '(' <LT_bang>* <expression> <LT_bang>* ')' <LT_bang>* <statement> ( <LT_bang>* 'else' <LT_bang>* <statement> )?
  }

  rule iterationStatement {
    <doWhileStatement>
  | <whileStatement>
  | <forStatement>
  | <forInStatement>
  }

  rule doWhileStatement {
    'do' <LT_bang>* <statement> <LT_bang>* 'while' <LT_bang>* '(' <expression> ')' ( <LT> | ';' ) # ! # XXX Need to represent bang
  }

  rule whileStatement {
    'while' <LT_bang>* '(' <LT_bang>* <expression> <LT_bang>* ')' <LT_bang>* <statement>
  }

  rule forStatement {
    'for' <LT_bang>* '(' ( <LT_bang>* <forStatementInitialiserPart> )? <LT_bang>* ';' ( <LT_bang>* <expression> )? <LT_bang>* ';' ( <LT_bang>* <expression> )? <LT_bang>* ')' <LT_bang>* <statement>
  }

  rule forStatementInitialiserPart {
    <expressionNoIn>
  | 'var' <LT_bang>* <variableDeclarationListNoIn>
  }

  rule forInStatement {
    'for' <LT_bang>* '(' <LT_bang>* <forInStatementInitialiserPart> <LT_bang>* 'in' <LT_bang>* <expression> <LT_bang>* ')' <LT_bang>* <statement>
  }

  rule forInStatementInitialiserPart {
    <leftHandSideExpression>
  | 'var' <LT_bang>* <variableDeclarationNoIn>
  }

  rule continueStatement {
    'continue' <Identifier>? ( <LT> | ';' ) # ! # XXX Need to express the bang
  }

  rule breakStatement {
    'break' <Identifier>? ( <LT> | ';' ) # ! # XXX Need to express the bang
  }

  rule returnStatement {
    'return' <expression>? ( <LT> | ';' ) # ! # XXX Need to express the bang
  }

  rule withStatement {
    'with' <LT_bang>* '(' <LT_bang>* <expression> <LT_bang>* ')' <LT_bang>* <statement>
  }

  rule labelledStatement {
    <Identifier> <LT_bang>* ':' <LT_bang>* <statement>
  }

  rule switchStatement {
    'switch' <LT_bang>* '(' <LT_bang>* <expression> <LT_bang>* ')' <LT_bang>* <caseBlock>
  }

  rule caseBlock {
    '{' ( <LT_bang>* <caseClause> )* ( <LT_bang>* <defaultClause> ( <LT_bang>* <caseClause> )* )? <LT_bang>* '}'
  }

  rule caseClause {
    'case' <LT_bang>* <expression> <LT_bang>* ':' <LT_bang>* <statementList>?
  }

  rule defaultClause {
    'default' <LT_bang>* ':' <LT_bang>* <statementList>?
  }

  rule throwStatement {
    'throw' <expression> ( <LT> | ';' ) # ! # XXX Need to express the bang
  }

  rule tryStatement {
    'try' <LT_bang>* <statementBlock> <LT_bang>* ( <finallyClause> | <catchClause> ( <LT_bang>* <finallyClause> )? )
  }

  rule catchClause {
    'catch' <LT_bang>* '(' <LT_bang>* <Identifier> <LT_bang>* ')' <LT_bang>* statementBlock
  }

  rule finallyClause {
    'finally' <LT_bang>* <statementBlock>
  }

  #
  # expressions
  #
  rule expression {
    <assignmentExpression> ( <LT_bang>* ',' <LT_bang>* <assignmentExpression> )*
  }

  rule expressionNoIn {
    <assignmentExpressionNoIn> ( <LT_bang>* ',' <LT_bang>* <assignmentExpressionNoIn> )*
  }

  rule assignmentExpression {
    <conditionalExpression>
  | <leftHandSideExpression> <LT_bang>* <assignmentOperator> <LT_bang>* <assignmentExpression>
  }

  rule assignmentExpressionNoIn {
    <conditionalExpressionNoIn>
  | <leftHandSideExpression> <LT_bang>* <assignmentOperator> <LT_bang>* <assignmentExpressionNoIn>
  }

  rule leftHandSideExpression {
    <callExpression>
  | <newExpression>
  }

  rule newExpression {
    <memberExpression>
  | 'new' <LT_bang>* <newExpression>
  }

  rule memberExpression {
    ( <primaryExpression> | <functionExpression> | 'new' <LT_bang>* <memberExpression> <LT_bang>* <arguments> ) ( <LT_bang>* <memberExpressionSuffix> )*
  }

  rule memberExpressionSuffix {
    <indexSuffix>
  | <propertyReferenceSuffix>
  }

  rule callExpression {
    <memberExpression> <LT_bang>* <arguments> ( <LT_bang>* <callExpressionSuffix> )*
  }

  rule callExpressionSuffix {
    <arguments>
  | <indexSuffix>
  | <propertyReferenceSuffix>
  }

  rule arguments {
    '(' (<LT_bang>* assignmentExpression (<LT_bang>* ',' <LT_bang>* assignmentExpression)*)? <LT_bang>* ')'
  }

  rule indexSuffix {
    '[' <LT_bang>* expression <LT_bang>* ']'
  }	

  rule propertyReferenceSuffix {
    '.' <LT_bang>* <Identifier>
  }

  #
  # Literal
  #
  rule assignmentOperator {
    '=' | '*=' | '/=' | '%=' | '+=' | '-=' | '<<=' | '>>=' | '>>>=' | '&=' | '^=' | '|='
  }

  rule conditionalExpression {
    <logicalORExpression> ( <LT_bang>* '?' <LT_bang>* <assignmentExpression> <LT_bang>* ':' <LT_bang>* <assignmentExpression> )?
  }

  rule conditionalExpressionNoIn {
    <logicalORExpressionNoIn> ( <LT_bang>* '?' <LT_bang>* <assignmentExpressionNoIn> <LT_bang>* ':' <LT_bang>* <assignmentExpressionNoIn> )?
  }

  rule logicalORExpression {
    <logicalANDExpression> (<LT_bang>* '||' <LT_bang>* <logicalANDExpression> )*
  }

  rule logicalORExpressionNoIn {
    <logicalANDExpressionNoIn> ( <LT_bang>* '||' <LT_bang>* <logicalANDExpressionNoIn> )*
  }

  rule logicalANDExpression {
    <bitwiseORExpression> ( <LT_bang>* '&&' <LT_bang>* <bitwiseORExpression> )*
  }

  rule logicalANDExpressionNoIn {
    <bitwiseORExpressionNoIn> ( <LT_bang>* '&&' <LT_bang>* <bitwiseORExpressionNoIn> )*
  }

  rule bitwiseORExpression {
    <bitwiseXORExpression> ( <LT_bang>* '|' <LT_bang>* <bitwiseXORExpression> )*
  }

  rule bitwiseORExpressionNoIn {
    <bitwiseXORExpressionNoIn> ( <LT_bang>* '|' <LT_bang>* <bitwiseXORExpressionNoIn> )*
  }

  rule bitwiseXORExpression {
    <bitwiseANDExpression> ( <LT_bang>* '^' <LT_bang>* <bitwiseANDExpression> )*
  }

  rule bitwiseXORExpressionNoIn {
    <bitwiseANDExpressionNoIn> ( <LT_bang>* '^' <LT_bang>* <bitwiseANDExpressionNoIn> )*
  }

  rule bitwiseANDExpression {
    <equalityExpression> ( <LT_bang>* '&' <LT_bang>* <equalityExpression> )*
  }

  rule bitwiseANDExpressionNoIn {
    <equalityExpressionNoIn> ( <LT_bang>* '&' <LT_bang>* <equalityExpressionNoIn> )*
  }

  rule equalityExpression {
    <relationalExpression> ( <LT_bang>* ('==' | '!=' | '===' | '!==') <LT_bang>* <relationalExpression> )*
  }

  rule equalityExpressionNoIn {
    <relationalExpressionNoIn> ( <LT_bang>* ('==' | '!=' | '===' | '!==') <LT_bang>* <relationalExpressionNoIn> )*
  }

  rule relationalExpression {
    <shiftExpression> ( <LT_bang>* ('<' | '>' | '<=' | '>=' | 'instanceof' | 'in') <LT_bang>* <shiftExpression> )*
  }

  rule relationalExpressionNoIn {
    <shiftExpression> ( <LT_bang>* ('<' | '>' | '<=' | '>=' | 'instanceof') <LT_bang>* <shiftExpression> )*
  }

  rule shiftExpression {
    <additiveExpression> ( <LT_bang>* ('<<' | '>>' | '>>>') <LT_bang>* <additiveExpression> )*
  }

  rule additiveExpression {
    <multiplicativeExpression> ( <LT_bang>* ('+' | '-') <LT_bang>* <multiplicativeExpression> )*
  }

  rule multiplicativeExpression {
    <unaryExpression> ( <LT_bang>* ('*' | '/' | '%') <LT_bang>* <unaryExpression> )*
  }

  rule unaryExpression {
    <postfixExpression>
  | ( 'delete' | 'void' | 'typeof' | '++' | '--' | '+' | '-' | '~' | '!' ) <unaryExpression>
  }

  rule postfixExpression {
    <leftHandSideExpression> ( '++' | '--' )?
  }

  rule primaryExpression {
    'this'
  | <Identifier>
  | <literal>
  | <arrayLiteral>
  | <objectLiteral>
  | '(' <LT_bang>* <expression> <LT_bang>* ')'
  }

  #
  # arrayLiteral definition.
  #
  rule arrayLiteral {
    '[' <LT_bang>* <assignmentExpression>? ( <LT_bang>* ',' ( <LT_bang>* <assignmentExpression> )? )* <LT_bang>* ']'
  }

  #
  # objectLiteral definition.
  #
  rule objectLiteral {
    '{' <LT_bang>* <propertyNameAndValue> ( <LT_bang>* ',' <LT_bang>* <propertyNameAndValue> )* <LT_bang>* '}'
  }

  rule propertyNameAndValue {
    <propertyName> <LT_bang>* ':' <LT_bang>* <assignmentExpression>
  }

  rule propertyName {
    <Identifier>
  | <StringLiteral>
  | <NumericLiteral>
  }

  #
  # primitive literal definition.
  #
  rule literal {
    'null'
  | 'true'
  | 'false'
  | <StringLiteral>
  | <NumericLiteral>
  }

  #
  # lexer rules.
  #
  rule StringLiteral {
    '"' <DoubleStringCharacter>* '"'
  | '\'' <SingleStringCharacter>* '\''
  }

  # XXX Refactor the ~() block out for later use.
  rule DoubleStringNonCharacter { <[ " \\ \n \r \x[2028] \x[2029] ]> }
  rule DoubleStringCharacter {
#    ~( '"' | '\\' | <LT> )
#  | '\\' <EscapeSequence>
    '\\' <EscapeSequnence>
  | <!DoubleStringNonCharacter>
  }

  # XXX Refactor the ~() block out for later use.
  rule SingleStringNonCharacter { <[ ' \\ \n \r \x[2028] \x[2029] ]> }
  rule SingleStringCharacter {
#    ~( '\'' | '\\' | <LT> )
#  | '\\' <EscapeSequence>
    '\\' <EscapeSequnence>
  | <!SingleStringNonCharacter>
  }

  rule EOF {
    $$
  }

  rule EscapeSequence {
    <CharacterEscapeSequence>
  | '0'
  | <HexEscapeSequence>
  | <UnicodeEscapeSequence>
  }

  rule CharacterEscapeSequence {
    <SingleEscapeCharacter>
  | <NonEscapeCharacter>
  }

  # XXX Refactor out the ~() for later use
  rule EscapeOrWhitespaceCharacter { <EscapeCharacter> | <LT> }
  rule NonEscapeCharacter {
#    ~( <EscapeCharacter> | <LT> )
    <!EscapeOrWhitespaceCharacter>
  }

  #
  # Literal
  #
  rule SingleEscapeCharacter {
    '\'' | '"' | '\\' | 'b' | 'f' | 'n' | 'r' | 't' | 'v'
  }

  rule EscapeCharacter {
    <SingleEscapeCharacter>
  | <DecimalDigit>
  | 'x'
  | 'u'
  }

  rule HexEscapeSequence {
    'x' <HexDigit> <HexDigit>
  }

  rule UnicodeEscapeSequence {
    'u' <HexDigit> <HexDigit> <HexDigit> <HexDigit>
  }

  rule NumericLiteral {
    <DecimalLiteral>
  | <HexIntegerLiteral>
  }

  rule HexIntegerLiteral {
    '0' <[xX]> <HexDigit>+
  }

  rule HexDigit {
    <DecimalDigit> | <[a..f]> | <[A..F]>
  }

  rule DecimalLiteral {
    <DecimalDigit>+ '.' <DecimalDigit>* <ExponentPart>?
  | '.'? <DecimalDigit>+ <ExponentPart>?
  }

  #
  # Literal
  #
  rule DecimalDigit {
    <[0..9]>
  }

  rule ExponentPart {
    <[eE]> <[+-]>? <DecimalDigit>+
  }

  rule Identifier {
    <IdentifierStart> <IdentifierPart>*
  }

  rule IdentifierStart {
    <UnicodeLetter>
  | '$'
  | '_'
  | '\\' <UnicodeEscapeSequence>
  }

  rule IdentifierPart {
    # Avoids ambiguity, as some <IdentifierStart> chars also match
    # following alternatives.
# XXX May not be the right thing...
#    ( <IdentifierStart> ) => <IdentifierStart>
    <IdentifierStart>
  | <UnicodeDigit>
  | <UnicodeConnectorPunctuation>
  }

  # Any character in the Unicode categories "Uppercase letter (Lu)", 
  # "Lowercase letter (Ll)", "Titlecase letter (Lt)",
  # "Modifier letter (Lm)", "Other letter (Lo)", or "Letter number (Nl)".
  #
  # Literal
  #
  rule UnicodeLetter {
    <[\x[0041]..\x[005A]]>
  | <[\x[0061]..\x[007A]]>
  | \x[00AA]
  | \x[00B5]
  | \x[00BA]
  | <[\x[00C0]..\x[00D6]]>
  | <[\x[00D8]..\x[00F6]]>
  | <[\x[00F8]..\x[021F]]>
  | <[\x[0222]..\x[0233]]>
  | <[\x[0250]..\x[02AD]]>
  | <[\x[02B0]..\x[02B8]]>
  | <[\x[02BB]..\x[02C1]]>
  | <[\x[02D0]..\x[02D1]]>
  | <[\x[02E0]..\x[02E4]]>
  | \x[02EE]
  | \x[037A]
  | \x[0386]
  | <[\x[0388]..\x[038A]]>
  | \x[038C]
  | <[\x[038E]..\x[03A1]]>
  | <[\x[03A3]..\x[03CE]]>
  | <[\x[03D0]..\x[03D7]]>
  | <[\x[03DA]..\x[03F3]]>
  | <[\x[0400]..\x[0481]]>
  | <[\x[048C]..\x[04C4]]>
  | <[\x[04C7]..\x[04C8]]>
  | <[\x[04CB]..\x[04CC]]>
  | <[\x[04D0]..\x[04F5]]>
  | <[\x[04F8]..\x[04F9]]>
  | <[\x[0531]..\x[0556]]>
  | \x[0559]
  | <[\x[0561]..\x[0587]]>
  | <[\x[05D0]..\x[05EA]]>
  | <[\x[05F0]..\x[05F2]]>
  | <[\x[0621]..\x[063A]]>
  | <[\x[0640]..\x[064A]]>
  | <[\x[0671]..\x[06D3]]>
  | \x[06D5]
  | <[\x[06E5]..\x[06E6]]>
  | <[\x[06FA]..\x[06FC]]>
  | \x[0710]
  | <[\x[0712]..\x[072C]]>
  | <[\x[0780]..\x[07A5]]>
  | <[\x[0905]..\x[0939]]>
  | \x[093D]
  | \x[0950]
  | <[\x[0958]..\x[0961]]>
  | <[\x[0985]..\x[098C]]>
  | <[\x[098F]..\x[0990]]>
  | <[\x[0993]..\x[09A8]]>
  | <[\x[09AA]..\x[09B0]]>
  | \x[09B2]
  | <[\x[09B6]..\x[09B9]]>
  | <[\x[09DC]..\x[09DD]]>
  | <[\x[09DF]..\x[09E1]]>
  | <[\x[09F0]..\x[09F1]]>
  | <[\x[0A05]..\x[0A0A]]>
  | <[\x[0A0F]..\x[0A10]]>
  | <[\x[0A13]..\x[0A28]]>
  | <[\x[0A2A]..\x[0A30]]>
  | <[\x[0A32]..\x[0A33]]>
  | <[\x[0A35]..\x[0A36]]>
  | <[\x[0A38]..\x[0A39]]>
  | <[\x[0A59]..\x[0A5C]]>
  | \x[0A5E]
  | <[\x[0A72]..\x[0A74]]>
  | <[\x[0A85]..\x[0A8B]]>
  | \x[0A8D]
  | <[\x[0A8F]..\x[0A91]]>
  | <[\x[0A93]..\x[0AA8]]>
  | <[\x[0AAA]..\x[0AB0]]>
  | <[\x[0AB2]..\x[0AB3]]>
  | <[\x[0AB5]..\x[0AB9]]>
  | \x[0ABD]
  | \x[0AD0]
  | \x[0AE0]
  | <[\x[0B05]..\x[0B0C]]>
  | <[\x[0B0F]..\x[0B10]]>
  | <[\x[0B13]..\x[0B28]]>
  | <[\x[0B2A]..\x[0B30]]>
  | <[\x[0B32]..\x[0B33]]>
  | <[\x[0B36]..\x[0B39]]>
  | \x[0B3D]
  | <[\x[0B5C]..\x[0B5D]]>
  | <[\x[0B5F]..\x[0B61]]>
  | <[\x[0B85]..\x[0B8A]]>
  | <[\x[0B8E]..\x[0B90]]>
  | <[\x[0B92]..\x[0B95]]>
  | <[\x[0B99]..\x[0B9A]]>
  | \x[0B9C]
  | <[\x[0B9E]..\x[0B9F]]>
  | <[\x[0BA3]..\x[0BA4]]>
  | <[\x[0BA8]..\x[0BAA]]>
  | <[\x[0BAE]..\x[0BB5]]>
  | <[\x[0BB7]..\x[0BB9]]>
  | <[\x[0C05]..\x[0C0C]]>
  | <[\x[0C0E]..\x[0C10]]>
  | <[\x[0C12]..\x[0C28]]>
  | <[\x[0C2A]..\x[0C33]]>
  | <[\x[0C35]..\x[0C39]]>
  | <[\x[0C60]..\x[0C61]]>
  | <[\x[0C85]..\x[0C8C]]>
  | <[\x[0C8E]..\x[0C90]]>
  | <[\x[0C92]..\x[0CA8]]>
  | <[\x[0CAA]..\x[0CB3]]>
  | <[\x[0CB5]..\x[0CB9]]>
  | \x[0CDE]
  | <[\x[0CE0]..\x[0CE1]]>
  | <[\x[0D05]..\x[0D0C]]>
  | <[\x[0D0E]..\x[0D10]]>
  | <[\x[0D12]..\x[0D28]]>
  | <[\x[0D2A]..\x[0D39]]>
  | <[\x[0D60]..\x[0D61]]>
  | <[\x[0D85]..\x[0D96]]>
  | <[\x[0D9A]..\x[0DB1]]>
  | <[\x[0DB3]..\x[0DBB]]>
  | \x[0DBD]
  | <[\x[0DC0]..\x[0DC6]]>
  | <[\x[0E01]..\x[0E30]]>
  | <[\x[0E32]..\x[0E33]]>
  | <[\x[0E40]..\x[0E46]]>
  | <[\x[0E81]..\x[0E82]]>
  | \x[0E84]
  | <[\x[0E87]..\x[0E88]]>
  | \x[0E8A]
  | \x[0E8D]
  | <[\x[0E94]..\x[0E97]]>
  | <[\x[0E99]..\x[0E9F]]>
  | <[\x[0EA1]..\x[0EA3]]>
  | \x[0EA5]
  | \x[0EA7]
  | <[\x[0EAA]..\x[0EAB]]>
  | <[\x[0EAD]..\x[0EB0]]>
  | <[\x[0EB2]..\x[0EB3]]>
  | <[\x[0EBD]..\x[0EC4]]>
  | \x[0EC6]
  | <[\x[0EDC]..\x[0EDD]]>
  | \x[0F00]
  | <[\x[0F40]..\x[0F6A]]>
  | <[\x[0F88]..\x[0F8B]]>
  | <[\x[1000]..\x[1021]]>
  | <[\x[1023]..\x[1027]]>
  | <[\x[1029]..\x[102A]]>
  | <[\x[1050]..\x[1055]]>
  | <[\x[10A0]..\x[10C5]]>
  | <[\x[10D0]..\x[10F6]]>
  | <[\x[1100]..\x[1159]]>
  | <[\x[115F]..\x[11A2]]>
  | <[\x[11A8]..\x[11F9]]>
  | <[\x[1200]..\x[1206]]>
  | <[\x[1208]..\x[1246]]>
  | \x[1248]
  | <[\x[124A]..\x[124D]]>
  | <[\x[1250]..\x[1256]]>
  | \x[1258]
  | <[\x[125A]..\x[125D]]>
  | <[\x[1260]..\x[1286]]>
  | \x[1288]
  | <[\x[128A]..\x[128D]]>
  | <[\x[1290]..\x[12AE]]>
  | \x[12B0]
  | <[\x[12B2]..\x[12B5]]>
  | <[\x[12B8]..\x[12BE]]>
  | \x[12C0]
  | <[\x[12C2]..\x[12C5]]>
  | <[\x[12C8]..\x[12CE]]>
  | <[\x[12D0]..\x[12D6]]>
  | <[\x[12D8]..\x[12EE]]>
  | <[\x[12F0]..\x[130E]]>
  | \x[1310]
  | <[\x[1312]..\x[1315]]>
  | <[\x[1318]..\x[131E]]>
  | <[\x[1320]..\x[1346]]>
  | <[\x[1348]..\x[135A]]>
  | <[\x[13A0]..\x[13B0]]>
  | <[\x[13B1]..\x[13F4]]>
  | <[\x[1401]..\x[1676]]>
  | <[\x[1681]..\x[169A]]>
  | <[\x[16A0]..\x[16EA]]>
  | <[\x[1780]..\x[17B3]]>
  | <[\x[1820]..\x[1877]]>
  | <[\x[1880]..\x[18A8]]>
  | <[\x[1E00]..\x[1E9B]]>
  | <[\x[1EA0]..\x[1EE0]]>
  | <[\x[1EE1]..\x[1EF9]]>
  | <[\x[1F00]..\x[1F15]]>
  | <[\x[1F18]..\x[1F1D]]>
  | <[\x[1F20]..\x[1F39]]>
  | <[\x[1F3A]..\x[1F45]]>
  | <[\x[1F48]..\x[1F4D]]>
  | <[\x[1F50]..\x[1F57]]>
  | \x[1F59]
  | \x[1F5B]
  | \x[1F5D]
  | <[\x[1F5F]..\x[1F7D]]>
  | <[\x[1F80]..\x[1FB4]]>
  | <[\x[1FB6]..\x[1FBC]]>
  | \x[1FBE]
  | <[\x[1FC2]..\x[1FC4]]>
  | <[\x[1FC6]..\x[1FCC]]>
  | <[\x[1FD0]..\x[1FD3]]>
  | <[\x[1FD6]..\x[1FDB]]>
  | <[\x[1FE0]..\x[1FEC]]>
  | <[\x[1FF2]..\x[1FF4]]>
  | <[\x[1FF6]..\x[1FFC]]>
  | \x[207F]
  | \x[2102]
  | \x[2107]
  | <[\x[210A]..\x[2113]]>
  | \x[2115]
  | <[\x[2119]..\x[211D]]>
  | \x[2124]
  | \x[2126]
  | \x[2128]
  | <[\x[212A]..\x[212D]]>
  | <[\x[212F]..\x[2131]]>
  | <[\x[2133]..\x[2139]]>
  | <[\x[2160]..\x[2183]]>
  | <[\x[3005]..\x[3007]]>
  | <[\x[3021]..\x[3029]]>
  | <[\x[3031]..\x[3035]]>
  | <[\x[3038]..\x[303A]]>
  | <[\x[3041]..\x[3094]]>
  | <[\x[309D]..\x[309E]]>
  | <[\x[30A1]..\x[30FA]]>
  | <[\x[30FC]..\x[30FE]]>
  | <[\x[3105]..\x[312C]]>
  | <[\x[3131]..\x[318E]]>
  | <[\x[31A0]..\x[31B7]]>
  | \x[3400]
  | \x[4DB5]
  | \x[4E00]
  | \x[9FA5]
  | <[\x[A000]..\x[A48C]]>
  | \x[AC00]
  | \x[D7A3]
  | <[\x[F900]..\x[FA2D]]>
  | <[\x[FB00]..\x[FB06]]>
  | <[\x[FB13]..\x[FB17]]>
  | \x[FB1D]
  | <[\x[FB1F]..\x[FB28]]>
  | <[\x[FB2A]..\x[FB36]]>
  | <[\x[FB38]..\x[FB3C]]>
  | \x[FB3E]
  | <[\x[FB40]..\x[FB41]]>
  | <[\x[FB43]..\x[FB44]]>
  | <[\x[FB46]..\x[FBB1]]>
  | <[\x[FBD3]..\x[FD3D]]>
  | <[\x[FD50]..\x[FD8F]]>
  | <[\x[FD92]..\x[FDC7]]>
  | <[\x[FDF0]..\x[FDFB]]>
  | <[\x[FE70]..\x[FE72]]>
  | \x[FE74]
  | <[\x[FE76]..\x[FEFC]]>
  | <[\x[FF21]..\x[FF3A]]>
  | <[\x[FF41]..\x[FF5A]]>
  | <[\x[FF66]..\x[FFBE]]>
  | <[\x[FFC2]..\x[FFC7]]>
  | <[\x[FFCA]..\x[FFCF]]>
  | <[\x[FFD2]..\x[FFD7]]>
  | <[\x[FFDA]..\x[FFDC]]>
  }

  # Any character in the Unicode categories "Non-spacing mark (Mn)"
  # or "Combining spacing mark (Mc)".
  #
  # Literal
  #
  rule UnicodeCombiningMark {
    <[\x[0300]..\x[034E]]>
  | <[\x[0360]..\x[0362]]>
  | <[\x[0483]..\x[0486]]>
  | <[\x[0591]..\x[05A1]]>
  | <[\x[05A3]..\x[05B9]]>
  | <[\x[05BB]..\x[05BD]]>
  | \x[05BF] 
  | <[\x[05C1]..\x[05C2]]>
  | \x[05C4]
  | <[\x[064B]..\x[0655]]>
  | \x[0670]
  | <[\x[06D6]..\x[06DC]]>
  | <[\x[06DF]..\x[06E4]]>
  | <[\x[06E7]..\x[06E8]]>
  | <[\x[06EA]..\x[06ED]]>
  | \x[0711]
  | <[\x[0730]..\x[074A]]>
  | <[\x[07A6]..\x[07B0]]>
  | <[\x[0901]..\x[0903]]>
  | \x[093C]
  | <[\x[093E]..\x[094D]]>
  | <[\x[0951]..\x[0954]]>
  | <[\x[0962]..\x[0963]]>
  | <[\x[0981]..\x[0983]]>
  | <[\x[09BC]..\x[09C4]]>
  | <[\x[09C7]..\x[09C8]]>
  | <[\x[09CB]..\x[09CD]]>
  | \x[09D7]
  | <[\x[09E2]..\x[09E3]]>
  | \x[0A02]
  | \x[0A3C]
  | <[\x[0A3E].\x[0A42]]>
  | <[\x[0A47].\x[0A48]]>
  | <[\x[0A4B].\x[0A4D]]>
  | <[\x[0A70].\x[0A71]]>
  | <[\x[0A81].\x[0A83]]>
  | \x[0ABC]
  | <[\x[0ABE]..\x[0AC5]]>
  | <[\x[0AC7]..\x[0AC9]]>
  | <[\x[0ACB]..\x[0ACD]]>
  | <[\x[0B01]..\x[0B03]]>
  | \x[0B3C]
  | <[\x[0B3E]..\x[0B43]]>
  | <[\x[0B47]..\x[0B48]]>
  | <[\x[0B4B]..\x[0B4D]]>
  | <[\x[0B56]..\x[0B57]]>
  | <[\x[0B82]..\x[0B83]]>
  | <[\x[0BBE]..\x[0BC2]]>
  | <[\x[0BC6]..\x[0BC8]]>
  | <[\x[0BCA]..\x[0BCD]]>
  | \x[0BD7]
  | <[\x[0C01]..\x[0C03]]>
  | <[\x[0C3E]..\x[0C44]]>
  | <[\x[0C46]..\x[0C48]]>
  | <[\x[0C4A]..\x[0C4D]]>
  | <[\x[0C55]..\x[0C56]]>
  | <[\x[0C82]..\x[0C83]]>
  | <[\x[0CBE]..\x[0CC4]]>
  | <[\x[0CC6]..\x[0CC8]]>
  | <[\x[0CCA]..\x[0CCD]]>
  | <[\x[0CD5]..\x[0CD6]]>
  | <[\x[0D02]..\x[0D03]]>
  | <[\x[0D3E]..\x[0D43]]>
  | <[\x[0D46]..\x[0D48]]>
  | <[\x[0D4A]..\x[0D4D]]>
  | \x[0D57]
  | <[\x[0D82]..\x[0D83]]>
  | \x[0DCA]
  | <[\x[0DCF]..\x[0DD4]]>
  | \x[0DD6]
  | <[\x[0DD8]..\x[0DDF]]>
  | <[\x[0DF2]..\x[0DF3]]>
  | \x[0E31]
  | <[\x[0E34]..\x[0E3A]]>
  | <[\x[0E47]..\x[0E4E]]>
  | \x[0EB1]
  | <[\x[0EB4]..\x[0EB9]]>
  | <[\x[0EBB]..\x[0EBC]]>
  | <[\x[0EC8]..\x[0ECD]]>
  | <[\x[0F18]..\x[0F19]]>
  | \x[0F35]
  | \x[0F37]
  | \x[0F39]
  | <[\x[0F3E]..\x[0F3F]]>
  | <[\x[0F71]..\x[0F84]]>
  | <[\x[0F86]..\x[0F87]]>
  | <[\x[0F90]..\x[0F97]]>
  | <[\x[0F99]..\x[0FBC]]>
  | \x[0FC6]
  | <[\x[102C]..\x[1032]]>
  | <[\x[1036]..\x[1039]]>
  | <[\x[1056]..\x[1059]]>
  | <[\x[17B4]..\x[17D3]]>
  | \x[18A9]
  | <[\x[20D0]..\x[20DC]]>
  | \x[20E1]
  | <[\x[302A]..\x[302F]]>
  | <[\x[3099]..\x[309A]]>
  | \x[FB1E]
  | <[\x[FE20]..\x[FE23]]>
  }

  # Any character in the Unicode category "Decimal number (Nd)".
  #
  # Literal
  #
  rule UnicodeDigit {
    <[\x[0030]..\x[0039]]>
  | <[\x[0660]..\x[0669]]>
  | <[\x[06F0]..\x[06F9]]>
  | <[\x[0966]..\x[096F]]>
  | <[\x[09E6]..\x[09EF]]>
  | <[\x[0A66]..\x[0A6F]]>
  | <[\x[0AE6]..\x[0AEF]]>
  | <[\x[0B66]..\x[0B6F]]>
  | <[\x[0BE7]..\x[0BEF]]>
  | <[\x[0C66]..\x[0C6F]]>
  | <[\x[0CE6]..\x[0CEF]]>
  | <[\x[0D66]..\x[0D6F]]>
  | <[\x[0E50]..\x[0E59]]>
  | <[\x[0ED0]..\x[0ED9]]>
  | <[\x[0F20]..\x[0F29]]>
  | <[\x[1040]..\x[1049]]>
  | <[\x[1369]..\x[1371]]>
  | <[\x[17E0]..\x[17E9]]>
  | <[\x[1810]..\x[1819]]>
  | <[\x[FF10]..\x[FF19]]>
  }

  # Any character in the Unicode category "Connector punctuation (Pc)".
  #
  # Literal
  #
  rule UnicodeConnectorPunctuation {
    \x[005F]
  | <[\x[203F]..\x[2040]]>
  | \x[30FB]
  | <[\x[FE33]..\x[FE34]]>
  | <[\x[FE4D]..\x[FE4F]]>
  | \x[FF3F]
  | \x[FF65]
  }

  #
  # Literal
  #
  rule Comment {
#    '/*' (options {greedy=false;} : .)* '*/'
    '/*' .* '*/'
  }

  rule LineComment {
#    '//' ~( <LT> )*
    '//' <!LT>*
  }

  #
  # Literal
  #
  rule LT {
    \n       # Line feed.
  | \r       # Carriage return.
  | \x[2028] # Line separator.
  | \x[2029] # Paragraph separator.
  }

  # Tab, vertical tab, form feed, space, non-breaking space and any other
  # unicode "space separator".
  #
  #
  # Literal
  #
  rule WhiteSpace {
    ( \t | \v | \f | ' ' | \x[00A0] )
  }

}
