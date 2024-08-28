
# **Base de Datos en SQL: Claves Primarias, Claves Foráneas, Tipos de Datos y Operaciones DDL y DML**

## **Índice**
1. [Claves Primarias (Primary Keys)](#claves-primarias-primary-keys)
2. [Claves Foráneas (Foreign Keys)](#claves-foráneas-foreign-keys)
3. [Tipos de Datos en PostgreSQL](#tipos-de-datos-en-postgresql)
4. [Operaciones DDL (Data Definition Language)](#operaciones-ddl-data-definition-language)
5. [Operaciones DML (Data Manipulation Language)](#operaciones-dml-data-manipulation-language)


## **Claves Primarias (Primary Keys)**

### **¿Qué es una Clave Primaria?**
Una **clave primaria** es una columna o un conjunto de columnas en una tabla de base de datos que identifica de manera única cada fila en esa tabla. La clave primaria debe ser única y no puede contener valores nulos.

### **¿Para qué sirve?**
- **Identificación Única:** Garantiza que cada fila en la tabla es única.
- **Integridad Referencial:** Permite que otras tablas puedan hacer referencia a esta clave mediante claves foráneas.
- **Optimización de Búsqueda:** Facilita la indexación y mejora la eficiencia de las consultas.

### **Ejemplo de Uso:**
Imagina que tienes una tabla `Estudiantes` donde cada estudiante debe tener un identificador único.

```sql
CREATE TABLE Estudiantes (
    id SERIAL PRIMARY KEY,
    nombre TEXT NOT NULL,
    apellido TEXT NOT NULL,
    edad INTEGER DEFAULT 18
);
```

En este ejemplo, la columna `id` es la clave primaria. Es un número que se incrementa automáticamente con cada nuevo estudiante (debido al tipo `SERIAL`), garantizando que cada `id` es único.


## **Claves Foráneas (Foreign Keys)**

### **¿Qué es una Clave Foránea?**
Una **clave foránea** es una columna o un conjunto de columnas en una tabla que establece un vínculo entre los datos de dos tablas. La clave foránea en una tabla apunta a una clave primaria en otra tabla.

### **¿Para qué sirve?**
- **Relacionar Tablas:** Permite que los datos de dos tablas estén relacionados entre sí.
- **Mantener la Integridad de los Datos:** Asegura que los valores en la clave foránea corresponden a un registro existente en la tabla referenciada.

### **Ejemplo de Uso:**
Siguiendo con el ejemplo anterior, supongamos que tenemos otra tabla `Cursos` y queremos relacionarla con la tabla `Estudiantes`.

```sql
CREATE TABLE Cursos (
    id SERIAL PRIMARY KEY,
    nombre_curso TEXT NOT NULL,
    id_estudiante INTEGER REFERENCES Estudiantes(id)
);
```

Aquí, `id_estudiante` es una clave foránea que apunta a la clave primaria `id` en la tabla `Estudiantes`. Esto significa que cada curso está asociado con un estudiante específico.

---

## **Tipos de Datos en PostgreSQL**

### **1. `SERIAL`**
- **Descripción:** Tipo de dato especial que crea automáticamente una secuencia de enteros, útil para generar identificadores únicos.
- **Ejemplo de Uso:**
  ```sql
  CREATE TABLE Libros (
      id SERIAL PRIMARY KEY,
      titulo TEXT NOT NULL
  );
  ```

### **2. `INTEGER`**
- **Descripción:** Tipo de dato numérico entero. Se usa para representar números enteros sin decimales.
- **Ejemplo de Uso:**
  ```sql
  CREATE TABLE Estudiantes (
      id INTEGER PRIMARY KEY,
      nombre TEXT NOT NULL
  );
  ```

### **3. `CHAR(n)`**
- **Descripción:** Tipo de dato de texto de longitud fija, donde `n` es el número de caracteres. Se utiliza para cadenas de texto que siempre tienen la misma longitud.
- **Ejemplo de Uso:**
  ```sql
  CREATE TABLE Productos (
      id SERIAL PRIMARY KEY,
      codigo CHAR(5),
      nombre TEXT NOT NULL
  );
  ```

### **4. `CHAR VARIYING(n)`**
- **Descripción:** Tipo de dato de texto de longitud variable, donde `n` es el número máximo de caracteres permitidos. Se utiliza cuando la longitud del texto puede variar.
- **Ejemplo de Uso:**
  ```sql
  CREATE TABLE Clientes (
      id SERIAL PRIMARY KEY,
      nombre VARCHAR(50) NOT NULL
  );
  ```

### **5. `TEXT`**
- **Descripción:** Tipo de dato de texto sin límite de longitud. Se utiliza para almacenar cadenas de texto largas.
- **Ejemplo de Uso:**
  ```sql
  CREATE TABLE Articulos (
      id SERIAL PRIMARY KEY,
      contenido TEXT NOT NULL
  );
  ```

### **6. `DATE`**
- **Descripción:** Tipo de dato que almacena fechas en el formato `YYYY-MM-DD`.
- **Ejemplo de Uso:**
  ```sql
  CREATE TABLE Eventos (
      id SERIAL PRIMARY KEY,
      fecha DATE NOT NULL
  );
  ```

---

## **Operaciones DDL (Data Definition Language)**

El DDL se utiliza para definir y modificar la estructura de las bases de datos. Las principales operaciones de DDL son:

### **1. `CREATE`**
   - **Descripción:** Crea una nueva tabla, índice, vista o esquema en la base de datos.
   - **Ejemplo:**
     ```sql
     CREATE TABLE Libros (
         id SERIAL PRIMARY KEY,
         titulo TEXT NOT NULL,
         autor TEXT NOT NULL,
         id_estante INTEGER
     );
     ```

### **2. `ALTER`**
   - **Descripción:** Modifica una tabla existente, añadiendo, modificando o eliminando columnas.
   - **Ejemplo:**
     ```sql
     ALTER TABLE Libros
     ADD COLUMN fecha_publicacion DATE;
     ```

### **3. `DROP`**
   - **Descripción:** Elimina una tabla, vista, índice o esquema de la base de datos.
   - **Ejemplo:**
     ```sql
     DROP TABLE Libros;
     ```

### **4. `TRUNCATE`**
   - **Descripción:** Elimina todos los registros de una tabla, pero conserva la estructura de la tabla.
   - **Ejemplo:**
     ```sql
     TRUNCATE TABLE Libros;
     ```

---

## **Operaciones DML (Data Manipulation Language)**

El DML se utiliza para manipular los datos almacenados en las bases de datos. Las principales operaciones de DML son:

### **1. `SELECT`**
   - **Descripción:** Recupera datos de la base de datos.
   - **Ejemplo:**
     ```sql
     SELECT * FROM Libros;
     ```

### **2. `INSERT`**
   - **Descripción:** Inserta nuevos registros en una tabla.
   - **Ejemplo:**
     ```sql
     INSERT INTO Libros (titulo, autor, id_estante)
     VALUES ('1984', 'George Orwell', 2);
     ```

### **3. `UPDATE`**
   - **Descripción:** Actualiza registros existentes en una tabla.
   - **Ejemplo:**
     ```sql
     UPDATE Libros
     SET titulo = 'Rebelión en la Granja'
     WHERE id = 1;
     ```

### **4. `DELETE`**
   - **Descripción:** Elimina registros de una tabla.
   - **Ejemplo:**
     ```sql
     DELETE FROM Libros
     WHERE id = 1;
     ```

---

## **Ejemplos Combinados en un Escenario**

### **Creación de Tablas y Manipulación de Datos:**

1. **Crear una Tabla de Libros (DDL - `CREATE`):**
   ```sql
   CREATE TABLE Libros (
       id SERIAL PRIMARY KEY,
       titulo TEXT NOT NULL,
       autor TEXT NOT NULL,
       ESTADO** BOOLEAN,
       id_estante INTEGER
   );
   ```

2. **Insertar Datos en la Tabla de Libros (DML - `INSERT`):**
   ```sql
   INSERT INTO Libros (titulo, autor, id_estante)
   VALUES ('El Principito', 'Antoine de Saint-Exupéry', 1);
   ```

3. **Seleccionar Todos los Libros (DML - `SELECT`):**
   ```sql
   SELECT * FROM Libros;
   ```

4. **Actualizar el Título de un Libro (DML - `UPDATE`):**
   ```sql
   UPDATE Libros
   SET titulo = '1984'
   WHERE id = 2;
   ```

5. **Eliminar un Libro de la Tabla (DML - `DELETE`):**
   ```sql
   DELETE FROM Libros
   WHERE id = 3;
   ```

### **Modificar la Estructura de la Tabla:**

1. **Agregar una Nueva Columna (DDL - `ALTER`):**
   ```sql
   ALTER TABLE Libros
   ADD COLUMN fecha_publicacion DATE;
   ```

2. **Eliminar Todos los Registros (DDL - `TRUNCATE`):**
   ```sql
   TRUNCATE TABLE Libros;
   ```

3. **Eliminar la Tabla Completa (DDL - `DROP`):**
   ```sql
   DROP TABLE Libros;
   ```

---