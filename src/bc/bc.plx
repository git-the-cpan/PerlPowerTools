$yysccsid = "@(#)yaccpar 1.8 (Berkeley) 01/20/91 (Perl 2.0 12/31/92)";
#define YYBYACC 1
#line 49 "bc.y"


;# I don't use BigFloat any more because they lack operators such as **,
;# and they're very, very slow
;## BigFloat calls a function it does not define
;#sub Math::BigFloat::panic { die $_[0];  }
;#use Math::BigFloat;

;# The symbol table : the keys are the identifiers, the value is in the
;# "var" field if it is a variable, in the "func" field if it is a 
;# function.
my %sym_table;
my @stmt_list = ();
my @ope_stack;
my @backup_sym_table;
my $input;
my $cur_file = '-';

$debug = 0;
sub debug(&) {
  my $fn = shift;
  print STDERR "\t".&$fn()
    if $debug;
}

;#$yydebug=1;

#line 32 "y.tab.pl"
$INT=257;
$FLOAT=258;
$STRING=259;
$IDENT=260;
$C_COMMENT=261;
$BREAK=262;
$DEFINE=263;
$AUTO=264;
$RETURN=265;
$PRINT=266;
$AUTO_LIST=267;
$IF=268;
$ELSE=269;
$QUIT=270;
$WHILE=271;
$FOR=272;
$EQ=273;
$NE=274;
$GT=275;
$GE=276;
$LT=277;
$LE=278;
$PP=279;
$MM=280;
$P_EQ=281;
$M_EQ=282;
$F_EQ=283;
$D_EQ=284;
$EXP_EQ=285;
$MOD_EQ=286;
$L_SHIFT=287;
$R_SHIFT=288;
$E_E=289;
$O_O=290;
$EXP=291;
$UNARY=292;
$PPP=293;
$MMM=294;
$YYERRCODE=256;
@yylhs = (                                               -1,
    0,    0,    1,    1,    1,    3,    4,    9,    3,    3,
    3,   12,    3,   13,    3,   14,    3,   15,   17,    3,
   18,   19,   20,    3,    3,   10,   10,   16,   16,    8,
    8,    6,    6,    2,    2,    5,    5,   22,   22,   23,
   23,   24,   24,    7,    7,   25,   25,   11,   11,   21,
   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
   21,   21,   21,   21,   21,   21,   21,   26,   26,
);
@yylen = (                                                2,
    0,    2,    1,    2,    2,    1,    0,    0,   13,    1,
    1,    0,    3,    0,    4,    0,    7,    0,    0,    8,
    0,    0,    0,   13,    1,    1,    4,    0,    1,    1,
    3,    0,    1,    1,    1,    0,    1,    1,    3,    0,
    1,    1,    3,    0,    3,    1,    3,    1,    3,    4,
    3,    3,    3,    3,    3,    3,    3,    3,    3,    3,
    3,    3,    3,    3,    3,    3,    3,    3,    3,    3,
    3,    3,    3,    2,    2,    2,    2,    2,    2,    2,
    2,    3,    6,    1,    1,    1,    1,    1,    4,
);
@yydefred = (                                             1,
    0,    0,   85,   86,   87,    0,    0,   11,    7,    0,
   12,    0,    6,   18,    0,    0,    0,    0,    0,    0,
   14,    0,   34,   35,    2,    3,    0,   10,    0,    0,
    5,    0,    0,    0,   81,    0,    0,    0,    0,    0,
    0,    0,   76,   77,   80,   74,    0,    0,   75,    4,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,   78,   79,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,   29,    0,    0,   51,    0,
   30,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,   50,    0,    0,    0,   27,    0,   16,
    0,   21,    0,   15,    0,    0,    0,   38,    0,    0,
    0,    0,    0,    0,   89,   31,    0,    0,    0,   33,
    0,   19,    0,    0,   39,   17,    0,   22,    0,   20,
    0,    0,    0,    0,    8,   23,   46,    0,    0,    0,
    0,   45,    0,    0,   47,    9,   24,
);
@yydgoto = (                                              1,
   25,  140,   86,   36,  129,  141,  155,   90,  159,   28,
   82,   38,   48,  132,   40,   91,  147,  134,  151,  160,
   29,  130,   77,   78,  158,   30,
);
@yysindex = (                                             0,
  475,   -8,    0,    0,    0,   84, -239,    0,    0,  -11,
    0,    3,    0,    0,   19, -218, -218,  899,  899,  899,
    0,  899,    0,    0,    0,    0,   -8,    0,  893,  -54,
    0,  899,  899,  899,    0, -199,  899,  899,  958,   24,
  958,  -26,    0,    0,    0,    0,  -32,  958,    0,    0,
  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
  899,  899,    0,    0,  893,  893,   25,   48,  830,   65,
  852,   64,  893,   27,  958,    0,   53,  899,    0,   26,
    0,  923,  923,  142,  142,  142,  142,  416,  416,  -21,
  -21,  -30,  -30,  -29,  -29, -180, -180,  142,  142,  142,
  142,  142,  142,    0,  899,   67, -146,    0,  899,    0,
   85,    0,  874,    0,  958,  893,  899,    0,   86,   87,
  893,   -8,   -8,  958,    0,    0,  893,   -8, -127,    0,
  958,    0,   88,   41,    0,    0,  958,    0,   -8,    0,
  958, -116,  108, -103,    0,    0,    0,   18,  958,   -8,
 -100,    0,   31,  958,    0,    0,    0,
);
@yyrindex = (                                             0,
    0,    0,    0,    0,    0,  -10,    0,    0,    0,   28,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,   30,   37,
    0,    0,  127,    0,    0,    0,    0,    0,    0,    0,
  119,   57,    0,    0,    0,    0,    0,   36,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    4,  -40,    0,  139,    0,    0,
    0,   34,   66,    0,  145,    0,    0,    0,    0,    0,
    0,  820,  822,  507,  518,  537,  551,  405,  442,  298,
  380,  122,  192,  129,  167,   76,   99,  572,  579,  680,
  758,  777,  799,    0,    0,   13,  149,    0,    0,    0,
    0,    0,    0,    0,   36,  -38,    0,    0,    0,  153,
   93, 1023, 1023,  119,    0,    0,   29,   60,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
  145,  499,    0,    0,    0,    0,    0,    0,   36, 1023,
    0,    0,    0,    0,    0,    0,    0,
);
@yygindex = (                                             0,
    0,  358,   52,    0,    0, -108,    0,   38,    0,    0,
    0,    0,    0,    0,    0,  337,    0,    0,    0,    0,
 1278,    0,    0,    0,    0,    2,
);
$YYTABLESIZE=1405;
@yytable = (                                             88,
   42,   24,   43,   42,   65,   43,   65,   65,   89,   63,
   61,   63,   62,   82,   64,   65,   64,   43,   44,   35,
   63,   61,   89,   62,  142,   64,   88,   24,   37,  144,
   88,   88,   88,   88,   88,   24,   88,   26,   83,   25,
   24,   42,   39,   13,   82,   28,   84,   82,   88,   89,
   23,  164,   27,   89,   89,   89,   89,   89,   41,   89,
   80,  161,   82,   85,   88,  114,   88,  120,   26,   83,
   25,   89,   83,   84,   13,   48,   23,   84,   84,   84,
   84,   84,   88,   84,   23,   67,   26,   83,   25,   23,
   84,  115,   13,   88,   28,   84,   82,   88,   88,   88,
   88,   88,   49,   88,  117,   89,   48,  119,   66,   48,
   66,  122,   67,  128,   88,   88,   67,   67,   67,   67,
   67,   83,   67,   33,   48,  133,  138,  127,   82,   84,
  139,   62,  145,   49,   67,   66,   49,   89,   64,   66,
   66,   66,   66,   66,   32,   66,  148,  154,  156,   88,
  124,   49,   26,   83,   25,  166,  157,   66,   13,  165,
   28,   84,   62,  149,   62,   62,   62,   40,   67,   64,
   64,   64,   64,   64,   34,   64,   65,   28,   65,   41,
   62,   88,   32,   63,   61,   28,   62,   64,   64,   36,
   48,   66,  146,   37,    0,    0,  163,    0,  150,    0,
   67,   63,    0,    0,    0,    0,    0,   65,   65,   65,
   65,   65,    0,   65,   62,  167,    0,   49,    0,    0,
    0,   64,    0,   66,    0,   65,   67,   68,   69,   70,
   71,   72,   63,    0,   63,   63,   63,    0,   73,   74,
   51,   52,   53,   54,   55,   56,   62,    0,    0,    0,
   63,    0,    0,   64,   57,   58,   59,   60,   66,   65,
   66,   66,   88,   88,   88,   88,   88,   88,    0,   66,
   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
   88,    0,   88,   88,   63,   89,   89,   89,   89,   89,
   89,   65,    0,   89,   89,   89,   89,   89,   89,   89,
   89,   89,   89,   89,    0,   89,   89,   53,    0,   84,
   84,   84,   84,   84,   84,    0,   63,    0,    0,    0,
    0,    0,    0,   84,   84,   84,   84,   84,    0,   88,
   88,   88,   88,   88,   88,    0,    0,    0,   53,    0,
    0,   53,    0,   88,   88,   88,   88,   88,   67,   67,
   67,   67,   67,   67,    0,    0,   53,    0,   26,   31,
    0,    0,   67,   67,   67,   67,    0,    0,    0,    0,
    0,   66,   66,   66,   66,   66,   66,   87,    0,    0,
    0,    0,    0,    0,   50,   66,   66,   66,   66,   52,
   53,    0,    0,    0,   62,   62,   62,   62,   62,   62,
    0,   64,   64,   64,   64,   64,   64,    0,   62,   62,
   62,   62,    0,    0,   60,   64,   64,   64,   64,    0,
   52,  121,   53,   52,    0,    0,    0,    0,   57,   58,
   59,   60,   66,    0,    0,    0,    0,    0,   52,   65,
   65,   65,   65,   65,   65,   60,    0,  125,   60,    0,
    0,   61,   65,   65,   65,   65,   65,   63,   61,    0,
   62,  136,   64,   60,   63,   63,   63,   63,   63,   63,
  143,    0,   52,    0,    0,    0,    0,    0,   63,   63,
   63,   63,   61,    0,   24,   61,    0,  153,    0,    0,
    0,    0,    0,    0,    0,    0,    0,   60,    0,    0,
   61,    0,    0,    0,   52,    0,  152,   22,   44,    0,
    0,    0,    7,    0,   20,  162,   56,   18,    0,   19,
  125,    0,    0,    0,    0,    0,    0,   57,    0,   60,
    0,   44,    0,   23,   61,    0,   44,    0,   44,    0,
    0,   44,    0,   44,    0,    0,   58,   56,    0,    0,
   56,    0,    0,    0,    0,    0,    0,   44,   57,    0,
   59,   57,    0,    0,    0,   56,   61,    0,    0,    0,
   53,   53,   53,   53,   53,   53,   57,   58,    0,    0,
   58,   68,    0,    0,   53,   53,   53,   53,   69,    0,
    0,   59,    0,    0,   59,   58,    0,   21,    0,   56,
    0,    0,    0,    0,    0,    0,    0,    0,    0,   59,
   57,    0,   68,    0,    0,   68,    0,    0,    0,   69,
    0,   44,   69,   44,    0,    0,    0,    0,    0,   58,
   68,   56,    0,    0,    0,    0,    0,   69,    0,    0,
    0,    0,   57,   59,    0,    0,    0,    0,    0,    0,
    0,    0,   52,   52,   52,   52,   52,   52,    0,    0,
    0,   58,    0,    0,   68,    0,   52,   52,   52,   52,
    0,   69,    0,    0,    0,   59,    0,   60,   60,   60,
   60,   60,   60,    0,    0,    0,    0,    0,    0,   70,
    0,   60,   60,    0,    0,    0,   68,    0,    0,    0,
    0,    0,    0,   69,   59,   60,   66,    0,    0,    0,
    0,    0,    0,    0,   61,   61,   61,   61,   61,   61,
   70,    0,    0,   70,    0,    0,    0,    0,   61,   61,
    2,    3,    4,    5,    6,    0,    8,    9,   70,   10,
   11,    0,   12,    0,   13,   14,   15,    0,    0,    0,
    0,    0,    0,   16,   17,   44,   44,   44,   44,    0,
   44,   44,    0,   44,   44,    0,   44,   71,   44,   44,
   44,    0,   70,    0,    0,    0,    0,   44,   44,   56,
   56,   56,   56,   56,   56,    0,   72,    0,    0,    0,
   57,   57,   57,   57,   57,   57,    0,    0,   71,    0,
    0,   71,    0,    0,   70,    0,    0,    0,   73,   58,
   58,   58,   58,   58,   58,    0,   71,   72,    0,    0,
   72,    0,    0,   59,   59,   59,   59,   59,   59,   54,
    0,   55,    0,    0,    0,   72,    0,    0,    0,   73,
    0,    0,   73,    0,   68,   68,   68,   68,   68,   68,
   71,   69,   69,   69,   69,   69,   69,   73,    0,    0,
   54,    0,   55,   54,    0,   55,   65,    0,    0,   72,
    0,   63,   61,    0,   62,    0,   64,    0,   54,    0,
   55,    0,   71,    0,    0,    0,    0,    0,   65,    0,
    0,   73,  118,   63,   61,    0,   62,    0,   64,    0,
    0,   72,    0,    0,    0,    0,    0,    0,    0,    0,
   65,    0,   54,    0,   55,   63,   61,    0,   62,    0,
   64,    0,  116,   73,    0,    0,    0,    0,    0,   65,
    0,   22,    0,    0,   63,   61,    7,   62,   20,   64,
    0,   18,    0,   19,   54,    0,   55,    0,    0,    0,
    0,    0,   70,   70,   70,   70,   70,   70,    0,   65,
    0,    0,    0,    0,   63,   61,  135,   62,    0,   64,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
   22,    0,    0,    0,    0,    7,    0,   20,    0,    0,
   18,    0,   19,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
   71,   71,   71,   71,   71,   71,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,   72,
   72,   72,   72,   72,   72,   32,    0,    0,    0,    0,
   32,    0,   32,    0,    0,   32,    0,   32,    0,    0,
    0,   73,   73,   73,   73,   73,   73,    0,    0,    0,
   21,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,   54,   54,   55,   55,    0,    0,    0,    0,
    0,    0,   51,   52,   53,   54,   55,   56,    0,    0,
    0,    0,    0,    0,    0,    0,   57,   58,   59,   60,
   66,    0,    0,    0,   51,   52,   53,   54,   55,   56,
    0,    0,    0,    0,    0,    0,    0,    0,   57,   58,
   59,   60,   66,    0,    0,   32,   51,   52,   53,   54,
   55,   56,    0,    0,    0,    3,    4,    5,    6,    0,
   57,   58,   59,   60,   66,   51,   52,   53,   54,   55,
   56,    0,    0,    0,    0,    0,    0,   16,   17,   57,
   58,   59,   60,   66,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,   53,   54,   55,
   56,    0,    0,    0,    0,    0,    0,    0,    0,   57,
   58,   59,   60,   66,    3,    4,    5,    6,    0,    8,
    9,    0,   10,   11,    0,   12,    0,   13,   14,   15,
    0,    0,    0,    0,    0,    0,   16,   17,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,   32,
   32,   32,   32,    0,   32,   32,    0,   32,   32,    0,
   32,    0,   32,   32,   32,   45,   46,   47,    0,   49,
    0,   32,   32,    0,    0,    0,    0,    0,    0,   75,
   76,   79,    0,    0,   81,   83,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,   92,   93,
   94,   95,   96,   97,   98,   99,  100,  101,  102,  103,
  104,  105,  106,  107,  108,  109,  110,  111,  112,  113,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,  123,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,  126,    0,    0,    0,  131,    0,    0,    0,
    0,    0,    0,    0,  137,
);
@yycheck = (                                             10,
   41,   10,   41,   44,   37,   44,   37,   37,   41,   42,
   43,   42,   45,   10,   47,   37,   47,   16,   17,  259,
   42,   43,   10,   45,  133,   47,   37,   10,   40,  138,
   41,   42,   43,   44,   45,   10,   47,   10,   10,   10,
   10,  260,   40,   10,   41,   10,   10,   44,   59,   37,
   59,  160,    1,   41,   42,   43,   44,   45,   40,   47,
  260,   44,   59,   40,   91,   41,   10,   41,   41,   41,
   41,   59,   44,   37,   41,   10,   59,   41,   42,   43,
   44,   45,   93,   47,   59,   10,   59,   59,   59,   59,
   39,   44,   59,   37,   59,   59,   93,   41,   42,   43,
   44,   45,   10,   47,   40,   93,   41,   44,   10,   44,
  291,   59,   37,  260,  125,   59,   41,   42,   43,   44,
   45,   93,   47,   40,   59,   41,   41,   61,  125,   93,
   44,   10,  260,   41,   59,   37,   44,  125,   10,   41,
   42,   43,   44,   45,   61,   47,   59,  264,   41,   93,
  125,   59,  125,  125,  125,  125,  260,   59,  125,  260,
  125,  125,   41,  123,   43,   44,   45,   41,   93,   41,
   42,   43,   44,   45,   91,   47,   10,   59,   37,   41,
   59,  125,  123,   42,   43,   41,   45,   59,   47,   41,
  125,   93,  141,   41,   -1,   -1,  159,   -1,  147,   -1,
  125,   10,   -1,   -1,   -1,   -1,   -1,   41,   42,   43,
   44,   45,   -1,   47,   93,  164,   -1,  125,   -1,   -1,
   -1,   93,   -1,  125,   -1,   59,  281,  282,  283,  284,
  285,  286,   41,   -1,   43,   44,   45,   -1,  293,  294,
  273,  274,  275,  276,  277,  278,  125,   -1,   -1,   -1,
   59,   -1,   -1,  125,  287,  288,  289,  290,  291,   93,
  291,  291,  273,  274,  275,  276,  277,  278,   -1,  291,
  281,  282,  283,  284,  285,  286,  287,  288,  289,  290,
  291,   -1,  293,  294,   93,  273,  274,  275,  276,  277,
  278,  125,   -1,  281,  282,  283,  284,  285,  286,  287,
  288,  289,  290,  291,   -1,  293,  294,   10,   -1,  273,
  274,  275,  276,  277,  278,   -1,  125,   -1,   -1,   -1,
   -1,   -1,   -1,  287,  288,  289,  290,  291,   -1,  273,
  274,  275,  276,  277,  278,   -1,   -1,   -1,   41,   -1,
   -1,   44,   -1,  287,  288,  289,  290,  291,  273,  274,
  275,  276,  277,  278,   -1,   -1,   59,   -1,    1,    2,
   -1,   -1,  287,  288,  289,  290,   -1,   -1,   -1,   -1,
   -1,  273,  274,  275,  276,  277,  278,   41,   -1,   -1,
   -1,   -1,   -1,   -1,   27,  287,  288,  289,  290,   10,
   93,   -1,   -1,   -1,  273,  274,  275,  276,  277,  278,
   -1,  273,  274,  275,  276,  277,  278,   -1,  287,  288,
  289,  290,   -1,   -1,   10,  287,  288,  289,  290,   -1,
   41,   85,  125,   44,   -1,   -1,   -1,   -1,  287,  288,
  289,  290,  291,   -1,   -1,   -1,   -1,   -1,   59,  273,
  274,  275,  276,  277,  278,   41,   -1,   90,   44,   -1,
   -1,   10,   37,  287,  288,  289,  290,   42,   43,   -1,
   45,  125,   47,   59,  273,  274,  275,  276,  277,  278,
  134,   -1,   93,   -1,   -1,   -1,   -1,   -1,  287,  288,
  289,  290,   41,   -1,   10,   44,   -1,  151,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   93,   -1,   -1,
   59,   -1,   -1,   -1,  125,   -1,  149,   33,   10,   -1,
   -1,   -1,   38,   -1,   40,  158,   10,   43,   -1,   45,
  163,   -1,   -1,   -1,   -1,   -1,   -1,   10,   -1,  125,
   -1,   33,   -1,   59,   93,   -1,   38,   -1,   40,   -1,
   -1,   43,   -1,   45,   -1,   -1,   10,   41,   -1,   -1,
   44,   -1,   -1,   -1,   -1,   -1,   -1,   59,   41,   -1,
   10,   44,   -1,   -1,   -1,   59,  125,   -1,   -1,   -1,
  273,  274,  275,  276,  277,  278,   59,   41,   -1,   -1,
   44,   10,   -1,   -1,  287,  288,  289,  290,   10,   -1,
   -1,   41,   -1,   -1,   44,   59,   -1,  123,   -1,   93,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   59,
   93,   -1,   41,   -1,   -1,   44,   -1,   -1,   -1,   41,
   -1,  123,   44,  125,   -1,   -1,   -1,   -1,   -1,   93,
   59,  125,   -1,   -1,   -1,   -1,   -1,   59,   -1,   -1,
   -1,   -1,  125,   93,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,  273,  274,  275,  276,  277,  278,   -1,   -1,
   -1,  125,   -1,   -1,   93,   -1,  287,  288,  289,  290,
   -1,   93,   -1,   -1,   -1,  125,   -1,  273,  274,  275,
  276,  277,  278,   -1,   -1,   -1,   -1,   -1,   -1,   10,
   -1,  287,  288,   -1,   -1,   -1,  125,   -1,   -1,   -1,
   -1,   -1,   -1,  125,  289,  290,  291,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,  273,  274,  275,  276,  277,  278,
   41,   -1,   -1,   44,   -1,   -1,   -1,   -1,  287,  288,
  256,  257,  258,  259,  260,   -1,  262,  263,   59,  265,
  266,   -1,  268,   -1,  270,  271,  272,   -1,   -1,   -1,
   -1,   -1,   -1,  279,  280,  257,  258,  259,  260,   -1,
  262,  263,   -1,  265,  266,   -1,  268,   10,  270,  271,
  272,   -1,   93,   -1,   -1,   -1,   -1,  279,  280,  273,
  274,  275,  276,  277,  278,   -1,   10,   -1,   -1,   -1,
  273,  274,  275,  276,  277,  278,   -1,   -1,   41,   -1,
   -1,   44,   -1,   -1,  125,   -1,   -1,   -1,   10,  273,
  274,  275,  276,  277,  278,   -1,   59,   41,   -1,   -1,
   44,   -1,   -1,  273,  274,  275,  276,  277,  278,   10,
   -1,   10,   -1,   -1,   -1,   59,   -1,   -1,   -1,   41,
   -1,   -1,   44,   -1,  273,  274,  275,  276,  277,  278,
   93,  273,  274,  275,  276,  277,  278,   59,   -1,   -1,
   41,   -1,   41,   44,   -1,   44,   37,   -1,   -1,   93,
   -1,   42,   43,   -1,   45,   -1,   47,   -1,   59,   -1,
   59,   -1,  125,   -1,   -1,   -1,   -1,   -1,   37,   -1,
   -1,   93,   41,   42,   43,   -1,   45,   -1,   47,   -1,
   -1,  125,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   37,   -1,   93,   -1,   93,   42,   43,   -1,   45,   -1,
   47,   -1,   93,  125,   -1,   -1,   -1,   -1,   -1,   37,
   -1,   33,   -1,   -1,   42,   43,   38,   45,   40,   47,
   -1,   43,   -1,   45,  125,   -1,  125,   -1,   -1,   -1,
   -1,   -1,  273,  274,  275,  276,  277,  278,   -1,   37,
   -1,   -1,   -1,   -1,   42,   43,   93,   45,   -1,   47,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   33,   -1,   -1,   -1,   -1,   38,   -1,   40,   -1,   -1,
   43,   -1,   45,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
  273,  274,  275,  276,  277,  278,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  273,
  274,  275,  276,  277,  278,   33,   -1,   -1,   -1,   -1,
   38,   -1,   40,   -1,   -1,   43,   -1,   45,   -1,   -1,
   -1,  273,  274,  275,  276,  277,  278,   -1,   -1,   -1,
  123,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,  273,  274,  273,  274,   -1,   -1,   -1,   -1,
   -1,   -1,  273,  274,  275,  276,  277,  278,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,  287,  288,  289,  290,
  291,   -1,   -1,   -1,  273,  274,  275,  276,  277,  278,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  287,  288,
  289,  290,  291,   -1,   -1,  123,  273,  274,  275,  276,
  277,  278,   -1,   -1,   -1,  257,  258,  259,  260,   -1,
  287,  288,  289,  290,  291,  273,  274,  275,  276,  277,
  278,   -1,   -1,   -1,   -1,   -1,   -1,  279,  280,  287,
  288,  289,  290,  291,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,  275,  276,  277,
  278,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  287,
  288,  289,  290,  291,  257,  258,  259,  260,   -1,  262,
  263,   -1,  265,  266,   -1,  268,   -1,  270,  271,  272,
   -1,   -1,   -1,   -1,   -1,   -1,  279,  280,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  257,
  258,  259,  260,   -1,  262,  263,   -1,  265,  266,   -1,
  268,   -1,  270,  271,  272,   18,   19,   20,   -1,   22,
   -1,  279,  280,   -1,   -1,   -1,   -1,   -1,   -1,   32,
   33,   34,   -1,   -1,   37,   38,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   51,   52,
   53,   54,   55,   56,   57,   58,   59,   60,   61,   62,
   63,   64,   65,   66,   67,   68,   69,   70,   71,   72,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   88,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,  115,   -1,   -1,   -1,  119,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,  127,
);
$YYFINAL=1;
#ifndef YYDEBUG
#define YYDEBUG 0
#endif
$YYMAXTOKEN=294;
#if YYDEBUG
@yyname = (
"end-of-file",'','','','','','','','','',"'\\n'",'','','','','','','','','','','','','','','','','','','','',
'','',"'!'",'','','',"'%'","'&'",'',"'('","')'","'*'","'+'","','","'-'","'.'","'/'",'',
'','','','','','','','','','',"';'",'',"'='",'','','','','','','','','','','','','','','','','','','','','','','',
'','','','','','',"'['",'',"']'",'','','','','','','','','','','','','','','','','','','','','','','','','','','',
'','',"'{'","'|'","'}'",'','','','','','','','','','','','','','','','','','','','','','','','','','','','','',
'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',
'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',
'','','','','','','','','','','','','','','','','','','','','','',"INT","FLOAT","STRING","IDENT",
"C_COMMENT","BREAK","DEFINE","AUTO","RETURN","PRINT","AUTO_LIST","IF","ELSE",
"QUIT","WHILE","FOR","EQ","NE","GT","GE","LT","LE","PP","MM","P_EQ","M_EQ",
"F_EQ","D_EQ","EXP_EQ","MOD_EQ","L_SHIFT","R_SHIFT","E_E","O_O","EXP","UNARY",
"PPP","MMM",
);
@yyrule = (
"\$accept : stmt_list_exec",
"stmt_list_exec :",
"stmt_list_exec : stmt_list_exec stmt_exec",
"stmt_exec : terminator",
"stmt_exec : stmt_compile terminator",
"stmt_exec : error terminator",
"stmt_compile : QUIT",
"\$$1 :",
"\$$2 :",
"stmt_compile : DEFINE $$1 IDENT '(' arg_list ')' terminator_or_void '{' terminator auto_list $$2 stmt_list_block '}'",
"stmt_compile : return",
"stmt_compile : BREAK",
"\$$3 :",
"stmt_compile : PRINT $$3 expr_list_commas",
"\$$4 :",
"stmt_compile : '{' $$4 stmt_list_block '}'",
"\$$5 :",
"stmt_compile : IF '(' stmt_compile ')' $$5 terminator_or_void stmt_compile",
"\$$6 :",
"\$$7 :",
"stmt_compile : WHILE $$6 '(' stmt_compile_or_void ')' terminator_or_void $$7 stmt_compile",
"\$$8 :",
"\$$9 :",
"\$$10 :",
"stmt_compile : FOR '(' stmt_compile_or_void ';' $$8 stmt_compile_or_void ';' $$9 stmt_compile_or_void ')' $$10 terminator_or_void stmt_compile",
"stmt_compile : expr",
"return : RETURN",
"return : RETURN '(' expr ')'",
"stmt_compile_or_void :",
"stmt_compile_or_void : stmt_compile",
"stmt_list_block : stmt_compile_or_void",
"stmt_list_block : stmt_list_block terminator stmt_compile_or_void",
"terminator_or_void :",
"terminator_or_void : terminator",
"terminator : ';'",
"terminator : '\\n'",
"arg_list :",
"arg_list : arg_list_nonempty",
"arg_list_nonempty : IDENT",
"arg_list_nonempty : arg_list_nonempty ',' IDENT",
"param_list :",
"param_list : param_list_nonempty",
"param_list_nonempty : expr",
"param_list_nonempty : param_list_nonempty ',' expr",
"auto_list :",
"auto_list : AUTO auto_list_nonempty terminator",
"auto_list_nonempty : IDENT",
"auto_list_nonempty : auto_list_nonempty ',' IDENT",
"expr_list_commas : expr",
"expr_list_commas : expr_list_commas ',' expr",
"expr : IDENT '(' param_list ')'",
"expr : '(' expr ')'",
"expr : expr O_O expr",
"expr : expr E_E expr",
"expr : expr EQ expr",
"expr : expr NE expr",
"expr : expr GT expr",
"expr : expr GE expr",
"expr : expr LT expr",
"expr : expr LE expr",
"expr : expr L_SHIFT expr",
"expr : expr R_SHIFT expr",
"expr : expr '+' expr",
"expr : expr '-' expr",
"expr : expr '*' expr",
"expr : expr '/' expr",
"expr : expr EXP expr",
"expr : expr '%' expr",
"expr : ident P_EQ expr",
"expr : ident M_EQ expr",
"expr : ident F_EQ expr",
"expr : ident D_EQ expr",
"expr : ident EXP_EQ expr",
"expr : ident MOD_EQ expr",
"expr : '-' expr",
"expr : '!' expr",
"expr : PP ident",
"expr : MM ident",
"expr : ident PPP",
"expr : ident MMM",
"expr : '+' expr",
"expr : '&' STRING",
"expr : IDENT '=' expr",
"expr : IDENT '[' expr ']' '=' expr",
"expr : ident",
"expr : INT",
"expr : FLOAT",
"expr : STRING",
"ident : IDENT",
"ident : IDENT '[' expr ']'",
);
#endif
sub yyclearin { $yychar = -1; }
sub yyerrok { $yyerrflag = 0; }
$YYSTACKSIZE = $YYSTACKSIZE || $YYMAXDEPTH || 500;
$YYMAXDEPTH = $YYMAXDEPTH || $YYSTACKSIZE || 500;
$yyss[$YYSTACKSIZE] = 0;
$yyvs[$YYSTACKSIZE] = 0;
sub YYERROR { ++$yynerrs; &yy_err_recover; }
sub yy_err_recover
{
  if ($yyerrflag < 3)
  {
    $yyerrflag = 3;
    while (1)
    {
      if (($yyn = $yysindex[$yyss[$yyssp]]) && 
          ($yyn += $YYERRCODE) >= 0 && 
          $yycheck[$yyn] == $YYERRCODE)
      {
#if YYDEBUG
       print "yydebug: state $yyss[$yyssp], error recovery shifting",
             " to state $yytable[$yyn]\n" if $yydebug;
#endif
        $yyss[++$yyssp] = $yystate = $yytable[$yyn];
        $yyvs[++$yyvsp] = $yylval;
        next yyloop;
      }
      else
      {
#if YYDEBUG
        print "yydebug: error recovery discarding state ",
              $yyss[$yyssp], "\n"  if $yydebug;
#endif
        return(1) if $yyssp <= 0;
        --$yyssp;
        --$yyvsp;
      }
    }
  }
  else
  {
    return (1) if $yychar == 0;
#if YYDEBUG
    if ($yydebug)
    {
      $yys = '';
      if ($yychar <= $YYMAXTOKEN) { $yys = $yyname[$yychar]; }
      if (!$yys) { $yys = 'illegal-symbol'; }
      print "yydebug: state $yystate, error recovery discards ",
            "token $yychar ($yys)\n";
    }
#endif
    $yychar = -1;
    next yyloop;
  }
0;
} # yy_err_recover

