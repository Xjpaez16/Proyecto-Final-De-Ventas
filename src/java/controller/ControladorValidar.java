package controller;

import Modelo.Empleado;
import Modelo.EmpleadoDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet(name = "Validar", urlPatterns = {"/Validar"})
public class ControladorValidar extends HttpServlet {

    EmpleadoDAO edao = new EmpleadoDAO();
    Empleado em = new Empleado();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        HttpSession session=request.getSession();
        if(accion!=null){
            if (accion.equalsIgnoreCase("Ingresar")) {
                String user = request.getParameter("txtuser");
                String pass = request.getParameter("txtpass");
                em = edao.validar(user, pass);
                if (em.getUser() != null) {

                    session.setAttribute("usuario", em);
                    request.getRequestDispatcher("Controlador?menu=Principal").forward(request, response);


                } else {
                    session.invalidate();
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
            } else if(accion.equalsIgnoreCase("salir")) {

                session.invalidate();
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        }else{
                request.getRequestDispatcher("Controlador?menu=Principal").forward(request, response);
        }    

        
    }
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}