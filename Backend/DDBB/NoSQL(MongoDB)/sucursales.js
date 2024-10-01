
//use empresa_de_moda

//creamos la coleccion con validacion de esquema 
db.createCollection("sucursales", {
    validator: {
        $jsonSchema: {
            bsonType: "object",
            required: ["_id", "nombre", "dir", "marca", "departamentos"],
            properties: {
                _id: {
                    bsonType: "string",
                    description: "Debe ser una cadena y es obligatorio"
                },
                nombre: {
                    bsonType: "string",
                    description: "Debe ser una cadena y es obligatorio"
                },
                dir: {
                    bsonType: "string",
                    description: "Debe ser una cadena y es obligatorio"
                },
                marca: {
                    bsonType: "string",
                    description: "Debe ser una cadena y es obligatorio"
                },
                departamentos: {
                    bsonType: "array",
                    description: "Debe ser un array de objetos y es obligatorio",
                    items: {
                        bsonType: "object",
                        required: ["cod_dpto", "nombre", "responsable"],
                        properties: {
                            cod_dpto: {
                                bsonType: "string",
                                description: "Debe ser una cadena y es obligatorio"
                            },
                            nombre: {
                                bsonType: "string",
                                description: "Debe ser una cadena y es obligatorio"
                            },
                            responsable: {
                                bsonType: "string",
                                description: "Debe ser una cadena y es obligatorio"
                            }
                        }
                    }
                }
            }
        }
    }
});
// hacemos los inserts de los documentos
db.sucursales.insertMany([
    {
        "_id": "SUC001",
        "nombre": "Sucursal Centro",
        "dir": "Calle Principal 123, Ciudad",
        "marca": "Marca A",
        "departamentos": [
            {
                "cod_dpto": "DPT001",
                "nombre": "Ventas",
                "responsable": "EMP001"
            },
            {
                "cod_dpto": "DPT002",
                "nombre": "Marketing",
                "responsable": "EMP002"
            }
        ]
    },
    {
        "_id": "SUC002",
        "nombre": "Sucursal Norte",
        "dir": "Avenida Norte 456, Ciudad",
        "marca": "Marca B",
        "departamentos": [
            {
                "cod_dpto": "DPT003",
                "nombre": "Finanzas",
                "responsable": "EMP003"
            },
            {
                "cod_dpto": "DPT004",
                "nombre": "Recursos Humanos",
                "responsable": "EMP004"
            }
        ]
    },
    {
        "_id": "SUC003",
        "nombre": "Sucursal Sur",
        "dir": "Calle Sur 789, Ciudad",
        "marca": "Marca A",
        "departamentos": [
            {
                "cod_dpto": "DPT005",
                "nombre": "Logística",
                "responsable": "EMP005"
            },
            {
                "cod_dpto": "DPT006",
                "nombre": "Producción",
                "responsable": "EMP006"
            }
        ]
    },
    {
        "_id": "SUC004",
        "nombre": "Sucursal Este",
        "dir": "Avenida Este 101, Ciudad",
        "marca": "Marca C",
        "departamentos": [
            {
                "cod_dpto": "DPT007",
                "nombre": "Desarrollo",
                "responsable": "EMP007"
            },
            {
                "cod_dpto": "DPT008",
                "nombre": "Soporte Técnico",
                "responsable": "EMP008"
            }
        ]
    },
    {
        "_id": "SUC005",
        "nombre": "Sucursal Oeste",
        "dir": "Calle Oeste 202, Ciudad",
        "marca": "Marca B",
        "departamentos": [
            {
                "cod_dpto": "DPT009",
                "nombre": "Investigación",
                "responsable": "EMP009"
            },
            {
                "cod_dpto": "DPT010",
                "nombre": "Desarrollo de Producto",
                "responsable": "EMP010"
            }
        ]
    },
    {
        "_id": "SUC006",
        "nombre": "Sucursal Central",
        "dir": "Plaza Central 303, Ciudad",
        "marca": "Marca A",
        "departamentos": [
            {
                "cod_dpto": "DPT011",
                "nombre": "Compras",
                "responsable": "EMP011"
            },
            {
                "cod_dpto": "DPT012",
                "nombre": "Ventas Internacionales",
                "responsable": "EMP012"
            }
        ]
    }
]);

// Buscar todas las sucursales que pertenecen a "Marca A"
db.sucursales.find({ "marca": "Marca A" }).pretty();

// Buscar todas las sucursales que tienen un departamento llamado "Ventas"
db.sucursales.find({ "departamentos.nombre": "Ventas" }).pretty();

