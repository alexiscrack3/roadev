# Roadev

## What is Roadev?

Roadev is an open-source project based on [roadmap.sh](https://roadmap.sh) to help guide the developers in picking up the path and guide their learnings.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
  - [Usage](#usage)
- [License](#license)

## Prerequisites

- Ruby 2.7.0
- Rails 6.1.4
- Node.js 12.18.3+
- Yarn
- Docker

## Installation

Clone the repo and cd into the directory:

```bash
git clone https://github.com/alexiscrack3/roadev
```

```bash
cd roadev
```

```bash
bundle install
```

```bash
yarn install
```

Next, migrate the database:

```bash
rails db:migrate
```

Seed the database with sample data:

```bash
rails server
```

### Usage

Spin up the db service:

```bash
docker-compose up -d db
```

Run the app in a local server:

```bash
rails server
```

## License

Licensed under MIT License. See [LICENSE](LICENSE) for further details.
