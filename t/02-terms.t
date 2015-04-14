use v6;

use Test;

plan 158;

use Grammar::ECMAScript;

my $g = Grammar::ECMAScript.new;

##############################################################################

ok $g.subparse( q{}, rule => 'additiveExpression' ), 'additiveExpression';
ok $g.subparse( q{}, rule => 'arguments' ), 'arguments';
ok $g.subparse( q{}, rule => 'arrayLiteral' ), 'arrayLiteral';
ok $g.subparse( q{}, rule => 'assignmentExpression' ), 'assignmentExpression';
ok $g.subparse( q{}, rule => 'assignmentExpressionNoIn' ),
   'assignmentExpressionNoIn';

#
# Literal
#
nok $g.subparse( q{},     rule => 'assignmentOperator' ),
   'assignmentOperator literal';
ok  $g.subparse( q{=},    rule => 'assignmentOperator' ),
   'assignmentOperator literal';
ok  $g.subparse( q{*=},   rule => 'assignmentOperator' ),
   'assignmentOperator literal';
ok  $g.subparse( q{>>>=}, rule => 'assignmentOperator' ),
   'assignmentOperator literal';
nok $g.subparse( q{#=},   rule => 'assignmentOperator' ),
   'assignmentOperator literal';

ok $g.subparse( q{}, rule => 'bitwiseANDExpression' ), 'bitwiseANDExpression';
ok $g.subparse( q{}, rule => 'bitwiseANDExpressionNoIn' ),
   'bitwiseANDExpressionNoIn';
ok $g.subparse( q{}, rule => 'bitwiseORExpression' ), 'bitwiseORExpression';
ok $g.subparse( q{}, rule => 'bitwiseORExpressionNoIn' ),
   'bitwiseORExpressionNoIn';
ok $g.subparse( q{}, rule => 'bitwiseXORExpression' ), 'bitwiseXORExpression';
ok $g.subparse( q{}, rule => 'bitwiseXORExpressionNoIn' ),
   'bitwiseXORExpressionNoIn';
ok $g.subparse( q{}, rule => 'breakStatement' ), 'breakStatement';
ok $g.subparse( q{}, rule => 'callExpression' ), 'callExpression';
ok $g.subparse( q{}, rule => 'callExpressionSuffix' ), 'callExpressionSuffix';
ok $g.subparse( q{}, rule => 'caseBlock' ), 'caseBlock';
ok $g.subparse( q{}, rule => 'caseClause' ), 'caseClause';
ok $g.subparse( q{}, rule => 'catchClause' ), 'catchClause';
ok $g.subparse( q{}, rule => 'CharacterEscapeSequence' ),
   'CharacterEscapeSequence';

#
# Literal
#
nok $g.subparse( q{},        rule => 'Comment' ), 'Comment literal';
ok  $g.subparse( q{/**/},    rule => 'Comment' ), 'Comment literal';
ok  $g.subparse( q{/*...*/}, rule => 'Comment' ), 'Comment literal';
nok $g.subparse( q{foo},     rule => 'Comment' ), 'Comment literal';

ok $g.subparse( q{}, rule => 'conditionalExpression' ),
   'conditionalExpression';
ok $g.subparse( q{}, rule => 'conditionalExpressionNoIn' ),
   'conditionalExpressionNoIn';
ok $g.subparse( q{}, rule => 'continueStatement' ), 'continueStatement';

#
# Literal
#
nok $g.subparse( q{},  rule => 'DecimalDigit' ), 'DecimalDigit literal';
ok  $g.subparse( q{0}, rule => 'DecimalDigit' ), 'DecimalDigit literal';
ok  $g.subparse( q{9}, rule => 'DecimalDigit' ), 'DecimalDigit literal';
nok $g.subparse( q{Ⅲ}, rule => 'DecimalDigit' ), 'DecimalDigit literal';
nok $g.subparse( q{৪}, rule => 'DecimalDigit' ), 'DecimalDigit literal';

#
# Literal
#
nok $g.subparse( q{},  rule => 'DecimalDigit' ), 'DecimalDigit literal';
ok  $g.subparse( q{0}, rule => 'DecimalDigit' ), 'DecimalDigit literal';
nok $g.subparse( q{a}, rule => 'DecimalDigit' ), 'DecimalDigit literal';

ok $g.subparse( q{}, rule => 'DecimalLiteral' ), 'DecimalLiteral';
ok $g.subparse( q{}, rule => 'defaultClause' ), 'defaultClause';
ok $g.subparse( q{}, rule => 'DoubleStringCharacter' ),
   'DoubleStringCharacter';
ok $g.subparse( q{}, rule => 'DoubleStringNonCharacter' ),
   'DoubleStringNonCharacter';
ok $g.subparse( q{}, rule => 'doWhileStatement' ), 'doWhileStatement';

#
# Literal
#
nok $g.subparse( q{},  rule => 'emptyStatement' ), 'emptyStatement literal';
ok  $g.subparse( q{;}, rule => 'emptyStatement' ), 'emptyStatement literal';
nok $g.subparse( q{a}, rule => 'emptyStatement' ), 'emptyStatement literal';
	
ok $g.subparse( q{}, rule => 'EOF_bang' ), 'EOF_bang';
ok $g.subparse( q{}, rule => 'equalityExpression' ), 'equalityExpression';
ok $g.subparse( q{}, rule => 'equalityExpressionNoIn' ),
   'equalityExpressionNoIn';
ok $g.subparse( q{}, rule => 'EscapeCharacter' ), 'EscapeCharacter';
ok $g.subparse( q{}, rule => 'EscapeOrWhitespaceCharacter' ),
   'EscapeOrWhitespaceCharacter';
ok $g.subparse( q{}, rule => 'EscapeSequence' ), 'EscapeSequence';
ok $g.subparse( q{}, rule => 'ExponentPart' ), 'ExponentPart';
ok $g.subparse( q{}, rule => 'expression' ), 'expression';
ok $g.subparse( q{}, rule => 'expressionNoIn' ), 'expressionNoIn';
ok $g.subparse( q{}, rule => 'expressionStatement' ), 'expressionStatement';
ok $g.subparse( q{}, rule => 'finallyClause' ), 'finallyClause';
ok $g.subparse( q{}, rule => 'forInStatement' ), 'forInStatement';
ok $g.subparse( q{}, rule => 'forInStatementInitialiserPart' ),
   'forInStatementInitialiserPart';
ok $g.subparse( q{}, rule => 'formalParameterList' ), 'formalParameterList';
ok $g.subparse( q{}, rule => 'forStatement' ), 'forStatement';
ok $g.subparse( q{}, rule => 'forStatementInitialiserPart' ),
   'forStatementInitialiserPart';
ok $g.subparse( q{}, rule => 'functionBody' ), 'functionBody';
ok $g.subparse( q{}, rule => 'functionDeclaration' ), 'functionDeclaration';
ok $g.subparse( q{}, rule => 'functionExpression' ), 'functionExpression';

nok $g.subparse( q{},  rule => 'HexDigit' ), 'HexDigit';
ok  $g.subparse( q{0}, rule => 'HexDigit' ), 'HexDigit';
ok  $g.subparse( q{9}, rule => 'HexDigit' ), 'HexDigit';
ok  $g.subparse( q{a}, rule => 'HexDigit' ), 'HexDigit';
ok  $g.subparse( q{F}, rule => 'HexDigit' ), 'HexDigit';

ok $g.subparse( q{}, rule => 'HexEscapeSequence' ), 'HexEscapeSequence';

nok $g.subparse( q{},      rule => 'HexIntegerLiteral' ), 'HexIntegerLiteral';
nok $g.subparse( q{0x},    rule => 'HexIntegerLiteral' ), 'HexIntegerLiteral';
ok  $g.subparse( q{0x0},   rule => 'HexIntegerLiteral' ), 'HexIntegerLiteral';
ok  $g.subparse( q{0x9fD}, rule => 'HexIntegerLiteral' ), 'HexIntegerLiteral';
ok  $g.subparse( q{0X9fD}, rule => 'HexIntegerLiteral' ), 'HexIntegerLiteral';

ok $g.subparse( q{}, rule => 'Identifier' ), 'Identifier';
ok $g.subparse( q{}, rule => 'IdentifierPart' ), 'IdentifierPart';
ok $g.subparse( q{}, rule => 'IdentifierStart' ), 'IdentifierStart';
ok $g.subparse( q{}, rule => 'ifStatement' ), 'ifStatement';
ok $g.subparse( q{}, rule => 'indexSuffix' ), 'indexSuffix';
ok $g.subparse( q{}, rule => 'initialiser' ), 'initialiser';
ok $g.subparse( q{}, rule => 'initialiserNoIn' ), 'initialiserNoIn';
ok $g.subparse( q{}, rule => 'iterationStatement' ), 'iterationStatement';
ok $g.subparse( q{}, rule => 'labelledStatement' ), 'labelledStatement';
ok $g.subparse( q{}, rule => 'leftHandSideExpression' ),
   'leftHandSideExpression';

#
# Literal
#
#ok $g.subparse( q{// foo}, rule => 'LineComment' ), 'LineComment literal';

ok $g.subparse( q{}, rule => 'literal' ), 'literal';
ok $g.subparse( q{}, rule => 'logicalANDExpression' ), 'logicalANDExpression';
ok $g.subparse( q{}, rule => 'logicalANDExpressionNoIn' ),
   'logicalANDExpressionNoIn';
ok $g.subparse( q{}, rule => 'logicalORExpression' ), 'logicalORExpression';
ok $g.subparse( q{}, rule => 'logicalORExpressionNoIn' ),
   'logicalORExpressionNoIn';

#
# Literal
#
nok $g.subparse( q{},    rule => 'LT' ), 'LT literal';
ok  $g.subparse( qq{\n}, rule => 'LT' ), 'LT literal';
ok  $g.subparse( qq{\r}, rule => 'LT' ), 'LT literal';
nok $g.subparse( qq{\a}, rule => 'LT' ), 'LT literal';
nok $g.subparse( qq{f},  rule => 'LT' ), 'LT literal';

nok $g.subparse( q{},          rule => 'LT_bang' ), 'LT_bang';
ok  $g.subparse( qq{\n},       rule => 'LT_bang' ), 'LT_bang';
ok  $g.subparse( qq{\x[2028]}, rule => 'LT_bang' ), 'LT_bang';

ok $g.subparse( q{}, rule => 'memberExpression' ), 'memberExpression';
ok $g.subparse( q{}, rule => 'memberExpressionSuffix' ),
   'memberExpressionSuffix';
ok $g.subparse( q{}, rule => 'multiplicativeExpression' ),
   'multiplicativeExpression';
ok $g.subparse( q{}, rule => 'newExpression' ), 'newExpression';
ok $g.subparse( q{}, rule => 'NonEscapeCharacter' ), 'NonEscapeCharacter';
ok $g.subparse( q{}, rule => 'NumericLiteral' ), 'NumericLiteral';
ok $g.subparse( q{}, rule => 'objectLiteral' ), 'objectLiteral';
ok $g.subparse( q{}, rule => 'postfixExpression' ), 'postfixExpression';
ok $g.subparse( q{}, rule => 'primaryExpression' ), 'primaryExpression';
ok $g.subparse( q{}, rule => 'propertyName' ), 'propertyName';
ok $g.subparse( q{}, rule => 'propertyNameAndValue' ), 'propertyNameAndValue';
ok $g.subparse( q{}, rule => 'propertyReferenceSuffix' ),
   'propertyReferenceSuffix';
ok $g.subparse( q{}, rule => 'relationalExpression' ), 'relationalExpression';
ok $g.subparse( q{}, rule => 'relationalExpressionNoIn' ),
   'relationalExpressionNoIn';
ok $g.subparse( q{}, rule => 'returnStatement' ), 'returnStatement';
ok $g.subparse( q{}, rule => 'shiftExpression' ), 'shiftExpression';

#
# Literal
#
nok $g.subparse( q{}, rule => 'SingleEscapeCharacter' ),
    'SingleEscapeCharacter literal';
ok  $g.subparse( q{'}, rule => 'SingleEscapeCharacter' ),
    'SingleEscapeCharacter literal';
ok  $g.subparse( q{"}, rule => 'SingleEscapeCharacter' ),
    'SingleEscapeCharacter literal';
ok  $g.subparse( q{b}, rule => 'SingleEscapeCharacter' ),
    'SingleEscapeCharacter literal';
nok $g.subparse( q{k}, rule => 'SingleEscapeCharacter' ),
   'SingleEscapeCharacter literal';

ok $g.subparse( q{}, rule => 'SingleStringCharacter' ),
   'SingleStringCharacter';
ok $g.subparse( q{}, rule => 'SingleStringNonCharacter' ),
   'SingleStringNonCharacter';
ok $g.subparse( q{}, rule => 'sourceElement' ), 'sourceElement';
ok $g.subparse( q{}, rule => 'sourceElements' ), 'sourceElements';
ok $g.subparse( q{}, rule => 'statement' ), 'statement';
ok $g.subparse( q{}, rule => 'statementBlock' ), 'statementBlock';
ok $g.subparse( q{}, rule => 'statementList' ), 'statementList';
ok $g.subparse( q{}, rule => 'StringLiteral' ), 'StringLiteral';
ok $g.subparse( q{}, rule => 'switchStatement' ), 'switchStatement';
ok $g.subparse( q{}, rule => 'throwStatement' ), 'throwStatement';
ok $g.subparse( q{}, rule => 'TOP' ), 'TOP';
ok $g.subparse( q{}, rule => 'tryStatement' ), 'tryStatement';
ok $g.subparse( q{}, rule => 'unaryExpression' ), 'unaryExpression';

#
# Literal
#
nok $g.subparse( q{},          rule => 'UnicodeCombiningMark' ),
   'UnicodeCombiningMark literal';
ok  $g.subparse( qq{\x[0300]}, rule => 'UnicodeCombiningMark' ),
  'UnicodeCombiningMark literal';
nok $g.subparse( qq{\x[02ff]}, rule => 'UnicodeCombiningMark' ),
  'UnicodeCombiningMark literal';

#
# Literal
#
nok $g.subparse( q{},         rule => 'UnicodeConnectorPunctuation' ),
   'UnicodeConnectorPunctuation literal';
ok $g.subparse( qq{\x[005f]}, rule => 'UnicodeConnectorPunctuation' ),
   'UnicodeConnectorPunctuation literal';
nok $g.subparse( q{\x[ff3d]}, rule => 'UnicodeConnectorPunctuation' ),
   'UnicodeConnectorPunctuation literal';

#
# Literal
#
nok $g.subparse( q{},          rule => 'UnicodeDigit' ), 'UnicodeDigit literal';
ok  $g.subparse( qq{\x[0031]}, rule => 'UnicodeDigit' ), 'UnicodeDigit literal';
nok $g.subparse( q{\x[0265]},  rule => 'UnicodeDigit' ), 'UnicodeDigit literal';

ok $g.subparse( q{}, rule => 'UnicodeEscapeSequence' ),
   'UnicodeEscapeSequence';

#
# Literal
#
nok $g.subparse( q{},          rule => 'UnicodeLetter' ),
    'UnicodeLetter literal';
ok  $g.subparse( q{a},         rule => 'UnicodeLetter' ),
    'UnicodeLetter literal';
ok  $g.subparse( qq{\x[04cb]}, rule => 'UnicodeLetter' ),
    'UnicodeLetter literal';
nok $g.subparse( q{9},         rule => 'UnicodeLetter' ),
    'UnicodeLetter literal';
nok $g.subparse( qq{\x[00ab]}, rule => 'UnicodeLetter' ),
    'UnicodeLetter literal';

ok $g.subparse( q{}, rule => 'variableDeclaration' ), 'variableDeclaration';
ok $g.subparse( q{}, rule => 'variableDeclarationList' ),
   'variableDeclarationList';
ok $g.subparse( q{}, rule => 'variableDeclarationListNoIn' ),
   'variableDeclarationListNoIn';
ok $g.subparse( q{}, rule => 'variableDeclarationNoIn' ),
   'variableDeclarationNoIn';
ok $g.subparse( q{}, rule => 'variableStatement' ), 'variableStatement';
ok $g.subparse( q{}, rule => 'whileStatement' ), 'whileStatement';

#
# Literal
#
nok $g.subparse( qq{},   rule => 'WhiteSpace' ), 'WhiteSpace literal';
ok  $g.subparse( qq{\t}, rule => 'WhiteSpace' ), 'WhiteSpace literal';
nok $g.subparse( qq{a},  rule => 'WhiteSpace' ), 'WhiteSpace literal';

ok $g.subparse( q{}, rule => 'withStatement' ), 'withStatement';
