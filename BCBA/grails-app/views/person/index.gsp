<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main" />
    <title>Catálogo de Personas</title>
    <script type="text/javascript">
      $(document).ready(function()
          {
              $("#myTable")
                .tablesorter({widthFixed: true, widgets: ['zebra']})
                .tablesorterPager({
                  container: $("#pager"),
                  positionFixed: false
                });

              $('.delete_link').click( function(event){

                var link = $(this);
                $( "#dialog-confirm" ).dialog({
                        resizable: false,
                        height:140,
                        modal: true,
                        buttons: {
                                "Eliminar": function() {
                                    $( this ).dialog( "close" );
                                    window.location = link.attr('href');
                                },
                                'Cancelar': function() {
                                    $( this ).dialog( "close" );
                                    event.preventDefault();
                                }
                        }
                });

                event.preventDefault();
              });
          }
      );
      //}{
    </script>

  </head>
  <body>

    <div id="dialog-confirm" style="display:none;" title="¿Eliminar?">
      <p>
        <span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>
        Este elemento será eliminado de forma permanente y no podrá ser recuperado. ¿Estás seguro?
      </p>
    </div>

    <div class="navigation-bar">
      <g:link controller="catalogue" action="index">Catálogos </g:link>- Personas
    </div>

    <h1>Catálogo de Personas</h1>

    <div id="contenido">

      <div class="operation-menu">
        <div class="operation-button">
          <g:link controller="person" action="add" >
             <img src="${resource(dir:'images/icons',file:'118379_35949_32_add_database_icon.png')}" title="Agregar" alt="Agregar" />
             <span>Agregar nueva persona</span>
          </g:link>
        </div>
      </div>

      <div class="clear"></div>

      <div>

        <div>
          <table id="myTable" class="tablesorter">
            <thead>
              <tr>
                  <th>ID</th>
                  <th>Nombre</th>
                  <th>Apellidos</th>
                  <th>Correo Electrónico</th>
                  <th>Fecha de Creación</th>
                  <th>Fecha de Modificación</th>
                  <th>Acciones</th>
              </tr>
            </thead>

            <tbody>

              <g:each var="person" in="${persons}">

                <tr>
                    <td>${person.id}</td>
                    <td>${person.name}</td>
                    <td>${person.lastName}</td>
                    <td>${person.email}</td>
                    <td>${person.dateCreated}</td>
                    <td>${person.lastUpdated}</td>
                    <td>
                        <g:link controller="person" action="edit" id="${person.id}">
                           <img src="${resource(dir:'images/icons',file:'118799_36369_32_edit_report_icon.png')}" title="Editar" alt="Editar" />
                        </g:link>

                        <g:link class="delete_link" controller="person" action="delete" id="${person.id}">
                           <img src="${resource(dir:'images/icons',file:'113269_29299_22_close_delete_dialog_disabled_icon.png')}" title="Eliminar" alt="Eliminar" />
                        </g:link>
                    </td>
                </tr>

              </g:each>

            </tbody>
          </table>
        </div>
        <div>
          <div id="pager" class="pager">
            <form action="" >
              <img alt=""  src="${resource(dir:'images/icons',file:'first.png')}" class="first"/>
              <img alt=""  src="${resource(dir:'images/icons',file:'prev.png')}" class="prev"/>
              <input type="text" class="pagedisplay"/>
              <img alt=""  src="${resource(dir:'images/icons',file:'next.png')}" class="next"/>
              <img alt=""  src="${resource(dir:'images/icons',file:'last.png')}" class="last"/>
              <select class="pagesize">
                      <option selected="selected"  value="10">10</option>
                      <option value="20">20</option>
                      <option value="30">30</option>
                      <option  value="40">40</option>
              </select>
            </form>
          </div>
        </div>
      </div>
    </div>

  </body>
</html>
