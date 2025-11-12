# Guia de Conexão Frontend e Backend - PsicoCare

Este guia explica como conectar o frontend (React Native/Expo) com o backend (Express.js).

## 📋 Pré-requisitos

1. Backend rodando na porta 3333 (padrão)
2. Frontend configurado e pronto para rodar

## 🚀 Como Iniciar

### 1. Iniciar o Backend

```bash
cd PsicoCare-API
npm install  # Se ainda não instalou as dependências
npm run dev  # Inicia o servidor na porta 3333
```

O backend estará disponível em: `http://localhost:3333`

### 2. Iniciar o Frontend

```bash
cd PsicoCare
npm install  # Se ainda não instalou as dependências
npm start   # Inicia o Expo
```

## 🔧 Configuração da URL da API

A URL da API é configurada automaticamente no arquivo `PsicoCare/lib/api.ts`. A configuração detecta o ambiente:

### Web (Navegador)
- Usa automaticamente: `http://localhost:3333`

### iOS Emulador
- Usa automaticamente: `http://localhost:3333`

### Android Emulador
- Por padrão: `http://localhost:3333`
- Se não funcionar, altere no arquivo `PsicoCare/lib/api.ts` para: `http://10.0.2.2:3333`

### Dispositivo Físico
Para usar em um dispositivo físico, você precisa:

1. **Descobrir o IP da sua máquina:**
   - Windows: Execute `ipconfig` no PowerShell e procure por "IPv4"
   - Mac/Linux: Execute `ifconfig` ou `ip addr`

2. **Configurar a URL:**
   - Opção 1: Editar `PsicoCare/lib/api.ts` e alterar a URL padrão
   - Opção 2: Criar arquivo `.env` na pasta `PsicoCare` com:
     ```
     EXPO_PUBLIC_API_URL=http://SEU_IP:3333
     ```
     Exemplo: `EXPO_PUBLIC_API_URL=http://192.168.1.100:3333`

3. **Garantir que o dispositivo está na mesma rede Wi-Fi**

## 🧪 Testando a Conexão

1. Inicie o backend
2. Inicie o frontend
3. No console do frontend, você verá: `🔗 API Base URL: http://...`
4. Tente fazer login ou qualquer ação que chame a API

## 🔍 Troubleshooting

### Erro: "Network request failed"
- Verifique se o backend está rodando
- Verifique se a porta 3333 está correta
- Para Android emulador, tente usar `10.0.2.2` em vez de `localhost`
- Para dispositivo físico, verifique o IP e a rede Wi-Fi

### Erro: "CORS policy"
- O backend já está configurado para aceitar todas as origens
- Se persistir, verifique se o backend está rodando

### Backend não inicia
- Verifique se a porta 3333 está disponível
- Verifique as variáveis de ambiente (arquivo `.env` no backend)
- Verifique a conexão com o banco de dados

## 📝 Estrutura da API

O backend expõe as seguintes rotas principais:

- `/pacientes` - Gerenciamento de pacientes
- `/psicologos` - Gerenciamento de psicólogos
- `/admin` - Funcionalidades administrativas
- `/solicitacoes` - Solicitações de atendimento
- `/atendimentos` - Atendimentos
- `/acompanhamentos` - Acompanhamentos diários
- `/horarios-disponiveis` - Horários disponíveis
- `/agendamentos` - Agendamentos
- `/notas-sessoes` - Notas de sessões

Todas as rotas (exceto login) requerem autenticação via token JWT no header:
```
Authorization: Bearer <token>
```

## ✅ Checklist de Conexão

- [ ] Backend rodando na porta 3333
- [ ] Frontend iniciado
- [ ] URL da API configurada corretamente para o ambiente
- [ ] CORS configurado no backend
- [ ] Teste de login funcionando
- [ ] Requisições autenticadas funcionando








