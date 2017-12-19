/*
 * Classe Servlet CourseWebBaseController
 */
package courseweb.controller;

import courseweb.data.impl.CourseWebDataLayerMySqlImpl;
import courseweb.data.model.CourseWebDataLayer;
import framework.data.DataLayerException;
import framework.result.FailureResult;

import java.io.IOException;

import java.util.logging.Level;
import java.util.logging.Logger;

import javax.annotation.Resource;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.sql.DataSource;
import java.sql.SQLException;
import javax.naming.NamingException;

/**
 *
 * @author valen
 */
public abstract class CourseWebBaseController extends HttpServlet {

    @Resource(name = "java:comp/env/jdbc/courseweb")
    private DataSource ds;
    
    protected abstract void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException;
    
    private void processBaseRequest(HttpServletRequest request, HttpServletResponse response) {
        try(CourseWebDataLayer datalayer = new CourseWebDataLayerMySqlImpl(ds)) {
            
            datalayer.init();
            request.setAttribute("datalayer", datalayer);
            processRequest(request, response);
            
        } catch(Exception ex) {
            ex.printStackTrace();
            (new FailureResult(getServletContext())).activate((ex.getMessage() != null || ex.getCause() == null) ? ex.getMessage() : ex.getCause().getMessage(), request, response);
        }
       
    }
        
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {   
        processBaseRequest(request, response);         
    }
        
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {       
        processBaseRequest(request, response);         
    }
    
}
