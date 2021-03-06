/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.0.M26
 * Generated at: 2019-12-19 01:58:38 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class populateDatabase_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(4);
    _jspx_dependants.put("/includes/scripts.jsp", Long.valueOf(1575854234000L));
    _jspx_dependants.put("/includes/navigation.jsp", Long.valueOf(1576023686000L));
    _jspx_dependants.put("/includes/footer.jsp", Long.valueOf(1575854184000L));
    _jspx_dependants.put("/includes/styles.jsp", Long.valueOf(1575854256000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


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

      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("<meta name=\"description\"  content=\"This is a JSP example to populate the database\" >\n");
      out.write("<title>Java Web Programming: Populate Database</title>\n");
      out.write("<meta name=\"viewport\" content=\"width=device=width, initial-scale=1.0\" > \n");
      out.write("<link href=\"assets/css/bootstrip.css\" rel=\"stylesheet\" type=\"text/css\" > \n");
      out.write("<link href=\"asset/css/main.css\" rel=\"stylesheet\" type=\"text/css\" > \n");
      out.write("\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\t<div class=\"container\">\n");
      out.write("\t\t<div class=\"hero-unit\">\n");
      out.write("\t\t\t<h1>Populate Database</h1>\n");
      out.write("\t\t</div>\n");
      out.write("\t\t\n");
      out.write("\t\t");
      out.write("<ul class=\"nav nav-tabs\">\n");
      out.write("\t<li><a href=\"index.jsp\">Home</a></li>\t\n");
      out.write("\t<li class=\"dropdown\">\n");
      out.write("\t\t\t<a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">View All<b class=\"caret\"></b></a>\n");
      out.write("\t\t\t<ul class=\"dropdown-menu\">\n");
      out.write("\t\t\t<li><a href=\"ViewAll\">View All</a>\n");
      out.write("\t\t\t<li><a href=\"ViewAll?sortType=title\">by Title</a>\n");
      out.write("\t\t\t<li><a href=\"ViewAll?sortType=director\">by Director</a>\n");
      out.write("\t\t\t<li><a href=\"ViewAll?sortType=lengthInMinutes\">by Length In Minutes</a>\t\t\n");
      out.write("\t\t</ul>\n");
      out.write("\t</li>\n");
      out.write("\t<li><a href=\"search.jsp\">Search</a></li>\n");
      out.write("\t<li><a href=\"addMovie.jsp\">Add Movie</a></li>\n");
      out.write("\t<li><a href=\"populateDatabase.jsp\">Populate Database</a></li>\n");
      out.write("</ul>");
      out.write("\n");
      out.write("\t\n");
      out.write("\t\t<div class=\"container\">\n");
      out.write("      <form action=\"PopulateDatabase\" method=\"post\">\n");
      out.write("      <p>Click on the Populate button to populate the movie database.</p>\n");
      out.write("      <p>Waring: Submitting this form will reset the database and it will \n");
      out.write("      only contain those movie in the original spreadsheet</p>\n");
      out.write("      <input type=\"submit\" value=\"Populate!\"> \n");
      out.write("    </form>\n");
      out.write("\t\t</div>\n");
      out.write("    <hr>\n");
      out.write("\t\t");
      out.write("<hr />\n");
      out.write("<div class=\"hero-unit\">&copy; Copyright 2019 David Kittle</div> ");
      out.write("\n");
      out.write("\t\t\n");
      out.write("\t</div>\n");
      out.write("<script src=\"assets/js/jquery.js\" type=\"text/javascript\"></script> \n");
      out.write("<script src=\"assets/js/bootstrap.min.js\" type=\"text/javascript\"></script>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
