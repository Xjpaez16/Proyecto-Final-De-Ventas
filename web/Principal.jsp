<%-- 
    Document   : Principal
    Created on : 29/01/2025, 8:59:40 p. m.
    Author     : Angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
             <ul>
                 <li><a href="#">Inicio</a></li>
                 <li><a href="#">Salir</a></li>
             </ul>
        </nav>
            <div>
                    <form action="Controlador?menu=NuevaVenta" method="POST">    
                        <div>
                            <div class="col-12">
                                <button type="submit" name="accion" value="ventanueva" class="btn btn-lg badge badge-light">
                                    <img src="img/cart.png" alt=""/>
                                </button>
                            </div>
                            <div class="col-12">
                                <label><h6>VENTA NUEVA</h6></label>  
                            </div> 
                        </div>
                    </form>
        </div>
    </body>
    
</html>





