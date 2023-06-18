// Generated from c:\Users\vitao\Documentos\Documentos\José\Aulas\Anhembi\Compiladores\ExemplosProfessor\Impressao\aula.g4 by ANTLR 4.9.2
 import java.util.*; 
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class aulaParser extends Parser {
	static { RuntimeMetaData.checkVersion("4.9.2", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, ID=3, NUM=4, Op_atrib=5, PV=6, WS=7;
	public static final int
		RULE_start = 0, RULE_comando = 1;
	private static String[] makeRuleNames() {
		return new String[] {
			"start", "comando"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "'inicio'", "'fim'", null, null, "'='", "';'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, null, null, "ID", "NUM", "Op_atrib", "PV", "WS"
		};
	}
	private static final String[] _SYMBOLIC_NAMES = makeSymbolicNames();
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}

	@Override
	public String getGrammarFileName() { return "aula.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }


		Print x = new Print();

	public aulaParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	public static class StartContext extends ParserRuleContext {
		public ComandoContext comando() {
			return getRuleContext(ComandoContext.class,0);
		}
		public StartContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_start; }
	}

	public final StartContext start() throws RecognitionException {
		StartContext _localctx = new StartContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_start);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(4);
			match(T__0);
			System.out.print(x.printInicio());
			setState(6);
			comando();
			setState(7);
			match(T__1);
			System.out.print(x.printFim());
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ComandoContext extends ParserRuleContext {
		public Token ID;
		public Token Op_atrib;
		public Token NUM;
		public Token PV;
		public List<TerminalNode> ID() { return getTokens(aulaParser.ID); }
		public TerminalNode ID(int i) {
			return getToken(aulaParser.ID, i);
		}
		public TerminalNode Op_atrib() { return getToken(aulaParser.Op_atrib, 0); }
		public TerminalNode PV() { return getToken(aulaParser.PV, 0); }
		public TerminalNode NUM() { return getToken(aulaParser.NUM, 0); }
		public ComandoContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_comando; }
	}

	public final ComandoContext comando() throws RecognitionException {
		ComandoContext _localctx = new ComandoContext(_ctx, getState());
		enterRule(_localctx, 2, RULE_comando);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(10);
			((ComandoContext)_localctx).ID = match(ID);
			System.out.print((((ComandoContext)_localctx).ID!=null?((ComandoContext)_localctx).ID.getText():null)+" ");
			setState(12);
			((ComandoContext)_localctx).Op_atrib = match(Op_atrib);
			System.out.print((((ComandoContext)_localctx).Op_atrib!=null?((ComandoContext)_localctx).Op_atrib.getText():null)+" ");
			setState(18);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case NUM:
				{
				setState(14);
				((ComandoContext)_localctx).NUM = match(NUM);
				System.out.print((((ComandoContext)_localctx).NUM!=null?((ComandoContext)_localctx).NUM.getText():null));
				}
				break;
			case ID:
				{
				setState(16);
				((ComandoContext)_localctx).ID = match(ID);
				System.out.print((((ComandoContext)_localctx).ID!=null?((ComandoContext)_localctx).ID.getText():null));
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
			setState(20);
			((ComandoContext)_localctx).PV = match(PV);
			System.out.print((((ComandoContext)_localctx).PV!=null?((ComandoContext)_localctx).PV.getText():null)+" ");
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3\t\32\4\2\t\2\4\3"+
		"\t\3\3\2\3\2\3\2\3\2\3\2\3\2\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\5\3\25\n"+
		"\3\3\3\3\3\3\3\3\3\2\2\4\2\4\2\2\2\30\2\6\3\2\2\2\4\f\3\2\2\2\6\7\7\3"+
		"\2\2\7\b\b\2\1\2\b\t\5\4\3\2\t\n\7\4\2\2\n\13\b\2\1\2\13\3\3\2\2\2\f\r"+
		"\7\5\2\2\r\16\b\3\1\2\16\17\7\7\2\2\17\24\b\3\1\2\20\21\7\6\2\2\21\25"+
		"\b\3\1\2\22\23\7\5\2\2\23\25\b\3\1\2\24\20\3\2\2\2\24\22\3\2\2\2\25\26"+
		"\3\2\2\2\26\27\7\b\2\2\27\30\b\3\1\2\30\5\3\2\2\2\3\24";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}