sub yyparse
{
#ifdef YYDEBUG
  if ($yys = $ENV{'YYDEBUG'})
  {
    $yydebug = int($1) if $yys =~ /^(\d)/;
  }
#endif

  $yynerrs = 0;
  $yyerrflag = 0;
  $yychar = (-1);

  $yyssp = 0;
  $yyvsp = 0;
  $yyss[$yyssp] = $yystate = 0;

yyloop: while(1)
  {
    yyreduce: {
      last yyreduce if ($yyn = $yydefred[$yystate]);
      if ($yychar < 0)
      {
        if (($yychar = &yylex) < 0) { $yychar = 0; }
#if YYDEBUG
        if ($yydebug)
        {
          $yys = '';
          if ($yychar <= $#yyname) { $yys = $yyname[$yychar]; }
          if (!$yys) { $yys = 'illegal-symbol'; };
          print "yydebug: state $yystate, reading $yychar ($yys)\n";
        }
#endif
      }
      if (($yyn = $yysindex[$yystate]) && ($yyn += $yychar) >= 0 &&
              $yycheck[$yyn] == $yychar)
      {
#if YYDEBUG
        print "yydebug: state $yystate, shifting to state ",
              $yytable[$yyn], "\n"  if $yydebug;
#endif
        $yyss[++$yyssp] = $yystate = $yytable[$yyn];
        $yyvs[++$yyvsp] = $yylval;
        $yychar = (-1);
        --$yyerrflag if $yyerrflag > 0;
        next yyloop;
      }
      if (($yyn = $yyrindex[$yystate]) && ($yyn += $yychar) >= 0 &&
            $yycheck[$yyn] == $yychar)
      {
        $yyn = $yytable[$yyn];
        last yyreduce;
      }
      if (! $yyerrflag) {
        &yyerror('syntax error');
        ++$yynerrs;
      }
      return(1) if &yy_err_recover;
    } # yyreduce
#if YYDEBUG
    print "yydebug: state $yystate, reducing by rule ",
          "$yyn ($yyrule[$yyn])\n"  if $yydebug;
#endif
    $yym = $yylen[$yyn];
    $yyval = $yyvs[$yyvsp+1-$yym];
    switch:
    {
if ($yyn == 4) {
#line 126 "bc.y"
{ 

		  my ($res, $val) = exec_stmt(shift @stmt_list); 
		  if($res == 0 and defined($val) and 
		     $cur_file ne 'main::DATA') {
		    print "$val\n";
		  }
		  start_stmt();
		
last switch;
} }
if ($yyn == 5) {
#line 136 "bc.y"
{ 
		  @ope_stack = (); 
		  @stmt_list = ();
		  start_stmt();
		  &yyerrok; 
		
last switch;
} }
if ($yyn == 6) {
#line 144 "bc.y"
{ exit(0); 
last switch;
} }
if ($yyn == 7) {
#line 147 "bc.y"
{ 
		  start_stmt(); 
		
last switch;
} }
if ($yyn == 8) {
#line 153 "bc.y"
{ 
		  start_stmt(); 
		  start_stmt();
		
last switch;
} }
if ($yyn == 9) {
#line 159 "bc.y"
{
		  finish_stmt();    # The last one is empty
		  push_instr('RETURN', 0);
		  my $body = finish_stmt();
		  push_instr('{}', $body);
		  my $code = finish_stmt();
		  push_instr('FUNCTION-DEF', $yyvs[$yyvsp-10], $code);
                
last switch;
} }
if ($yyn == 11) {
#line 170 "bc.y"
{ push_instr('BREAK'); 
last switch;
} }
if ($yyn == 12) {
#line 173 "bc.y"
{
		  push_instr(',');
		  start_stmt(); 
		  start_stmt(); 
		
last switch;
} }
if ($yyn == 13) {
#line 179 "bc.y"
{
		  finish_stmt();  # The last one is empty
		  my $stmt = finish_stmt();
		  push_instr('PRINT', $stmt);
		
last switch;
} }
if ($yyn == 14) {
#line 186 "bc.y"
{ 
		  start_stmt(); 
		  start_stmt();
		
last switch;
} }
if ($yyn == 15) {
#line 191 "bc.y"
{
		  finish_stmt();  # The last one is empty
		  my $stmt = finish_stmt();
		  push_instr('{}', $stmt);
		
last switch;
} }
if ($yyn == 16) {
#line 197 "bc.y"
{ start_stmt(); 
last switch;
} }
if ($yyn == 17) {
#line 200 "bc.y"
{
		  my $stmt = finish_stmt();
		  push_instr('IF', $stmt);
		
last switch;
} }
if ($yyn == 18) {
#line 205 "bc.y"
{ start_stmt(); 
last switch;
} }
if ($yyn == 19) {
#line 207 "bc.y"
{ 
		  my $stmt = finish_stmt();
		  push_instr('FOR-COND', $stmt);
                  start_stmt();
                
last switch;
} }
if ($yyn == 20) {
#line 213 "bc.y"
{
		  my $stmt = finish_stmt();
		  push_instr('FOR-INCR', []);
		  push_instr('FOR-BODY', $stmt);
		
last switch;
} }
if ($yyn == 21) {
#line 219 "bc.y"
{ start_stmt(); 
last switch;
} }
if ($yyn == 22) {
#line 221 "bc.y"
{
		  my $stmt = finish_stmt();
		  push_instr('FOR-COND', $stmt);
		  start_stmt();
		
last switch;
} }
if ($yyn == 23) {
#line 227 "bc.y"
{
		  my $stmt = finish_stmt();
		  push_instr('FOR-INCR', $stmt);
		  start_stmt();
		
last switch;
} }
if ($yyn == 24) {
#line 232 "bc.y"
{ 
		  my $stmt = finish_stmt();
		  push_instr('FOR-BODY', $stmt);
		
last switch;
} }
if ($yyn == 26) {
#line 241 "bc.y"
{ push_instr('RETURN', 0); 
last switch;
} }
if ($yyn == 27) {
#line 242 "bc.y"
{ push_instr('RETURN', 1); 
last switch;
} }
if ($yyn == 30) {
#line 250 "bc.y"
{
		   my $stmt = finish_stmt();
		   if(scalar(@$stmt) > 0) {
		     push_instr('STMT', $stmt);
		   }
		   start_stmt();
		 
last switch;
} }
if ($yyn == 31) {
#line 258 "bc.y"
{
		   my $stmt = finish_stmt();
		   if(scalar(@$stmt) > 0) {
		     push_instr('STMT', $stmt);
		   }
		   start_stmt();
		 
last switch;
} }
if ($yyn == 38) {
#line 281 "bc.y"
{ push_instr('a', $yyvs[$yyvsp-0]); 
last switch;
} }
if ($yyn == 39) {
#line 282 "bc.y"
{ push_instr('a', $yyvs[$yyvsp-0]); 
last switch;
} }
if ($yyn == 46) {
#line 299 "bc.y"
{ push_instr('A', $yyvs[$yyvsp-0]); 
last switch;
} }
if ($yyn == 47) {
#line 300 "bc.y"
{ push_instr('A', $yyvs[$yyvsp-0]); 
last switch;
} }
if ($yyn == 48) {
#line 305 "bc.y"
{
		  my $stmt = finish_stmt();
		  push_instr('PRINT-STMT', $stmt);
		  start_stmt();
		
last switch;
} }
if ($yyn == 49) {
#line 311 "bc.y"
{
		  my $stmt = finish_stmt();
		  push_instr('PRINT-STMT', $stmt);
		  start_stmt();
		
last switch;
} }
if ($yyn == 50) {
#line 320 "bc.y"
{ 
		  push_instr('FUNCTION-CALL', $yyvs[$yyvsp-3]);
		
last switch;
} }
if ($yyn == 51) {
#line 324 "bc.y"
{ 
last switch;
} }
if ($yyn == 52) {
#line 326 "bc.y"
{ push_instr('||_'); 
last switch;
} }
if ($yyn == 53) {
#line 327 "bc.y"
{ push_instr('&&_'); 
last switch;
} }
if ($yyn == 54) {
#line 329 "bc.y"
{ push_instr('==_'); 
last switch;
} }
if ($yyn == 55) {
#line 330 "bc.y"
{ push_instr('!=_'); 
last switch;
} }
if ($yyn == 56) {
#line 331 "bc.y"
{ push_instr('>_'); 
last switch;
} }
if ($yyn == 57) {
#line 332 "bc.y"
{ push_instr('>=_'); 
last switch;
} }
if ($yyn == 58) {
#line 333 "bc.y"
{ push_instr('<_'); 
last switch;
} }
if ($yyn == 59) {
#line 334 "bc.y"
{ push_instr('<=_'); 
last switch;
} }
if ($yyn == 60) {
#line 335 "bc.y"
{ push_instr('<<_'); 
last switch;
} }
if ($yyn == 61) {
#line 336 "bc.y"
{ push_instr('>>_'); 
last switch;
} }
if ($yyn == 62) {
#line 338 "bc.y"
{ push_instr('+_'); 
last switch;
} }
if ($yyn == 63) {
#line 339 "bc.y"
{ push_instr('-_'); 
last switch;
} }
if ($yyn == 64) {
#line 340 "bc.y"
{ push_instr('*_'); 
last switch;
} }
if ($yyn == 65) {
#line 341 "bc.y"
{ push_instr('/_'); 
last switch;
} }
if ($yyn == 66) {
#line 342 "bc.y"
{ push_instr('^_'); 
last switch;
} }
if ($yyn == 67) {
#line 343 "bc.y"
{ push_instr('%_'); 
last switch;
} }
if ($yyn == 68) {
#line 347 "bc.y"
{ 
		  push_instr('+_');
		  push_instr('V', $yyvs[$yyvsp-2]);
		  push_instr('=V');
		
last switch;
} }
if ($yyn == 69) {
#line 353 "bc.y"
{ 
		  push_instr('-_');
		  push_instr('V', $yyvs[$yyvsp-2]);
		  push_instr('=V');
		
last switch;
} }
if ($yyn == 70) {
#line 359 "bc.y"
{ 
		  push_instr('*_');
		  push_instr('V', $yyvs[$yyvsp-2]);
		  push_instr('=V');
		
last switch;
} }
if ($yyn == 71) {
#line 365 "bc.y"
{ 
		  push_instr('/_');
		  push_instr('V', $yyvs[$yyvsp-2]);
		  push_instr('=V'); 
		
last switch;
} }
if ($yyn == 72) {
#line 371 "bc.y"
{ 
		  push_instr('^_');
		  push_instr('V', $yyvs[$yyvsp-2]);
		  push_instr('=V'); 
		
last switch;
} }
if ($yyn == 73) {
#line 377 "bc.y"
{ 
		  push_instr('%_');
		  push_instr('V', $yyvs[$yyvsp-2]);
		  push_instr('=V'); 
		
last switch;
} }
if ($yyn == 74) {
#line 386 "bc.y"
{ 
		  push_instr('m_');
		
last switch;
} }
if ($yyn == 75) {
#line 390 "bc.y"
{ 
		  push_instr('!_');
		
last switch;
} }
if ($yyn == 76) {
#line 394 "bc.y"
{ 
		  # 'v'.$2 has already been pushed in the 'ident' rule
		  push_instr('N', 1);
		  push_instr('+_');
		  push_instr('V', $yyvs[$yyvsp-0]);
		  push_instr('=V');
		
last switch;
} }
if ($yyn == 77) {
#line 402 "bc.y"
{ 
		  push_instr('N', 1);
		  push_instr('-_');
		  push_instr('V', $yyvs[$yyvsp-0]);
		  push_instr('=V');
		
last switch;
} }
if ($yyn == 78) {
#line 409 "bc.y"
{
		  # $1 is already on the stack (see the "ident:" rule)
		  push_instr('v', $yyvs[$yyvsp-1])     ;
		  push_instr('V', '*tmp') ; 
		  push_instr('=V')        ;  # *tmp = $1
		  push_instr(',')         ;

		  push_instr('N', 1)      ;    
		  push_instr('+_')        ;
		  push_instr('V', $yyvs[$yyvsp-1])     ;
		  push_instr('=V')        ;  # $1 = $1 + 1
		  push_instr(',')         ;
			    
		  push_instr('v', '*tmp') ;  # Return *tmp

		
last switch;
} }
if ($yyn == 79) {
#line 426 "bc.y"
{ 
		  # See PPP for comments
		  push_instr('v', $yyvs[$yyvsp-1]);
		  push_instr('V', '*tmp');
		  push_instr('=V');
		  push_instr(',');
		  push_instr('N', 1);
		  push_instr('-_');
		  push_instr('V', $yyvs[$yyvsp-1]);
		  push_instr('=V');
		  push_instr(',');
		  push_instr('v', '*tmp');
		
last switch;
} }
if ($yyn == 80) {
#line 440 "bc.y"
{ $yyval = $yyvs[$yyvsp-0]; 
last switch;
} }
if ($yyn == 81) {
#line 442 "bc.y"
{ 
		  push_instr('&', $yyvs[$yyvsp-0]);
		  $yyval = 1;
		
last switch;
} }
if ($yyn == 82) {
#line 448 "bc.y"
{
		  push_instr('V', $yyvs[$yyvsp-2]);
		  push_instr('=V');
		  $yyval = $yyvs[$yyvsp-0];
		
last switch;
} }
if ($yyn == 83) {
#line 454 "bc.y"
{
		  # Add [] to the name in order to allow the same name
		  # for an array and a scalar
		  push_instr('P', $yyvs[$yyvsp-5]);
		  push_instr('=P');
		  $yyval = $yyvs[$yyvsp-0];
		
last switch;
} }
if ($yyn == 84) {
#line 462 "bc.y"
{ $yyval = $yyvs[$yyvsp-0]->{"value"}; 
last switch;
} }
if ($yyn == 85) {
#line 464 "bc.y"
{ push_instr('N', $yyvs[$yyvsp-0]); 
last switch;
} }
if ($yyn == 86) {
#line 465 "bc.y"
{ push_instr('N', $yyvs[$yyvsp-0]); 
last switch;
} }
if ($yyn == 87) {
#line 466 "bc.y"
{ push_instr('S', $yyvs[$yyvsp-0]); 
last switch;
} }
if ($yyn == 88) {
#line 470 "bc.y"
{ push_instr('v', $yyvs[$yyvsp-0]); 
last switch;
} }
if ($yyn == 89) {
#line 473 "bc.y"
{ 
		  push_instr('p', $yyvs[$yyvsp-3]); 
		  $yyval = $yyvs[$yyvsp-3].'[]'.$yyvs[$yyvsp-1];
		
last switch;
} }
#line 1201 "y.tab.pl"
    } # switch
    $yyssp -= $yym;
    $yystate = $yyss[$yyssp];
    $yyvsp -= $yym;
    $yym = $yylhs[$yyn];
    if ($yystate == 0 && $yym == 0)
    {
#if YYDEBUG
      print "yydebug: after reduction, shifting from state 0 ",
            "to state $YYFINAL\n" if $yydebug;
#endif
      $yystate = $YYFINAL;
      $yyss[++$yyssp] = $YYFINAL;
      $yyvs[++$yyvsp] = $yyval;
      if ($yychar < 0)
      {
        if (($yychar = &yylex) < 0) { $yychar = 0; }
#if YYDEBUG
        if ($yydebug)
        {
          $yys = '';
          if ($yychar <= $#yyname) { $yys = $yyname[$yychar]; }
          if (!$yys) { $yys = 'illegal-symbol'; }
          print "yydebug: state $YYFINAL, reading $yychar ($yys)\n";
        }
#endif
      }
      return(0) if $yychar == 0;
      next yyloop;
    }
    if (($yyn = $yygindex[$yym]) && ($yyn += $yystate) >= 0 &&
        $yyn <= $#yycheck && $yycheck[$yyn] == $yystate)
    {
        $yystate = $yytable[$yyn];
    } else {
        $yystate = $yydgoto[$yym];
    }
#if YYDEBUG
    print "yydebug: after reduction, shifting from state ",
        "$yyss[$yyssp] to state $yystate\n" if $yydebug;
#endif
    $yyss[++$yyssp] = $yystate;
    $yyvs[++$yyvsp] = $yyval;
  } # yyloop
} # yyparse
#line 479 "bc.y"

# Prompt the user on STDERR, but only prompt if STDERR and the input
# file are both terminals.

@file_list=();
$mathlib=0;
sub command_line()
{
  while ($f = shift(@ARGV)) {
    if ($f eq '-d') {
      use Data::Dumper;
      $debug = 1;
    } elsif ($f eq '-y') {
      $yydebug = 1;
    } elsif ($f eq '-l') {
      $mathlib = 1;
    } else {
      push(@file_list, $f);
    }
  }
# read from STDIN if no files are named on the command line
  @file_list = ('-') if $#file_list < 0;
}


# After finishing a file, open the next one.  Return whether there
# really is a next one that was opened.
sub next_file
{
  if($cur_file) {
    close $input;
  }

  if($mathlib) {

    debug { "reading the math library\n" };

    $input = \*main::DATA;
    $mathlib=0;
    $cur_file="main::DATA";
    return 1;

  } elsif($file = shift(@file_list)) {

    debug { "reading from $file\n" };

    if (! open(IN, $file)) {
      die "$file: cannot open file: $!\n";
    }
    $input = IN;
    $cur_file = $file;
    $prompt = '';
    return 1;

  }

  debug { "no next file\n" };

  return 0;
}

# print the prompt
sub prompt
{
    print STDERR $prompt if $prompt;
}

# print an error message
sub yyerror
{
    print STDERR "\"$cur_file\", " if $cur_file ne '-';
#    debug { "yyerror-stmt_list : ".Dumper(\@stmt_list) };

    print STDERR "line $.: ", @_, "\n";

    @ope_stack = ();
    start_stmt();
}

# Hand-coded lex
sub yylex
{
 lexloop: {
   # get a line of input, if we need it.
   if ($line eq '')
	{
	  &prompt;
	  while(! ($line = <$input>)) {
	      &next_file || do { 
		return(0); };
	  }
	}

	# Skip over white space, and grab the first character.
	# If there is no such character, then grab the next line.
	$line =~ s/^\s*(.|\n)//	|| next lexloop;
	local($char) = $1;

	if ($char eq '/' and $line =~ /^\*/) {
          # C-style comment
 	  while($line !~ m%\*/%) {
	    $line = <$input>;
	  }
	  $line =~ s%.*?\*/% %;
	  yylex();
	} 

        elsif ($char eq '#') {
	  # comment, so discard the line
	  $line = "\n";
	  &yylex;

	} elsif ($char eq '\\' and $line eq "\n") {

	  # Discard the newline
	  $line = '';
	  yylex();

	} elsif ($char =~ /^(['"])/) {

          $yylval = "";

          my $c = $1;
 	  while($line !~ /$c/) {
            $yylval .= $line;
	    $line = <$input>;
	  }

	  $line =~ s%(.*?)$c% %;
          $yylval .= $1;

	    $STRING;

	} elsif ($char =~ /^[\dA-F]/ or 
		 ($char eq '.' and $line =~ /\d/)) {

          # Bug: hexadecimal values are not supported, because they are
          # not supported in Math::BigFloat
	  # I should support them myself

	  if($char =~ /[A-F]/) {
	    &yyerror('Sorry, hexadecimal values are not supported');
	  }

	  $line = "0.$line" if($char eq '.');
 
          # number, is it integer or float?
	  if ($line =~ s/^(\d+)//) {
#	      $yylval = Math::BigFloat->new($char . $1);
	      $yylval = 0 + ($char.$1);
          } else {
#	      $yylval = Math::BigFloat->new($char);
	      $yylval = 0 + $char;
	  }
	  $type = $INT;
	  
	  if ($line =~ s/^(\.\d*)//) {
	      $tmp = "0$1";
	      $yylval += $tmp;
	      $type = $FLOAT;
	  }
	  if ($line =~ s/^[eE]([-+]*\d+)//) {
	      $yylval *= 10 ** $1;
	      $type = $FLOAT;
	  }

	  $type;
	  
     } elsif ($char =~ /^[a-z]/) {   
          # Uppercase is reserved for hexadecimal numbers
	  $line =~ s/^([\w\d]*)//;
	  $yylval = $char.$1;

	  if($yylval eq 'auto') {
	    $AUTO;
	  } elsif($yylval eq 'break') {
	    $BREAK;
	  } elsif($yylval eq 'define') {
	    $DEFINE;
	  } elsif($yylval eq 'for') {
	    $FOR;
	  } elsif($yylval eq 'if') {
	    $IF;
	  } elsif($yylval eq 'else') {
	    $ELSE;
	  } elsif($yylval eq 'print') {
	    $PRINT;
	  } elsif($yylval eq 'quit') {
	    $QUIT;
	  } elsif($yylval eq 'return') {
	    $RETURN;
	  } elsif($yylval eq 'while') {
	    $WHILE;
	  } else {
	    $IDENT;
	  }

	} elsif (($char eq '*' && $line =~ s/^\*=//) or
                 ($char eq '^' && $line =~ s/=//)) {
	    $EXP_EQ;
	} elsif (($char eq '*' && $line =~ s/^\*//) or
                 ($char eq '^')) {
	    $EXP;

	} elsif ($char eq '|' && $line =~ s/^\|//) {
	    $O_O;
	} elsif ($char eq '&' && $line =~ s/^&//) {
	    $E_E;

	} elsif ($char eq '%' && $line =~ s/^=//) {
	    $MOD_EQ;
	} elsif ($char eq '!' && $line =~ s/^=//) {
	    $NE;
	} elsif ($char eq '=' && $line =~ s/^=//) {
	    $EQ;

	} elsif ($char =~ /^[<>]/ && $line =~ s/^=//) {
	    $char eq '<' ? $LE : $GE;
	} elsif ($char =~ /^[<>]/ && $line =~ s/^$char//) {
	    $char eq '<' ? $L_SHIFT : $R_SHIFT;
	} elsif ($char =~ /^[<>]/) {
	    $char eq '<' ? $LT : $GT;

 	} elsif ($char eq '+' && $line =~ s/^\+(\s*\w)/$1/) {
	    $PP;
	} elsif ($char eq '+' && $line =~ s/^=//) {
	    $P_EQ;
	} elsif ($char eq '+' && $line =~ s/^\+//) {
	    $PPP;
	} elsif ($char eq '-' && $line =~ s/^\-(\s*\w)/$1/) {
	    $MM;
	} elsif ($char eq '-' && $line =~ s/^\-//) {
	    $MMM;
	} elsif ($char eq '-' && $line =~ s/^=//) {
	    $M_EQ;
	} elsif ($char eq '*' && $line =~ s/^=//) {
	    $F_EQ;
	} elsif ($char eq '/' && $line =~ s/^=//) {
	    $D_EQ;
	} else {
	    $yylval = $char;
	    ord($char);
	}
    }
}

# factorial
sub fact
{
    local($n) = @_;
    local($f) = 1;
    $f *= $n-- while ($n > 1) ;
    $f;
}

sub bi_length
{
  my $stack = shift;
  
  $_ = pop @$stack;
  
  my ($a, $b);
  die "NaN" unless ($a, $b) = /[-+]?(\d*)\.?(\d+)?/;
  
  $a =~ s/^0+//;  
  $b =~ s/0+$//;

  my $len = length($a) + length($b);
  
  return $len == 0 ? 1 : $len;
}


sub bi_scale
{
  my $stack = shift;
  
  $_ = pop @$stack;
  
  my ($a, $b);
  die "NaN" unless ($a, $b) = /[-+]?(\d*)\.?(\d+)?/;

  return length($b);
}

sub bi_sqrt
{
  my $stack = shift;
  
  $_ = pop @$stack;
  
  return sqrt($_);
}

# Initialize the symbol table
sub init_table
{
  $sym_table{'scale'} = { type => 'var', value => 0};
  $sym_table{'ibase'} = { type => 'var', value => 0};
  $sym_table{'obase'} = { type => 'var', value => 0};
  $sym_table{'last'} = { type => 'var', value => 0};
  $sym_table{'length()'} = { type => 'builtin', 
			   value => \&bi_length };
  $sym_table{'scale()'} = { type => 'builtin', 
			   value => \&bi_scale };
  $sym_table{'sqrt()'} = { type => 'builtin', 
			   value => \&bi_sqrt };
}

#
# Pseudo-code
#

# Compilation time: a stack of statements is maintained. Each statement
# is itself a stack of instructions.
# Each instruction is appended to the statement which is on the top.
# When a sub-block (IF, DEFINE...) is encountered, a
# new, empty statement is pushed onto the stack, and it receives the
# instructions in the sub-block.

my $cur_stmt;


# Pushes one instruction onto the current statement
# First element is the type, others are 0 or more arguments, depending on
# the type.
sub push_instr
{
  die "Internal error: no cur stmt" unless($cur_stmt);
  my @args = @_;
  push(@$cur_stmt, [ @args ]);
}

# Pushes a new statement onto the stack of statements, and makes it the
# current
sub start_stmt
{
  $cur_stmt = [];
  push(@stmt_list, $cur_stmt);
}

# Closes a statement, and returns a reference on it.
sub finish_stmt
{
  my $stmt = pop @stmt_list;
  $cur_stmt = $stmt_list[$#stmt_list];
  return $stmt;
}


#
# Execution time
#

my ($res, $val);
my $res2;
my $code;

sub exec_print
{
  my $res = exec_stmt(@_);
  print "$res\n" if(defined $res);
}

#
# exec_stmt
# Really executes a statement. Calls itself recursively when it
# encounters sub-statements (in block, loops, functions...)
#  
my $count = 0;
sub exec_stmt
{
$count++;
  my $stmt = shift;

  my $return = 0; # 1 if a "return" statement is encountered
  
  my @stmt_s = @$stmt;
#  print STDERR "ko\n";"executing statement: ".Dumper(\@stmt_s);
  
  
# Each instruction in the stack is an array which first element gives
# the type. Others elements may contain references to sub-statements
  
  my $instr;
  
 INSTR: while (defined($instr = shift @stmt_s)) {

   $_ = $instr->[0]; 
      
   print STDERR ("instruction: ".join(', ', @$instr)."\n" ) if $debug;
      
# remove the stack top value, and forget about it
   if($_ eq ',') {
     $res = pop @ope_stack;
     next INSTR;

   } elsif($_ eq 'N') {

# N for number
     push(@ope_stack, 0 + $instr->[1]);
     next INSTR;

   } elsif($_ eq '+_'  or $_ eq '-_'  or $_ eq '*_'  or $_ eq '/_'  or 
	   $_ eq '^_'  or $_ eq '%_'  or $_ eq '==_' or $_ eq '!=_' or 
	   $_ eq '>_'  or $_ eq '>=_' or $_ eq '<_'  or $_ eq '<=_' or 
	   $_ eq '<<_' or $_ eq '>>_' or $_ eq '||_' or $_ eq '&&_') {

# Binary operators
	  my $b = pop(@ope_stack); my $a = pop(@ope_stack);
	  
	  if   ($_ eq '+_') { $res = $a + $b    ; 1 }
	  elsif($_ eq '-_') { $res = $a - $b    ; 1 }
	  elsif($_ eq '*_') { $res = $a * $b    ; 1 }
	  elsif($_ eq '/_') { $res = $a / $b    ; 1 }
	  elsif($_ eq '^_') { $res = $a ** $b   ; 1 }
	  elsif($_ eq '%_') { $res = $a % $b    ; 1 }

	  elsif($_ eq '==_') { $res = 0 + ($a == $b) ; 1 }
	  elsif($_ eq '!=_') { $res = 0 + ($a != $b) ; 1 }
	  elsif($_ eq '>_')  { $res = 0 + ($a > $b)  ; 1 }
	  elsif($_ eq '>=_') { $res = 0 + ($a >= $b) ; 1 }
	  elsif($_ eq '<_')  { $res = 0 + ($a < $b)  ; 1 }
	  elsif($_ eq '<=_') { $res = 0 + ($a <= $b) ; 1 }

	  elsif($_ eq '<<_') { $res = ($a << $b) ; 1 }
	  elsif($_ eq '>>_') { $res = ($a >> $b) ; 1 }

	  elsif($_ eq '||_') { $res = ($a || $b) ? 1 : 0 ; 1 }
	  elsif($_ eq '&&_') { $res = ($a && $b) ? 1 : 0 ; 1 }

	  ;
	      
	  push(@ope_stack, $res);
	  next INSTR;


# Unary operators

   } elsif($_ eq 'm_') {

     $res = pop(@ope_stack);
     push(@ope_stack, -$res);
     next INSTR;

   } elsif($_ eq '!_') {

     $res = pop(@ope_stack);
     push(@ope_stack, 0+!$res);
     next INSTR;

   } elsif($_ eq 'V') {

# Variable or array identifier
     push(@ope_stack, $instr->[1]);
     next INSTR;

   } elsif($_ eq 'P') {

     push(@ope_stack, $instr->[1].'[]'.(pop(@ope_stack)));
     next INSTR;

   } elsif($_ eq 'v') {

# Variable value
# '*' is reserved for internal variables

     my $name = $instr->[1];
     unless (defined($sym_table{$name}) 
	     and $sym_table{$name}{'type'} eq 'var') {
       print STDERR "$name: undefined variable\n";
       $return = 3;
       @ope_stack = ();
       @stmt_list=();
       YYERROR;
     }
     push(@ope_stack, $sym_table{$name}{'value'});
     next INSTR;

   } elsif($_ eq 'p') {

# Array value : initialized to 0
     my ($name, $idx) = ($instr->[1], pop(@ope_stack));

     if($idx !~ /^\d+$/) {
       print STDERR "Non-integer index $idx for array\n";
       $return = 3;
       @ope_stack = ();
       @stmt_list=();
       YYERROR;
     }
       
#     debug {"p: $name, $idx.\n"};
     unless (defined($sym_table{$name.'[]'})
	     and $sym_table{$name.'[]'}{'type'} eq 'array') {

       $sym_table{$name.'[]'} = { type => 'array'};
     }
     unless ($sym_table{$name.'[]'}{'value'}[$idx]) {
       $sym_table{$name.'[]'}{'value'}[$idx] = { type => 'var',
					    value => 0 };
     }
     push(@ope_stack, $sym_table{$name.'[]'}{'value'}[$idx]{'value'});
     next INSTR;
     
   } elsif($_ eq '=V') { 
      
# Attribution of a value to a variable
# ope_stack ends with a NUMBER and an IDENTIFIER
     my $varName = pop(@ope_stack);
     my $value = pop(@ope_stack);
     $sym_table{$varName} = { type => 'var',
			      value => $value };
     push(@ope_stack, $value);
     next INSTR;

   } elsif($_ eq '=P') {
   
     my $varName = pop(@ope_stack);
     my $value = pop(@ope_stack);
     my ($name, $idx) = ($varName =~ /([a-z]+)\[\](\d+)/);

     $name .= '[]';
     unless (defined($sym_table{$name})
	     and $sym_table{$name}{'type'} eq 'array') 
     {
       $sym_table{$name} = { type => 'array',
			     value => [] };
     }
     $sym_table{$name}{'value'}[$idx] = { type => 'var',
					  value => $value };
     push(@ope_stack, $value);
     next INSTR;

   } elsif($_ eq 'IF') {
# IF statement

     my $cond = pop @ope_stack;
     my $res = $cond;
     $val = 0;
     if($cond) {
       ($return, $val) = exec_stmt($instr->[1]);
       push(@ope_stack, $val), last INSTR if $return;
     }

#     debug {"IF: $val.\n"};
     push(@ope_stack, $val);
#     debug {"IF: ope_stack=".Dumper(\@ope_stack)};
     next INSTR;

   } elsif($_ eq 'FOR-COND') {
# WHILE and FOR statement

#     debug {"while-cond: stmt_s=".Dumper(\@stmt_s)};

     my $i_cond = $instr;
     my $i_incr = shift @stmt_s;
     my $i_body = shift @stmt_s;
     
     my $r;
     my $val=1;

#     debug { "cond: ".Dumper($i_cond) };

   LOOP: while(1) {

     @ope_stack=();
     if($#{ $i_cond->[1] } >= 0) {
       ($return, $val) = exec_stmt($i_cond->[1]);
#       debug {"results of cond: $return, $val"};
       push(@ope_stack, $val), last INSTR 
	 if($return == 1 or $return == 2);
       last LOOP if $val == 0;
     }
     
#     debug {"while: executing a body\n"};
     
     if($#{ $i_body->[1] } >= 0) {
       ($return, $val) = exec_stmt($i_body->[1]);
       push(@ope_stack, $val);
       
       if($return == 1) {
	 last INSTR;
       } elsif($return == 2) {
	 $return = 0 ;
	 last INSTR;
       }
     }
     
     if($#{ $i_incr->[1] } >= 0) {
#       debug {"for: executing the increment: ".Dumper($i_incr)};
       @ope_stack = ();
       ($return, $val) = exec_stmt($i_incr->[1]);
	 push(@ope_stack, $val);
	 last INSTR if($return == 1 or $return == 2);
     }
     
   }
     $return = 3;
     push(@ope_stack, 1);  # whatever
     next INSTR;

   } elsif($_ eq 'FUNCTION-CALL') {

# Function call
     push @backup_sym_table, undef;   # Hmmm...

     my $name = $instr->[1];
     $name .= '()';

     unless($sym_table{$name}) {
       print STDERR "No function $name has been defined\n";
       @ope_stack = (0);
       $return = 3;
       YYERROR;
     } 

     if($sym_table{$name}{type} eq 'builtin') {
       ($return, $val) = 
	 (1, &{ $sym_table{$name}{value} }(\@ope_stack));
     } else {
       ($return, $val) = exec_stmt($sym_table{$name}{'value'});

# Restore the symbols temporarily pushed in 'a' and 'A' instructions
       debug {"restoring backup: ".Dumper(\@backup_sym_table)};

       my $n;
#       pop @backup_sym_table;    # The first is undef
       my $entry;
       while($var = pop @backup_sym_table) {
	 debug {"restoring var: ".Dumper($var)};
	 if($var->{'type'} eq 'undef') {
	   delete $sym_table{$var->{'name'}};;
	 } else {
	   $sym_table{$var->{'name'}} = $var->{'entry'};
	 }
       }

#       push @backup_sym_table, undef;
     }

#     debug {"result from function $name: $return, $val.\n"};
     push(@ope_stack, $val);

     if($return == 1) {
       $return = 0; # so the result will be printed
     } elsif($return == 2) {
       print STDERR "No enclosing while or for";
       YYERROR;
     } elsif($return == 3) {
       $return = 0;
     }
     next INSTR;

   } elsif($_ eq 'a' or $_ eq  'A') {

# Function arguments and auto list declaration
# The difference is that function arguments are initialized from the
# operation stack, while auto variables are initialized to zero
     my ($where, $name) = ($_, $instr->[1]);
  
     if(defined $sym_table{$name}) {
       debug { "backup $name, $sym_table{$name}\n" };
       push @backup_sym_table,  { name => $name,
				    entry => $sym_table{$name} }; 
     } else {
       debug { "backup $name, undef \n" };
       push @backup_sym_table,  { name => $name,
				    type => 'undef' }; 
     } 
     $sym_table{$name} = { type => 'var',
			   value => ($where eq 'a' ? 
				     shift(@ope_stack) : 0) };
     
#     debug { "new entry $name in sym table: $sym_table{$name}{'value'}" };
     next INSTR;

   } elsif($_ eq '{}') {

# Grouped statements
     if(scalar @{ $instr->[1] } > 0) {
       ($return, $val) = exec_stmt($instr->[1]);
     } else {
       ($return, $val) = (0, 0);
     }

     push(@ope_stack, $val), last INSTR 
       if($return eq 1 or $return eq 2);

     $return = 3;
     push(@ope_stack, $val);
     next INSTR;

   } elsif($_ eq 'STMT') {
     
     @ope_stack=();
     if(scalar $instr->[1] > 0) {
       ($return, $val) = exec_stmt($instr->[1]);
     } else {
       ($return, $val) = (3, undef);
     }

     @ope_stack = ($val), last INSTR 
	if($return eq 1 or $return eq 2);

     $return = 3;
     @ope_stack = ($val);

     next INSTR;

   } elsif($_ eq 'RETURN') {
# Return statement
     
#     debug {"returning $instr->[1].\n"};
     my $value = ($instr->[1] == 0) ? 0
       : pop(@ope_stack);

     $return = 1;
     @ope_stack = ($value);

     last INSTR;

   } elsif($_ eq 'BREAK') {
# Break statement
     
#     debug {"breaking.\n"};

     $return = 2;
     push(@ope_stack, 0);

     last INSTR;

   } elsif($_ eq 'PRINT') {
# PRINT statement

     if(scalar @{ $instr->[1] } > 0) {
       ($return, $val) = exec_stmt($instr->[1]);
     } else {
       ($return, $val) = (0, 0);
     }

     push(@ope_stack, $val), last INSTR 
       if($return eq 1 or $return eq 2);

     $return = 3;
     next INSTR;

   } elsif($_ eq 'PRINT-STMT') {

     @ope_stack=();
     if(scalar $instr->[1] > 0) {
       ($return, $val) = exec_stmt($instr->[1]);
     } else {
       ($return, $val) = (3, undef);
     }

     last INSTR if($return eq 1 or $return eq 2);

     $return = 3;

     print $val;
     next INSTR;

   } elsif($_ eq 'FUNCTION-DEF') {

# Function definition
     my ($name, $code) = ($instr->[1], $instr->[2]);
     push(@$code, ["RETURN", 0]);
     $sym_table{$name.'()'} = { type => 'func',
				value => $code };
     $return = 3;
     push(@ope_stack, 1); # whatever
     next INSTR;

   } elsif($_ eq '&') {

# Evaluating a Perl instruction
     $res = eval $instr->[1];
     push(@ope_stack, "\nresult of eval: $res");
     next INSTR;

   } elsif($_ eq 'S') {

# S for string
     $_ = $instr->[1];
     s/ \\a  /\a/gx;
     s/ \\b  /\b/gx;
     s/ \\f  /\f/gx;
     s/ \\n  /\n/gx;
     s/ \\r  /\r/gx;
     s/ \\t  /\t/gx;
     s/ \\q  /"/gx;   # "
     s/ \\\\ /\\/gx; 
     push(@ope_stack, $_); 
     next INSTR;

   } else {
     
     die "internal error: illegal statement $_";

   }
   
 }
  
  my $val;
  if ($return == 3) {
    @ope_stack = ();
  } else {
    if(scalar @ope_stack != 1) {
      die("internal error: ope_stack = ".join(", ", @ope_stack).".\n");
    }
 
    $val = pop(@ope_stack);
#    debug {"Returning ($return, $val)\n"};
#    debug {"ope_stack at e-o-func: ".Dumper(\@ope_stack)};
  }

  return ($return, $val);

}

# catch signals
sub catch
{
  local($signum) = @_;
  print STDERR "\n" if (-t STDERR && -t STDIN);
  &yyerror("Floating point exception") if $signum == 8;
#  next outer;
  main();
}

# main program
sub main
{
# outer: 
  while(1)
    {
      $line = '';
      eval '$status = &yyparse;';
#      debug { "yyparse returned $status" } if !$@;
      exit $status if ! $@;
      &yyerror($@);
    }
}

init_table();

command_line();

$SIG{'INT'} = 'catch';
$SIG{'FPE'} = 'catch';

select(STDERR); $| = 1;
select(STDOUT);
&next_file;

start_stmt();

main();

print "count=$count\n";

__END__

/* libmath.b for GNU bc.  */

/*  This file is part of GNU bc.
    Copyright (C) 1991, 1992, 1993, 1997 Free Software Foundation, Inc.

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License , or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; see the file COPYING.  If not, write to
    the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.

    You may contact the author by:
       e-mail:  phil@cs.wwu.edu
      us-mail:  Philip A. Nelson
                Computer Science Department, 9062
                Western Washington University
                Bellingham, WA 98226-9062
       
*************************************************************************/


scale = 20

/* Uses the fact that e^x = (e^(x/2))^2
   When x is small enough, we use the series:
     e^x = 1 + x + x^2/2! + x^3/3! + ...
*/

define e(x) {
  auto  a, d, e, f, i, m, n, v, z

  /* a - holds x^y of x^y/y! */
  /* d - holds y! */
  /* e - is the value x^y/y! */
  /* v - is the sum of the e's */
  /* f - number of times x was divided by 2. */
  /* m - is 1 if x was minus. */
  /* i - iteration count. */
  /* n - the scale to compute the sum. */
  /* z - orignal scale. */

  /* Check the sign of x. */
  if (x<0) {
    m = 1
    x = -x
  } 

  /* Precondition x. */
  z = scale;
  n = 6 + z + .44*x;
  scale = scale(x)+1;
  while (x > 1) {
    f += 1;
    x /= 2;
    scale += 1;
  }

  /* Initialize the variables. */
  scale = n;
  v = 1+x
  a = x
  d = 1

  for (i=2; 1; i++) {
    e = (a *= x) / (d *= i)
    if (e == 0) {
      if (f>0) while (f--)  v = v*v;
      scale = z
      if (m) return (1/v);
      return (v/1);
    }
    v += e
  }
}

/* Natural log. Uses the fact that ln(x^2) = 2*ln(x)
    The series used is:
       ln(x) = 2(a+a^3/3+a^5/5+...) where a=(x-1)/(x+1)
*/

define l(x) {
  auto e, f, i, m, n, v, z

  /* return something for the special case. */
  if (x <= 0) return ((1 - 10^scale)/1)

  /* Precondition x to make .5 < x < 2.0. */
  z = scale;
  scale = 6 + scale;
  f = 2;
  i=0
  while (x >= 2) {  /* for large numbers */
    f *= 2;
    x = sqrt(x);
  }
  while (x <= .5) {  /* for small numbers */
    f *= 2;
    x = sqrt(x);
  }

  /* Set up the loop. */
  v = n = (x-1)/(x+1)
  m = n*n

  /* Sum the series. */
  for (i=3; 1; i+=2) {
    e = (n *= m) / i
    if (e == 0) {
      v = f*v
      scale = z
      return (v/1)
    }
    v += e
  }
}

/* Sin(x)  uses the standard series:
   sin(x) = x - x^3/3! + x^5/5! - x^7/7! ... */

define s(x) {
  auto  e, i, m, n, s, v, z

  /* precondition x. */
  z = scale 
  scale = 1.1*z + 2;
  v = a(1)
  if (x < 0) {
    m = 1;
    x = -x;
  }
  scale = 0
  n = (x / v + 2 )/4
  x = x - 4*n*v
  if (n%2) x = -x

  /* Do the loop. */
  scale = z + 2;
  v = e = x
  s = -x*x
  for (i=3; 1; i+=2) {
    e *= s/(i*(i-1))
    if (e == 0) {
      scale = z
      if (m) return (-v/1);
      return (v/1);
    }
    v += e
  }
}

/* Cosine : cos(x) = sin(x+pi/2) */
define c(x) {
  auto v;
  scale += 1;
  v = s(x+a(1)*2);
  scale -= 1;
  return (v/1);
}

/* Arctan: Using the formula:
     atan(x) = atan(c) + atan((x-c)/(1+xc)) for a small c (.2 here)
   For under .2, use the series:
     atan(x) = x - x^3/3 + x^5/5 - x^7/7 + ...   */

define a(x) {
  auto a, e, f, i, m, n, s, v, z

  /* a is the value of a(.2) if it is needed. */
  /* f is the value to multiply by a in the return. */
  /* e is the value of the current term in the series. */
  /* v is the accumulated value of the series. */
  /* m is 1 or -1 depending on x (-x -> -1).  results are divided by m. */
  /* i is the denominator value for series element. */
  /* n is the numerator value for the series element. */
  /* s is -x*x. */
  /* z is the saved user's scale. */

  /* Negative x? */
  m = 1;
  if (x<0) {
    m = -1;
    x = -x;
  }

  /* Special case and for fast answers */
  if (x==1) {
    if (scale <= 25) return (.7853981633974483096156608/m)
    if (scale <= 40) return (.7853981633974483096156608458198757210492/m)
    if (scale <= 60) \
      return (.785398163397448309615660845819875721049292349843776455243736/m)
  }
  if (x==.2) {
    if (scale <= 25) return (.1973955598498807583700497/m)
    if (scale <= 40) return (.1973955598498807583700497651947902934475/m)
    if (scale <= 60) \
      return (.197395559849880758370049765194790293447585103787852101517688/m)
  }


  /* Save the scale. */
  z = scale;

  /* Note: a and f are known to be zero due to being auto vars. */
  /* Calculate atan of a known number. */ 
  if (x > .2)  {
    scale = z+5;
    a = a(.2);
  }
   
  /* Precondition x. */
  scale = z+3;
  while (x > .2) {
    f += 1;
    x = (x-.2) / (1+x*.2);
  }

  /* Initialize the series. */
  v = n = x;
  s = -x*x;

  /* Calculate the series. */
  for (i=3; 1; i+=2) {
    e = (n *= s) / i;
    if (e == 0) {
      scale = z;
      return ((f*a+v)/m);
    }
    v += e
  }
}


/* Bessel function of integer order.  Uses the following:
   j(-n,x) = (-1)^n*j(n,x) 
   j(n,x) = x^n/(2^n*n!) * (1 - x^2/(2^2*1!*(n+1)) + x^4/(2^4*2!*(n+1)*(n+2))
            - x^6/(2^6*3!*(n+1)*(n+2)*(n+3)) .... )
*/
define j(n,x) {
  auto a, d, e, f, i, m, s, v, z

  /* Make n an integer and check for negative n. */
  z = scale;
  scale = 0;
  n = n/1;
  if (n<0) {
    n = -n;
    if (n%2 == 1) m = 1;
  }

  /* Compute the factor of x^n/(2^n*n!) */
  f = 1;
  for (i=2; i<=n; i++) f = f*i;
  scale = 1.5*z;
  f = x^n / 2^n / f;

  /* Initialize the loop .*/
  v = e = 1;
  s = -x*x/4
  scale = 1.5*z

  /* The Loop.... */
  for (i=1; 1; i++) {
    e =  e * s / i / (n+i);
    if (e == 0) {
       scale = z
       if (m) return (-f*v/1);
       return (f*v/1);
    }
    v += e;
  }
}
#line 2391 "y.tab.pl"
