library(shiny)
library(shinyjs)

ui<- fluidPage(
  tags$style(HTML('
    .board {
      display: grid;
      grid-template-columns: repeat(20, 1fr);
      grid-template-rows: repeat(20, 1fr);
      width: 400px;
      height: 400px;
    }
    .cell {
      width: 20px;
      height: 20px;
      border: 1px solid #000;
    }
  ')),
  div(class = "board", id = "board")
)

server <- function(input, output, session) {
    observe({
      shinyjs::runjs("
      var board = document.getElementById('board');
      board.innerHTML = '';
      for (var i = 0; i < 20; i++) {
        for (var j = 0; j < 20; j++) {
          var cell = document.createElement('div');
          cell.className = 'cell';
          cell.id = 'cell_' + i + '_' + j;
          cell.addEventListener('click', function() {
            // Handle cell click event here
            console.log(this.id);
          });
          board.appendChild(cell);
        }
      }
    ")
    })
  }

shinyApp(ui, server)
