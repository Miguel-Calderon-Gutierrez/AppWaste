# 🌿 **Waste Classification App** 🌿  

### 📝 **Descripción**  
**Waste Classification App** es una aplicación móvil desarrollada en **Flutter** que utiliza un modelo avanzado de aprendizaje profundo: **`Giecom/google-vit-base-patch16-224-Waste-O-I-classification`**, creado por **Miguel Calderón**. La app permite clasificar residuos como **Orgánico** o **Inorgánico** con un alto nivel de precisión, ayudando a promover la gestión adecuada de los desechos.  

---

### ✨ **Características Principales**  
1. 📸 **Clasificación de imágenes**:  
   - Toma o selecciona fotos desde la galería.  
   - Las imágenes son enviadas a la API, procesadas y clasificadas como **"Orgánico"** o **"Inorgánico"**, con un porcentaje de confianza.  

2. 💬 **Chat interactivo**:  
   - Las imágenes enviadas y las respuestas de la API se presentan en formato de chat.  
   - **MyMessageBubble**: Muestra la imagen enviada con la fecha y hora.  
   - **HerMessageBubble**: Muestra la clasificación del residuo (con confianza porcentual).  

3. 📂 **Almacenamiento local**:  
   - Las últimas **10 imágenes enviadas** se almacenan localmente usando **SharedPreferences** y se cargan automáticamente al iniciar la app.  

4. 🚨 **Manejo de errores**:  
   - Si no hay respuesta de la API, se muestra un mensaje amigable:  
     **"Ups, no tengo forma de responder en este momento :("**.  

5. 🎨 **Diseño personalizado**:  
   - Íconos personalizados generados con **`flutter_launcher_icons`**.  
   - Bordes redondeados en imágenes para un diseño limpio y moderno.  

---

### 🚀 **¿Cómo funciona?**  
1. El usuario toma o selecciona una imagen.  
2. La app convierte la imagen a **Base64** y la envía a la API para clasificación.  
3. La respuesta se muestra en el chat:  
   - **Texto**: "La imagen muestra residuos de tipo: Orgánico/Inorgánico, con una confianza del XX.XX%".  
   - **Imagen**: Separada del texto y con bordes redondeados.  
4. Si ocurre un error, se muestra un mensaje indicando que no se pudo obtener una respuesta.  

---

### 🛠️ **Tecnologías y Herramientas Utilizadas**  
- 🔷 **Flutter**: Framework principal para desarrollo multiplataforma.  
- 💻 **Dart**: Lenguaje de programación.  
- 🌐 **Dio**: Cliente HTTP para manejar solicitudes a la API.  
- 📦 **SharedPreferences**: Para almacenar imágenes localmente.  
- 🧠 **Modelo Google ViT**: Modelo de clasificación de imágenes basado en Vision Transformer.  

---

### 📲 **Instalación**  
1. Clona el repositorio:  
   ```bash
   git clone <URL_DEL_REPOSITORIO>
   ```  

2. Instala las dependencias:  
   ```bash
   flutter pub get
   ```  

3. Ejecuta la aplicación:  
   ```bash
   flutter run
   ```  

---

### 👨‍💻 **Créditos**  
- **Modelo:** `Giecom/google-vit-base-patch16-224-Waste-O-I-classification`.  
- **Desarrollador:** **Miguel Calderón**.  

🌟 ¡Gracias por visitar la app Waste Classification! 🌟  
Contribuye al cuidado del 🌍 con cada clasificación. 🗑️♻️  
