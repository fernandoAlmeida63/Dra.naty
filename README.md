# Dra.naty

Dra.naty é um projeto Flutter que visa facilitar o acesso à saúde por meio de entregas rápidas e consultas online com profissionais qualificados. Este repositório contém a aplicação front-end (multi-plataforma) com telas de login, dashboard e home, organizada com um padrão simples de factories e coordinators para navegação e injeção de dependências.

**Status:** Em desenvolvimento

**Stack:** Flutter (Dart)

**Repositório:** https://github.com/fernandoAlmeida63/Dra.naty

**Índice**
- **Projeto**: visão geral
- **Pré-requisitos**: ferramentas necessárias
- **Instalação**: como preparar o ambiente
- **Execução**: rodar a aplicação (web, desktop, Android)
- **Testes e análise estática**
- **Estrutura do projeto**
- **Contribuição**
- **Licença**

**Projeto**
O app contém telas principais: login, home (com componentes de interface reutilizáveis), e uma arquitetura simples baseada em:
- `Factory` para criação de views e injeção de serviços
- `Coordinator` para navegação centralizada

O código está organizado em `lib/` com subpastas por cena (`scenes`), `core` e `application`.

**Pré-requisitos**
- Flutter (recomendado canal `stable`). Verifique com:

```
flutter --version
```

- Para rodar em Windows (desktop): Visual Studio com workload "Desktop development with C++" instalado.
- Para rodar em Android: Android SDK (via Android Studio) ou dispositivo conectado.
- Navegador moderno (Chrome/Edge) para execução web.

**Instalação (rápida)**
1. Clone o repositório:

```
git clone https://github.com/fernandoAlmeida63/Dra.naty.git
cd Dra.naty
```

2. Instale dependências:

```
flutter pub get
```

3. Configure ferramentas de plataforma se necessário (Android SDK / Visual Studio).

**Execução**

- Rodar no navegador (Chrome):

```
flutter run -d chrome
```

- Rodar no Windows (desktop) — requer Visual Studio C++ workload:

```
flutter run -d windows
```

- Rodar em dispositivo Android (emulador ou físico):

```
flutter run -d <device-id>
```

Substitua `<device-id>` por um id listado em `flutter devices`.

**Builds**

- Release para Android (apk):

```
flutter build apk --release
```

- Build web:

```
flutter build web
```

**Testes e análise estática**

- Executar testes unitários:

```
flutter test
```

- Rodar análise estática (lint/erro):

```
flutter analyze
```

- Aplicar formatação automática (dartfmt):

```
dart format .
```

**Estrutura do projeto (resumo)**
- `lib/` - código fonte Flutter
	- `application/` - ponto de entrada alternativo / app configurado
	- `core/` - `AppCoordinator`, utilitários
	- `scenes/` - telas do aplicativo (login, home, dashboard)
	- `assets/` - imagens e recursos (logo, ícones)

**Observações importantes**
- Caso a execução em Windows falhe com erro "Unable to find suitable Visual Studio toolchain", instale o Visual Studio (Community) com o workload "Desktop development with C++".
- Se o projeto for clonado e as `packages` foram atualizadas externamente, rode `flutter pub get` antes de `flutter run`.

**Contribuição**
- Abra issues para discutir bugs ou features.
- Para contribuir com PRs:

```
git checkout -b feature/minha-melhora
# faça mudanças
git add .
git commit -m "Descrição da mudança"
git push origin feature/minha-melhora
# abra um Pull Request no GitHub
```
