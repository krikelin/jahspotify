<%--
  ~ Licensed to the Apache Software Foundation (ASF) under one
  ~        or more contributor license agreements.  See the NOTICE file
  ~        distributed with this work for additional information
  ~        regarding copyright ownership.  The ASF licenses this file
  ~        to you under the Apache License, Version 2.0 (the
  ~        "License"); you may not use this file except in compliance
  ~        with the License.  You may obtain a copy of the License at
  ~
  ~          http://www.apache.org/licenses/LICENSE-2.0
  ~
  ~        Unless required by applicable law or agreed to in writing,
  ~        software distributed under the License is distributed on an
  ~        "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
  ~        KIND, either express or implied.  See the License for the
  ~        specific language governing permissions and limitations
  ~        under the License.
  --%>

<%@ include file="/jsp/header.jsp" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>

  var timer = $.timer( function ()
   {
   } );

  $( document ).on( "pageinit", function ()
  {
    $( "#result" ).on( {
                             popupbeforeposition:function ()
                             {
                               // Set up to reload every 2 seconds when the panel is open
                               timer.set( { time:2000, autostart:true } );
                             }
                           } );

    $( "#result" ).on( {
                             popupafterclose:function ()
                             {
                               // Cancel the reloading when the panel is closed
                               timer.stop();
                             }
                           } );
  } );

</script>

<div id="result" data-role="page">


  <div class="mainHeaderPanel" data-theme="o" data-position="inline" data-role="header" role="banner">
    <h1><c:out value="${pageTitle}"/></h1>
  </div>

  <div data-role="content">
    <div class="content-primary" data-theme="a">
      <p><c:out value="${resultMessage}"/></p>
      <a href="#" data-role="button" data-rel="back">Ok</a>
    </div>
  </div>

</div>

<%@ include file="/jsp/dialog-footer.jsp" %>