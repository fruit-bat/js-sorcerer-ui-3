                                                                                                    SPELLU 0�                                                                                                         ��� �(12):�:� "SIGHTSPELL PROGRAM" ��:� >�� "THIS PROGRAM EXERCISES AND TESTS VISION, ATTENTION," y� "AND MEMORY SKILLS NEEDED FOR READING AND SPELLING." ��:� �� "THIS PROGRAM FLASHES WORDS OR RANDOM STRINGS ON THE" �$� "SCREEN.  YOU MUST� THEN ENTER EXACTLY THE SAME WORD OR" :.� "STRING IN 3 TRIES.  TO CORRECT ENTRIES, USE SHIFT-RUB." B8�:� �B� "IF YOU CHOOSE WORDS, YOU WILL BE ASKED TO ENTER UP TO" �L� "100 WORDS OF UP TO 64 CHARACTERS EACH, AND SELECT A" �V� "NUMBER FROM 1 TO 9� FOR HOW LONG YOU WANT THE WORDS TO" 7`� "BE FLASHED.  THE WORDS WILL BE FLASHED ONE AT A TIME" Pj� "IN RANDOM ORDER." Xt�:� �~� "IF YOU CHOOSE STRINGS, THE PROGRAM WILL FLASH STRINGS" ��� "OF DIGITS, UPPER CASE CHARACTERS, OR LOWER CASE" �� "�CHARACTERS, BEGINNING WITH SHORT ONES.  IF YOU GET 10" K�� "IN A ROW ON THE FIRST TRY, IT WILL TRY LONGER STRINGS." ��� "IF YOU CAN'T GET 3 IN A ROW, IT WILL TRY SHORTER STRINGS." ��� "WHEN YOU WANT TO QUIT, JUST ENTER THE SLASH MARK /." ���:� ��W� "TO CONTINUE, HIT RETURN";X$ �� 7000 
NN�100 � V$(NN),R(NN) ,(� I�1 � NN 92V$(I)�"" D<R(I)�0 LF� I Z�� �(12):� ��� "IF YOU WISH TO TRY WORDS, ENTER Y.  OTHERWISE, YOU" ��� "WILL GET RANDOM STRINGS." ��X$�"" ��� X$ ��� X$�"Y"" � 2000 �� 3000 ��� �(12):�:� 9�� "ENTER THE WORDS YOU WISH TO TRY.  WHEN YOU ARE FINISHED," R�� "JUST HIT RETURN." \��:�:� d�N�0 r�� V$(N�1) ��� �(V$(N�1))�0 � 2300 ��� �(V$(N�1))�64 � 2250 ��� 2270 ���:� ��� "WORDS MUST NOT EXCEE�D 64 CHARACTERS.  TRY AGAIN." ��� 2210 �N�N�1 �� N��100 � 2290 '�� 2210 O��:�:� "YOU HAVE ENTERED 100 WORDS." g��:�:� I�1 � 500:� I w�� �(12):�:� �	� "HOW LONG DO YOU WANT THE WORDS FLASHED"; �	� T �	� T�1 � T�9 � 2340 �	� 2400 �$	Ǘ:� 	.	� "YOU MUST ENTER A NUMBER FROM 1 TO 9.  TRY AGAIN." 	8	� 2315 8	`	� WORD SHUFFLE ROUTINE Q	e	� I�1 � N:R(I)�0:� I f	j	R(1)�1��(N��(1)) t	t	� I�2 � N |	~	J�1 �	�	S�1��(N��(1)) �	�	� S�R(J) � 2430 �	�	J�J�1 �	�	� J��I�1 � 2450 �	�	R(I)�S �	�	� I �	�	� WORD SELECT ROUTINE �	�	E�0:G�0 
�	� I�1 � N 
�	W$�V$(R(I)) "
�	� 4000 *
�	� I :
�	� �(12):�:� g
�	� "YOU MISSED";E;"OUT OF";N;"WORDS.":�:� �
 
� "YOUR SCORE IS";�(100�(N�E)�N�.5);"PERCENT." �

�:� �


� "IF YOU WISH TO TRY THESE WORDS AGAIN, ENTER xY." �

X$�"" �

� X$  (
� X$�"Y" � 2400 ;2
� "IF YOU WISH TO TRY ANOTHER LIST OF WORDS, ENTER Y." E<
X$�"" NF
� X$ bP
� X$�"Y" � 2200 �Z
� "IF YOU WISH TO TRY RANDOM STRINGS, ENTER Y." �d
X$�"" �n
� X$ �x
� X$�"Y" � 3000 ��
�:�:� "PROGRAM ENDED�.":�:� ��
� 9999 �� RANDOM STRING ROUTINE �M�2:Q�0:G�0:H�0 �T�5 )�W$�"" 7�� I�1 � M J�P�1��(62��(1)) ]�� P��10 � 3200 p�� P��36 � 3220 {�� 3240 ��P�P�47 ��� 3300 ��P�P�54 ��� 3300 ��P�P�60 ��W$�W$��(P) ��� I ��� 4000 ���� Y$�"/" � 3500 ��Q�Q�1 � G�10 � 3020 M�M�1 E�0:Q�0:G�0 )� 3020 9�� �(12):�:� J�� Q�0 � 3530 ��� "YOU GOT THE LAST";G;"STRINGS ON THE FIRST TRY." ���:� ��� "YOU MISSED";E;"OUT OF";Q;�(M)�"-CHARACTER STRINGS." ���:� ��� "YOUR SCORE IS";�(100�(Q�E)�Q�.5);"PERCENT." ��:� E�� "IF YOU WISH TO TRY THE PREVIOUS WORDS AGAIN, ENTER Y." O�X$�"" X�� X$ l�� X$�"Y" � 2400 t��:� ��� "IF YOU WISH TO TRY SOME NEW WORDS, ENTER Y." �X$�"" �� X$ �� X$�"Y" � 2000 �$�:�� .� "IF YOU WISH TO TRY RANDOM STRINGS AGAIN, ENTER Y." 8X$�"" $B� X$ 8L� X$�"Y" � 3000 SV�:�:� "PROGRAM ENDED." ^`� 9999 t�� DISPLAY ROUTINE ��C��(30��(1)) ��D��((64��(W$))��(1)) ��� �(12):�:� ��� "WHEN READY, HIT RETURN";X$ ���L �(12); ��� J�1 � C ��� ��� J �� �D);W$ "� K�1 � 100�2�(1�T):� K .� �(12) Eh� RESPONSE ROUTINE kr�:�:� "NOW ENTER THE SAME THING." z|� J�1 � 12 ��� ��� J ��L�0 ��Y$�"" ��� Y$ ��� COMPARISON ROUTINE ��� Y$�"/" � 5999 ���� W$�Y$ � 5900 ��L�L�1 ��G�0 �� L��3 � 5070 -��:�:� "WRONG.  TRY AGAIN.":� 4250 L��:�:� "YOU DIDN'T GET IT." `�� K�1 � 500:� K n�G�0:E�E�1 x�H�H�1 ��� H��3 � M�2 � M�M�1 ��E�0:Q�0:G�0 ��� 5999 ��:�:� "RIGHT! �� K�1 � 500:� K ��� L�0 � G�G�1 �H�0 � � 5999 �o� '�   