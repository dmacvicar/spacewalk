<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://rhn.redhat.com/rhn" prefix="rhn" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<head>
<%@ include file="/WEB-INF/pages/common/fragments/editarea.jspf" %>
</head>


<html>
<body>
<%@ include file="/WEB-INF/pages/common/fragments/kickstart/kickstart-toolbar.jspf" %>

<rhn:dialogmenu mindepth="0" maxdepth="1"
    definition="/WEB-INF/nav/kickstart_details.xml"
    renderer="com.redhat.rhn.frontend.nav.DialognavRenderer" />

<p>
<rhn:toolbar base="h2" icon="fa-rocket"
    deletionUrl="/rhn/kickstart/KickstartScriptDelete.do?kssid=${kssid}&ksid=${ksdata.id}"
    deletionType="kickstartscript" >
<bean:message key="kickstart.script.header1"/>
</rhn:toolbar>

<div>
  <p>
    <bean:message key="kickstart.script.summary"/>
    <p>

    <html:form method="POST" action="/kickstart/KickstartScriptEdit.do">
      <rhn:csrf />
      <%@ include file="script-form.jspf" %>
      <html:hidden property="kssid" value="${kssid}"/>
      <html:hidden property="ksid" value="${ksdata.id}"/>
      <html:hidden property="submitted" value="true"/>
    </html:form>
  </p>
</div>

</body>
</html>

