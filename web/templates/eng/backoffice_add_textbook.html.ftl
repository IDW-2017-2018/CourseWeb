
<div class="filter">

    <h1 class="title">ADD RELATION WITH TEXTBOOK</h1>

    <div class="formcontainer">

      <form action="backofficeeditcourse?lang=${lang}&id=${corso.id}&action=add_textbook" method="POST">

            <div class="fieldcontainerleft">

                <label class="label" for="corso_nome">Course</label>
                <input class="field" type="text" id="corso_nome" name="corso_nome"" placeholder="${corso.nome}" disabled="disabled" />

            </div>


            <div class="fieldcontainerright">

                <label class="label" for="libro_testo_autore">Textbook</label>
                <select class="field" name="libro_testo_autore">
                  <#list items>
                      <#items as item>
                      <option value="${item.id}">${item.nome}</option>
                      </#items>
                  <#else>
          </#list>
                </select>

            </div>


        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="aggiungi_libri_testo" value="ADD"/>
        </div>

        <h1 class="title">ADD NEW TEXTBOOK</h1>

        <div class="buttoncontainer">
            <input class="filterbutton" type="submit" name="nuovo_libro_testo" value="NEW"/>
        </div>

      </form>

    </div>

</div>
