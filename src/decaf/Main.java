package decaf;

import java.io.*;
//import antlr.Token;
import java.util.Arrays;
import javax.swing.JFrame;
import javax.swing.JPanel;

import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.gui.TreeViewer;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import java6035.tools.CLI.*;

class Main {
    public static void main(String[] args) {
        try {
        	CLI.parse (args, new String[0]);

        	InputStream inputStream = args.length == 0 ?
                    System.in : new java.io.FileInputStream(CLI.infile);

        	if (CLI.target == CLI.SCAN)
        	{
        		DecafLexer lexer = new DecafLexer(new ANTLRInputStream(inputStream));
        		Token token;
        		boolean done = false;
        		while (!done)
        		{
        			try
        			{
		        		for (token=lexer.nextToken(); token.getType()!=Token.EOF; token=lexer.nextToken())
		        		{
		        			String type = "";
		        			String text = token.getText();

		        			switch (token.getType())
	        			{
		        			
		        			

		        			case DecafLexer.INT:
		        				type = "NUMERO";
							  			
							break;
						case DecafLexer.ID:
		        				type = "IDENTIFIER";
							  			
							break;
						case DecafLexer.CHAR2:
							type = " CHARLITERAL";
							break;
						case DecafLexer.STRING:
							type ="STRING";
							break;
						case DecafLexer.HEX:
							type ="HEXADECIMAL";
							break;

						
						case DecafLexer.OP:
							type ="OPERADOR";
							break;

						




						case DecafLexer.BOOLEANO:
							type ="BOOLEANO";
							break;
						case DecafLexer.SAIR:
							type ="SAIR";
							break;


						case DecafLexer.CLASSE:
							type ="CLASSE";
							break;

						case DecafLexer.SENAO:
							type ="SENAO";
							break;
						case DecafLexer.FALSO:
							type ="FALSO";
							break;

						case DecafLexer.SE:
							type ="SE";
							break;

						case DecafLexer.INTEIRO:
							type ="INTEIRO";
							break;

						case DecafLexer.RETORNO:
							type ="RETORNO";
							break;
						case DecafLexer.VERDADE:
							type ="VERDADE";
							break;
						case DecafLexer.VAZIO:
							type ="VAZIO";
							break;

						case DecafLexer.VA:
							type ="VA";
							break;

						case DecafLexer.PARDEFOR:
							type ="PARDEFOR";
							break;

						case DecafLexer.QUEBRA:
							type ="QUEBRA";
							break;

						case DecafLexer.CONTINUAR:
							type ="CONTINUAR";
							break;
						case DecafLexer.GATO:
							throw new Exception("unexpected char: 0x");
							
                                                     }	
						
						//fadaAFfas
		        			System.out.println (token.getLine() + " " +type + " " + text);


						}
		        		done = true;
        			} catch(Exception e) {
        	        	// print the error:
        	            System.out.println(CLI.infile+" "+e);
        	            lexer.skip();
        	        }
        		}
        	}
        	else if (CLI.target == CLI.PARSE || CLI.target == CLI.DEFAULT)
        	{
        	    // Primeiro faz o parsing da cadeia
                DecafLexer lexer = new DecafLexer(new ANTLRInputStream(inputStream));
                CommonTokenStream tokens = new CommonTokenStream(lexer);
                DecafParser parser = new DecafParser(tokens);

                // Adiciona as regras semÃ¢nticas
                ParseTree tree = parser.program();

                if (CLI.debug) {
                    // Se estiver no modo debug imprime a Ã¡rvore de parsing
                    // Create Tree View
                    // Source: https://stackoverflow.com/questions/23809005/how-to-display-antlr-tree-gui


                    //show AST in console
                    System.out.println(tree.toStringTree(parser));

                    //show AST in GUI
                    JFrame frame = new JFrame("Antlr AST");
                    JPanel panel = new JPanel();
                    TreeViewer viewr = new TreeViewer(Arrays.asList(
                            parser.getRuleNames()),tree);
                    viewr.setScale(1.5);//scale a little
                    panel.add(viewr);
                    frame.add(panel);
                    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
                    frame.setSize(200,200);
                    frame.setVisible(true);
                }

            }
        	
        } catch(Exception e) {
        	// print the error:
            System.out.println(CLI.infile+" "+e);
        }
    }
}


