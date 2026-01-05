# npmw-sql-migrate

A lightweight, OS-agnostic **NPM wrapper** for the simple yet popular Go-based migration tool [sql-migrate](https://github.com/rubenv/sql-migrate).

This package automatically detects your operating system and architecture (Windows, macOS, Linux) and provides the correct native binary for your environment. No Go installation required.

## 🚀 Key Features

* **Zero Dependencies:** No need to install Go or GCC on your machine.
* **OS Agnostic:** Works seamlessly on Windows (x64), macOS (Intel/Apple Silicon), and Linux (x64/ARM).
* **npx Support:** Run migrations without even installing the package globally.
* **CI/CD Ready:** Tiny footprint, perfect for GitHub Actions or Docker-based deployments.

---

## 📦 Installation

Install it as a development dependency in your project:

```bash
npm install --save-dev npmw-sql-migrate

```

Or install it globally:

```bash
npm install -g npmw-sql-migrate

```

---

## 🛠 Usage

You can use the command exactly like the original `sql-migrate` tool.

### Using npx (Recommended)

```bash
npx sql-migrate --help

```

### Common Commands

```bash
# Apply migrations
npx sql-migrate up

# Rollback migrations
npx sql-migrate down

# Check status
npx sql-migrate status

# Create a new migration file
npx sql-migrate new my_new_feature

```

---

## ⚙️ Configuration

`npmw-sql-migrate` looks for a `dbconfig.yml` file in your project root by default.

Example `dbconfig.yml`:

```yaml
development:
  dialect: mysql
  datasource: root:password@tcp(127.0.0.1:3306)/my_db?parseTime=true
  dir: migrations

```

---

## 📂 How it Works

This package utilizes **Optional Dependencies**. When you install `npmw-sql-migrate`, NPM only downloads the specific binary package for your current platform (e.g., `npmw-sql-migrate-linux-x64`). This keeps your `node_modules` small and efficient.

---

## ⚖️ License & Credits

* **Original Tool:** [sql-migrate](https://github.com/rubenv/sql-migrate) by Ruben Vermeersch.
* **Wrapper License:** [MIT](https://www.google.com/search?q=LICENSE).
* **Binary License:** Distributed under the original MIT License of `sql-migrate`.

This is a community-maintained fork/wrapper. 
If you encounter issues with the migration logic itself, please refer to the original repository. 
If you encounter issues with the NPM installation or binary execution, please open an issue here.
