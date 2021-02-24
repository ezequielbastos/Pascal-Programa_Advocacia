Program Pzim ;

Type Login = record
		 Nome	 					: string;
		 Pass						: String;
		 Tipo_Adv				: String;
		 Data						: String;
		 CPF_CNPJ				: String;
		 OAB						: String;
	   Telefone				: Integer;
	   Email					: string;						
	   CEP						: Integer;
	   NumeroRes			: String;
		 Complem_Ender 	: String;
End;

Var arq_Log : file of Login; 
		    Log : Login;
OAB_Verif, Pass_Verif : String;
Opc : Integer;
		 
Procedure Criador_de_Arq_Adv;
Begin
	 mkdir('C:\ArquivosPascal');
	 Assign(arq_Log, 'C:\ArquivosPascal\Login_Adv.Text');
	 {$I-}
	 Reset(arq_Log);
	 {SI+}
	 If (IOResult <> 0) Then
	 Rewrite(arq_Log);
End;

Procedure Criador_de_Arq_Cli;
Begin
	 mkdir('C:\ArquivosPascal');
	 Assign(arq_Log, 'C:\ArquivosPascal\Ent_Client.Text');
	 {$I-}
	 Reset(arq_Log);
	 {SI+}
	 If (IOResult <> 0) Then
	 Rewrite(arq_Log);
End;

Procedure Criador_de_Arq_Proc;
Begin
	 mkdir('C:\ArquivosPascal');
	 Assign(arq_Log, 'C:\ArquivosPascal\Ent_Proc.Text');
	 {$I-}
	 Reset(arq_Log);
	 {SI+}
	 If (IOResult <> 0) Then
	 Rewrite(arq_Log);
End;

Procedure DashBoard;

Var i : integer;
Begin
		

  For i := 4 to 83 do begin  
   Gotoxy (i,2);
   TextColor(Brown);
   Write ('=');
  End;
	
	For i := 2 to 26 do begin 
   Gotoxy (83,i);
   TextColor(Brown);
   Write ('+');
  End;
	
	 For i := 4 to 82 do begin  
   Gotoxy (i,26);
   TextColor(Brown);
   Write ('=');
	 End;	
	 
	 
	Gotoxy (4,14);
  TextColor(red);
	writeln ('|===========MENU===========|');
	Gotoxy (4,15); 
  writeln ('|[1] Registros Advogados  ]|');
	Gotoxy (4,16); 
  writeln ('|[2] Buscar 1 Advogados   ]|');
	Gotoxy (4,17); 
  writeln ('|[3] Registros Clientes   ]|');
	Gotoxy (4,18); 
  writeln ('|[4] Buscar 1 Clientes    ]|');
	Gotoxy (4,19); 
  writeln ('|[5] Registrar 1 Cliente  ]|');
  Gotoxy (4,20); 
  writeln ('|[6] Registros Processo   ]|');
  Gotoxy (4,21); 
  writeln ('|[7] Buscar 1 Processo    ]|');
  Gotoxy (4,22); 
  writeln ('|[8] Registrar 1 Processo ]|');
  Gotoxy (4,23);
  writeln ('|[0]  SAIR DO SISTEMA     ]|');
  Gotoxy (4,24);
  Writeln ('|==========================|');
  
  Gotoxy (52,5);
  TextColor(Red);
	writeln ('|=======[ATUALIZADOR]========|');
	Gotoxy (52,6); 
  writeln ('|[TOTAL DE ADVOGADOS]        |');
	Gotoxy (52,7); 
  writeln ('|[TOTAL DE CLIENTES]         |');
	Gotoxy (52,8); 
  writeln ('|[TOTAL DE PROCESSOS]        |');
	Gotoxy (52,9);
	Writeln ('|============================|');
	 TextColor(White);
	 
	Gotoxy (35,14);
  TextColor(Red);
	writeln ('|===[MEUS DADOS]===|');
	Gotoxy (35,16); 
  writeln ('|[NOME]: ');
	Gotoxy (35,18); 
  writeln ('|[CPF/CNPJ]: ');
	Gotoxy (35,20); 
  writeln ('|[Nº OAB ]: ');
	Gotoxy (35,22); 
  writeln ('|[EMAIL]: ');
  Gotoxy (35,24); 
  writeln ('|[TIPO ADV]: ');
  
	 WriteLn;
	 			Gotoxy (3,4);
	 			TextColor(WHITE);
				WriteLn('         ________ ');
				Gotoxy (3,5);
				WriteLn('        |________|____ ');
				Gotoxy (3,6);
				WriteLn('        //        \    ');
				Gotoxy (3,7);   
				WriteLn('       /\   O| |O  \  ');
				Gotoxy (3,8);
				WriteLn('         \_  (_)  _/   ');
				Gotoxy (3,9);
				WriteLn('          \  .__. /  "Tenha o controle de');
				Gotoxy (3,10);
				WriteLn('           \_____/  Tudo com sua DashBoard 2.0"');
				Gotoxy (3,11);    
				WriteLn('      _____|_____|_____    ');
				Gotoxy (3,12);
				WriteLn('     /...../\    /\....\   ');
		
		For i := 4 to 50 do begin  
   Gotoxy (i,13);
   TextColor(Brown);
   Write ('=');
	 End;
	 
	 For i := 2 to 13 do begin 
   Gotoxy (50,i);
   TextColor(Brown);
   Write ('=');
   End;	
				
				For i := 2 to 26 do begin  
   Gotoxy (3,i);
   TextColor(Brown);
   Write ('+');
  End;	
