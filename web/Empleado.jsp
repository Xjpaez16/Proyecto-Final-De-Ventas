<%@ include file="commons/header.jspf"%>
<%
    HttpSession misesion = request.getSession();
    if (misesion.getAttribute("usuario") == null) {
        response.sendRedirect("index.jsp");
    } else {

%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/estilospr.css">
        <title>Empleado</title>
</head>
<body class="empleado">
        <nav class="navi">
             <a href="Principal.jsp"><img src="img/logo.png" alt="Logo"/></a>
             <ul>
                 <li class="right"><form method="POST" action="Validar"><button class="Btn" type="submit" name="accion" value="salir" > <div class="sign"><svg viewBox="0 0 512 512"><path d="M377.9 105.9L500.7 228.7c7.2 7.2 11.3 17.1 11.3 27.3s-4.1 20.1-11.3 27.3L377.9 406.1c-6.4 6.4-15 9.9-24 9.9c-18.7 0-33.9-15.2-33.9-33.9l0-62.1-128 0c-17.7 0-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32l128 0 0-62.1c0-18.7 15.2-33.9 33.9-33.9c9 0 17.6 3.6 24 9.9zM160 96L96 96c-17.7 0-32 14.3-32 32l0 256c0 17.7 14.3 32 32 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-64 0c-53 0-96-43-96-96L0 128C0 75 43 32 96 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32z"></path></svg></div>

                             <div class="text">Salir</div></button></form></li>
             </ul>
        </nav>
    <div class="empleadodiv">
        <div class="formempleado">
            <!-- Formulario -->
        <form action="Controlador?menu=Empleado" method="POST" class="">
            <label>Dni</label>
            <input type="text" value="${empleado.getDni()}" name="txtDni" class="form-control" required>

            <label>Nombres</label>
            <input type="text" value="${empleado.getNom()}" name="txtNombres" class="form-control" required>

            <label>Telefono</label>
            <input type="text" value="${empleado.getTel()}" name="txtTel" class="form-control" required>

            <label>Estado</label>
            <select class="form-control" name="txtEstado">
                <option value="1">ACTIVO</option>
                <option value="0">INACTIVO</option>
            </select>

            <label>Correo</label>
            <input type="email" value="${empleado.getCorreo()}" name="txtCorreo" class="form-control" required>

            <label>Usuario</label>
            <input type="text" value="${empleado.getUser()}" name="txtUser" class="form-control" required>

            <label>Contraseña</label>
            <input type="password" value="${empleado.getPassword()}" name="txtPassword" class="form-control" required>
            <div class="botonesemp">
                <input type="submit" name="accion" value="Agregar" class="btn btn-primary">
                <input type="submit" name="accion" value="Actualizar" class="btn btn-success">
            </div>
            
        </form>
        </div>
        
            

        <!-- Tabla de empleados -->
        <div class="tablita">
            <table class="table-hover" style="width: 100%" id="example">
             <thead>
                 <tr class="trtablita">
                     <th>#</th>
                     <th>NOMBRES</th>
                     <th>DNI</th>
                     <th>TELEFONO</th>
                     <th>ESTADO</th>
                     <th>CORREO</th>
                     <th>USER</th>
                     <th>ACCION</th>
                 </tr>
             </thead>
             <tbody> 
                 <c:forEach var="em" items="${empleados}" varStatus="n">
                     <tr>
                         <td>${n.index+1}</td>                                  
                         <td>${em.getNom()}</td>
                         <td>${em.getDni()}</td>
                         <td>${em.getTel()}</td>
                         <c:if test="${em.getEstado()=='1'}">
                             <td>ACTIVO</td>
                         </c:if>
                         <c:if test="${em.getEstado()=='0'}">
                             <td>INACTIVO</td>
                         </c:if>                                  
                         <td>${em.getCorreo()}</td>
                         <td>${em.getUser()}</td>
                         <td>
                             <a class="Btnedit" href="Controlador?menu=Empleado&accion=Editar&id=${em.getId()}">Editar
                                 <svg viewBox="0 0 512 512" class="svg">
                                 <path
                                     d="M410.3 231l11.3-11.3-33.9-33.9-62.1-62.1L291.7 89.8l-11.3 11.3-22.6 22.6L58.6 322.9c-10.4 10.4-18 23.3-22.2 37.4L1 480.7c-2.5 8.4-.2 17.5 6.1 23.7s15.3 8.5 23.7 6.1l120.3-35.4c14.1-4.2 27-11.8 37.4-22.2L387.7 253.7 410.3 231zM160 399.4l-9.1 22.7c-4 3.1-8.5 5.4-13.3 6.9L59.4 452l23-78.1c1.4-4.9 3.8-9.4 6.9-13.3l22.7-9.1v32c0 8.8 7.2 16 16 16h32zM362.7 18.7L348.3 33.2 325.7 55.8 314.3 67.1l33.9 33.9 62.1 62.1 33.9 33.9 11.3-11.3 22.6-22.6 14.5-14.5c25-25 25-65.5 0-90.5L453.3 18.7c-25-25-65.5-25-90.5 0zm-47.4 168l-144 144c-6.2 6.2-16.4 6.2-22.6 0s-6.2-16.4 0-22.6l144-144c6.2-6.2 16.4-6.2 22.6 0s6.2 16.4 0 22.6z"
                                     ></path>
                                 </svg></a>                                        
                             <a class="button" type="button" href="Controlador?menu=Empleado&accion=Delete&id=${em.getId()}"><span class="button__text">Delete</span>
                                 <span class="button__icon"><svg class="svg" height="512" viewBox="0 0 512 512" width="512" xmlns="http://www.w3.org/2000/svg"><title></title><path d="M112,112l20,320c.95,18.49,14.4,32,32,32H348c17.67,0,30.87-13.51,32-32l20-320" style="fill:none;stroke:#fff;stroke-linecap:round;stroke-linejoin:round;stroke-width:32px"></path><line style="stroke:#fff;stroke-linecap:round;stroke-miterlimit:10;stroke-width:32px" x1="80" x2="432" y1="112" y2="112"></line><path d="M192,112V72h0a23.93,23.93,0,0,1,24-24h80a23.93,23.93,0,0,1,24,24h0v40" style="fill:none;stroke:#fff;stroke-linecap:round;stroke-linejoin:round;stroke-width:32px"></path><line style="fill:none;stroke:#fff;stroke-linecap:round;stroke-linejoin:round;stroke-width:32px" x1="256" x2="256" y1="176" y2="400"></line><line style="fill:none;stroke:#fff;stroke-linecap:round;stroke-linejoin:round;stroke-width:32px" x1="184" x2="192" y1="176" y2="400"></line><line style="fill:none;stroke:#fff;stroke-linecap:round;stroke-linejoin:round;stroke-width:32px" x1="328" x2="320" y1="176" y2="400"></line></svg></span></a>
                         </td>
                     </tr>
                 </c:forEach>
             </tbody>
         </table> 
        </div>
    </div>
        
        
   
</body>
<% } %>
<%@ include file="commons/footer.jspf"%>

