#!/bin/bash

# Exibe uma caixa de mensagem temporária
dialog --infobox "S IDE" 10 30

# Exibe uma caixa de entrada e captura a entrada do usuário
code=$(dialog --inputbox "Digite o comando para executar:" 10 30 2>&1 >/dev/tty)

# Verifica se o usuário clicou em Cancelar
if [ $? -eq 0 ]; then
    # Executa o comando digitado pelo usuário e captura a saída
    output=$(eval "$code" 2>&1)
    
    # Exibe a caixa de mensagem com a saída do comando
    dialog --msgbox "Saída:\n$output" 10 50
else
    # Informa que o usuário clicou em Cancelar
    dialog --msgbox "Comando cancelado." 10 30
fi

# Limpa o terminal
clear
