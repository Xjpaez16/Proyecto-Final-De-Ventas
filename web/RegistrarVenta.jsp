<%@ include file="commons/header.jspf"%>
<%
    HttpSession misesion = request.getSession();
    if(misesion.getAttribute("usuario")==null){
        response.sendRedirect("index.jsp");
    }else{
     
    %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="stylesheet" href="css/estilospr.css">
        
        <title>Empleado</title>
</head>
<body class="vender">
    <nav class="navi">
             <div class="navidiv">
                 <a href="Principal.jsp">
                         
                             <img src="img/logo.png" alt="Logo" class="logo"/>
                            <h1>PERICONECT</h1>
                    </a>
             </div>                              
             <ul>
                 <li class="right"><form method="POST" action="Validar"><button class="Btn" type="submit" name="accion" value="salir" > <div class="sign"><svg viewBox="0 0 512 512"><path d="M377.9 105.9L500.7 228.7c7.2 7.2 11.3 17.1 11.3 27.3s-4.1 20.1-11.3 27.3L377.9 406.1c-6.4 6.4-15 9.9-24 9.9c-18.7 0-33.9-15.2-33.9-33.9l0-62.1-128 0c-17.7 0-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32l128 0 0-62.1c0-18.7 15.2-33.9 33.9-33.9c9 0 17.6 3.6 24 9.9zM160 96L96 96c-17.7 0-32 14.3-32 32l0 256c0 17.7 14.3 32 32 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-64 0c-53 0-96-43-96-96L0 128C0 75 43 32 96 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32z"></path></svg></div>

                             <div class="text">Salir</div></button></form></li>
             </ul>
        </nav>
<div class="container mt-4">
    <div class="row">
        <div class="col-lg-5 parte01">
            <div class="card">
                <form action="Controlador?menu=NuevaVenta" method="POST">
                    <div class="card-body">
                        <!--DATOS DEL PRODUCTO-->
                        <div class="form-group">
                            <label>Datos del Cliente</label>
                        </div>
                        <div class="form-group d-flex">
                            <div class="col-sm-6 d-flex">
                                <input type="text" name="codigocliente" value="${c.getDni()}" class="form-control" placeholder="DNI" >
                                <button type="submit" name="accion" value="BuscarCliente" class="btn btn-dark">Buscar</button>
                            </div>                           
                            <div class="col-sm-6">
                                <input type="text" name="nombrescliente" value="${c.getNom()}" placeholder="Datos Cliente" class="form-control" >
                            </div>                           
                        </div>
                        <!--DATOS DEL PRODUCTO-->
                        <div class="form-group">
                            <label>Datos Producto</label>
                        </div>
                        <div class="form-group d-flex">
                            <div class="col-sm-6 d-flex">
                                <input type="text" name="codigoproducto" value="${producto.getId()}" class="form-control" placeholder="Codigo" >
                                <button type="submit" name="accion" value="BuscarProducto" class="btn btn-dark">Buscar</button>
                            </div>                           
                            <div class="col-sm-6">
                                <input type="text" name="nomproducto" value="${producto.getNom()}" placeholder="Datos Producto" class="form-control">
                            </div>  
                        </div>
                        <div class="form-group d-flex">
                            <div class="col-sm-6 d-flex">
                                <input type="text" name="precio" value="${producto.getPre()}" class="form-control" placeholder="S/.0.00">                                
                            </div>                           
                            <div class="col-sm-3">
                                <input type="number" value="1" name="cant" placeholder="" class="form-control">
                            </div>  
                            <div class="col-sm-3">
                                <input type="text" name="stock" value="${producto.getStock()}" placeholder="Stock" class="form-control">
                            </div>  
                        </div>
                        <!--BOTON AGREGAR PRODUCTO AL REGISTRO-->
                        <div class="form-group">
                            <div class="col-sm">
                                <button type="submit" name="accion" value="Agregar" class="btn btn-primary">Agregar Producto</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-sm-7">
            <div class="card parte02">                    
                <div class="card-body">
                    <div class="d-flex ml-auto col-sm-6">
                        <label class="text-right mt-2 col-sm-6">NRO. SERIE</label>
                        <input readonly="" type="text" name="numeroserie" class="form-control text-center" value="${nserie}" style="font-weight: bold;font-size: 18px">
                    </div>                      
                    <br>
                    <table class="table table-hover">
                        <thead>
                            <tr class="text-center">
                                <th>N�</th>
                                <th>ID</th>
                                <th>PRODUCTO</th>
                                <th>PRECIO</th>
                                <th>CANTIDAD</th>
                                <th>SUBTOTAL</th>                                    
                                <th class="accion">ACCION</th>                                    
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="list" items="${lista}">
                                <tr class="text-center">
                                    <td>${list.getItem()}</td>
                                    <td>${list.getIdproducto()}</td>
                                    <td>${list.getDescripcionP()}</td>
                                    <td>${list.getPrecio()}</td>
                                    <td>         
                                        <input type="hidden" id="item1" value="${list.getIdproducto()}">
                                        <input type="number" min="1" max="10" id="Cant" class=" form-control text-center" value="${list.getCantidad()}">
                                    </td>
                                    <td>${list.getSubtotal()}</td>
                                    <td class="text-center">
                                        <input type="hidden" id="item2" value="${list.getIdproducto()}">
                                        <a id="deleteItem" class="btn btn-outline-danger btn-sm"><i class="bi bi-trash"></i></a>                                        
                                    </td>
                                </tr>
                            </c:forEach>

                        </tbody>
                    </table>
                </div>
                <div class="card-footer" >
                    <div class="row">
                        <div class="col-sm-6">
                            <a href="Controlador?menu=NuevaVenta&accion=GenerarVenta" onclick="print()" class="btn btn-success">Generar Venta</a>
                            <input type="submit" name="accion" value="Cancelar" class="btn btn-danger">
                        </div>
                        <div class="col-sm-6 ml-auto d-flex">                                
                            <label class=" col-sm-6 text-right mt-2">Total a Pagar</label>                                                       
                            <input type="text" name="txtTotal" value="S/.${totalpagar}0" class="form-control text-center font-weight-bold" style="font-size: 18px;">
                        </div>
                    </div>                        
                </div>
            </div>

        </div>
    </div>
</div>
</body>
<% } %>
<%@ include file="commons/footer.jspf"%>
