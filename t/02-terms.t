use v6;

use Test;

plan 312;

use Grammar::ECMAScript;

my $g = Grammar::ECMAScript.new;

##############################################################################

nok $g.parse( q{}, rule => 'additiveExpression' ), 'additiveExpression';
ok  $g.parse( q{a+b}, rule => 'additiveExpression' ), 'additiveExpression';

nok $g.parse( q{}, rule => 'arguments' ), 'arguments';
ok  $g.parse( q{(a)}, rule => 'arguments' ), 'arguments';
ok  $g.parse( q{(a,b)}, rule => 'arguments' ), 'arguments';

nok $g.parse( q{}, rule => 'arrayLiteral' ), 'arrayLiteral';
ok  $g.parse( q{[1]}, rule => 'arrayLiteral' ), 'arrayLiteral';

nok $g.parse( q{}, rule => 'assignmentExpression' ), 'assignmentExpression';
ok  $g.parse( q{ab}, rule => 'assignmentExpression' ), 'assignmentExpression';

ok $g.parse( q{}, rule => 'assignmentExpressionNoIn' ),
   'assignmentExpressionNoIn';

#
# Literal
#
nok $g.parse( q{},     rule => 'assignmentOperator' ),
   'assignmentOperator literal';
nok $g.parse( q{#=},   rule => 'assignmentOperator' ),
   'assignmentOperator literal';
ok  $g.parse( q{=},    rule => 'assignmentOperator' ),
   'assignmentOperator literal';
ok  $g.parse( q{*=},   rule => 'assignmentOperator' ),
   'assignmentOperator literal';
ok  $g.parse( q{>>>=}, rule => 'assignmentOperator' ),
   'assignmentOperator literal';

nok $g.parse( q{}, rule => 'bitwiseANDExpression' ), 'bitwiseANDExpression';
ok  $g.parse( q{a&b}, rule => 'bitwiseANDExpression' ), 'bitwiseANDExpression';

ok $g.parse( q{}, rule => 'bitwiseANDExpressionNoIn' ),
   'bitwiseANDExpressionNoIn';

nok $g.parse( q{}, rule => 'bitwiseORExpression' ), 'bitwiseORExpression';
ok  $g.parse( q{a|b}, rule => 'bitwiseORExpression' ), 'bitwiseORExpression';

ok $g.parse( q{}, rule => 'bitwiseORExpressionNoIn' ),
   'bitwiseORExpressionNoIn';

nok $g.parse( q{}, rule => 'bitwiseXORExpression' ), 'bitwiseXORExpression';
ok  $g.parse( q{a^b}, rule => 'bitwiseXORExpression' ), 'bitwiseXORExpression';

ok $g.parse( q{}, rule => 'bitwiseXORExpressionNoIn' ),
   'bitwiseXORExpressionNoIn';

nok $g.parse( q{},            rule => 'breakStatement' ), 'breakStatement';
ok  $g.parse( q{break a_;},   rule => 'breakStatement' ), 'breakStatement';
ok  $g.parse( qq{break a_\n}, rule => 'breakStatement' ), 'breakStatement';

nok $g.parse( q{}, rule => 'callExpression' ), 'callExpression';
ok  $g.parse( q{a(b)}, rule => 'callExpression' ), 'callExpression';

nok $g.parse( q{}, rule => 'callExpressionSuffix' ), 'callExpressionSuffix';
# No further testing of callExpressionSuffix needed, the alternations will suffice.

ok $g.parse( q{}, rule => 'caseBlock' ), 'caseBlock';

nok $g.parse( q{}, rule => 'caseClause' ), 'caseClause';
ok  $g.parse( q{caseA:}, rule => 'caseClause' ), 'caseClause';
ok  $g.parse( q{caseA:a++;}, rule => 'caseClause' ), 'caseClause';

ok $g.parse( q{}, rule => 'catchClause' ), 'catchClause';

nok $g.parse( q{}, rule => 'CharacterEscapeSequence' ),
   'CharacterEscapeSequence';
# No further testing of CharacterEscapeSequence needed, the alternations will suffice.

#
# Literal
#
nok $g.parse( q{},          rule => 'Comment' ), 'Comment literal';
nok $g.parse( q{foo},       rule => 'Comment' ), 'Comment literal';
ok  $g.parse( q{/**/},      rule => 'Comment' ), 'Comment literal';
ok  $g.parse( q{/*...*/},   rule => 'Comment' ), 'Comment literal';
ok  $g.parse( q{/* ... */}, rule => 'Comment' ), 'Comment literal';

nok $g.parse( q{}, rule => 'conditionalExpression' ),
   'conditionalExpression';
ok  $g.parse( q{a?1:2}, rule => 'conditionalExpression' ),
   'conditionalExpression';

ok $g.parse( q{}, rule => 'conditionalExpressionNoIn' ),
   'conditionalExpressionNoIn';

nok $g.parse( q{}, rule => 'continueStatement' ), 'continueStatement';
ok  $g.parse( q{continue a_;}, rule => 'continueStatement' ),
    'continueStatement';
ok  $g.parse( qq{continue a_\n}, rule => 'continueStatement' ),
    'continueStatement';

#
# Literal
#
nok $g.parse( q{},  rule => 'DecimalDigit' ), 'DecimalDigit literal';
nok $g.parse( q{Ⅲ}, rule => 'DecimalDigit' ), 'DecimalDigit literal';
nok $g.parse( q{৪}, rule => 'DecimalDigit' ), 'DecimalDigit literal';
ok  $g.parse( q{0}, rule => 'DecimalDigit' ), 'DecimalDigit literal';
ok  $g.parse( q{9}, rule => 'DecimalDigit' ), 'DecimalDigit literal';

nok $g.parse( q{},         rule => 'DecimalLiteral' ), 'DecimalLiteral';
ok  $g.parse( q{23},       rule => 'DecimalLiteral' ), 'DecimalLiteral';
ok  $g.parse( q{23e4},     rule => 'DecimalLiteral' ), 'DecimalLiteral';
ok  $g.parse( q{.23},      rule => 'DecimalLiteral' ), 'DecimalLiteral';
ok  $g.parse( q{.23e-2},   rule => 'DecimalLiteral' ), 'DecimalLiteral';
ok  $g.parse( q{45.23},    rule => 'DecimalLiteral' ), 'DecimalLiteral';
ok  $g.parse( q{45.23E-7}, rule => 'DecimalLiteral' ), 'DecimalLiteral';

nok $g.parse( q{}, rule => 'defaultClause' ), 'defaultClause';
ok  $g.parse( q{default:a;}, rule => 'defaultClause' ), 'defaultClause';

nok $g.parse( q{},          rule => 'DoubleStringCharacter' ),
    'DoubleStringCharacter';
nok $g.parse( qq{\n},       rule => 'DoubleStringCharacter' ),
    'DoubleStringCharacter';
nok $g.parse( qq{\x[2028]}, rule => 'DoubleStringCharacter' ),
    'DoubleStringCharacter';
nok $g.parse( q{"},         rule => 'DoubleStringCharacter' ),
    'DoubleStringCharacter';
ok  $g.parse( q{\"},        rule => 'DoubleStringCharacter' ),
    'DoubleStringCharacter';
ok  $g.parse( q{\n},        rule => 'DoubleStringCharacter' ),
    'DoubleStringCharacter';
ok  $g.parse( qq{\\\x[2028]}, rule => 'DoubleStringCharacter' ), # XXX ???
    'DoubleStringCharacter';
ok  $g.parse( q{\y},        rule => 'DoubleStringCharacter' ),
    'DoubleStringCharacter';

ok $g.parse( q{}, rule => 'doWhileStatement' ), 'doWhileStatement';

#
# Literal
#
nok $g.parse( q{},  rule => 'emptyStatement' ), 'emptyStatement literal';
nok $g.parse( q{a}, rule => 'emptyStatement' ), 'emptyStatement literal';
ok  $g.parse( q{;}, rule => 'emptyStatement' ), 'emptyStatement literal';
	
ok $g.parse( q{}, rule => 'EOF' ), 'EOF';

nok $g.parse( q{}, rule => 'equalityExpression' ), 'equalityExpression';
ok $g.parse( q{a==b}, rule => 'equalityExpression' ), 'equalityExpression';

ok $g.parse( q{}, rule => 'equalityExpressionNoIn' ),
   'equalityExpressionNoIn';

nok $g.parse( q{},   rule => 'EscapeCharacter' ), 'EscapeCharacter';
ok  $g.parse( q{\\}, rule => 'EscapeCharacter' ), 'EscapeCharacter';
ok  $g.parse( q{f},  rule => 'EscapeCharacter' ), 'EscapeCharacter';
ok  $g.parse( q{'},  rule => 'EscapeCharacter' ), 'EscapeCharacter';
ok  $g.parse( q{u},  rule => 'EscapeCharacter' ), 'EscapeCharacter';

nok $g.parse( q{},      rule => 'EscapeSequence' ), 'EscapeSequence';
ok  $g.parse( q{0},     rule => 'EscapeSequence' ), 'EscapeSequence';
nok $g.parse( q{x},     rule => 'EscapeSequence' ), 'EscapeSequence';
nok $g.parse( qq{\n},   rule => 'EscapeSequence' ), 'EscapeSequence';
ok  $g.parse( q{'},     rule => 'EscapeSequence' ), 'EscapeSequence';
ok  $g.parse( q{a},     rule => 'EscapeSequence' ), 'EscapeSequence';
ok  $g.parse( q{0},     rule => 'EscapeSequence' ), 'EscapeSequence';
ok  $g.parse( q{u0000}, rule => 'EscapeSequence' ), 'EscapeSequence';
ok  $g.parse( q{ufF33}, rule => 'EscapeSequence' ), 'EscapeSequence';

nok $g.parse( q{},    rule => 'ExponentPart' ), 'ExponentPart';
ok  $g.parse( q{e0},  rule => 'ExponentPart' ), 'ExponentPart';
ok  $g.parse( q{E1},  rule => 'ExponentPart' ), 'ExponentPart';
ok  $g.parse( q{E-2}, rule => 'ExponentPart' ), 'ExponentPart';

nok $g.parse( q{}, rule => 'expression' ), 'expression';
ok  $g.parse( q{a}, rule => 'expression' ), 'expression';

ok $g.parse( q{}, rule => 'expressionNoIn' ), 'expressionNoIn';

nok $g.parse( q{}, rule => 'expressionStatement' ), 'expressionStatement';
ok  $g.parse( q{a;}, rule => 'expressionStatement' ), 'expressionStatement';
ok  $g.parse( qq{a\n}, rule => 'expressionStatement' ), 'expressionStatement';

ok $g.parse( q{}, rule => 'finallyClause' ), 'finallyClause';

ok $g.parse( q{}, rule => 'forInStatement' ), 'forInStatement';
ok $g.parse( q{}, rule => 'forInStatementInitialiserPart' ),
   'forInStatementInitialiserPart';

nok $g.parse( q{}, rule => 'formalParameterList' ),
    'formalParameterList';
ok  $g.parse( q{()}, rule => 'formalParameterList' ),
    'formalParameterList';
ok  $g.parse( q{( )}, rule => 'formalParameterList' ),
    'formalParameterList';
ok  $g.parse( q{(a)}, rule => 'formalParameterList' ),
    'formalParameterList';
ok  $g.parse( q{( a)}, rule => 'formalParameterList' ),
    'formalParameterList';
ok  $g.parse( q{(a )}, rule => 'formalParameterList' ),
    'formalParameterList';
ok  $g.parse( q{( $a, \u0000a )}, rule => 'formalParameterList' ),
    'formalParameterList';

ok $g.parse( q{}, rule => 'forStatement' ), 'forStatement';

nok $g.parse( q{}, rule => 'forStatementInitialiserPart' ),
    'forStatementInitialiserPart';
ok  $g.parse( q{var a}, rule => 'forStatementInitialiserPart' ),
    'forStatementInitialiserPart';

ok $g.parse( q{}, rule => 'functionBody' ), 'functionBody';

ok $g.parse( q{}, rule => 'functionDeclaration' ), 'functionDeclaration';
ok $g.parse( q{}, rule => 'functionExpression' ), 'functionExpression';

nok $g.parse( q{},  rule => 'HexDigit' ), 'HexDigit';
ok  $g.parse( q{0}, rule => 'HexDigit' ), 'HexDigit';
ok  $g.parse( q{9}, rule => 'HexDigit' ), 'HexDigit';
ok  $g.parse( q{a}, rule => 'HexDigit' ), 'HexDigit';
ok  $g.parse( q{F}, rule => 'HexDigit' ), 'HexDigit';

nok $g.parse( q{},    rule => 'HexEscapeSequence' ), 'HexEscapeSequence';
ok  $g.parse( q{x00}, rule => 'HexEscapeSequence' ), 'HexEscapeSequence';
ok  $g.parse( q{x0f}, rule => 'HexEscapeSequence' ), 'HexEscapeSequence';
ok  $g.parse( q{xA3}, rule => 'HexEscapeSequence' ), 'HexEscapeSequence';

nok $g.parse( q{},      rule => 'HexIntegerLiteral' ), 'HexIntegerLiteral';
nok $g.parse( q{0x},    rule => 'HexIntegerLiteral' ), 'HexIntegerLiteral';
ok  $g.parse( q{0x0},   rule => 'HexIntegerLiteral' ), 'HexIntegerLiteral';
ok  $g.parse( q{0x9fD}, rule => 'HexIntegerLiteral' ), 'HexIntegerLiteral';
ok  $g.parse( q{0X9fD}, rule => 'HexIntegerLiteral' ), 'HexIntegerLiteral';

# XXX This needs a bit more work.
#
nok $g.parse( q{},          rule => 'Identifier' ), 'Identifier';
nok $g.parse( q{9},         rule => 'Identifier' ), 'Identifier';
nok $g.parse( qq{\x[00ab]}, rule => 'Identifier' ), 'Identifier';
ok  $g.parse( q{a},         rule => 'Identifier' ), 'Identifier';
ok  $g.parse( q{$},         rule => 'Identifier' ), 'Identifier';
ok  $g.parse( q{ab},        rule => 'Identifier' ), 'Identifier';
ok  $g.parse( q{$$},        rule => 'Identifier' ), 'Identifier';
ok  $g.parse( q{$a},        rule => 'Identifier' ), 'Identifier';
ok  $g.parse( q{a_},        rule => 'Identifier' ), 'Identifier';
ok  $g.parse( q{\u0000a},   rule => 'Identifier' ), 'Identifier';

nok $g.parse( q{},          rule => 'IdentifierPart' ), 'IdentifierPart';
# No further testing of IdentifierPart needed, the alternations will suffice.

nok $g.parse( q{},          rule => 'IdentifierStart' ), 'IdentifierStart';
nok $g.parse( q{9},         rule => 'IdentifierStart' ), 'IdentifierStart';
nok $g.parse( qq{\x[00ab]}, rule => 'IdentifierStart' ), 'IdentifierStart';
ok  $g.parse( q{a},         rule => 'IdentifierStart' ), 'IdentifierStart';
ok  $g.parse( q{$},         rule => 'IdentifierStart' ), 'IdentifierStart';
ok  $g.parse( q{_},         rule => 'IdentifierStart' ), 'IdentifierStart';
ok  $g.parse( qq{\x[04cb]}, rule => 'IdentifierStart' ), 'IdentifierStart';
ok  $g.parse( q{\u0000},    rule => 'IdentifierStart' ), 'IdentifierStart';
ok  $g.parse( q{\ufF33},    rule => 'IdentifierStart' ), 'IdentifierStart';

ok $g.parse( q{}, rule => 'ifStatement' ), 'ifStatement';

nok $g.parse( q{},         rule => 'indexSuffix' ), 'indexSuffix';
ok  $g.parse( q{[0]},      rule => 'indexSuffix' ), 'indexSuffix';
ok  $g.parse( q{[a]},      rule => 'indexSuffix' ), 'indexSuffix';
ok  $g.parse( qq{[\na]},   rule => 'indexSuffix' ), 'indexSuffix';
ok  $g.parse( qq{[a\n]},   rule => 'indexSuffix' ), 'indexSuffix';
ok  $g.parse( qq{[\na\n]}, rule => 'indexSuffix' ), 'indexSuffix';

nok $g.parse( q{}, rule => 'initialiser' ), 'initialiser';
ok  $g.parse( q{=1}, rule => 'initialiser' ), 'initialiser';

ok $g.parse( q{}, rule => 'initialiserNoIn' ), 'initialiserNoIn';

nok $g.parse( q{}, rule => 'iterationStatement' ), 'iterationStatement';
# No further testing of iterationStatement needed, the alternations will suffice.

nok $g.parse( q{}, rule => 'labelledStatement' ), 'labelledStatement';
ok  $g.parse( q{a:b;}, rule => 'labelledStatement' ), 'labelledStatement';

nok $g.parse( q{}, rule => 'leftHandSideExpression' ),
   'leftHandSideExpression';
# No further testing of leftHandSideExpression needed, the alternations will suffice.

#
# Literal
#
nok $g.parse( q{},          rule => 'LineComment' ), 'LineComment literal';
ok  $g.parse( q{//},        rule => 'LineComment' ), 'LineComment literal';
ok  $g.parse( q{// },       rule => 'LineComment' ), 'LineComment literal';
ok  $g.parse( q{//foo},     rule => 'LineComment' ), 'LineComment literal';
ok  $g.parse( q{//foo bar}, rule => 'LineComment' ), 'LineComment literal';

nok $g.parse( q{},             rule => 'literal' ), 'literal';
nok $g.parse( qq{'\n'},        rule => 'literal' ), 'literal';
nok $g.parse( qq{'\x[2028]'},  rule => 'literal' ), 'literal';
ok  $g.parse( q{'"'},          rule => 'literal' ), 'literal';
ok  $g.parse( q{"'"},          rule => 'literal' ), 'literal';
ok  $g.parse( q{'\"'},         rule => 'literal' ), 'literal';
ok  $g.parse( q{"\""},         rule => 'literal' ), 'literal';
ok  $g.parse( q{'\''},         rule => 'literal' ), 'literal';
ok  $g.parse( q{"\'"},         rule => 'literal' ), 'literal';
ok  $g.parse( q{'\n'},         rule => 'literal' ), 'literal';
ok  $g.parse( q{'\\\x[2028]'}, rule => 'literal' ), 'literal';
ok  $g.parse( q{'\y'},         rule => 'literal' ), 'literal';
ok  $g.parse( q{'foo bar'},    rule => 'literal' ), 'literal';
ok  $g.parse( q{3.e-0},        rule => 'literal' ), 'literal';
ok  $g.parse( q{3.1e-70},      rule => 'literal' ), 'literal';
nok $g.parse( q{nul},          rule => 'literal' ), 'literal';
ok  $g.parse( q{null},         rule => 'literal' ), 'literal';
nok $g.parse( q{tru},          rule => 'literal' ), 'literal';
ok  $g.parse( q{true},         rule => 'literal' ), 'literal';
ok  $g.parse( q{false},        rule => 'literal' ), 'literal';
nok $g.parse( q{maybe},        rule => 'literal' ), 'literal';

nok $g.parse( q{}, rule => 'logicalANDExpression' ), 'logicalANDExpression';
ok  $g.parse( q{a&&b}, rule => 'logicalANDExpression' ), 'logicalANDExpression';

ok $g.parse( q{}, rule => 'logicalANDExpressionNoIn' ),
   'logicalANDExpressionNoIn';

nok $g.parse( q{}, rule => 'logicalORExpression' ), 'logicalORExpression';
ok  $g.parse( q{a||b}, rule => 'logicalORExpression' ), 'logicalORExpression';

ok $g.parse( q{}, rule => 'logicalORExpressionNoIn' ),
   'logicalORExpressionNoIn';

#
# Literal
#
nok $g.parse( q{},          rule => 'LT' ), 'LT literal';
nok $g.parse( qq{\a},       rule => 'LT' ), 'LT literal';
nok $g.parse( qq{f},        rule => 'LT' ), 'LT literal';
ok  $g.parse( qq{\n},       rule => 'LT' ), 'LT literal';
ok  $g.parse( qq{\r},       rule => 'LT' ), 'LT literal';
ok  $g.parse( qq{\x[2028]}, rule => 'LT' ), 'LT literal';
ok  $g.parse( qq{\x[2029]}, rule => 'LT' ), 'LT literal';

ok $g.parse( q{}, rule => 'memberExpression' ), 'memberExpression';

nok $g.parse( q{}, rule => 'memberExpressionSuffix' ),
   'memberExpressionSuffix';
# No further testing of memberExpressionSuffix needed, the alternations will suffice.

nok $g.parse( q{}, rule => 'multiplicativeExpression' ),
    'multiplicativeExpression';
ok  $g.parse( q{a*b}, rule => 'multiplicativeExpression' ),
    'multiplicativeExpression';

ok $g.parse( q{}, rule => 'newExpression' ), 'newExpression';

nok $g.parse( q{},   rule => 'NonEscapeCharacter' ), 'NonEscapeCharacter';
nok $g.parse( q{n},  rule => 'NonEscapeCharacter' ), 'NonEscapeCharacter';
nok $g.parse( q{x},  rule => 'NonEscapeCharacter' ), 'NonEscapeCharacter';
nok $g.parse( q{0},  rule => 'NonEscapeCharacter' ), 'NonEscapeCharacter';
nok $g.parse( q{\\}, rule => 'NonEscapeCharacter' ), 'NonEscapeCharacter';
nok $g.parse( q{'},  rule => 'NonEscapeCharacter' ), 'NonEscapeCharacter';
ok  $g.parse( q{ },  rule => 'NonEscapeCharacter' ), 'NonEscapeCharacter';
ok  $g.parse( q{a},  rule => 'NonEscapeCharacter' ), 'NonEscapeCharacter';
ok  $g.parse( q{y},  rule => 'NonEscapeCharacter' ), 'NonEscapeCharacter';

nok $g.parse( q{},        rule => 'NumericLiteral' ), 'NumericLiteral';
# No further testing of NumericLiteral needed, the alternations will suffice.

ok $g.parse( q{}, rule => 'objectLiteral' ), 'objectLiteral';

nok $g.parse( q{},    rule => 'postfixExpression' ), 'postfixExpression';
ok  $g.parse( q{a++}, rule => 'postfixExpression' ), 'postfixExpression';

ok $g.parse( q{}, rule => 'primaryExpression' ), 'primaryExpression';

nok $g.parse( q{}, rule => 'propertyName' ), 'propertyName';
# No further testing of propertyName needed, the alternations will suffice.

ok $g.parse( q{}, rule => 'propertyNameAndValue' ), 'propertyNameAndValue';

nok $g.parse( q{},             rule => 'propertyReferenceSuffix' ),
   'propertyReferenceSuffix';
ok  $g.parse( q{.a_},   rule => 'propertyReferenceSuffix' ),
   'propertyReferenceSuffix';
ok  $g.parse( q{. a_},   rule => 'propertyReferenceSuffix' ),
   'propertyReferenceSuffix';
ok  $g.parse( qq{.\na_}, rule => 'propertyReferenceSuffix' ),
   'propertyReferenceSuffix';

nok $g.parse( q{}, rule => 'relationalExpression' ), 'relationalExpression';
ok  $g.parse( q{a<b}, rule => 'relationalExpression' ), 'relationalExpression';

ok $g.parse( q{}, rule => 'relationalExpressionNoIn' ),
   'relationalExpressionNoIn';

nok $g.parse( q{},             rule => 'returnStatement' ), 'returnStatement';
ok  $g.parse( q{return a_;},   rule => 'returnStatement' ), 'returnStatement';
ok  $g.parse( qq{return a_\n}, rule => 'returnStatement' ), 'returnStatement';

nok $g.parse( q{}, rule => 'shiftExpression' ), 'shiftExpression';
ok  $g.parse( q{a<<b}, rule => 'shiftExpression' ), 'shiftExpression';

#
# Literal
#
nok $g.parse( q{}, rule => 'SingleEscapeCharacter' ),
    'SingleEscapeCharacter literal';
nok $g.parse( q{k}, rule => 'SingleEscapeCharacter' ),
   'SingleEscapeCharacter literal';
ok  $g.parse( q{'}, rule => 'SingleEscapeCharacter' ),
    'SingleEscapeCharacter literal';
ok  $g.parse( q{"}, rule => 'SingleEscapeCharacter' ),
    'SingleEscapeCharacter literal';
ok  $g.parse( q{b}, rule => 'SingleEscapeCharacter' ),
    'SingleEscapeCharacter literal';

nok $g.parse( q{},          rule => 'SingleStringCharacter' ),
    'SingleStringCharacter';
nok $g.parse( qq{\n},       rule => 'SingleStringCharacter' ),
    'SingleStringCharacter';
nok $g.parse( qq{\x[2028]}, rule => 'SingleStringCharacter' ),
    'SingleStringCharacter';
nok $g.parse( q{'},         rule => 'SingleStringCharacter' ),
    'SingleStringCharacter';
ok  $g.parse( q{\'},        rule => 'SingleStringCharacter' ),
    'SingleStringCharacter';
ok  $g.parse( q{\n},        rule => 'SingleStringCharacter' ),
    'SingleStringCharacter';
ok  $g.parse( q{\\\x[2028]}, rule => 'SingleStringCharacter' ), # XXX ???
    'SingleStringCharacter';
ok  $g.parse( q{\y},        rule => 'SingleStringCharacter' ),
    'SingleStringCharacter';

nok $g.parse( q{}, rule => 'sourceElement' ), 'sourceElement';
# No further testing of sourceElement needed, the alternations will suffice.

ok $g.parse( q{}, rule => 'sourceElements' ), 'sourceElements';

nok $g.parse( q{}, rule => 'statement' ), 'statement';
# No further testing of statement needed, the alternations will suffice.

ok $g.parse( q{}, rule => 'statementBlock' ), 'statementBlock';
ok $g.parse( q{}, rule => 'statementList' ), 'statementList';

nok $g.parse( q{},             rule => 'StringLiteral' ), 'StringLiteral';
nok $g.parse( qq{'\n'},        rule => 'StringLiteral' ), 'StringLiteral';
nok $g.parse( qq{'\x[2028]'},  rule => 'StringLiteral' ), 'StringLiteral';
ok  $g.parse( q{'"'},          rule => 'StringLiteral' ), 'StringLiteral';
ok  $g.parse( q{"'"},          rule => 'StringLiteral' ), 'StringLiteral';
ok  $g.parse( q{'\"'},         rule => 'StringLiteral' ), 'StringLiteral';
ok  $g.parse( q{"\""},         rule => 'StringLiteral' ), 'StringLiteral';
ok  $g.parse( q{'\''},         rule => 'StringLiteral' ), 'StringLiteral';
ok  $g.parse( q{"\'"},         rule => 'StringLiteral' ), 'StringLiteral';
ok  $g.parse( q{'\n'},         rule => 'StringLiteral' ), 'StringLiteral';
ok  $g.parse( q{'\\\x[2028]'}, rule => 'StringLiteral' ), 'StringLiteral';
ok  $g.parse( q{'\y'},         rule => 'StringLiteral' ), 'StringLiteral';
ok  $g.parse( q{'foo bar'},    rule => 'StringLiteral' ), 'StringLiteral';

ok $g.parse( q{}, rule => 'switchStatement' ), 'switchStatement';

nok $g.parse( q{},            rule => 'throwStatement' ), 'throwStatement';
ok  $g.parse( q{throw a_;},   rule => 'throwStatement' ), 'throwStatement';
ok  $g.parse( qq{throw a_\n}, rule => 'throwStatement' ), 'throwStatement';

ok $g.parse( q{}, rule => 'TOP' ), 'TOP';
ok $g.parse( q{}, rule => 'tryStatement' ), 'tryStatement';

nok $g.parse( q{}, rule => 'unaryExpression' ), 'unaryExpression';
ok  $g.parse( q{void a}, rule => 'unaryExpression' ), 'unaryExpression';

#
# Literal
#
nok $g.parse( q{},          rule => 'UnicodeCombiningMark' ),
   'UnicodeCombiningMark literal';
nok $g.parse( qq{\x[02ff]}, rule => 'UnicodeCombiningMark' ),
  'UnicodeCombiningMark literal';
ok  $g.parse( qq{\x[0300]}, rule => 'UnicodeCombiningMark' ),
  'UnicodeCombiningMark literal';

#
# Literal
#
nok $g.parse( q{},         rule => 'UnicodeConnectorPunctuation' ),
   'UnicodeConnectorPunctuation literal';
nok $g.parse( q{\x[ff3d]}, rule => 'UnicodeConnectorPunctuation' ),
   'UnicodeConnectorPunctuation literal';
ok $g.parse( qq{\x[005f]}, rule => 'UnicodeConnectorPunctuation' ),
   'UnicodeConnectorPunctuation literal';

#
# Literal
#
nok $g.parse( q{},          rule => 'UnicodeDigit' ), 'UnicodeDigit literal';
nok $g.parse( q{\x[0265]},  rule => 'UnicodeDigit' ), 'UnicodeDigit literal';
ok  $g.parse( qq{\x[0031]}, rule => 'UnicodeDigit' ), 'UnicodeDigit literal';

nok $g.parse( q{},      rule => 'UnicodeEscapeSequence' ),
    'UnicodeEscapeSequence';
ok  $g.parse( q{u0000}, rule => 'UnicodeEscapeSequence' ),
    'UnicodeEscapeSequence';
ok  $g.parse( q{ufF33}, rule => 'UnicodeEscapeSequence' ),
    'UnicodeEscapeSequence';

#
# Literal
#
nok $g.parse( q{},          rule => 'UnicodeLetter' ), 'UnicodeLetter literal';
nok $g.parse( q{9},         rule => 'UnicodeLetter' ), 'UnicodeLetter literal';
nok $g.parse( qq{\x[00ab]}, rule => 'UnicodeLetter' ), 'UnicodeLetter literal';
ok  $g.parse( q{a},         rule => 'UnicodeLetter' ), 'UnicodeLetter literal';
ok  $g.parse( qq{\x[04cb]}, rule => 'UnicodeLetter' ), 'UnicodeLetter literal';

nok $g.parse( q{}, rule => 'variableDeclaration' ), 'variableDeclaration';
ok  $g.parse( q{A}, rule => 'variableDeclaration' ), 'variableDeclaration';
ok  $g.parse( q{A = 1}, rule => 'variableDeclaration' ), 'variableDeclaration';

nok $g.parse( q{}, rule => 'variableDeclarationList' ),
   'variableDeclarationList';
ok  $g.parse( q{a=1}, rule => 'variableDeclarationList' ),
   'variableDeclarationList';
ok  $g.parse( q{a=1,b=a}, rule => 'variableDeclarationList' ),
   'variableDeclarationList';

ok $g.parse( q{}, rule => 'variableDeclarationListNoIn' ),
   'variableDeclarationListNoIn';

ok $g.parse( q{}, rule => 'variableDeclarationNoIn' ),
    'variableDeclarationNoIn';

nok $g.parse( q{}, rule => 'variableStatement' ), 'variableStatement';
ok  $g.parse( q{varA=1;}, rule => 'variableStatement' ), 'variableStatement';
ok  $g.parse( q{varA=1,b=A;}, rule => 'variableStatement' ), 'variableStatement';

nok $g.parse( q{}, rule => 'whileStatement' ), 'whileStatement';
ok  $g.parse( q{while(1)a++;}, rule => 'whileStatement' ), 'whileStatement';

#
# Literal
#
nok $g.parse( qq{},   rule => 'WhiteSpace' ), 'WhiteSpace literal';
nok $g.parse( qq{a},  rule => 'WhiteSpace' ), 'WhiteSpace literal';
ok  $g.parse( qq{\t}, rule => 'WhiteSpace' ), 'WhiteSpace literal';

ok $g.parse( q{}, rule => 'withStatement' ), 'withStatement';
