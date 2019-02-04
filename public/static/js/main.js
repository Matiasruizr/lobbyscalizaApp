// var table = new Tabulator("#top_lobbysta_proveedor", {
//     height:"311px",
//     columns:[
//     {title:"Posición de organización", field:"Posición de organización"},
//     {title:"Rut", field:"Rut", sorter:"number"},
//     {title:"Nombre proveedor", field:"Nombre proveedor"},
//     {title:"Cantidad de audiencias", field:"Cantidad de audiencias", sorter:"number"},
//     {title:"Favourite Color", field:"col"},
//     {title:"Date Of Birth", field:"dob", align:"center"},
//     ],
// });

Tabulator.prototype.extendModule("localize", "langs", {
    "en":{
        "columns":{
        },
        "ajax":{
            "loading":"Loading",
            "error":"Error",
        },
        "pagination":{
            "first":"First",
            "first_title":"First Page",
            "last":"Last",
            "last_title":"Last Page",
            "prev":"Prev",
            "prev_title":"Prev Page",
            "next":"Next",
            "next_title":"Next Page",
        },
        "headerFilters":{
            "default":"filter column...",
            "columns":{}
        }
    },
});

var table = new Tabulator("#top_lobbysta_proveedor", {

    layout : "fitColumns" ,
});


var tableProveedores = new Tabulator("#top_proveedores_estado", {

    layout : "fitColumns" 
});


var tableCompradores = new Tabulator("#top10compradoresdelestado", {

    layout : "fitColumns" 
});


var table = new Tabulator("#top_10_orgamnizmos", {

    layout : "fitColumns" 
});