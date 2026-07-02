# PostgreSQL Template

Postgres is an awesome database, but setting it up with multiple users following security best practices is tedious and easy to get wrong.

This template handles that setup once, so every new project starts secure by default.

## Usage

1. Click **Use this template** on GitHub (or `git clone` this repo).
2. Copy `.env.example` to `.env` and fill in real passwords:
   ```bash
   cp .env.example .env
   ```
3. Start the database:
   ```bash
   docker compose up -d
   ```
4. Edit `setup.sql`, uncommenting or modifiying what you need, connect as `postgres` and run it.

## Files

| File | Purpose |
|---|---|
| `docker-compose.yml` | Runs Postgres with a persistent volume |
| `.env.example` | Environment variable template |
| `setup.sql` | Commented script: revokes default public access, creates admin and app roles, sets grants |
| `.gitignore` | Keeps `.env` out of version control |

## Roles

- **`db_admin`**: used for migrations and schema administration. Not used by the app at runtime.
- **`db_user`**: used by the application at runtime. Restricted privileges: no `CREATE`, no `BYPASSRLS`.

## Security notes

- `db_user` should never be superuser or have `BYPASSRLS`, so Row Level Security works if you add it later.