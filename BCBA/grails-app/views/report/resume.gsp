<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main" />
    <title>Autos Parqueados</title>
	<g:javascript src="raphael/raphael.js" />
	<g:javascript src="raphael/g.raphael-min.js" />	
	<g:javascript src="raphael/g.pie-min.js" />
        <g:javascript src="raphael/popup.js" />
        <g:javascript src="raphael/jquery.js" />
        <g:javascript src="raphael/analytics.js" />
        <g:javascript>
		$(document).ready(
			function(){
                            window.onload = function (){
                            var data = [];

                            $("#parkeados td").each(function () {
                                 data.push($(this).html());
                            });

                            //}{
                            graph(data,"holder");
                            };
                        }
		);
	</g:javascript>
	
  </head>
  <body>
  <div class="navigation-bar">
    <g:link controller="report" action="index">Reportes </g:link> - Autos Parqueados
  </div>
    <h1>Autos Parqueados</h1>
    <table id="labels" class="data">
              <tr>
				<g:each in="${(1..days)}">
					<th>${it}</th>
				</g:each>
              </tr>
          </table>
          <table id="parkeados" class="data">
              <tr>
              	  <td>8</td>
                  <td>25</td>
                  <td>27</td>
                  <td>25</td>
                  <td>54</td>
                  <td>59</td>
                  <td>79</td>
                  <td>47</td>
                  <td>27</td>
                  <td>44</td>
                  <td>44</td>
                  <td>51</td>
                  <td>56</td>
                  <td>83</td>
                  <td>12</td>
                  <td>291</td>
                  <td>52</td>
                  <td>12</td>
                  <td>40</td>
                  <td>8</td>
                  <td>60</td>
                  <td>29</td>
                  <td>7</td>
                  <td>33</td>
                  <td>56</td>
                  <td>25</td>
                  <td>1</td>
                  <td>78</td>
                  <td>70</td>
                  <td>68</td>
                  <td>200</td>
				<!--Descomentar en cuanto se tengan datos reales, la tabla saca un promedio para ver de cuanto en cuanto se avanza.-->
				<!--<g:each in="${carPerDay}">
					<td>${it}</td>
				</g:each>-->>
              </tr>
        </table>
    <div id="holder">
    </div>
  </body>
</html>
