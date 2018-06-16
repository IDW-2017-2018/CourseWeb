
<div class="filter">

    <h1 class="title">AGGIUNTA RELAZIONE CON LIBRO TESTO</h1>

    <div class="formcontainer">

      <form action="backofficeeditcourse?lang=${lang}&id=${corso.id}&action=add_textbook" method="POST">

            <div class="fieldcontainerleft">

                <label class="label" for="corso_nome">Corso</label>
                <input class="field" type="text" id="corso_nome" name="corso_nome" placeholder="${strip_slashes(corso.nome)}" disabled="disabled" />

            </div>


            <div class="fieldcontainerright">

                <label class="label" for="libro_testo_titolo">Libro di Testo</label>
                <select class="field" name="libro_testo_titolo">
                  <#list items>
                      <#items as item>
                      <option value="${item.id}">${strip_slashes(item.titolo)}</option>
                      </#items>
                  <#else>
                  </#list>
                </select>

            </div>


        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="aggiungi_libro_testo_action" value="AGGIUNGI"/>
        </div>
      
      </form>

      <form action="backofficeeditcourse?lang=${lang}&id=${corso.id}&action=new_textbook" method="POST">

        <h1 class="title">AGGIUNGI NUOVO LIBRO DI TESTO</h1>

        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="nuovo_libro_testo" value="NUOVO"/>
        </div>

      </form>

    </div>

</div>
