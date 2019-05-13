/*
*@Name: 
*@Author: xuzhiwen
*@Copyright:layui.com
*/

layui.define(['layer'],function(exports){
	var layer = layui.layer;
	
var car = {
  init : function(){
  		var uls = document.getElementById('list-cont').getElementsByTagName('ul');//每一行
  		 window.sessionStorage.setItem("shoppingCartCount",uls.length);
  		var checkInputs = document.getElementsByClassName('check'); // 所有勾选框
      var checkAll = document.getElementsByClassName('check-all'); //全选框
      var SelectedPieces = document.getElementsByClassName('Selected-pieces')[0];//总件数
      var piecesTotal = document.getElementsByClassName('pieces-total')[0];//总价
      var batchdeletion = document.getElementsByClassName('batch-deletion')[0]//批量删除按钮
      //计算
      function getTotal(){
          var seleted = 0,price = 0;
          for(var i = 0; i < uls.length;i++){
        			if(uls[i].getElementsByTagName('input')[0].checked){
                seleted += parseInt(uls[i].getElementsByClassName('Quantity-input')[0].value);
                price += parseFloat(uls[i].getElementsByClassName('sum')[0].innerHTML);
              }
      		}
          SelectedPieces.innerHTML = seleted;
          piecesTotal.innerHTML = '￥' + price.toFixed(1);
      }

      // 小计
      function getSubTotal(ul){
        var unitprice = parseFloat(ul.getElementsByClassName('th-su')[0].innerHTML);//单价
        var count = parseInt(ul.getElementsByClassName('Quantity-input')[0].value); //数量
        var SubTotal = parseFloat(unitprice*count); //小计
        ul.getElementsByClassName('sum')[0].innerHTML = SubTotal.toFixed(1);
      }

      for(var i = 0;i < checkInputs.length;i++){
        checkInputs[i].onclick = function(){
          if(this.className === 'check-all check'){
            for(var j = 0;j < checkInputs.length; j++){
              checkInputs[j].checked = this.checked;
            }
          }
          if(this.checked == false){
            for(var k = 0;k < checkAll.length;k++){
              checkAll[k].checked = false;
            }
          }
          getTotal()
        }
      }

      for(var i = 0; i < uls.length;i++){
        uls[i].onclick = function(e){
          e = e || window.event;
          var el = e.srcElement;
          var cls = el.className;
          var input = this.getElementsByClassName('Quantity-input')[0];
          var less = this.getElementsByClassName('less')[0];
          var val = parseInt(input.value);
          var that = this;
          var bookId =  $(input).attr("bookId");
          switch(cls){
            case 'add layui-btn':
              input.value = val + 1;
              window.location.href="shoppingCart_updateCount.action?bookCount="+input.value+"&bookId="+bookId;
              getSubTotal(this)
              break;
            case 'less layui-btn':
              if(val > 1){
                input.value = val - 1;
                var bookId =  $(input).attr("bookId");
                window.location.href="shoppingCart_updateCount.action?bookCount="+input.value+"&bookId="+bookId;
              }
              getSubTotal(this)
              break;
            case 'dele-btn':
              layer.confirm('你确定要删除吗',{
                yes:function(index,layero){
                  layer.close(index)
                  window.location.href="shoppingCart_deleteItem.action?bookId="+bookId;
                  that.parentNode.removeChild(that);
                }
              })
              break;
          }
          getTotal()
        }
      }
      batchdeletion.onclick = function(){
        if(SelectedPieces.innerHTML != 0){
          layer.confirm('你确定要删除吗',{
            yes:function(index,layero){
              layer.close(index)
               var bookIDs = []; 
              for(var i = 0;i < uls.length;i++){
                var input = uls[i].getElementsByTagName('input')[0];
                if(input.checked){
                	var bookID = $(input).attr("bookID");
                	bookIDs.push(bookID);
                  uls[i].parentNode.removeChild(uls[i]); 
                  i--;
                }
              }
              var params = $.param({'bookIDs':bookIDs},true);
          	  var url = 'shoppingCart_batchDeleteItem.action';
              $.ajax({
  		        url : url,
  		        data: params,
  		        cache : false, 
  		        async : false,
  		        type : "POST",
  		        dataType : 'json',
               });
              getTotal() 
              window.location.href="shoppingCart_shoppingCartUI.action";
            }

          })
        }else{
          layer.msg('请选择商品')
        }
        
      }
        checkAll[0].checked = true;
        checkAll[0].onclick();
  	  }  	

  }


  exports('car',car)
}); 