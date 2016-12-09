<html>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.js"></script>

<script>

//======JavaScript

$(function(){
    DragSigner();
    DragMe();
  })

  //remove the dragsigner when click on close icon
  $(document).on("click", ".closeIt", function(){
    var parent = $(this).parent();
    parent.remove();
  });

function DragSigner(){

    $(".dragSigners").draggable({
      helper: 'clone',
      cursor: 'move',
      tolerance: 'fit',
      revert: true 
    });

    $("#document-reader").droppable({
      accept: '.dragSigners',
      activeClass: "drop-area",

      drop: function(e, ui) {
        dragEl = ui.helper.clone();
        ui.helper.remove();

        document_id   = dragEl.data("document-id");
        signer_id     = dragEl.data("signer-id");
        leftPosition  = ui.offset.left - $(this).offset().left;
        topPosition   = ui.offset.top - $(this).offset().top;

        
        // debug current dropped position
        alert("top: " + topPosition + ", left: " + leftPosition); 
        dragEl.data("signer-id", signer_id);

        dragEl.draggable({
          helper: 'original',
          cursor: 'move',
          tolerance: 'fit',
          drop: function (event, ui) {
            $(ui.draggable).remove();
          }
        });

        // append element to #document-reader
        dragEl.addClass("dragMe");
        dragEl.removeClass("dragSigners col-sm-6 parent");
        dragEl.find("span.closeIt").removeClass("hideIt");
        dragEl.appendTo('#document-reader');

        // update draged element position to database
        // updateDraggedPosition(dragEl, stopPosition, document_id, signer_id)

        // activate dragging for cloned element
        DragMe();
      }
    });
  }



  function DragMe(){
    var document_id;
    $(".dragMe").draggable({
      containment: "#document-reader",
      cursor: 'move',
      // opacity: 0.35,
      stack: $('#document-reader'),
      scroll: false,
      appendTo: $("#document-reader"),
      start: function(event, ui) {
        startPosition = $(this).position();
      },
      stop: function(event, ui) {
        dragEl        = $(this);
        stopPosition  = dragEl.position();
        document_id   = dragEl.data("document-id");
        signer_id     = dragEl.data("signer-id");
        
        // debug current dropped position
        // this position is working perfectly fine.
        // above drag, drop and clone position should behave like this
        alert("top: " + stopPosition.top + ", left: " + stopPosition.left); 
          
        console.log(dragEl.hasClass("parent"))
        if(!dragEl.hasClass("parent")){
         // updateDraggedPosition(dragEl, stopPosition, document_id, signer_id)
        }
      }
    });
  }

  // this function is simply for updating required fields to database
  // please ignore this for now
  function updateDraggedPosition(dragEl, stopPosition, document_id, signer_id){
    $.ajax({
      url: '/signers/drag_signer',
      data: {
        drag_signer: {
          top: stopPosition.top,
          left: stopPosition.left,
          signer_id: signer_id,
          document_id: document_id,
          id: dragEl.data("id")
        }
      },
      type: "POST",
      dataType: "script",
      success: function(data) {
        console.log(dragged_signer_id);
        console.log(dragEl);
        dragEl.data("id", dragged_signer_id);
      }
    })
  }
  
  
  
  
</script>
<!--
=============CSS===========
-->
<style>

  .navbar .btn, .navbar .btn-group {
    margin-top: 12px;
}

body{
    background: #EEE;   
}

header, .navbar-default{
    background: #FFF;
}

header{
    border-bottom: 2px solid #CCC;
}

.navbar-default{
    border: 0px;
}
/* end nav and body section every page*/



/*heading section every page*/
.headerbox {
    background-color: #EFEBFC;
    border: solid #E0DEDE 1px;
    color: #0C002E;
}

.bodybox {
    background-color: white;
    border: solid #E0DEDE 1px;
}
/* end heading section every page*/




/* button color */
.navbtnstyle {
    background-color: #24246B;
    color: white;
}
a.navbtnstyle:hover{color: white;}

.btnaddmore {
    background-color: #55555E;
    color: white;
}
a.btnaddmore:link{color: white;}
a.btnaddmore:hover{color: white;}
a.btnaddmore:visited{color:white;} 
a.btnaddmore:active{color: white;}


.btncancel {
    background-color: #31317A;
    color: white;
}
a.btncancel:link{color: white;}
a.btncancel:hover{color: white;}
a.btncancel:visited{color:white;} 
a.btncancel:active{color: white;}

