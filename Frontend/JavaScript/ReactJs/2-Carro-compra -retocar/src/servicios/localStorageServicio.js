export class LocalStorageServicio{

    static get(valor){
        try {
            const item = window.localStorage.getItem(valor)
            if(item===undefined){
                return null
            }else{
                return JSON.parse(item)
            }
        } catch (error) {
            console.error("Error al leer el valor", valor, error)
            return null
        }
    }

    static set(clave,valor){
        try {
            window.localStorage.setItem(clave, JSON.stringify(valor))
        } catch (error) {
            console.error("Error al guardar el valor", valor, error)
        }
    }

    static remove(clave,valor){
        try {
            window.localStorage.removeItem(clave, JSON.stringify(valor))
        } catch (error) {
            console.error("Error al borrar el valor", valor, error)
        }
    }

    static clear(){
        try {
            window.localStorage.clear()
        } catch (error) {
            console.error("Error al Limpiar el localStorage")
        }
    }
}