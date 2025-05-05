# 📄 Esquema de Base de Datos

## 🧾 Tablas

### 1. `clientes`
| Columna        | Tipo de dato     | Descripción                  |
|----------------|------------------|------------------------------|
| id_cliente     | `int`            | **PK**, autoincrement        |
| nombre         | `varchar(100)`   | NOT NULL                     |
| apellido       | `varchar(100)`   | NOT NULL                     |
| direccion      | `varchar(255)`   |                              |
| telefono       | `varchar(20)`    | ÚNICO, INDEX                 |
| email          | `varchar(100)`   | ÚNICO, INDEX                 |
| fecha_registro | `timestamp`      | DEFAULT CURRENT_TIMESTAMP    |

**Claves**:
- 🔑 **PK**: `id_cliente`
- 🔍 **Índices**: `id_cliente`, `telefono`, `email`

---

### 2. `deudas`
| Columna           | Tipo de dato       | Descripción                                |
|-------------------|--------------------|--------------------------------------------|
| id_deuda          | `int`              | **PK**, autoincrement                      |
| id_cliente        | `int`              | **FK** → `clientes(id_cliente)`           |
| monto_original    | `decimal(10,2)`    | NOT NULL                                   |
| monto_pendiente   | `decimal(10,2)`    | NOT NULL                                   |
| fecha_vencimiento | `date`             | NOT NULL                                   |
| tipo_deuda        | `varchar(50)`      |                                            |
| tasa_interes      | `decimal(5,2)`     |                                            |
| fecha_inicio      | `date`             |                                            |

**Claves**:
- 🔑 **PK**: `id_deuda`
- 🔗 **FK**: `id_cliente` → `clientes(id_cliente)`
- 🔍 **Índices**: `id_cliente`, `fecha_vencimiento`

---

### 3. `pagos`
| Columna        | Tipo de dato      | Descripción                             |
|----------------|-------------------|-----------------------------------------|
| id_pago        | `int`             | **PK**, autoincrement                   |
| id_deuda       | `int`             | **FK** → `deudas(id_deuda)`            |
| fecha_pago     | `date`            | NOT NULL                                |
| monto_pagado   | `decimal(10,2)`   | NOT NULL                                |
| metodo_pago    | `varchar(50)`     |                                         |
| referencia     | `varchar(100)`    |                                         |

**Claves**:
- 🔑 **PK**: `id_pago`
- 🔗 **FK**: `id_deuda` → `deudas(id_deuda)`
- 🔍 **Índices**: `id_deuda`, `fecha_pago`

---

### 4. `agentes`
| Columna            | Tipo de dato      | Descripción                            |
|--------------------|-------------------|----------------------------------------|
| id_agente          | `int`             | **PK**, autoincrement                  |
| nombre             | `varchar(100)`    | NOT NULL                               |
| apellido           | `varchar(100)`    | NOT NULL                               |
| email_agente       | `varchar(100)`    | ÚNICO, INDEX                           |
| telefono_agente    | `varchar(20)`     |                                        |
| fecha_contratacion | `date`            |                                        |

**Claves**:
- 🔑 **PK**: `id_agente`
- 🔍 **Índices**: `id_agente`, `email_agente`

---

### 5. `interacciones`
| Columna           | Tipo de dato      | Descripción                                   |
|-------------------|-------------------|-----------------------------------------------|
| id_interaccion    | `int`             | **PK**, autoincrement                         |
| id_deuda          | `int`             | **FK** → `deudas(id_deuda)`                  |
| id_agente         | `int`             | **FK** → `agentes(id_agente)`                |
| fecha_hora        | `datetime`        | DEFAULT CURRENT_TIMESTAMP                     |
| tipo_interaccion  | `varchar(50)`     |                                               |
| canal             | `varchar(50)`     |                                               |
| duracion          | `int`             |                                               |
| resultado         | `varchar(255)`    |                                               |
| notas             | `text`            |                                               |

**Claves**:
- 🔑 **PK**: `id_interaccion`
- 🔗 **FK**: `id_deuda` → `deudas(id_deuda)`
- 🔗 **FK**: `id_agente` → `agentes(id_agente)`
- 🔍 **Índices**: `id_deuda`, `id_agente`, `fecha_hora`

---

### 6. `planes_pago`
| Columna       | Tipo de dato      | Descripción                             |
|----------------|------------------|-----------------------------------------|
| id_plan        | `int`            | **PK**, autoincrement                   |
| id_deuda       | `int`            | **FK** → `deudas(id_deuda)`            |
| fecha_inicio   | `date`           |                                         |
| fecha_fin      | `date`           |                                         |
| monto_cuota    | `decimal(10,2)`  |                                         |
| frecuencia     | `varchar(20)`    |                                         |
| dia_de_pago    | `int`            |                                         |
| estado         | `varchar(20)`    |                                         |

**Claves**:
- 🔑 **PK**: `id_plan`
- 🔗 **FK**: `id_deuda` → `deudas(id_deuda)`
- 🔍 **Índices**: `id_deuda`, `estado`, `dia_de_pago`
