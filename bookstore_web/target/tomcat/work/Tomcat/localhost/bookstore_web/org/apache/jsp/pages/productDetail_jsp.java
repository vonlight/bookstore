/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2020-05-16 04:25:06 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.pages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class productDetail_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/pages/common/header.jsp", Long.valueOf(1586708010093L));
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005ffmt_005fformatNumber_0026_005fvalue_005fpattern_005fnobody;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005ffmt_005fformatNumber_0026_005fvalue_005fpattern_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.release();
    _005fjspx_005ftagPool_005ffmt_005fformatNumber_0026_005fvalue_005fpattern_005fnobody.release();
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!-- 通过动态标签引入公共jsp页面 -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(" <!-- å¼å¥cæ ç­¾ -->\r\n");
      out.write(" \r\n");
      out.write(" \r\n");
      out.write(" \r\n");
      out.write("\r\n");
      out.write(" ");
      if (_jspx_meth_c_005fset_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(" <link\r\n");
      out.write("\t\t href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/resources/bootstrap/css/bootstrap.css\"\r\n");
      out.write("\t\t rel=\"stylesheet\" />\r\n");
      out.write(" <link href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/resources/css/taobao.css\"\r\n");
      out.write("\t   rel=\"stylesheet\" />\r\n");
      out.write(" <script\r\n");
      out.write("\t\t src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/resources/jquery/jquery.min.js\"></script>\r\n");
      out.write(" <script\r\n");
      out.write("\t\t src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/resources/bootstrap/js/bootstrap.js\"></script>\r\n");
      out.write(" <script\r\n");
      out.write("\t\t src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/resources/js/getParameter.js\"></script>\r\n");
      out.write("\r\n");
      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("\r\n");
      out.write(" <!DOCTYPE html>\r\n");
      out.write("<html lang=\"zh_CN\">\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"utf-8\">\r\n");
      out.write("<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("<title>商品详情</title>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\r\n");
      out.write("   // 为 ’-‘ 绑定事件，用户点击后，将购买的数量减一，但是必须保证购买的数量为大于等于1的正整数\r\n");
      out.write("   function minuFun(){\r\n");
      out.write("\t   \r\n");
      out.write("\t   //获取输入框对应的dom对象\r\n");
      out.write("\t   var  obj = document.getElementById(\"number\");\r\n");
      out.write("\t   //获取输入款中的值\r\n");
      out.write("\t   var num = parseInt(obj.value);\r\n");
      out.write("\t   \r\n");
      out.write("\t   if(num>1){\r\n");
      out.write("\t\t   //重新给输入框中的value赋值\r\n");
      out.write("\t\t   obj.value = num - 1; \r\n");
      out.write("\t   }\r\n");
      out.write("\t   \r\n");
      out.write("   }\r\n");
      out.write("   \r\n");
      out.write("   \r\n");
      out.write("   // 为 ’+‘ 绑定事件，用户点击后，将购买的数量减一，但是必须保证购买的数量为大于等于1的正整数 \r\n");
      out.write("   function addFun(){\r\n");
      out.write("\t   \r\n");
      out.write("\t   //获取输入框对应的dom对象\r\n");
      out.write("\t   var  obj = document.getElementById(\"number\");\r\n");
      out.write("\t   //获取输入款中的值\r\n");
      out.write("\t   var num = parseInt(obj.value);//parseInt:将字符窜转成整数\r\n");
      out.write("\t   \r\n");
      out.write("\t   //获取库存数\r\n");
      out.write("\t   var kucun = parseInt(\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${product.storage}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\")\r\n");
      out.write("\t   //重新给输入框中的value赋值\r\n");
      out.write("\t\tobj.value = (num + 1) > kucun ?  kucun : num + 1; \r\n");
      out.write("\t   \r\n");
      out.write("\t   \r\n");
      out.write("   }\r\n");
      out.write("\r\n");
      out.write("    //为购买的数量对应的输入框  绑定失去焦点事件\r\n");
      out.write("    function validNum(obj){\r\n");
      out.write("    \t//用户输入的数字 必须为 大于等于1的正整数，并且不能大于库存\r\n");
      out.write("    \t\r\n");
      out.write("    \t//1、判断用户输入的是否是数字   isNaN: is Not a Number\r\n");
      out.write("    \tif(isNaN(obj.value)||obj.value < 1){\r\n");
      out.write("    \t\t//用户输入的不是数字或者小于1的数字 都不合法,则 使用默认购买数量\r\n");
      out.write("    \t\tobj.value = 1;\r\n");
      out.write("    \t}else if(obj.value > parseInt(\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${product.storage}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\")){\r\n");
      out.write("    \t\tobj.value = 1;\r\n");
      out.write("    \t\talert(\"购买数量已超过库存数，请核实\");\r\n");
      out.write("    \t}else{\r\n");
      out.write("    \t\t//防止用户用户输入小数    假设用户输入3 == 》3  用户输入  3.5 == 》4   对用户输入的值 进行向上取整\r\n");
      out.write("    \t\tobj.value = Math.ceil(obj.value);\r\n");
      out.write("    \t\t\r\n");
      out.write("    \t\t\r\n");
      out.write("    \t}\r\n");
      out.write("    \t\r\n");
      out.write("    }\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<!-- 横幅导航条开始 -->\r\n");
      out.write("\t\r\n");
      out.write("\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/pages/common/nav.jsp", out, false);
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t<!--  横幅下方的主体开始 -->\r\n");
      out.write("\t<div class=\"container\">\r\n");
      out.write("\r\n");
      out.write("\t\t<div class=\"row row-offcanvas row-offcanvas-right\">\r\n");
      out.write("\t\t\t<!-- 内容主体开始 -->\r\n");
      out.write("\t\t\t<div class=\"col-xs-12 col-sm-12 panel panel-default\" style=\"padding: 80px\">\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t<button type=\"button\" class=\"btn btn-default btn-sm pull-right\" onclick=\"history.back(-1);\"><span class=\"glyphicon glyphicon glyphicon-arrow-left\" aria-hidden=\"true\"></span>返回</button>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t<div class=\"col-xs-12 col-sm-6\">\r\n");
      out.write("\t\t\t\t\t<img alt=\"商品的图片\" style=\"width:200px;height:200px\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/image/product/");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${product.image}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\">\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"col-xs-12 col-sm-6\">\r\n");
      out.write("\t\t\t\t\t<p>标题 : ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${product.title}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("</p>\r\n");
      out.write("\t\t\t\t\t<p>作者 : ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${product.author}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write(" 著</p>\r\n");
      out.write("\t\t\t\t\t<p>出版社 : ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${product.publisher}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("</p>\r\n");
      out.write("\t\t\t\t\t<p>\r\n");
      out.write("                        抢购价 : <span style=\"color: red; \"><strong>¥");
      if (_jspx_meth_fmt_005fformatNumber_005f0(_jspx_page_context))
        return;
      out.write("</strong></span>\r\n");
      out.write("                        &nbsp;&nbsp; <span class=\"price\">¥");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${product.price}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("</span>\r\n");
      out.write("\t\t\t\t\t</p>\r\n");
      out.write("\t\t\t\t\t<p>\r\n");
      out.write("\t\t\t\t\t\t库存量：<span id=\"storage\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${product.storage}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("</span>\r\n");
      out.write("\t\t\t\t\t</p>\r\n");
      out.write("\t\t\t\t\t<p>\r\n");
      out.write("\t\t\t\t\t<form method=\"get\" action=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/shopcar/addOrUpdateShopcar.do\">\r\n");
      out.write("\t\t\t\t\t\t<input type=\"hidden\" name=\"productId\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${product.id}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\" /> <span\r\n");
      out.write("\t\t\t\t\t\t\tstyle=\"font-weight: bold; font-size: 18px; cursor: pointer; margin-left: 10px; margin-right: 10px;\"\r\n");
      out.write("\t\t\t\t\t\t\tonclick=\"minuFun()\">-</span>\r\n");
      out.write("\t\t\t\t\t\t<input id=\"number\" name=\"number\" value=\"1\" onblur=\"validNum(this)\" style=\"width: 50px;\" />\r\n");
      out.write("                    ");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<span\r\n");
      out.write("\t\t\t\t\t\t\tstyle=\"font-weight: bold; font-size: 18px; cursor: pointer; margin-left: 10px; margin-right: 10px;\"\r\n");
      out.write("\t\t\t\t\t\t\tonclick=\"addFun()\">+</span>\r\n");
      out.write("                    ");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<button class=\"btn btn-default\">\r\n");
      out.write("\t\t\t\t\t\t\t<span class=\"glyphicon glyphicon-shopping-cart\"\r\n");
      out.write("\t\t\t\t\t\t\t\tstyle=\"color: red;\"></span>加入购物车\r\n");
      out.write("\t\t\t\t\t\t</button>\r\n");
      out.write("\t\t\t\t\t</form>\r\n");
      out.write("\t\t\t\t\t</p>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"col-xs-12\">\r\n");
      out.write("\t\t\t\t\t<fieldset>\r\n");
      out.write("\t\t\t\t\t\t<legend>介绍</legend>\r\n");
      out.write("                        ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${product.description}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t</fieldset>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<!--/.col-xs-12.col-sm-9-->\r\n");
      out.write("\t\t\t<!-- 内容主体结束 -->\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<!--/row-->\r\n");
      out.write("\t\t<hr>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<!--/.container-->\r\n");
      out.write("\t<!--  横幅下方的主体结束 -->\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_005fset_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:set
    org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_005fset_005f0 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
    _jspx_th_c_005fset_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005fset_005f0.setParent(null);
    // /pages/common/header.jsp(9,1) name = value type = javax.el.ValueExpression reqTime = true required = false fragment = false deferredValue = true expectedTypeName = java.lang.Object deferredMethod = false methodSignature = null
    _jspx_th_c_005fset_005f0.setValue(new org.apache.jasper.el.JspValueExpression("/pages/common/header.jsp(9,1) '${pageContext.request.contextPath}'",_el_expressionfactory.createValueExpression(_jspx_page_context.getELContext(),"${pageContext.request.contextPath}",java.lang.Object.class)).getValue(_jspx_page_context.getELContext()));
    // /pages/common/header.jsp(9,1) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fset_005f0.setVar("ctx");
    int _jspx_eval_c_005fset_005f0 = _jspx_th_c_005fset_005f0.doStartTag();
    if (_jspx_th_c_005fset_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f0);
    return false;
  }

  private boolean _jspx_meth_fmt_005fformatNumber_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  fmt:formatNumber
    org.apache.taglibs.standard.tag.rt.fmt.FormatNumberTag _jspx_th_fmt_005fformatNumber_005f0 = (org.apache.taglibs.standard.tag.rt.fmt.FormatNumberTag) _005fjspx_005ftagPool_005ffmt_005fformatNumber_0026_005fvalue_005fpattern_005fnobody.get(org.apache.taglibs.standard.tag.rt.fmt.FormatNumberTag.class);
    _jspx_th_fmt_005fformatNumber_005f0.setPageContext(_jspx_page_context);
    _jspx_th_fmt_005fformatNumber_005f0.setParent(null);
    // /pages/productDetail.jsp(97,66) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_fmt_005fformatNumber_005f0.setValue((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${product.discountPrice}", java.lang.Object.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
    // /pages/productDetail.jsp(97,66) name = pattern type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_fmt_005fformatNumber_005f0.setPattern("0.00");
    int _jspx_eval_fmt_005fformatNumber_005f0 = _jspx_th_fmt_005fformatNumber_005f0.doStartTag();
    if (_jspx_th_fmt_005fformatNumber_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005ffmt_005fformatNumber_0026_005fvalue_005fpattern_005fnobody.reuse(_jspx_th_fmt_005fformatNumber_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005ffmt_005fformatNumber_0026_005fvalue_005fpattern_005fnobody.reuse(_jspx_th_fmt_005fformatNumber_005f0);
    return false;
  }
}
