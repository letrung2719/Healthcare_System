package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.List;
import model.Employee;

public final class list_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>List of Employee</h1>\n");
      out.write("        <h2><a href=\"addnew.jsp\">Add new</a></h2>\n");
      out.write("        <table border=\"1px\">\n");
      out.write("            <tr>\n");
      out.write("                <th>ID</th>\n");
      out.write("                <th>Fullname</th>\n");
      out.write("                <th>Gender</th>\n");
      out.write("                <th>DOB</th>\n");
      out.write("                <th>Salary</th>\n");
      out.write("                <th>Action</th>\n");
      out.write("            <tr/>\n");
      out.write("            ");

                List<Employee> list = (List<Employee>) request.getAttribute("data");
                for (Employee i : list) {
            
      out.write("\n");
      out.write("            <tr>\n");
      out.write("                <td>");
      out.print(i.getId());
      out.write("</td>\n");
      out.write("                <td>");
      out.print(i.getName());
      out.write("</td>\n");
      out.write("                ");

                    if (i.getGender()) {
                
      out.write("\n");
      out.write("                <td><img src=\"images/male-icon.png\"></td>\n");
      out.write("                    ");

                    } else {
                    
      out.write("\n");
      out.write("                <td><img src=\"images/female-icon.png\"></td>\n");
      out.write("                    ");

                        }
                    
      out.write("\n");
      out.write("                <td>");
      out.print(i.getDob());
      out.write("</td>\n");
      out.write("                <td>");
      out.print(i.getSalary());
      out.write("</td>\n");
      out.write("                <td>\n");
      out.write("                    <a href=\"\">Edit</a>&nbsp;&nbsp;&nbsp;\n");
      out.write("                    <a href=\"\">Delete</a>\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("            ");

                }
            
      out.write("\n");
      out.write("        </table>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
