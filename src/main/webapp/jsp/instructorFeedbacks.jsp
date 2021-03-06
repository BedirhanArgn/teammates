<%@ page trimDirectiveWhitespaces="true" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page import="teammates.common.util.FrontEndLibrary" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/instructor" prefix="ti" %>
<%@ taglib tagdir="/WEB-INF/tags/instructor/feedbacks" prefix="feedbacks" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="jsIncludes">
  <script type="text/javascript" src="<%= FrontEndLibrary.TINYMCE %>"></script>
  <script type="text/javascript" src="<%= FrontEndLibrary.MOMENT %>"></script>
  <script type="text/javascript" src="/data/moment-timezone-with-data.min.js"></script>
  <script type="text/javascript" src="/js/instructorFeedbacks.js"></script>
</c:set>
<ti:instructorPage title="Add New Feedback Session" jsIncludes="${jsIncludes}">

  <c:if test="${!data.usingAjax}">
    <feedbacks:feedbackSessionsForm courseAttributes="${data.courseAttributes}" fsForm="${data.newFsForm}"/>
    <feedbacks:loadSessionsTableByAjaxForm fsList="${data.fsList}" />
  </c:if>
  <br>
  <t:statusMessage statusMessagesToUser="${data.statusMessagesToUser}" />
  <br>
  <div id="sessionList" class="align-center">
    <c:if test="${data.usingAjax}">
      <feedbacks:feedbackSessionsTable fsList = "${data.fsList}" />

      <c:if test="${not empty data.softDeletedFsList.rows}">
        <feedbacks:softDeletedFeedbackSessionsPanel />
        <br>
        <br>
        <br>
        <br>
      </c:if>
    </c:if>
  </div>

  <ti:remindParticularStudentsModal remindParticularStudentsLink="${data.remindParticularStudentsLink}" />
  <feedbacks:copyFromModal copyFromModal="${data.copyFromModal}" />
  <ti:copyModal editCopyActionLink="${data.editCopyActionLink}" />
  <ti:resendPublishedEmailModal sessionResendPublishedEmailLink="${data.sessionResendPublishedEmailLink}" />

</ti:instructorPage>
