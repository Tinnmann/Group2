package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;;
import javax.sql.*;;
import login.java.LoginDB;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
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

    String email = request.getParameter("email");
    session.putValue("email", email);
    String password = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/capewatchdb","root","sqlPass");
    Statement st = conn.createStatement();
    
ResultSet rs = st.executeQuery("SELECT * FROM police_user WHERE email='"+email+"'");

if(rs.next()){
    if(rs.getString(7).equals(password)){
        out.println("Welcome" + email);
    }
    else{
        out.println("Invalid password");
    }
}

      out.write("\n");
      out.write("    \n");
      out.write("    \n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("  <head>\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("    <title>Cape Watch</title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\" integrity=\"sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u\" crossorigin=\"anonymous\">\n");
      out.write("    <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\" integrity=\"sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa\" crossorigin=\"anonymous\"></script>\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/style.css\">\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css?family=Open+Sans\" rel=\"stylesheet\">\n");
      out.write("  </head>\n");
      out.write("  <body class=\"image-background\">\n");
      out.write("    <nav class=\"navbar navbar-default navbar-inverse\">\n");
      out.write("      <div class=\"container-fluid\"></div>\n");
      out.write("      <div class=\"navbar-header\">\n");
      out.write("        <button class=\"navbar-toggle collapsed\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbar-links\" aria-expanded=\"false\"><span class=\"sr-only\">Toggle navigation</span><span class=\"icon-bar\"></span><span class=\"icon-bar\"></span><span class=\"icon-bar\"></span></button><a class=\"navbar-brand\" href=\"index.html\"><img src=\"images/sheriff.svg\" alt=\"Police logo\" id=\"badge\"></a>\n");
      out.write("      </div>\n");
      out.write("      <div class=\"collapse navbar-collapse\" id=\"navbar-links\">\n");
      out.write("        <ul class=\"nav navbar-nav navbar-right\"></ul>\n");
      out.write("        <ul class=\"nav navbar-nav navbar-right\">\n");
      out.write("          <li><a href=\"index.html\">Home</a></li>\n");
      out.write("          <li class=\"active\"><a href=\"login.html\">Login</a></li>\n");
      out.write("          <li><a href=\"profile.html\">Profile</a></li>\n");
      out.write("          <li><a href=\"reports.html\">Reports</a></li>\n");
      out.write("          <li><a href=\"stats.html\">Statistics</a></li>\n");
      out.write("          <li><a href=\"../NewCapewatch/web/hotspots.html\">Hotspots</a></li>\n");
      out.write("          <li><a href=\"../NewCapewatch/web/contact.jsp\">Contact Us</a></li>\n");
      out.write("        </ul>\n");
      out.write("      </div>\n");
      out.write("    </nav>\n");
      out.write("    <div class=\"container\">\n");
      out.write("      <div class=\"login-div\">                   \n");
      out.write("        <div class=\"text-center\">\n");
      out.write("          <h4>Login</h4>\n");
      out.write("          <div class=\"login-form-1\">\n");
      out.write("            <form class=\"text-left\" id=\"login-form\">\n");
      out.write("              <div class=\"login-form-main-message\"></div>\n");
      out.write("              <div class=\"main-login-form\">\n");
      out.write("                <div class=\"login-group\">\n");
      out.write("                  <div class=\"form-group\">\n");
      out.write("                    <input class=\"form-control\" type=\"email\" placeholder=\"Email\" name=\"email\" id=\"lg_email\">\n");
      out.write("                  </div>\n");
      out.write("                  <div class=\"form-group\">\n");
      out.write("                    <input class=\"form-control\" type=\"password\" placeholder=\"Password\" name=\"password\" id=\"lg_password\">\n");
      out.write("                  </div>\n");
      out.write("                </div>\n");
      out.write("                <button class=\"login-button\" type=\"submit\" name=\"submit\"><i class=\"glyphicon glyphicon-chevron-right\"></i></button>\n");
      out.write("                <p class=\"marginTops text-center\" id=\"whiteText\">New user?    <a href=\"register.html\">Create account</a></p>\n");
      out.write("                <div class=\"text-center\" id=\"whiteText\"><a href=\"#\">Forgot password?</a></div>\n");
      out.write("              </div>\n");
      out.write("            </form>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("  </body>\n");
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
