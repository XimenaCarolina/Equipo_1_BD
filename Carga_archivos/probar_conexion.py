import psycopg2

DATABASE_URL = "AQUI_PEGA_TU_CONNECTION_STRING_DE_NEON"

try:
    conn = psycopg2.connect(DATABASE_URL)
    cur = conn.cursor()

    cur.execute("SELECT current_database(), current_user;")
    resultado = cur.fetchone()

    print("Conexión exitosa")
    print("Base de datos:", resultado[0])
    print("Usuario:", resultado[1])

    cur.close()
    conn.close()

except Exception as e:
    print("Error al conectar")
    print(e)