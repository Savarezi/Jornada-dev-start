# TCC - Trabalho de Conclusão de Curso: Do Zero ao Protheus (Harbour/ADVPL)

## 📌 Sobre o Projeto
Sistema desenvolvido para a Indústria XYZ com o objetivo de monitorar as não conformidades na entrada de materiais dos fornecedores, garantindo a conformidade com o processo de certificação **ISO 9001**. O projeto engloba o controle de certificados de qualidade (ZZ1) e o registro detalhado de ocorrências de não conformidade (ZZ2), integrados aos cadastros padrão do ERP TOTVS Protheus (SA2 e SB1).

---

## 📂 Estrutura de Arquivos e Componentes

| Pasta / Arquivo | Descrição Detalhada |
| :--- | :--- |
| **TCC/** | Diretório raiz contendo todos os artefatos do Trabalho de Conclusão de Curso. |
| **Dados-e-Dicionario/** | Pasta que armazena os arquivos de banco de dados (.dbf), dicionários do sistema e menu customizado. |
| ├── sa2990.dbf | Tabela de dados de teste: Cadastro de Fornecedores. |
| ├── sb1990.dbf | Tabela de dados de teste: Cadastro de Produtos. |
| ├── sx2990.dbf | Dicionário de Tabelas do Protheus (SX2). |
| ├── sx3990.dbf | Dicionário de Campos do Protheus (SX3). |
| ├── six990.dbf | Dicionário de Índices do Protheus (SIX). |
| ├── sx7990.dbf | Dicionário de Gatilhos automáticos do Protheus (SX7). |
| ├── sxb990.dbf | Consultas Padrão (F3) do Protheus (SXB). |
| ├── zz1990.dbf | Tabela de Controle de Fornecimento (Certificados ISO 9001). |
| ├── zz2990.dbf | Tabela de Ocorrências de Não Conformidade por Fornecedor. |
| ├── sigacom.xnu | Arquivo de Menu customizado adicionado ao Módulo de Compras (SIGACOM). |
| **TCC.PRJ** | Arquivo de projeto do Visual Studio / DevStudio gerenciavel. |
| **STTZZ1.PRW** | Rotina mBrowse principal para gerenciamento e manutenção da tabela ZZ1 (com legendas e botão de ocorrências). |
| **STTZZ2.PRW** | Rotina mBrowse para gerenciamento de ocorrências (ZZ2) e função de filtro por fornecedor/controle. |
| **STTZZLIB.PRW** | Biblioteca unificada de funções comuns (zero duplicação de código). |
| **TCC-Documentacao.docx** | Documentação técnica completa do projeto com prints e instruções. |

---

## 🗄️ Estrutura das Tabelas Principales

### 1. ZZ1 - Controle de Fornecimento (Certificados)
* **Acesso:** Compartilhado
* **Campos Principais:** ZZ1_FILIAL, ZZ1_CODIGO, ZZ1_FORNEC, ZZ1_LOJAFO, ZZ1_NOMEFO (Virtual), ZZ1_CERTIF, ZZ1_VALCER, ZZ1_TOLERA, ZZ1_TOTOK, ZZ1_TOTNOK.

### 2. ZZ2 - Ocorrências do Fornecedor
* **Acesso:** Compartilhado
* **Campos Principais:** ZZ2_FILIAL, ZZ2_CONFOR, ZZ2_FORNEC, ZZ2_LOJAFO, ZZ2_NOMEFO (Virtual), ZZ2_DATA, ZZ2_HORA, ZZ2_CODPRO, ZZ2_QTDOK, ZZ2_QTDNOK, ZZ2_VLRUNI, ZZ2_TOTOK (Virtual), ZZ2_TOTNOK (Virtual).

---

## 🚀 Como Executar e Instalar
1. Importar os arquivos de dicionário (.dbf) no ambiente Protheus.
2. Compilar os fontes (STTZZLIB.PRW, STTZZ1.PRW, STTZZ2.PRW) no repositório RPO.
3. Configurar o menu do SIGACOM (sigacom.xnu).
4. Executar as rotinas via Protheus SmartClient.