End;

Procedure Register_Adv;
Var Pass1, Pass2 : string;

Begin
		SeeK (arq_Log, filesize(arq_Log)); //Pula as informações ja gravadas, indo para o final do arquivo, para poder regitras as novas informações!
		WriteLN;
	  Write ('(Informe seu nome*): ');
	  	Read (Log.Nome);
	  Write ('(Informe seu CPF/CNPJ*): ');
	    Read (Log.CPF_CNPJ);
	  Write ('(Area em que Atua ): ');
	    Read (Log.Tipo_Adv);
	   {------------------------------------------------
	       Espaço para incluir o validador CPF/CNPJ
	   ------------------------------------------------}
	  Write ('(Informe sua (Data de Nascimento): ');
	  	Read (Log.Data);
	  Write ('(Informe seu (Telefone): ');
	  	Read (Log.Telefone);
	  Write ('(Informe seu Nº(OAB): ');
	  	Read (Log.OAB);
	  Write ('(Informe seu (Email): ');
	  	Read (Log.Email);
	  Write ('(Informe seu (CEP): ');
	    Read (Log.CEP);
	  Write ('(Informe o (Numero Do Bairro/Casa): ');
	    Read (Log.NumeroRes);
		Writeln ('(Informe seu (Complemento endreço): ');
	    Read (Log.Complem_Ender);
	  Writeln;
	  
	  Begin
	  	Repeat
			Writeln('------------------------------------------------');
			Write('Insira a nova senha: ');
			Read(Pass1);
			Write('Insira a confirme senha: ');
			Read(Pass2);
				If (Pass1 <> Pass2)Then
				Writeln('Senhas não coferem tente novamente!: ');
			Until(Pass1 = Pass2);
		End; 
		 Log.Pass := Pass1 ;
	  Write(arq_Log, Log); //Grava as informações dentro do arquivo
End;
  
