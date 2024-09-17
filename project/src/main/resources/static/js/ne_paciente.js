const medicinesTable = document.getElementById("medicinesTable");

function agregarFila() {
    const table = document.getElementById("medicinesTable");
    const tbody = table.querySelector("tbody");

    // Crear una nueva fila
    const newRow = document.createElement("tr");

    // Crear celdas para medicamento, dosis y el botón de eliminar
    const medicamentoCell = document.createElement("td");
    const dosisCell = document.createElement("td");
    const buttonCell = document.createElement("td");

    // Crear los inputs para medicamento y dosis
    const medicamentoInput = document.createElement("input");
    medicamentoInput.type = "text";
    medicamentoInput.name = "medicamento[]";
    medicamentoInput.placeholder = "Nombre del medicamento";

    const dosisInput = document.createElement("input");
    dosisInput.type = "text";
    dosisInput.name = "dosis[]";
    dosisInput.placeholder = "Dosis [mg]";
    dosisInput.inputmode = "numeric";

    // Crear el botón para eliminar la fila
    const deleteButton = document.createElement("button");
    deleteButton.type = "button";
    deleteButton.textContent = "Eliminar";
    deleteButton.addEventListener("click", function () {
        tbody.removeChild(newRow); // Eliminar la fila al hacer clic en el botón
    });

    // Agregar los inputs y el botón a las celdas correspondientes
    medicamentoCell.appendChild(medicamentoInput);
    dosisCell.appendChild(dosisInput);
    buttonCell.appendChild(deleteButton);

    // Agregar las celdas a la nueva fila
    newRow.appendChild(medicamentoCell);
    newRow.appendChild(dosisCell);
    newRow.appendChild(buttonCell);

    // Agregar la nueva fila al tbody de la tabla
    tbody.appendChild(newRow);
}


function actualizarFechaHora() {
    const ahora = new Date(); 

    // Formatea la fecha como "DD/MM/YYYY"
    const fecha = ahora.toLocaleDateString('es', {
        day: '2-digit',
        month: '2-digit',
        year: 'numeric',
    });

    let horas = ahora.getHours();
    const minutos = ahora.getMinutes();
    const esAM = horas < 12;
    if (horas === 0) {
        horas = 12; 
    } else if (horas > 12) {
        horas -= 12; 
    }

    const minutosFormateados = minutos < 10 ? `0${minutos}` : minutos;
    const hora = `${horas}:${minutosFormateados} ${esAM ? 'a.m.' : 'p.m.'}`;

    document.getElementById('fechaNota').textContent = fecha;
    document.getElementById('horaNota').textContent = hora;
}

actualizarFechaHora();

setInterval(actualizarFechaHora, 60000);



