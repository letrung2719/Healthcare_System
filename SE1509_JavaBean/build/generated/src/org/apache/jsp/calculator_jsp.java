package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class calculator_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Calculator Form</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Calculator Form</h1>\n");
      out.write("        ");
      model.Calculator c = null;
      synchronized (_jspx_page_context) {
        c = (model.Calculator) _jspx_page_context.getAttribute("c", PageContext.PAGE_SCOPE);
        if (c == null){
          c = new model.Calculator();
          _jspx_page_context.setAttribute("c", c, PageContext.PAGE_SCOPE);
        }
      }
      out.write("\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.introspect(_jspx_page_context.findAttribute("c"), request);
      out.write("\n");
      out.write("\n");
      out.write("        <form action=\"calculator.jsp\">\n");
      out.write("            <label>Enter number 1:</label>\n");
      out.write("            <input type=\"text\" name=\"num1\" value=\"\n");
      out.write("                   ");
      out.write(org.apache.jasper.runtime.JspRuntimeLibrary.toString((((model.Calculator)_jspx_page_context.findAttribute("c")).getNum1())));
      out.write("\"/><br>\n");
      out.write("            <label>Enter number 2:</label>\n");
      out.write("            <input type=\"text\" name=\"num2\" value=\"\n");
      out.write("                   ");
      out.write(org.apache.jasper.runtime.JspRuntimeLibrary.toString((((model.Calculator)_jspx_page_context.findAttribute("c")).getNum2())));
      out.write("\"/><br>\n");
      out.write("            <label>Select operator</label>\n");
      out.write("            <select name=\"op\" onchange=\"this.form.submit()\">\n");
      out.write("                <option value=\"0\">Select</option>\n");
      out.write("                <option value=\"+\">+</option>\n");
      out.write("                <option value=\"-\">-</option>\n");
      out.write("                <option value=\"x\">x</option>\n");
      out.write("                <option value=\"/\">/</option>\n");
      out.write("            </select>\n");
      out.write("        </form>\n");
      out.write("        <h2>");
      out.write(org.apache.jasper.runtime.JspRuntimeLibrary.toString((((model.Calculator)_jspx_page_context.findAttribute("c")).getResult())));
      out.write("</h2>\n");
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
