<div class="fragment_416">
  <div class="container mt-5">
    <div class="row">
      <div style="font-size: 24px !important; font-weight: bold !important; color: #333 !important; text-align: center;" class="col-md-12 text-center">
        <lfr-editable id="title" type="rich-text">
          <span >Título Centralizado</span>
        </lfr-editable>
      </div>
    </div>

    <div class="row mt-3">
      <div id="category-page" style="font-size: 18px; font-weight: bold; color: #333;" class="col-md-6">
        <lfr-editable id="category" type="rich-text">
          <span>Categoria</span>
        </lfr-editable>
      </div>
    </div>

    <div class="row mt-3">
      <div style="height: auto; max-width: 600px; margin: 0 auto;" class="col-md-12"> 
        <lfr-editable id="img" type="image">
          <img id="img-page" class="img-fluid" src="" alt="imagem" />
        </lfr-editable>
      </div>
    </div>

    <div class="row mt-3">
      <div style="font-size: 16px; font-weight: normal; color: #333; " class="col-md-12">
        <lfr-editable id="content" type="rich-text">
          <span id="content-page">Parágrafo totalmente responsivo para todos os tamanhos de tela.</span>
        </lfr-editable>
      </div>
    </div>
  </div>
</div>

<style>


.saude {
  background-color: green;
  color: white;
}

.musculacao {
  background-color: orange;
  color: white;
}

.carros {
  background-color: yellow;
  color: black;
}

.futebol {
  background-color: purple;
  color: white;
}

.ciclismo {
  background-color: #9370DB;
  color: black;
}

.fragment_416 .lfr-editable span {
  font-size: 24px;
  font-weight: bold;
  color: #333;
  text-align: center;
}

#category-page div {
    display: inline-block;
     padding: 5px;
}
</style>

<script>
    window.addEventListener("load", function () {
        const categoryElement = document.querySelector("#category-page div");
        changeBackgroundColor(categoryElement);
        });

        function changeBackgroundColor(element) {
        const categoryText = element.textContent.trim();
        let backgroundColor;

        switch (categoryText) {
            case "Saude":
            backgroundColor = "green";
            element.style.color = "white";
            break;
            case "Futebol":
            backgroundColor = "purple";
            element.style.color = "white";
            break;
            case "Musculacao":
            backgroundColor = "blue";
            element.style.color = "white";
            break;
            case "Carros":
            backgroundColor = "yellow";
            element.style.color = "black";
            break;
            case "Ciclismo":
            backgroundColor = "orange";
            element.style.color = "black";
            break;
            default:
            backgroundColor = "#ffffff";
            break;
        }

        element.style.backgroundColor = backgroundColor;
    }

</script>
