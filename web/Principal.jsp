<%-- 
    Document   : Principal
    Created on : 29/01/2025, 8:59:40 p. m.
    Author     : Angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession misesion = request.getSession();
    if(misesion.getAttribute("usuario")==null){
        response.sendRedirect("index.jsp");
    }else{
     
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/estilospr.css">
        <title>Principal</title>
    </head>
    <body>
         <nav class="navi">
             <a href="Principal.jsp" class="logobtn"> 
                 <img src="img/logo.png" alt="Logo" class="logo"/>
                 <svg  class="svg">
                 <h1>PERICONECT</h1>
                 </svg>
             </a>
             <ul>
                 <li class="right"><form method="POST" action="Validar"><button class="Btn" type="submit" name="accion" value="salir" > <div class="sign"><svg viewBox="0 0 512 512"><path d="M377.9 105.9L500.7 228.7c7.2 7.2 11.3 17.1 11.3 27.3s-4.1 20.1-11.3 27.3L377.9 406.1c-6.4 6.4-15 9.9-24 9.9c-18.7 0-33.9-15.2-33.9-33.9l0-62.1-128 0c-17.7 0-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32l128 0 0-62.1c0-18.7 15.2-33.9 33.9-33.9c9 0 17.6 3.6 24 9.9zM160 96L96 96c-17.7 0-32 14.3-32 32l0 256c0 17.7 14.3 32 32 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-64 0c-53 0-96-43-96-96L0 128C0 75 43 32 96 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32z"></path></svg></div>

                             <div class="text">Salir</div></button></form></li>
             </ul>
        </nav>
        <script>
            window.onload = function() {
                document.getElementById("formEmpleado").submit();
            };
        </script>
        <div class="formventa">
            <form action="Controlador?menu=NuevaVenta" method="POST">    

                        <div class="ventan">
                            <button type="submit" name="accion" value="ventanueva" class="btnventa">
                                <img src="img/carrito.png" alt=""/>
                            </button>

                        </div>    


            </form>

            <form action="Controlador?menu=Empleado&accion=Listar" method="POST">    
                    <div class="formventa">
                        <div class="ventan">

                            <button type="submit" name="accion" value="Listar" class="btnventa">
                                <img src="img/user.webp" alt=""/>
                            </button>

                        </div>    
                    </div>


            </form>

            <form action="Controlador?menu=Cliente&accion=Listar" method="POST">    
                    <div class="formventa">
                        <div class="ventan">
                            <button type="submit" name="accion" value="Listar" class="btnventa">
                                <img src="img/clientes.png" alt=""/>
                            </button>
                        </div>    
                    </div>


            </form>
            
            <form action="Controlador?menu=Producto&accion=Listar" method="POST">    
                    <div class="formventa">
                        <div class="ventan">
                            <button type="submit" name="accion" value="Listar" class="btnventa">
                                <img src="img/productos.png" alt=""/>
                            </button>
                        </div>    
                    </div>


            </form>
        </div>

        <div class="textotbtn">
                    <h2>Nueva<br>Venta</h2>
                    <h2>Empleados</h2>
                    <h2>Clientes</h2>
                    <h2>Productos</h2>
        </div>
 
    </body>
    
</html>
<% } %>