Begin  
 
 Writeln;
 Writeln ('         |______________________________________________________________|'); 
 Writeln ('                             ¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦ 		');
 Writeln ('                             ¦¦?. Escritorio .?¦¦¦¦ 		'); 
 Writeln ('                             ¦¦¦¦¦¦¦¦ De ¦¦¦¦¦¦¦¦¦¦¦¦¦¦ '); 
 Writeln ('                             ¦¦¦¦ Advocacia ¦¦¦¦¦¦.·.¦¦ ');
 Writeln ('                             ¦¦¦¦¦¦¦ MITZ ¦¦¦¦¦¦¦¦¦¦¦¦  ');
 Writeln ('                              ¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦     ');
 Writeln (' 	                       ¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦       ');
 Writeln ('                                ¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦        ');
 Writeln ('                          ¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦ ');
 Writeln ('                              ¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦     ');
 Writeln ('         |=============|================================================|');
 Gotoxy(10,14);
 Writeln ('|[1] LOGIN    | ');
 Gotoxy(10,15);
 Writeln ('|[2] REGISTRE | ');
 Gotoxy(10,16);
 Writeln ('|[3] SAIR     | ');
 Gotoxy(10,17);
 Writeln ('|=============| ');
 Write('Tecle a opção correspondente: ');
 Read(Opc);
 
  Case (Opc) of
  	1: Begin
  		Criador_de_Arq_Adv;
  	   Write('Insira o Nº da sua (OAB): ');
 				Read(OAB_Verif);
 				Write('Insira sua (Senha): ');
 				Read(Pass_Verif);
 				Begin
					Seek(arq_Log, 0);
					While (not eof (arq_Log)) do
					Begin 
						Read (arq_Log, Log);
						Begin 
	 						If (OAB_Verif = Log.OAB) and (Pass_Verif = Log.Pass)Then
							
							Begin
			 					If(OAB_Verif <> Log.OAB) and (Pass_Verif <> Log.Pass)Then
			 					 Write('Dados de login incorretos ou User inesistente!');
			 					If(OAB_Verif <> Log.OAB) and (Pass_Verif <> Log.Pass)Then
								exit
							End;
	  				End;
					End;
 				End;
 				ClrScr;
 				WriteLn;
				WriteLn('         ________ ');
				WriteLn('        |________|____ ');
				WriteLn('        //        \    ');   
				WriteLn('       /\   O| |O  \  ');
				WriteLn('         \_  (_)  _/   ');
				WriteLn('          \  .__. /  Bem vindo ');
				WriteLn('           \_____/      (',Log.nome,')'); //Esta pegando o ultimo nome do registro, fazer manipulação por arrey.
				WriteLn('      _____|_____|_____    ');
				WriteLn('     /...../\    /\....\   ');
 				WriteLn;
 				Write('Tecle alguma tecla para continuar para DashBoard...');
 				ReadKey;
 				ClrScr;
  	End;
  	
  	2: Begin
      Criador_de_Arq_Adv;
      Register_Adv;
      Writeln;
      ClrScr;
 				WriteLn;
				WriteLn('         ________ ');
				WriteLn('        |________|____ ');
				WriteLn('        //        \    ');   
				WriteLn('       /\   O| |O  \  ');
				WriteLn('         \_  (_)  _/   ');
				WriteLn('          \  .__. /  Parabéns seu cadastro ');
				WriteLn('           \_____/     Foi realizado com ');
				WriteLn('      _____|_____|_____    Sucesso! ');
				WriteLn('     /...../\    /\....\   ');
 				WriteLn;
 				Write('Precione uma tecla para encerrar, depois entre com o login!');
 				ReadKey;
 				ClrScr;
 				Exit
  	End;
  	
  	3: Begin
  	   Writeln('Cessão Terminada....');
  	   ReadKey;
  	   Exit
  	End;
  	
  	else Begin
				WriteLN('Opção de menu invalida! Renicie o programa e tecle (1) ou (2)');
				ReadKey;
				Exit
		end;	
  End;
  
   Begin
   //Criar um arrey para pegar as 4 variaveis e mandar via referencia para a procedure DashBoard
   Criador_de_Arq_Adv;
     Repeat
    DashBoard;
		Writeln ;
    Write ('Digite a Opcão desejada: ');
		Read (Opc);
		Case (Opc) of
			1: begin
  
  		End;
  		
  		2: Begin
  		
  		End;
  		
  		3: begin
  
  		End;
  		
  		4: Begin
  		
  		End;
  		
  		5: begin
  
  		End;
  		
  		6: Begin
  		
  		End;
  		
  		7: begin
  
  		End;
  		
  		8: Begin
  		
  		End;
  		
  		0: begin
        WriteLn('Sessão Terminada!!!');
  		  ReadKey;
  		End;
  		Else Begin
  			WriteLn;
  		  WriteLn('Digito não coencide com nenhuma das opções!!!');
  		  ReadKey;
  		  ClrScr;
  		End;
  	End;
  	 Until(Opc = 0);
   End;
End.