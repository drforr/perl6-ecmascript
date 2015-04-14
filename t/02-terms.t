use v6;

use Test;

plan 192;

use Grammar::ECMAScript;

my $g = Grammar::ECMAScript.new;

##############################################################################

ok $g.parse( q{}, rule => 'additiveExpression' ), 'additiveExpression';
ok $g.parse( q{}, rule => 'arguments' ), 'arguments';
ok $g.parse( q{}, rule => 'arrayLiteral' ), 'arrayLiteral';
ok $g.parse( q{}, rule => 'assignmentExpression' ), 'assignmentExpression';
ok $g.parse( q{}, rule => 'assignmentExpressionNoIn' ),
   'assignmentExpressionNoIn';

#
# Literal
#
nok $g.parse( q{},     rule => 'assignmentOperator' ),
   'assignmentOperator literal';
ok  $g.parse( q{=},    rule => 'assignmentOperator' ),
   'assignmentOperator literal';
ok  $g.parse( q{*=},   rule => 'assignmentOperator' ),
   'assignmentOperator literal';
ok  $g.parse( q{>>>=}, rule => 'assignmentOperator' ),
   'assignmentOperator literal';
nok $g.parse( q{#=},   rule => 'assignmentOperator' ),
   'assignmentOperator literal';

ok $g.parse( q{}, rule => 'bitwiseANDExpression' ), 'bitwiseANDExpression';
ok $g.parse( q{}, rule => 'bitwiseANDExpressionNoIn' ),
   'bitwiseANDExpressionNoIn';
ok $g.parse( q{}, rule => 'bitwiseORExpression' ), 'bitwiseORExpression';
ok $g.parse( q{}, rule => 'bitwiseORExpressionNoIn' ),
   'bitwiseORExpressionNoIn';
ok $g.parse( q{}, rule => 'bitwiseXORExpression' ), 'bitwiseXORExpression';
ok $g.parse( q{}, rule => 'bitwiseXORExpressionNoIn' ),
   'bitwiseXORExpressionNoIn';
ok $g.parse( q{}, rule => 'breakStatement' ), 'breakStatement';
ok $g.parse( q{}, rule => 'callExpression' ), 'callExpression';
ok $g.parse( q{}, rule => 'callExpressionSuffix' ), 'callExpressionSuffix';
ok $g.parse( q{}, rule => 'caseBlock' ), 'caseBlock';
ok $g.parse( q{}, rule => 'caseClause' ), 'caseClause';
ok $g.parse( q{}, rule => 'catchClause' ), 'catchClause';

nok $g.parse( q{}, rule => 'CharacterEscapeSequence' ),
   'CharacterEscapeSequence';
ok  $g.parse( q{'}, rule => 'CharacterEscapeSequence' ),
   'CharacterEscapeSequence';
ok  $g.parse( q{a}, rule => 'CharacterEscapeSequence' ),
   'CharacterEscapeSequence';
nok $g.parse( q{0}, rule => 'CharacterEscapeSequence' ),
   'CharacterEscapeSequence';
nok $g.parse( q{x}, rule => 'CharacterEscapeSequence' ),
   'CharacterEscapeSequence';
nok $g.parse( qq{\n}, rule => 'CharacterEscapeSequence' ),
   'CharacterEscapeSequence';

#
# Literal
#
nok $g.parse( q{},        rule => 'Comment' ), 'Comment literal';
ok  $g.parse( q{/**/},    rule => 'Comment' ), 'Comment literal';
ok  $g.parse( q{/*...*/}, rule => 'Comment' ), 'Comment literal';
nok $g.parse( q{foo},     rule => 'Comment' ), 'Comment literal';

ok $g.parse( q{}, rule => 'conditionalExpression' ),
   'conditionalExpression';
ok $g.parse( q{}, rule => 'conditionalExpressionNoIn' ),
   'conditionalExpressionNoIn';
ok $g.parse( q{}, rule => 'continueStatement' ), 'continueStatement';

#
# Literal
#
nok $g.parse( q{},  rule => 'DecimalDigit' ), 'DecimalDigit literal';
ok  $g.parse( q{0}, rule => 'DecimalDigit' ), 'DecimalDigit literal';
ok  $g.parse( q{9}, rule => 'DecimalDigit' ), 'DecimalDigit literal';
nok $g.parse( q{Ⅲ}, rule => 'DecimalDigit' ), 'DecimalDigit literal';
nok $g.parse( q{৪}, rule => 'DecimalDigit' ), 'DecimalDigit literal';

#
# Literal
#
nok $g.parse( q{},  rule => 'DecimalDigit' ), 'DecimalDigit literal';
ok  $g.parse( q{0}, rule => 'DecimalDigit' ), 'DecimalDigit literal';
nok $g.parse( q{a}, rule => 'DecimalDigit' ), 'DecimalDigit literal';

nok $g.parse( q{},         rule => 'DecimalLiteral' ), 'DecimalLiteral';
ok  $g.parse( q{23},       rule => 'DecimalLiteral' ), 'DecimalLiteral';
ok  $g.parse( q{23e4},     rule => 'DecimalLiteral' ), 'DecimalLiteral';
ok  $g.parse( q{.23},      rule => 'DecimalLiteral' ), 'DecimalLiteral';
ok  $g.parse( q{.23e-2},   rule => 'DecimalLiteral' ), 'DecimalLiteral';
ok  $g.parse( q{45.23},    rule => 'DecimalLiteral' ), 'DecimalLiteral';
ok  $g.parse( q{45.23E-7}, rule => 'DecimalLiteral' ), 'DecimalLiteral';

ok $g.parse( q{}, rule => 'defaultClause' ), 'defaultClause';
ok $g.parse( q{}, rule => 'DoubleStringCharacter' ),
   'DoubleStringCharacter';
ok $g.parse( q{}, rule => 'doWhileStatement' ), 'doWhileStatement';

#
# Literal
#
nok $g.parse( q{},  rule => 'emptyStatement' ), 'emptyStatement literal';
ok  $g.parse( q{;}, rule => 'emptyStatement' ), 'emptyStatement literal';
nok $g.parse( q{a}, rule => 'emptyStatement' ), 'emptyStatement literal';
	
ok $g.parse( q{}, rule => 'EOF_bang' ), 'EOF_bang';
ok $g.parse( q{}, rule => 'equalityExpression' ), 'equalityExpression';
ok $g.parse( q{}, rule => 'equalityExpressionNoIn' ),
   'equalityExpressionNoIn';

nok $g.parse( q{},   rule => 'EscapeCharacter' ), 'EscapeCharacter';
ok  $g.parse( q{\\}, rule => 'EscapeCharacter' ), 'EscapeCharacter';
ok  $g.parse( q{f},  rule => 'EscapeCharacter' ), 'EscapeCharacter';
ok  $g.parse( q{'},  rule => 'EscapeCharacter' ), 'EscapeCharacter';
ok  $g.parse( q{u},  rule => 'EscapeCharacter' ), 'EscapeCharacter';

#nok $g.parse( q{},     rule => 'EscapeOrWhitespaceCharacter' ),
#   'EscapeOrWhitespaceCharacter';
#ok  $g.parse( q{\\},   rule => 'EscapeOrWhitespaceCharacter' ),
#   'EscapeOrWhitespaceCharacter';
#ok  $g.parse( q{f},    rule => 'EscapeOrWhitespaceCharacter' ),
#   'EscapeOrWhitespaceCharacter';
#ok  $g.parse( q{'},    rule => 'EscapeOrWhitespaceCharacter' ),
#   'EscapeOrWhitespaceCharacter';
#ok  $g.parse( q{u},    rule => 'EscapeOrWhitespaceCharacter' ),
#   'EscapeOrWhitespaceCharacter';
#ok  $g.parse( qq{\r},  rule => 'EscapeOrWhitespaceCharacter' ),
#   'EscapeOrWhitespaceCharacter';

ok $g.parse( q{}, rule => 'EscapeSequence' ), 'EscapeSequence';

nok $g.parse( q{},    rule => 'ExponentPart' ), 'ExponentPart';
ok  $g.parse( q{e0},  rule => 'ExponentPart' ), 'ExponentPart';
ok  $g.parse( q{E1},  rule => 'ExponentPart' ), 'ExponentPart';
ok  $g.parse( q{E-2}, rule => 'ExponentPart' ), 'ExponentPart';

ok $g.parse( q{}, rule => 'expression' ), 'expression';
ok $g.parse( q{}, rule => 'expressionNoIn' ), 'expressionNoIn';
ok $g.parse( q{}, rule => 'expressionStatement' ), 'expressionStatement';
ok $g.parse( q{}, rule => 'finallyClause' ), 'finallyClause';
ok $g.parse( q{}, rule => 'forInStatement' ), 'forInStatement';
ok $g.parse( q{}, rule => 'forInStatementInitialiserPart' ),
   'forInStatementInitialiserPart';
ok $g.parse( q{}, rule => 'formalParameterList' ), 'formalParameterList';
ok $g.parse( q{}, rule => 'forStatement' ), 'forStatement';
ok $g.parse( q{}, rule => 'forStatementInitialiserPart' ),
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

ok $g.parse( q{}, rule => 'Identifier' ), 'Identifier';
ok $g.parse( q{}, rule => 'IdentifierPart' ), 'IdentifierPart';
ok $g.parse( q{}, rule => 'IdentifierStart' ), 'IdentifierStart';
ok $g.parse( q{}, rule => 'ifStatement' ), 'ifStatement';
ok $g.parse( q{}, rule => 'indexSuffix' ), 'indexSuffix';
ok $g.parse( q{}, rule => 'initialiser' ), 'initialiser';
ok $g.parse( q{}, rule => 'initialiserNoIn' ), 'initialiserNoIn';
ok $g.parse( q{}, rule => 'iterationStatement' ), 'iterationStatement';
ok $g.parse( q{}, rule => 'labelledStatement' ), 'labelledStatement';
ok $g.parse( q{}, rule => 'leftHandSideExpression' ),
   'leftHandSideExpression';

#
# Literal
#
nok $g.parse( q{},          rule => 'LineComment' ), 'LineComment literal';
ok  $g.parse( q{//},        rule => 'LineComment' ), 'LineComment literal';
ok  $g.parse( q{// },       rule => 'LineComment' ), 'LineComment literal';
ok  $g.parse( q{//foo},     rule => 'LineComment' ), 'LineComment literal';
ok  $g.parse( q{//foo bar}, rule => 'LineComment' ), 'LineComment literal';

ok $g.parse( q{}, rule => 'literal' ), 'literal';
ok $g.parse( q{}, rule => 'logicalANDExpression' ), 'logicalANDExpression';
ok $g.parse( q{}, rule => 'logicalANDExpressionNoIn' ),
   'logicalANDExpressionNoIn';
ok $g.parse( q{}, rule => 'logicalORExpression' ), 'logicalORExpression';
ok $g.parse( q{}, rule => 'logicalORExpressionNoIn' ),
   'logicalORExpressionNoIn';

#
# Literal
#
nok $g.parse( q{},    rule => 'LT' ), 'LT literal';
ok  $g.parse( qq{\n}, rule => 'LT' ), 'LT literal';
ok  $g.parse( qq{\r}, rule => 'LT' ), 'LT literal';
nok $g.parse( qq{\a}, rule => 'LT' ), 'LT literal';
nok $g.parse( qq{f},  rule => 'LT' ), 'LT literal';

nok $g.parse( q{},          rule => 'LT_bang' ), 'LT_bang';
ok  $g.parse( qq{\n},       rule => 'LT_bang' ), 'LT_bang';
ok  $g.parse( qq{\x[2028]}, rule => 'LT_bang' ), 'LT_bang';

ok $g.parse( q{}, rule => 'memberExpression' ), 'memberExpression';
ok $g.parse( q{}, rule => 'memberExpressionSuffix' ),
   'memberExpressionSuffix';
ok $g.parse( q{}, rule => 'multiplicativeExpression' ),
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
ok  $g.parse( q{3.27e-7}, rule => 'NumericLiteral' ), 'NumericLiteral';
ok  $g.parse( q{0x234af}, rule => 'NumericLiteral' ), 'NumericLiteral';

ok $g.parse( q{}, rule => 'objectLiteral' ), 'objectLiteral';
ok $g.parse( q{}, rule => 'postfixExpression' ), 'postfixExpression';
ok $g.parse( q{}, rule => 'primaryExpression' ), 'primaryExpression';
ok $g.parse( q{}, rule => 'propertyName' ), 'propertyName';
ok $g.parse( q{}, rule => 'propertyNameAndValue' ), 'propertyNameAndValue';
ok $g.parse( q{}, rule => 'propertyReferenceSuffix' ),
   'propertyReferenceSuffix';
ok $g.parse( q{}, rule => 'relationalExpression' ), 'relationalExpression';
ok $g.parse( q{}, rule => 'relationalExpressionNoIn' ),
   'relationalExpressionNoIn';
ok $g.parse( q{}, rule => 'returnStatement' ), 'returnStatement';
ok $g.parse( q{}, rule => 'shiftExpression' ), 'shiftExpression';

#
# Literal
#
nok $g.parse( q{}, rule => 'SingleEscapeCharacter' ),
    'SingleEscapeCharacter literal';
ok  $g.parse( q{'}, rule => 'SingleEscapeCharacter' ),
    'SingleEscapeCharacter literal';
ok  $g.parse( q{"}, rule => 'SingleEscapeCharacter' ),
    'SingleEscapeCharacter literal';
ok  $g.parse( q{b}, rule => 'SingleEscapeCharacter' ),
    'SingleEscapeCharacter literal';
nok $g.parse( q{k}, rule => 'SingleEscapeCharacter' ),
   'SingleEscapeCharacter literal';

ok $g.parse( q{}, rule => 'SingleStringCharacter' ), 'SingleStringCharacter';
ok $g.parse( q{}, rule => 'sourceElement' ), 'sourceElement';
ok $g.parse( q{}, rule => 'sourceElements' ), 'sourceElements';
ok $g.parse( q{}, rule => 'statement' ), 'statement';
ok $g.parse( q{}, rule => 'statementBlock' ), 'statementBlock';
ok $g.parse( q{}, rule => 'statementList' ), 'statementList';
ok $g.parse( q{}, rule => 'StringLiteral' ), 'StringLiteral';
ok $g.parse( q{}, rule => 'switchStatement' ), 'switchStatement';
ok $g.parse( q{}, rule => 'throwStatement' ), 'throwStatement';
ok $g.parse( q{}, rule => 'TOP' ), 'TOP';
ok $g.parse( q{}, rule => 'tryStatement' ), 'tryStatement';
ok $g.parse( q{}, rule => 'unaryExpression' ), 'unaryExpression';

#
# Literal
#
nok $g.parse( q{},          rule => 'UnicodeCombiningMark' ),
   'UnicodeCombiningMark literal';
ok  $g.parse( qq{\x[0300]}, rule => 'UnicodeCombiningMark' ),
  'UnicodeCombiningMark literal';
nok $g.parse( qq{\x[02ff]}, rule => 'UnicodeCombiningMark' ),
  'UnicodeCombiningMark literal';

#
# Literal
#
nok $g.parse( q{},         rule => 'UnicodeConnectorPunctuation' ),
   'UnicodeConnectorPunctuation literal';
ok $g.parse( qq{\x[005f]}, rule => 'UnicodeConnectorPunctuation' ),
   'UnicodeConnectorPunctuation literal';
nok $g.parse( q{\x[ff3d]}, rule => 'UnicodeConnectorPunctuation' ),
   'UnicodeConnectorPunctuation literal';

#
# Literal
#
nok $g.parse( q{},          rule => 'UnicodeDigit' ), 'UnicodeDigit literal';
ok  $g.parse( qq{\x[0031]}, rule => 'UnicodeDigit' ), 'UnicodeDigit literal';
nok $g.parse( q{\x[0265]},  rule => 'UnicodeDigit' ), 'UnicodeDigit literal';

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
ok  $g.parse( q{a},         rule => 'UnicodeLetter' ), 'UnicodeLetter literal';
ok  $g.parse( qq{\x[04cb]}, rule => 'UnicodeLetter' ), 'UnicodeLetter literal';
nok $g.parse( q{9},         rule => 'UnicodeLetter' ), 'UnicodeLetter literal';
nok $g.parse( qq{\x[00ab]}, rule => 'UnicodeLetter' ), 'UnicodeLetter literal';

ok $g.parse( q{}, rule => 'variableDeclaration' ), 'variableDeclaration';
ok $g.parse( q{}, rule => 'variableDeclarationList' ),
   'variableDeclarationList';
ok $g.parse( q{}, rule => 'variableDeclarationListNoIn' ),
   'variableDeclarationListNoIn';
ok $g.parse( q{}, rule => 'variableDeclarationNoIn' ),
   'variableDeclarationNoIn';
ok $g.parse( q{}, rule => 'variableStatement' ), 'variableStatement';
ok $g.parse( q{}, rule => 'whileStatement' ), 'whileStatement';

#
# Literal
#
nok $g.parse( qq{},   rule => 'WhiteSpace' ), 'WhiteSpace literal';
ok  $g.parse( qq{\t}, rule => 'WhiteSpace' ), 'WhiteSpace literal';
nok $g.parse( qq{a},  rule => 'WhiteSpace' ), 'WhiteSpace literal';

ok $g.parse( q{}, rule => 'withStatement' ), 'withStatement';
