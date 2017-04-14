# DevOpsCloud

## Instalación

- Visual Studio 2015
- SDK Visual Studio 2015 Azure. https://go.microsoft.com/fwlink/?LinkId=518003&clcid=0x409
- Cuenta Visual Studio Team Services 

_________________________________________________________________________________________________________________________________

## Tabla de Contenido

- [Crear cuenta VSTS](#1-Crear-cuenta-VSTS).
- Creación Proyecto Visual Studio Team Services 
- Creación repositorio VSTS
- Publicación Web App (Azure)
  - Creación Web App Azure
- Crear Build VSTS
- Crear Release VSTS
- EndPoints VSTS
- Application Insigths 

_________________________________________________________________________________________________________________________________

## 1 Crear cuenta VSTS ##

  Ingresar a https://www.visualstudio.com/. Se puede crear una cuenta personal o crear un proyecto nuevo con la cuenta corporativa.

![GitHub Logo](/img/img001.PNG)


Seleccionar la opción Crear Cuenta Nueva 

![GitHub Logo](/img/img002.png)

Crear repositorio por defecto 

![GitHub Logo](/img/img003.png)

Una vez se selecciona la opción continuar se crea la cuenta del proyecto con el reopsitorio por defecto.

![GitHub Logo](/img/img004.png)

_________________________________________________________________________________________________________________________________

Crear Aplicación 

- Seleccionar nuevo proyecto Web Application

![GitHub Logo](/img/img007.PNG)

Al seleccionar la opción Host in the Cloud, el despliegue se realiza automáticamente en azure, con application Insights 

![GitHub Logo](/img/img008.PNG)

Configurar las credenciales de la cuenta de Azure. Crear grupo de recursos y service plan free donde será alojado el Web App 

![GitHub Logo](/img/img008.PNG)

Desplegar y probar el Web App localmente

![GitHub Logo](/img/img011.PNG)

## Crear Repositorio Visual Studio Team Services ##

Visual Studio Team Services ofrece repositoriosde forma ilimitada. Para crearlos se selecciona la opción Code -> Repositories --> New Repository

![GitHub Logo](/img/img012.PNG)

### Configurar CI y Release con Web App Azure ###

- Subir cambios de aplicación

Para subir los cambios se obtiene el origen del repositorio en VSO, seleccionando la opción clone en la configuración del repo.

![GitHub Logo](/img/img013.PNG)

<pre><code>git remote add origin https://devopsjohannab.visualstudio.com/MyFirstProject/_git/AppJohannaPersonal</code></pre>
<pre><code>git add .</code></pre>
<pre><code>git commit -m 'Johanna Init'</code></pre>
<pre><code>git push -u origin master</code></pre>

Verificar el código en VSTS 

![GitHub Logo](/img/img014.PNG)


### Configurar Integración y Despliegue Continuo Web App ###

##Crear Build 

1. Seleccionar un template de VSO Básico 

![GitHub Logo](/img/img015.PNG)

![GitHub Logo](/img/img0151.PNG)

- Seleccionar en la pestaña de Triguers la opción Continuous Integration, para realizar el build cada vez que se haga push en el repositorio.
- En la pestaña de opciones seleccionar Default agent queue --> Hosted.
- Adicionar la línea siguiente línea en Msbuild Arguments para que el distribuible quede almaecnado en la carpeta work del sitio.

<pre><code>/p:DeployOnBuild=true /p:WebPublishMethod=Package /p:PackageAsSingleFile=true /p:SkipInvalidConfigurations=true /p:PackageLocation="$(build.stagingDirectory)"</code></pre>







