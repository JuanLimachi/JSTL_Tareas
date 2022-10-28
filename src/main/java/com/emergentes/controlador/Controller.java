package com.emergentes.controlador;

import com.emergentes.modelo.GestorTareas;
import com.emergentes.modelo.Tarea;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Controller", urlPatterns = {"/Controller"})
public class Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Tarea objTarea = new Tarea();
        int id, pos;
        
        String opcion = request.getParameter("op");
        String op = (opcion != null) ? request.getParameter("op") : "view";
        
        if(op.equals("nuevo")){
            HttpSession ses = request.getSession();
            GestorTareas agenda = (GestorTareas) ses.getAttribute("agenda");
            objTarea.setId(agenda.ObtenerId());
            request.setAttribute("op", op);
            request.setAttribute("miTarea", objTarea);
            request.getRequestDispatcher("editar.jsp").forward(request, response);
        }
        
        if(op.equals("modificar")){
            HttpSession ses = request.getSession();
            GestorTareas agenda = (GestorTareas) ses.getAttribute("agenda");
            
            id = Integer.parseInt(request.getParameter("id"));
            pos = agenda.UbicarTarea(id);
            objTarea = agenda.getLista().get(pos);
            
            request.setAttribute("op", op);
            request.setAttribute("miTarea", objTarea);
            request.getRequestDispatcher("editar.jsp").forward(request, response);
        }
        
        if(op.equals("eliminar")){
            HttpSession ses = request.getSession();
            GestorTareas agenda = (GestorTareas) ses.getAttribute("agenda");
            
            id = Integer.parseInt(request.getParameter("id"));
            pos = agenda.UbicarTarea(id);
            
            agenda.EliminarTarea(pos);
            ses.setAttribute("agenda", agenda);
            response.sendRedirect("index.jsp");
        }
        
        if(op.equals("view")){
            response.sendRedirect("index.jsp");
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Tarea objTarea = new Tarea();
        int pos;
        String op = request.getParameter("op");
        
        if(op.equals("grabar")){
            //  Recuperar valores del formulario
            //  Verificar si es nuevo o es una modificacion
            objTarea.setId(Integer.parseInt(request.getParameter("id")));
            objTarea.setTarea(request.getParameter("tarea"));
            objTarea.setPrioridad(request.getParameter("prioridad"));
            
            HttpSession ses = request.getSession();
            GestorTareas agenda = (GestorTareas) ses.getAttribute("agenda");
            
            String opg = request.getParameter("opg");
            if(opg.equals("nuevo")){
                agenda.InsertarTarea(objTarea);
            } else {
                pos = agenda.UbicarTarea(objTarea.getId());
                agenda.ModificarTarea(pos, objTarea);
            }
            ses.setAttribute("agenda", agenda);
            response.sendRedirect("index.jsp");
        }
    }
}
