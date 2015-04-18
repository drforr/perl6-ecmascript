use v6;

#
# ANTLR grammar Copyright 2008 Chris Lambrou. All rights reserved.
#

# XXX 'LT!' => LT # Because '!' just means "Don't render in AST"
# XXX 'EOF!' => EOF # Because '!' just means "Don't render in AST"

grammar Grammar::ECMAScript {

  # has tests
  #
  rule TOP {
    <LT>* <sourceElements> <LT>* <EOF>
  }

  # has tests
  #
  rule sourceElements {
#    <sourceElement> [ <LT>* <sourceElement> ]*
    <sourceElement>+ % <LT>
  }

  # has tests - Mainly bcause it's sufficient to test the children.
  #
  rule sourceElement {
    <functionDeclaration>
  | <statement>
  }

  #
  # functions
  #
  # has tests
  #
  rule functionDeclaration {
    'function' <LT>* <Identifier>
               <LT>* <formalParameterList>
               <LT>* <functionBody>
  }

  # has tests
  #
  rule functionExpression {
    'function' <LT>* <Identifier>?
               <LT>* <formalParameterList>
               <LT>* <functionBody>
  }

  # has tests
  #
  rule formalParameterList {
#    '(' [<LT>* <Identifier> [<LT>* ',' <LT>* <Identifier>]*]? <LT>* ')'
    '(' <LT>* <Identifier>* % [<LT>* ',' <LT>*] <LT>* ')'
  }

  rule functionBody {
    '{' <LT>* <sourceElements> <LT>* '}'
  }

  #
  # statements
  #
  # has tests - Mainly bcause it's sufficient to test the children.
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
    '{' <LT>* <statementList>? <LT>* '}'
  }

  # has tests
  #
  rule statementList {
#    <statement> [<LT>* <statement>]*
    <statement>+ % <LT>
  }

  # has tests
  #
  rule variableStatement {
    'var' <LT>* <variableDeclarationList> [ <LT> | ';' ]
  }

  # has tests
  #
  rule variableDeclarationList {
#    <variableDeclaration> [ <LT>* ',' <LT>* <variableDeclaration> ]*
    <variableDeclaration>+ % [<LT>* ',' <LT>*]
  }

  # has tests
  #
  rule variableDeclarationListNoIn {
#    <variableDeclarationNoIn> [ <LT>* ',' <LT>* <variableDeclarationNoIn> ]*
    <variableDeclarationNoIn>+ % [<LT>* ',' <LT>*]
  }

  # has tests
  #
  rule variableDeclaration {
    <Identifier> <LT>* <initialiser>?
  }

  # has tests
  #
  rule variableDeclarationNoIn {
    <Identifier> <LT>* <initialiserNoIn>?
  }

  # has tests
  #
  rule initialiser {
    '=' <LT>* <assignmentExpression>
  }

  # has tests
  #
  rule initialiserNoIn {
    '=' <LT>* <assignmentExpressionNoIn>
  }

  #
  # Literal
  #
  # has tests
  #
  token emptyStatement {
    ';'
  }

  # has tests
  #
  rule expressionStatement {
    <expression> [ <LT> | ';' ]
  }

  rule ifStatement {
    'if' <LT>* '(' <LT>* <expression> <LT>* ')'
         <LT>* <statement>
         [ <LT>* 'else' <LT>* <statement> ]?
  }

  # has tests - Mainly bcause it's sufficient to test the children.
  #
  rule iterationStatement {
    <doWhileStatement>
  | <whileStatement>
  | <forStatement>
  | <forInStatement>
  }

  # has tests
  #
  rule doWhileStatement {
    'do' <LT>* <statement>
         <LT>* 'while'
         <LT>* '(' <expression> ')' [ <LT> | ';' ]
  }

  # has tests
  #
  rule whileStatement {
    'while' <LT>* '(' <LT>* <expression> <LT>* ')'
            <LT>* <statement>
  }

  rule forStatement {
    'for' <LT>* '(' [ <LT>* <forStatementInitialiserPart> ]? <LT>* ';' [ <LT>* <expression> ]? <LT>* ';' [ <LT>* <expression> ]? <LT>* ')' <LT>* <statement>
  }

  # has tests
  #
  rule forStatementInitialiserPart {
    <expressionNoIn>
  | 'var' <LT>* <variableDeclarationListNoIn>
  }

  # has tests
  #
  rule forInStatement {
    'for' <LT>* '(' <LT>* <forInStatementInitialiserPart> <LT>* 'in' <LT>* <expression> <LT>* ')' <LT>* <statement>
  }

  # has tests
  #
  rule forInStatementInitialiserPart {
    <leftHandSideExpression>
  | 'var' <LT>* <variableDeclarationNoIn>
  }

  # has tests
  #
  rule continueStatement {
    'continue' <Identifier>? [ <LT> | ';' ]
  }

  # has tests
  #
  rule breakStatement {
    'break' <Identifier>? [ <LT> | ';' ]
  }

  # has tests
  #
  rule returnStatement {
    'return' <expression>? [ <LT> | ';' ]
  }

  # has tests
  #
  rule withStatement {
    'with' <LT>* '(' <LT>* <expression> <LT>* ')' <LT>* <statement>
  }

  # has tests
  #
  rule labelledStatement {
    <Identifier> <LT>* ':' <LT>* <statement>
  }

  # has tests
  #
  rule switchStatement {
    'switch' <LT>* '(' <LT>* <expression> <LT>* ')' <LT>* <caseBlock>
  }

  # has tests
  #
  rule caseBlock {
    '{' [ <LT>* <caseClause> ]* [ <LT>* <defaultClause> [ <LT>* <caseClause> ]* ]? <LT>* '}'
  }

  # has tests
  #
  rule caseClause {
    'case' <LT>* <expression> <LT>* ':' <LT>* <statementList>?
  }

  # has tests
  #
  rule defaultClause {
    'default' <LT>* ':' <LT>* <statementList>?
  }

  # has tests
  #
  rule throwStatement {
    'throw' <expression> [ <LT> | ';' ]
  }

  rule tryStatement {
    'try' <LT>* <statementBlock> <LT>* [ <finallyClause> | <catchClause> [ <LT>* <finallyClause> ]? ]
  }

  # has tests
  #
  rule catchClause {
    'catch' <LT>* '(' <LT>* <Identifier> <LT>* ')'
            <LT>* statementBlock
  }

  # has tests
  #
  rule finallyClause {
    'finally' <LT>* <statementBlock>
  }

  #
  # expressions
  #
  # has tests
  #
  rule expression {
#   <assignmentExpression> [ <LT>* ',' <LT>* <assignmentExpression> ]*
    <assignmentExpression>+ % [<LT>* ',' <LT>*]
  }

  # has tests
  #
  rule expressionNoIn {
#   <assignmentExpressionNoIn> [ <LT>* ',' <LT>* <assignmentExpressionNoIn> ]*
   <assignmentExpressionNoIn>+ % [<LT>* ',' <LT>*]
  }

  # has tests
  #
  rule assignmentExpression {
    <conditionalExpression>
  | <leftHandSideExpression> <LT>* <assignmentOperator>
                             <LT>* <assignmentExpression>
  }

  # has tests
  #
  rule assignmentExpressionNoIn {
    <conditionalExpressionNoIn>
  | <leftHandSideExpression> <LT>* <assignmentOperator>
                             <LT>* <assignmentExpressionNoIn>
  }

  # has tests - Mainly bcause it's sufficient to test the children.
  #
  rule leftHandSideExpression {
    <callExpression>
  | <newExpression>
  }

  rule newExpression {
    <memberExpression>
  | 'new' <LT>* <newExpression>
  }

  rule memberExpression {
    [ <primaryExpression> | <functionExpression> | 'new' <LT>* <memberExpression> <LT>* <arguments> ] [ <LT>* <memberExpressionSuffix> ]*
  }

  # has tests - Mainly bcause it's sufficient to test the children.
  #
  rule memberExpressionSuffix {
    <indexSuffix>
  | <propertyReferenceSuffix>
  }

  # has tests
  #
  rule callExpression {
    <memberExpression> <LT>* <arguments> [ <LT>* <callExpressionSuffix> ]*
  }

  # has tests - Mainly bcause it's sufficient to test the children.
  #
  rule callExpressionSuffix {
    <arguments>
  | <indexSuffix>
  | <propertyReferenceSuffix>
  }

  # has tests
  #
  rule arguments {
#    '(' [<LT>* <assignmentExpression> [<LT>* ',' <LT>* <assignmentExpression>]*]? <LT>* ')'
    '(' [<LT>* <assignmentExpression>+ % [<LT>* ',' <LT>*] ]? <LT>* ')'
  }

  # has tests
  #
  rule indexSuffix {
    '[' <LT>* <expression> <LT>* ']'
  }	

  # has tests
  #
  rule propertyReferenceSuffix {
    '.' <LT>* <Identifier>
  }

  #
  # Literal
  #
  # has tests
  #
  token assignmentOperator {
    '=' | '*=' | '/=' | '%=' | '+=' | '-=' | '<<=' | '>>=' | '>>>=' | '&=' | '^=' | '|='
  }

  # has tests
  #
  rule conditionalExpression {
    <logicalORExpression> [ <LT>* '?'
                            <LT>* <assignmentExpression>
                            <LT>* ':'
                            <LT>* <assignmentExpression> ]?
  }

  rule conditionalExpressionNoIn {
    <logicalORExpressionNoIn> [ <LT>* '?' <LT>* <assignmentExpressionNoIn> <LT>* ':' <LT>* <assignmentExpressionNoIn> ]?
  }

  # has tests
  #
  rule logicalORExpression {
#    <logicalANDExpression> [<LT>* '||' <LT>* <logicalANDExpression> ]*
    <logicalANDExpression>+ % [<LT>* '||' <LT>*]
  }

  # has tests
  #
  rule logicalORExpressionNoIn {
#    <logicalANDExpressionNoIn> [ <LT>* '||' <LT>* <logicalANDExpressionNoIn> ]*
    <logicalANDExpressionNoIn>+ % [<LT>* '||' <LT>*]
  }

  # has tests
  #
  rule logicalANDExpression {
#    <bitwiseORExpression> [ <LT>* '&&' <LT>* <bitwiseORExpression> ]*
    <bitwiseORExpression>+ % [<LT>* '&&' <LT>*]
  }

  # has tests
  #
  rule logicalANDExpressionNoIn {
#    <bitwiseORExpressionNoIn> [ <LT>* '&&' <LT>* <bitwiseORExpressionNoIn> ]*
    <bitwiseORExpressionNoIn>+ % [<LT>* '&&' <LT>*]
  }

  # has tests
  #
  rule bitwiseORExpression {
#    <bitwiseXORExpression> [ <LT>* '|' <LT>* <bitwiseXORExpression> ]*
    <bitwiseXORExpression>+ % [<LT>* '|' <LT>*]
  }

  # has tests
  #
  rule bitwiseORExpressionNoIn {
#    <bitwiseXORExpressionNoIn> [ <LT>* '|' <LT>* <bitwiseXORExpressionNoIn> ]*
    <bitwiseXORExpressionNoIn>+ % [<LT>* '|' <LT>*]
  }

  # has tests
  #
  rule bitwiseXORExpression {
#    <bitwiseANDExpression> [ <LT>* '^' <LT>* <bitwiseANDExpression> ]*
    <bitwiseANDExpression>+ % [<LT>* '^' <LT>*]
  }

  rule bitwiseXORExpressionNoIn {
#    <bitwiseANDExpressionNoIn> [ <LT>* '^' <LT>* <bitwiseANDExpressionNoIn> ]*
    <bitwiseANDExpressionNoIn>+ % [<LT>* '^' <LT>*]
  }

  # has tests
  #
  rule bitwiseANDExpression {
#    <equalityExpression> [ <LT>* '&' <LT>* <equalityExpression> ]*
    <equalityExpression>+ % [<LT>* '&' <LT>*]
  }

  # has tests
  #
  rule bitwiseANDExpressionNoIn {
#    <equalityExpressionNoIn> [ <LT>* '&' <LT>* <equalityExpressionNoIn> ]*
    <equalityExpressionNoIn>+ % [<LT>* '&' <LT>*]
  }

  # has tests
  #
  rule equalityExpression {
#    <relationalExpression> [ <LT>* ('==' | '!=' | '===' | '!==') <LT>* <relationalExpression> ]*
    <relationalExpression>+ % [<LT>* ('==' | '!=' | '===' | '!==') <LT>*]
  }

  # has tests
  #
  rule equalityExpressionNoIn {
#    <relationalExpressionNoIn> [ <LT>* ('==' | '!=' | '===' | '!==') <LT>* <relationalExpressionNoIn> ]*
    <relationalExpressionNoIn>+ % [<LT>* ('==' | '!=' | '===' | '!==') <LT>*]
  }

  # has tests
  #
  rule relationalExpression {
#    <shiftExpression> [ <LT>* ('<' | '>' | '<=' | '>=' | 'instanceof' | 'in') <LT>* <shiftExpression> ]*
    <shiftExpression>+ % [<LT>* ('<' | '>' | '<=' | '>=' | 'instanceof' | 'in') <LT>*]
  }

  # has tests
  #
  rule relationalExpressionNoIn {
#    <shiftExpression> [ <LT>* ('<' | '>' | '<=' | '>=' | 'instanceof') <LT>* <shiftExpression> ]*
    <shiftExpression>+ % [<LT>* ('<' | '>' | '<=' | '>=' | 'instanceof') <LT>*]
  }

  # has tests
  #
  rule shiftExpression {
#    <additiveExpression> [ <LT>* ('<<' | '>>' | '>>>') <LT>* <additiveExpression> ]*
    <additiveExpression>+ % [<LT>* ('<<' | '>>' | '>>>') <LT>*]
  }

  # has tests
  #
  rule additiveExpression {
#    <multiplicativeExpression> [ <LT>* ('+' | '-') <LT>* <multiplicativeExpression> ]*
    <multiplicativeExpression>+ % [<LT>* ('+' | '-') <LT>*]
  }

  # has tests
  #
  rule multiplicativeExpression {
#    <unaryExpression> [ <LT>* ('*' | '/' | '%') <LT>* <unaryExpression> ]*
    <unaryExpression>+ % [<LT>* ('*' | '/' | '%') <LT>*]
  }

  # has tests
  #
  rule unaryExpression {
    <postfixExpression>
  | [ 'delete' | 'void' | 'typeof' | '++' | '--' | '+' | '-' | '~' | '!' ]
    <unaryExpression>
  }

  # has tests
  #
  rule postfixExpression {
    <leftHandSideExpression> [ '++' | '--' ]?
  }

  rule primaryExpression {
    'this'
  | <Identifier>
  | <literal>
  | <arrayLiteral>
  | <objectLiteral>
  | '(' <LT>* <expression> <LT>* ')'
  }

  #
  # arrayLiteral definition.
  #
  # has tests
  #
  rule arrayLiteral {
    '[' <LT>* <assignmentExpression>?
        [ <LT>* ',' [ <LT>* <assignmentExpression> ]? ]* <LT>* ']'
  }

  #
  # objectLiteral definition.
  #
  rule objectLiteral {
#    '{' <LT>* <propertyNameAndValue> [ <LT>* ',' <LT>* <propertyNameAndValue> ]* <LT>* '}'
    '{' <LT>* <propertyNameAndValue>+ % [<LT>* ',' <LT>*] <LT>* '}'
  }

  rule propertyNameAndValue {
    <propertyName> <LT>* ':' <LT>* <assignmentExpression>
  }

  # has tests - Mainly bcause it's sufficient to test the children.
  #
  rule propertyName {
    <Identifier>
  | <StringLiteral>
  | <NumericLiteral>
  }

  #
  # primitive literal definition.
  #
  # has tests
  #
  token literal {
    'null'
  | 'true'
  | 'false'
  | <StringLiteral>
  | <NumericLiteral>
  }

  #
  # lexer rules.
  #
  # has tests
  #
  token StringLiteral {
    '"' <DoubleStringCharacter>* '"'
  | '\'' <SingleStringCharacter>* '\''
  }

  # has tests
  #
  rule DoubleStringCharacter {
#    ~( '"' | '\\' | <LT> )
#  | '\\' <EscapeSequence>
    <-[ " \\ \n \r \x[2028] \x[2029] ]> # Expanding <LT> inline
  | '\\' <EscapeSequence>
  }

  # has tests
  #
  token SingleStringCharacter {
#    ~( '\'' | '\\' | <LT> )
#  | '\\' <EscapeSequence>
    <-[ ' \\ \n \r \x[2028] \x[2029] ]> # XXX Expanding <LT> inline
  | '\\' <EscapeSequence>
  }

  # has tests
  #
  token EOF {
    $$
  }

  # has tests
  #
  token EscapeSequence {
    <CharacterEscapeSequence>
  | '0'
  | <HexEscapeSequence>
  | <UnicodeEscapeSequence>
  }

  # has tests - Mainly bcause it's sufficient to test the children.
  #
  token CharacterEscapeSequence {
    <SingleEscapeCharacter>
  | <NonEscapeCharacter>
  }

  # XXX Refactor out the ~() for later use
  #
  # has tests
  #
  rule NonEscapeCharacter {
#    ~( <EscapeCharacter> | <LT> )
    <- [ ' " \\ b f n r t v ] - [0..9] - [ x u ] - [ \n \r \x[2028] \x[2029] ]>
  }

  #
  # Literal
  #
  # has tests
  #
  token SingleEscapeCharacter {
    <[ ' " \\ b f n r t v ]>
  }

#  # XXX This is being refactored so that it can be used inline.
#  #
#  token EscapeCharacter {
#    <SingleEscapeCharacter>
#  | <DecimalDigit>
#  | 'x'
#  | 'u'
#  }

  # has tests
  #
  token EscapeCharacter {
    <[ ' " \\ b f n r t v ] + [ 0 .. 9 ] + [ x u ]>
  }

  # has tests
  #
  token HexEscapeSequence {
    'x' <HexDigit> <HexDigit>
  }

  # has tests
  #
  token UnicodeEscapeSequence {
    'u' <HexDigit> <HexDigit> <HexDigit> <HexDigit>
  }

  # has tests - Mainly bcause it's sufficient to test the children.
  #
  token NumericLiteral {
    <DecimalLiteral>
  | <HexIntegerLiteral>
  }

  # has tests
  #
  token HexIntegerLiteral {
    '0' <[xX]> <HexDigit>+
  }

  # has tests
  #
  token HexDigit {
    <DecimalDigit> | <[a..f]> | <[A..F]>
  }

  # has tests
  #
  token DecimalLiteral {
    <DecimalDigit>+ '.' <DecimalDigit>* <ExponentPart>?
  | '.'? <DecimalDigit>+ <ExponentPart>?
  }

  #
  # Literal
  #
  # has tests
  #
  token DecimalDigit {
    <[0..9]>
  }

  # has tests
  #
  token ExponentPart {
    <[eE]> <[+-]>? <DecimalDigit>+
  }

  # has tests
  #
  token Identifier {
    <IdentifierStart> <IdentifierPart>*
  }

  # has tests
  #
  token IdentifierStart {
    <UnicodeLetter>
  | '$'
  | '_'
  | '\\' <UnicodeEscapeSequence>
  }

  # has tests - Mainly bcause it's sufficient to test the children.
  #
  token IdentifierPart {
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
  # has tests
  #
  token UnicodeLetter {
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
  # has tests
  #
  token UnicodeCombiningMark {
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
  # has tests
  #
  token UnicodeDigit {
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
  # has tests
  #
  token UnicodeConnectorPunctuation {
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
  # has tests
  #
  token Comment {
#    '/*' (options {greedy=false;} : .)* '*/'
    '/*' .*? '*/'
  }

  # has tests
  #
  token LineComment {
#    '//' ~( <LT> )*
    '//' .* [ \n | $ ]
  }

  #
  # Literal
  #
  # has tests
  #
  token LT {
    <[ \n \r \x[2028] \x[2029] ]>
#    \n       # Line feed.
#  | \r       # Carriage return.
#  | \x[2028] # Line separator.
#  | \x[2029] # Paragraph separator.
  }

  # Tab, vertical tab, form feed, space, non-breaking space and any other
  # unicode "space separator".
  #
  # Literal
  #
  # has tests
  #
  token WhiteSpace {
    \t | \v | \f | ' ' | \x[00A0]
  }

  #
  # Override whitespace to disallow newlines.
  #
  token ws {
    \h*
  }

}
