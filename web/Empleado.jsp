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
                 <li class="right"><form method="POST" action="Validar"><button type="submit" name="accion" value="salir" >Salir</button></form></li>
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
                             <a class="btn btn-outline-warning btn-sm" href="Controlador?menu=Empleado&accion=Editar&id=${em.getId()}"><i class="bi bi-pencil-square"></i></a>                                        
                             <a class="btn btn-outline-danger btn-sm" href="Controlador?menu=Empleado&accion=Delete&id=${em.getId()}"><i class="bi bi-trash"></i></a>
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

