<%@ page import="ua.gladiator.model.entity.dto.Page" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
    <%@ include file="/static/css/bootstrap.css" %>
    <%@ include file="/static/css/styles.css" %>
</style>
<fmt:setLocale value="${param.lang}"/>
<fmt:setBundle basename="properties/messages"/>

<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Library</title>

</head>
<body>
<section class="section-1 head_wrapper">
    <header class="header container">
        <div class="headline row ">
            <div class="logo col-lg-2">
                <%--<img class="logo-img" src="${pageContext.request.contextPath}/static/sources/book-logo.png" alt="logo">--%>
            </div>
            <div class="head_info col-lg-12">
                <h1 class="translate" data-args="message.title"></h1>
            </div>
            <div class="col-lg-2 langs">
                <div class="switch-locale lang-images">
                    <%--                    <a href="#" data-locale="en"><img src="../static/sources/us-flag.png" alt="en"></a>--%>
                    <%--                    <a href="#" data-locale="ua"><img src="../static/sources/ua-flag.png" alt="ua"></a></div>--%>
                    <a href="/logout">
                        <button type="button" class="btn btn-info btn-sm logout-button translate"
                                data-args="message.logout">

                        </button>
                    </a>
                </div>
            </div>
            <nav class="navigation">

                <div class="row menu_row">

                    <div class="col-lg-offset-6 col-lg-2 menu-item center-text">
                        <a class="nav-link" href="#"><h3 class="translate" data-args="message.mainpage"></h3></a>
                    </div>
                    <div class="col-lg-2  menu-item center-text">
                        <a class="nav-link" href="file:///D:/1PROGA/libraryapp/src/main/resources/admin/takes.html"><h3 class="translate" data-args="message.stats"></h3></a>
                    </div>

                </div>
            </nav>
    </header>
</section>

<section class="page-wrapper container">


    <div class="row books-filter-wrapper books-wrapper addbook-wrapper">

        <div class="filter col-lg-4 mgtop-container">
            <div class="form-horizontal filter-form col-lg-12">
                <fieldset>



                    <div class="form-group col-lg-16 input-field-my">
                        <h3 class="center-text translate" data-args="message.filter"></h3>
                        <div class="">
                            <input id="filter-author" type="search" placeholder="Author" class="form-control input-md">

                        </div>
                    </div>

                    <div class="form-group col-lg-16 input-field-my">
                        <div class="">
                            <input id="line"  type="search" placeholder="Name or text" class="form-control input-md">

                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-lg-12 col-lg-offset-2 filter-attributes">

                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-4 control-label" for="filter-button"></label>
                        <div class="col-lg-4">
                            <button id="filter-button" name="filter-button" class="btn btn-info translate" data-args="message.confirm"></button>
                        </div>
                    </div>

                    <fmt:message key="message.nothingfound"/>
                </fieldset>
            </div>

        </div>
        <div class="col-lg-12">
            <div id="books" class="row">
                ${client}

                <c:if test="${empty books}">
                    321
                    <fmt:message key="message.nothingfound"/>
                </c:if>
                <c:forEach var="b" items="${books.pageContent}">
                    <div class="book_container col-lg-4">
                        <img src="${b.picUrl}" alt="book_pic">
                        <div class="book_info">
                            <h2 class="author_name">${b.author}</h2>
                            <p class="book_name">${b.name}</p>
                            <p class="book_attributes"><c:forEach var="a" items="${b.attributes}">

                            </c:forEach>
                            </p>
                            <p class="book_days_to_return translate" data-args="message.daystoreturn,{{daysToReturn}}">Days to return: ${b.daysToReturn}</p>
                        </div>
                        <div class="book-button">
                            <button class="remove-book" data-id="{{id}}"><p class="translate" data-args="message.remove">Delete book</p></button>
                        </div>
                    </div>
                </c:forEach>

            </div>
            <div id="pager">

            </div>
            <div class="add-form col-lg-12  mgtop-container">
                <h3 class="create-book center-text translate" data-args="message.create"></h3>

                <div class="col-lg-4">
                    <div class="form-group col-lg-16">
                        <label for="name" class="translate" data-args="message.name"></label>
                        <input type="text" class="form-control" id="name">
                    </div>
                    <div class="form-group col-lg-16">
                        <label for="add-author" class="translate" data-args="message.author"></label>
                        <input type="text" class="form-control" id="add-author">
                    </div>
                    <div class="form-group col-lg-16">
                        <label for="picUrl" class="translate" data-args="message.picurl"></label>
                        <input type="url" class="form-control" id="picUrl">
                    </div>
                    <label class="control-label long-label translate" for="daysToReturn" data-args="message.days"></label>
                    <div class="form-group col-lg-16">
                        <select id="daysToReturn" class="form-control">

                        </select>
                    </div>
                </div>
                <div class="col-lg-4">

                    <div class="form-group add-attributes" >

                    </div>



                </div>
                <div class="col-lg-8">
                    <div class="form-group" >
                        <label for="text" class="translate" data-args="message.text"></label>
                        <textarea cols="40" rows="10" id="text"></textarea>

                        <button id="addBook" class="btn bin-default add-book-button add-book translate" data-args="message.add"></button>
                    </div>
                </div>



            </div>
            <div class="add-form att-form mgtop-container col-lg-4 ">
                <h3 class="create-att center-text translate" data-args="message.createatt"></h3>

                <div class="col-lg-16">
                    <div class="form-group col-lg-16">
                        <label for="name" class="translate" data-args="message.att"></label>
                        <input type="text" class="form-control" id="new-attribute">
                    </div>
                    <button id="add-attribute" class="btn bin-default add-att-button translate" data-args="message.add" ></button>
                </div>




            </div>




        </div>



    </div>









</section>

<footer class="footer">
    <div class="foot container">
        <div class="footer_info col-lg-4 ">
            <ul>
                <li class="translate bold" data-args="message.address"></li>
                <li class="translate" data-args="message.kyiv"></li>
                <li class="translate" data-args="message.street"></li>
            </ul>
        </div>
        <div class="footer_info col-lg-4 ">
            <ul>
                <li class="translate bold" data-args="message.cont"></li>
                <li class="translate" data-args="message.phone1"></li>
                <li class="translate" data-args="message.phone2"></li>
            </ul>
        </div>
        <div class="footer_info col-lg-4 ">
            <ul>
                <li class="translate bold" data-args="message.sponsors"></li>
                <li class="translate" data-args="message.sponsor1"></li>
                <li class="translate" data-args="message.sponsor2"></li>
            </ul>
        </div>
        <div class="footer_info col-lg-4 ">
            <ul>

                <li class="translate bold" data-args="message.inc"></li>
                <li class="translate bold" data-args="message.allrr"></li>
            </ul>
        </div>
    </div>
</footer>

</body>



</html>