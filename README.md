# 🧠 Mini Data Platform Lab

Proyecto diseñado para simular un entorno real de trabajo en Data Engineering / Backend.

## 🎯 Objetivo

Este laboratorio tiene como objetivo entender cómo funciona una mini plataforma de datos combinando:

- Python (ETL + API)
- SQL (PostgreSQL)
- DevOps (Docker, CI/CD, Git)

---

## 🏗️ Arquitectura del sistema

```text
CSV → ETL (Python) → PostgreSQL → API → Métricas
```

## 📁 Estructura del proyecto`
```text
app/            → Código principal de la aplicación
  api/          → Endpoints FastAPI
  etl/          → Lógica de extracción y transformación
  models/       → Modelos de datos
  services/     → Lógica de negocio
  db.py         → Conexión a base de datos
  config.py     → Configuración del sistema

data/
  raw/          → Datos de entrada (CSV)
  exports/      → Datos procesados

sql/
  init.sql      → Creación inicial de tablas

scripts/
  run_etl.py    → Ejecución del pipeline de datos

tests/
  → Tests unitarios
```
---

## 🐳 Servicios

```text
| Servicio | URL |
|--------|------|
| API | http://localhost:8000/docs |
| Adminer | http://localhost:8080 |
| PostgreSQL | localhost:5432 |
```
---

## 🚀 Levantar el entorno

```bash
docker compose up --build
```

## 🧪 Ejecutar ETL
```bash
docker compose exec app python scripts/run_etl.py
```

## 🧠 Flujo de trabajo

Datos entran en data/raw
Script ETL los procesa
Se insertan en PostgreSQL
Se consultan mediante SQL o API

## 🌳 Flujo Git

Este proyecto sigue una estructura profesional:

main → código estable
develop → integración de features
feature/* → desarrollo de funcionalidades

## 🧑‍💻 Normas del proyecto

No se trabaja en main
Todo va por Pull Request
Código documentado
Tests obligatorios en nuevas features

## 🎓 Objetivo formativo

Este proyecto simula un entorno real para adquirir:

pensamiento de pipeline de datos
modelado SQL
estructura de backend
prácticas DevOps


---

# 💬 4. Comentarios en código 

## app/db.py

```python
"""
Módulo de conexión a base de datos.

Este archivo construye la conexión a PostgreSQL usando variables de entorno.
Simula cómo se gestionan credenciales en entornos reales.
"""

import os
from sqlalchemy import create_engine

DB_HOST = os.getenv("DB_HOST")
DB_PORT = os.getenv("DB_PORT")
DB_NAME = os.getenv("DB_NAME")
DB_USER = os.getenv("DB_USER")
DB_PASSWORD = os.getenv("DB_PASSWORD")

DATABASE_URL = f"postgresql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}"

engine = create_engine(DATABASE_URL)
```
## scripts/run_etl.py

```python
"""
Script principal de ETL.

Responsable de:
1. Leer datos desde CSV
2. Transformarlos
3. Insertarlos en la base de datos

Este flujo simula un pipeline de datos real.
"""

import pandas as pd
from app.db import engine

def run_etl():
    # Leer datos crudos
    df = pd.read_csv("data/raw/sales_test.csv")

    # Transformación básica
    df["total_amount"] = df["quantity"] * df["unit_price"]

    # Inserción en base de datos
    df.to_sql("raw_orders", engine, if_exists="append", index=False)

    print("ETL completado 🚀")

if __name__ == "__main__":
    run_etl()
```

## app/main.py

```python
"""
Punto de entrada de la API.

Simula un servicio backend que expone endpoints para consultar datos.
"""

from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
def health():
    return {"status": "ok"}
```

