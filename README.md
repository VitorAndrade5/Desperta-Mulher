Desperta Mulher - Análise de Risco (ARPAX)

O **Desperta Mulher** é um aplicativo desenvolvido em Flutter voltado para o acolhimento, conscientização e proteção de mulheres em situação de vulnerabilidade. O projeto conta com um formulário de análise de risco baseado no Formulário Nacional de Avaliação de Riscos (FONAR) e integra ferramentas de acessibilidade para garantir que o conhecimento chegue a todas.

---

 Funcionalidades Principais

Análise de Risco (ARPAX): Questionário dinâmico baseado nas diretrizes do CNJ (Conselho Nacional de Justiça) e Maria da Penha para mapear níveis de perigo.
  Identidade Visual Integrada: Cores e tipografia totalmente padronizadas com a plataforma oficial `despertemulher.org`.
  Acessibilidade com VLibras: Integração nativa do assistente de tradução de Libras utilizando a avatar feminina (**Hozana**), mantendo a representatividade do projeto.
  Sistema de Rotas Seguro: Navegação fluida entre as telas de Login, Perfil, Registro, Quiz e Resultados.



Identidade Visual e Design

O design do aplicativo foi refinado para espelhar a sofisticação da plataforma web:
Fundo: Tom creme suave (`#FDFBF7`) que reduz a fadiga visual.
Cores de Destaque: Roxo elegante (`#632B6C`) para títulos e identidade da marca; Magenta/Rosa queimado (`#C44B77`) para botões de ação estruturados em formato de pílula (`StadiumBorder`).



Tecnologies Utilizadas

Framework: [Flutter](https://flutter.dev) (Dart)
Plataforma Alvo: Flutter Web / Android
Acessibilidade: Plugin [VLibras Widget](https://vlibras.gov.br/) do Governo Federal


Estrutura do Projeto

```text
lib/
├── common/          # Gerenciamento de rotas e utilitários globais
├── login/           # Tela de autenticação e controle de acesso
├── Models/          # Modelagem de dados (Perguntas, Respostas, Critérios)
├── profile/         # Tela de perfil do usuário acolhido
└── Screens/         # Telas principais do fluxo (Registro, Quiz, Resultados)
web/
└── index.html       # Configuração web e inicialização do VLibras
