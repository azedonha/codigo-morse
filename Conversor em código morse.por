programa {
    inclua biblioteca Texto --> tx
    inclua biblioteca Tipos --> tp

    funcao inicio() {
        cadeia mensagem, morse
        escreva("Digite o texto para criptografar em Morse: ")
        leia(mensagem)

        morse = converterParaMorse(mensagem)
        escreva("\nMensagem em Morse:\n", morse)
    }

    funcao cadeia converterParaMorse(cadeia texto) {
        cadeia alfabeto[27] = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", " "}
        cadeia codigos[27] = {".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..", "--", "-.", "---", ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--..", " / "}
        
        cadeia resultado = ""
        cadeia letra_atual
        inteiro indice

        // Transforma tudo para maiúsculas para facilitar a busca
        texto = tx.caixa_alta(texto)

        para (inteiro i = 0; i < tx.numero_caracteres(texto); i++) {
            letra_atual = tx.extrair_subtexto(texto, i, i + 1)
            indice = 26 // assume espaço ou caractere desconhecido

            // Busca qual é o código da letra
            para (inteiro j = 0; j < 26; j++) {
                se (letra_atual == alfabeto[j]) {
                    indice = j
                    pare
                }
            }

            // Concatena o código morse com um espaço entre as letras
            resultado = resultado + codigos[indice] + " "
        }

        retorne resultado
    }
}