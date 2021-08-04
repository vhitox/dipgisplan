<%--
  Created by IntelliJ IDEA.
  User: Vic
  Date: 1/25/2021
  Time: 7:11 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='mainaccess' />
    <title></title>
</head>

<body>
<h1>Hi</h1>
%{--<g:each in="${marcadosList}" var="dia">
    ${dia.key}<br>
    <g:each in="${dia.value}" var="marcado">
        ${marcado.usuario.nombreCompleto} : ${marcado.entrada} --> ${marcado.salida}<br>
    </g:each>
</g:each>--}%

<h1 style="margin-top: 20px;">Marcado del Personal</h1>
<div id="accordion">
    <g:set var="c" value="${1}"/>
    <g:each in="${marcadosList}" var="dia">
        <div class="card">
            <div class="card-header" id="headingOne${c}">
                <h5 class="mb-0">
                    <button class="btn btn-link" data-toggle="collapse" data-target="#collapse${c}" aria-expanded="true" aria-controls="collapse${dia.key}">
                        ${dia.key}
                    </button>
                </h5>
            </div>

            <div id="collapse${c}" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
                <div class="card-body">
                    <g:if test="${!dia.value.empty}">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>Funcionario</th>
                                <th>Hora Entrada</th>
                                <th>Hora Salida</th>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${dia.value}" status="i" var="marcado">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                    <td>${marcado?.usuario?.nombreCompleto}</td>
                                    <td>${marcado?.entrada?.format("HH:mm")}</td>
                                    <td>${marcado?.salida?.format("HH:mm")}</td>
                                </tr>
                            </g:each>
                            </tbody>
                        </table>
                    </g:if>
                </div>
            </div>
        </div>
        <g:set var="c" value="${c+1}"/>
    </g:each>
</div>
<script>
    $('.collapse').collapse()
</script>

</body>
</html>