.btnsave {
    background-color: #0E0E2B;
    color: white;
}
input.btnsave:hover {
    background: transparent;
    background-color: #0E0E2B;
    color: white;  
}

.btnloginsave {
    background-color: #31317A;
    color: white;
}
input.btnloginsave:hover {
    background: transparent;
    background-color: #31317A;
    color: white;  
}

.signinlink {
    color: #31317A;
}
a.signinlink:link{color: #31317A;}
a.signinlink:hover{color: #31317A;}
a.signinlink:visited{color:#31317A;} 
a.signinlink:active{color: #31317A;}
/* end button color */







/* errors in view page */
#error_explanation{
    border: 1px solid red;
    background-color: #FFDFDF;
    margin-bottom: 10px;
    padding: 5px 10px;
}

#error_explanation h2{
    font-size: 14px;
    font-weight: bold;
}

#error_explanation ul, #error_explanation li{
    margin: 0px;
    padding: 0px;
    list-style-type: none;
    color: red;
    font-size: 13px;
}

.error{
    color: red;
}
/* end errors in view page */




/*sortable drag drop*/
#sortable1, #sortable2 {
    border: 1px solid #eee;
    width: 142px;
    min-height: 20px;
    list-style-type: none;
    margin: 0;
    padding: 5px 0 0 0;
    float: left;
    margin-right: 10px;
}

#sortable1 li, #sortable2 li {
    margin: 0 5px 5px 5px;
    padding: 5px 15px;
    font-size: 1.2em;
    width: 120px;
    background: #2E2E33;
    color: #FFF;
    text-align: center;
    border-radius: 5px;
}

#ajax_loader_big_div {
    display:none;
    height:auto;
    left:35%;
    position:fixed;
    top:40%;
    z-index:999999999999;
    padding: 10px 30px;
    background: #F1F1F1;
    border: 1px solid #111;
}


/*end sortable drag drop*/





/*responsive iframe*/
#signthis-document-viewer{
    width: 100%;
    height: 600px;
}

.document-reader img{
    border: 1px solid #CCC;
}
.page-number{
    margin-bottom: 20px;
}

.dragSigners, .dragMe{
    margin: 5px;
    padding: 5px;
    background: #2E2E33;
    color: #FFF;
    text-align: center;
    border-radius: 3px;
    cursor: move;
    font-family: Helvetica,Arial,sans-serif;
    font-size: 12px;
}
.dragSigners{
    z-index: 999;
}
.dragMe{
    position: relative;
}
.closeIt{
    background: #RRR;
    color: #111;
    padding: 0 2px;
    cursor: pointer;
}
/*end responsive iframe*/

/*table rows color*/
.even{background-color: #F5F5F5;}
/*end table rows color*/

.error{
    color: red;
    font-size: 12px;
}

#handwriting_scroll {
    height: 100px;
    position: relative;
    overflow: auto;
}

.signature-section{
    border-left: 1px solid blue;
    border-top: 1px solid blue;
    border-bottom: 1px solid blue;
    border-radius: 5px;
    padding: 5px;
}
.signature-section img{
    max-width: 75px;
}

.main-wrapper{
    max-height: 600px;
    overflow: auto;
}

.sidebar{
    position: fixed;
}

.document-content{
    position: relative;
    left: 325px;
}
.drop-area {
    background-color:#afd1b2;
}
.hideIt {
    visibility: hidden;
}


</style>

</head>

<body>




            
                      <div class="col-sm-12" id="draggable1">
                          <div class="row">
                            <div id="signer-1" class="col-sm-6 col-sm-6 dragMe dragSigners" data-signer-id="1" data-document-id="1">
                              <span>First</span>
                              <span class="closeIt hideIt">x</span>
                            </div>
                            
                            <div id="signer-2" class="col-sm-6 col-sm-6 dragMe dragSigners" data-signer-id="2" data-document-id="1">
                              <span>second</span>
                              <span class="closeIt hideIt">x</span>
                            </div>
                          </div>
                      </div>
              

               		<div class='document-reader' id="document-reader">
                          <div id='draggable-signature' class="fixed">
                            <img src="http://s24.postimg.org/8mwl7v1ud/image.png">
                            <div class="page-number">1</div>
                         </div>
                      </div>


