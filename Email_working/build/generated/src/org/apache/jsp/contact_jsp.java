package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import mail.java.ContactUs;
import javax.mail.MessagingException;;

public final class contact_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    String serverMessage = null;
    String status = null;
    String name =  request.getParameter("name");
    String email = request.getParameter("email");
    String message = request.getParameter("message");
    
    if (request.getParameter("submit") != null){
        ContactUs contactUs = new ContactUs();
        contactUs.setMailServerProperties();

        String emailSubject = "New Message From Cape Watch System";
        String emailBody = "Sender Name: " + name + "\n\nSender Email Address: " + email + "\n\nMessage: \n" + message;

        /*if (request.getParameter("name") != null){
            emailBody = "Sender Name: " + name;
        } 
        if (request.getParameter("email") != null){
            emailBody = "\nSender Email: " + email;
        }
        if (request.getParameter("message") != null){
            emailBody = "\nMessage: \n" + message;
        }*/

        contactUs.createEmailMessage(emailSubject, emailBody);
            try {
                contactUs.sendEmail();
        } catch (MessagingException me) {
                serverMessage = "Error in Sending Email!" + me.toString();
        }
}


      out.write("\n");
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
      out.write("    <link href=\"https://fonts.googleapis.com/css?family=Orbitron\" rel=\"stylesheet\">\n");
      out.write("  </head>\n");
      out.write("  <body class=\"world_background\">\n");
      out.write("    <nav class=\"navbar navbar-default navbar-inverse\">\n");
      out.write("      <div class=\"container-fluid\"></div>\n");
      out.write("      <div class=\"navbar-header\">\n");
      out.write("        <button class=\"navbar-toggle collapsed\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbar-links\" aria-expanded=\"false\"><span class=\"sr-only\">Toggle navigation</span><span class=\"icon-bar\"></span><span class=\"icon-bar\"></span><span class=\"icon-bar\"></span></button><a class=\"navbar-brand\" href=\"index.html\"><img src=\"images/sheriff.svg\" alt=\"Police logo\" id=\"badge\"></a>\n");
      out.write("      </div>\n");
      out.write("      <div class=\"collapse navbar-collapse\" id=\"navbar-links\">\n");
      out.write("        <ul class=\"nav navbar-nav navbar-right\"></ul>\n");
      out.write("        <ul class=\"nav navbar-nav navbar-right\">\n");
      out.write("          <li><a href=\"index.html\">Home</a></li>\n");
      out.write("          <li><a href=\"login.html\">Login</a></li>\n");
      out.write("          <li><a href=\"profile.html\">Profile</a></li>\n");
      out.write("          <li><a href=\"reports.html\">Reports</a></li>\n");
      out.write("          <li><a href=\"stats.html\">Statistics</a></li>\n");
      out.write("          <li><a href=\"hotspots.html\">Hotspots</a></li>\n");
      out.write("          <li class=\"active\"><a href=\"contact.html\">Contact Us</a></li>\n");
      out.write("        </ul>\n");
      out.write("      </div>\n");
      out.write("    </nav>\n");
      out.write("    <section id=\"contact\">     \n");
      out.write("      <div class=\"container\">\n");
      out.write("        <div class=\"row\">   \n");
      out.write("          <div class=\"about_us\"> \n");
      out.write("            <h1>Contact Us</h1>\n");
      out.write("            <div class=\"titleline-icon\"></div>\n");
      out.write("            <p>Send us a message </p>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"row\">\n");
      out.write("          <div class=\"col-md-8\">\n");
      out.write("            <div class=\"contactUS\">\n");
      out.write("              <form name=\"sendMessage\" novalidate id=\"contactForm\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                  <div class=\"col-md-6\">\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                      <input class=\"form-control\" type=\"text\" placeholder=\"Enter your name\" required=\"\" data-validation-required-message=\"Please enter your name.\" id=\"name\" name=\"name\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                      <input type=\"email\" placeholder=\"Enter your email\" required=\"\" data-validation-required-message=\"Please enter your E-mail address\" id=\"email\" name=\"email\">\n");
      out.write("                    </div>\n");
      out.write("                  </div>\n");
      out.write("                  <div class=\"col-md-6\">\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                      <textarea class=\"form-control\" placeholder=\"Your message...\" required=\"\" data-validation-required-message=\"Please enter a message\" id=\"message\" name=\"message\"></textarea>\n");
      out.write("                    </div>\n");
      out.write("                  </div>\n");
      out.write("                  <div class=\"col-lg-12 text-center col-sm-offset-3\">\n");
      out.write("                    <div id=\"success\">\n");
      out.write("                      <button class=\"btn btn-xl get btn-warning\" type=\"submit\" name=\"submit\">Send Message</button>\n");
      out.write("                    </div>\n");
      out.write("                  </div>\n");
      out.write("                </div>  \n");
      out.write("                  \n");
      out.write("                  \n");
      out.write("              <!--Test\n");
      out.write("              ");

                if (null != serverMessage) {
                        out.println("<div class='" + status + "'>"
                                        + serverMessage + "</div>");
                }
		
      out.write("\n");
      out.write("             -->\n");
      out.write("                  \n");
      out.write("              </form>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("          <div class=\"col-md-4\" id=\"whiteText\">\n");
      out.write("            <p>\n");
      out.write("              Xmeagol is a website and software solutions company based in Cape Town, South Africa. Created due to a group project.</p><br>We offer services in: \n");
      out.write("            <ul>\n");
      out.write("              <li>Web design</li>\n");
      out.write("              <li>Web development</li>\n");
      out.write("              <li>Software development</li>\n");
      out.write("              <li>Database development</li>\n");
      out.write("            </ul>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </section>\n");
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
