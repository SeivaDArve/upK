# Como guardar o site dos barco mas em ficheiro local
   # -s significa 'silent'
   # -L significa ''
   # -H significa 'header'
   # -o significa 'output' ou seja, cria um ficheiro de saida com o nome que for dado como argumento seguinte

   # drya-fast-tg-sys-vars
      v_verbose=on
      v_verbose=off

   function f_center {
      texto="$1"
      largura_terminal=$(tput cols)
      largura_texto=${#texto}
      espacos=$(( (largura_terminal - largura_texto) / 2 ))

      printf "%*s%s\n" $espacos "" "$texto"
   }

   function f_reset {
      cat $v_output2 > $v_output
      rm $v_output2
   }

   v_dir=${v_REPOS_CENTER}/omni-log/all/cp/./
   cd $v_dir
   mkdir -p out

   v_output=output.txt  # Sem filtro
   v_output2=output2.txt  # Com tail
   v_site="https://cp.pt/pt/pesquisa-estacao-detalhe/94-60038"
   v_site="https://ttsl.pt/passageiros/horarios-de-ligacoes-fluviais/ligacao-barreiro-terreiro-do-paco/"
   v_agent="User-Agent: Mozilla/5.0"

   clear
   figlet Barcos
   echo -n "A copiar o site a softlusa... "
   curl -s -L -H "$v_agent" "$v_site" -o $v_output
   echo
   echo " > A filtrar horarios"


# Contar quantas linhas tem o doc
   v_count=$(wc -l $v_output | cut -f 1 -d ' ')
   [[ $v_verbose == "on" ]] && echo "Numero total de linhas 1: $v_count"

# Filtrar h3
   v_num=$(cat $v_output | grep -n "<h3>" | head -n 1 | cut -f 1 -d ':')
   [[ $v_verbose == "on" ]] && echo "Numero do primeiro header: $v_num"

   v_num=$(echo "$v_num - 3" | bc)
   [[ $v_verbose == "on" ]] && echo " > BC: $v_num"
   
   v_sub=$(echo "$v_count - $v_num" | bc)
   [[ $v_verbose == "on" ]] && echo "Numero de linhas a dar ao 'tail': $v_sub"


   if [[ -f $v_output ]]; then
      tail -n $v_sub $v_output > $v_output2
   else
      [[ $v_verbose == "on" ]] && echo "Ficheiro de output '$v_output' nao existe"
   fi



# Remover o footer e tudo para baixo
   # Contar quantas linhas tem o doc 2
      v_count=$(wc -l $v_output2 | cut -f 1 -d ' ')
      [[ $v_verbose == "on" ]] && echo "Numero total de linhas 2: $v_count"

   v_footer=$(cat output2.txt | grep -nG "<footer>" | cut -f 1 -d ':')
   [[ $v_verbose == "on" ]] && echo "Linha do footer: $v_footer"

   v_sub=$(echo "$v_count - $v_footer" | bc)
   [[ $v_verbose == "on" ]] && echo "Numero de linhas a dar ao 'head': $v_sub"

   head -n $v_footer $v_output2 > $v_output
   
# Buscar o asterisco presente na tabela
   v_ast=$(cat output.txt | grep "iagens")
   v_ast=$(echo $v_ast | cut -f 2 -d '*' | cut -f 1 -d '<')
   v_ast="*$v_ast"
   [[ $v_verbose == "on" ]] && echo "Asterisco: $v_ast"

# Comecar a limpar
   cat $v_output | grep -v "^<" > $v_output2
   f_reset

   cat output.txt | grep -v "</p><p class=" > $v_output2
   f_reset

   cat output.txt | grep -v "</p></div><div class=" > $v_output2
   f_reset

   cat output.txt | grep -v "<p class=" > $v_output2
   f_reset

   cat output.txt | grep -v "</div>" > $v_output2
   f_reset

   cat output.txt | grep -v "entrada" > $v_output2
   f_reset

   cat output.txt | grep -v "table-responsive" > $v_output2
   f_reset

   cat output.txt | grep -v "<p>" > $v_output2
   f_reset

   grep -v "<br />" output.txt > $v_output2
   f_reset

   sed -i "s/<h3>//g"  output.txt

   sed -i "s#</h3>##g" output.txt

   sed -i "s#<div class=\"##g" output.txt

   sed -i "s#\">##g" output.txt

   grep -v "</p>" output.txt > $v_output2
   f_reset

   grep -v "hora-partidas" output.txt > $v_output2
   f_reset

   sed -i 's/^ *//' $v_output

   sed -i '/^$/d' $v_output

# Separar o texto resultante em 3 ficheiros separados
   # Ficheiro 3
      v_num=$(wc -l $v_output | cut -f 1 -d " ")
      v_num3=$(cat output.txt | grep -n div | tail -n 1 | cut -f 1 -d ':')
      [[ $v_verbose == "on" ]] && echo "num3: $v_num3"

      v_num=$(echo "$v_num - $v_num3 + 1" | bc)  # Numero de linhas para o tail
      [[ $v_verbose == "on" ]] && echo "tail $v_num"
      tail -n $v_num $v_output > 3.txt

      # Remover domingos e feriados:
         v_dom=$(echo "$v_num3 - 1" | bc)
         head -n $v_dom $v_output > $v_output2
         f_reset


   # Ficheiro 2
      v_num=$(wc -l $v_output | cut -f 1 -d " ")
      v_num2=$(cat output.txt | grep -n div | tail -n 1 | cut -f 1 -d ':')
      [[ $v_verbose == "on" ]] && echo "num2: $v_num2"

      v_num=$(echo "$v_num - $v_num2 + 1" | bc)  # Numero de linhas para o tail
      [[ $v_verbose == "on" ]] && echo "tail $v_num"
      tail -n $v_num $v_output > 2.txt

      # Remover sabados:
         v_sab=$(echo "$v_num2 - 1" | bc)
         head -n $v_sab $v_output > $v_output2
         f_reset


   # Ficheiro 1
      mv $v_output 1.txt
   

# Limpeza para cada 1 dos 3 ficheiros de output
   for i in $(ls | grep "txt"); 
   do
      [[ $v_verbose == "on" ]] && echo ----------------------------------
      [[ $v_verbose == "on" ]] && echo "A manipular $i"
      v_num=$(wc -l $i | cut -f 1 -d " ")
      v_num=$(echo "$v_num - 1" | bc)  # Para usar o Tail sem a primeira linha

      v=$(head -n 1 $i | cut -f 2 -d '"')
      a=$(echo $v | sed "s/ /_/g")
      [[ $v_verbose == "on" ]] && echo "texto: $v"
      [[ $v_verbose == "on" ]] && echo "Horario: $v" > output.txt

      tail -n $v_num $i >> output.txt

      cat output.txt > out/$a

      # Adicionar uma linha acima de "Partidas" no `sed` é a opcao 'i'
      sed -i '/Partidas/i \
          ' out/$a

      rm $i 
      rm output.txt
   done

   L0="Barcos: Escolha um horario para ver:"
   v=$(ls out | fzf --prompt="$L0")
   less out/$v


