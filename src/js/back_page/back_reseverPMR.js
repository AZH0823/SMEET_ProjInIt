const app = Vue.createApp({
  data() {
      return {
          test:'',
          APIdata:{
          },
          popOnMsg:{
              isEdit:false,
          },
          popOnInsertMsg:{
              // dishName Type id price
              isAdd:false,
              intro:'',
              id:"",
              dishName:"",
              price:300,
              Type:7,
          },
          popOnSetDetail:{
              isDisplay:false,
              isEdit:false,
          }
      };
      },
      computed:{

      },
      methods:{
          // api start
          
          getSetPrice(){
              fetch('php/reserveAPI/getSetPriceAPI.php')
              .then(response =>{
                  return response.json();
              })
              .then( data =>{
                  // 將套餐資訊放入APIData (圖片,售價,ID...)
                  // console.log(data)
                  data.forEach(el => {
                      // console.log(el)
                      if(!this.APIdata.hasOwnProperty(`sets`)){
                              this.APIdata.sets = {};
                      }
                      if(this.APIdata.sets.hasOwnProperty(`set${el.id}`)){
                          this.APIdata[`set${el.id}`] = {};
                      }

                      this.APIdata.sets[`set${el.id}`] = el; 
                      // _this.$nextTick(function () {  
                      //     _this.OrderDetail = {...obj}
                      // });
                  });
                  this.getSetdishDetail();
              }).catch(err=>{
                  console.log(err)
              })
          },

          // 取得套餐內商品資訊 及 服務資訊
          getSetdishDetail(){
              fetch('php/backpage/back_setAPI.php')
              .then(function(response) {
                  return response.json();
              })
              .then((res)=>{
                
                  res.forEach(data => {
                      // 單品 
                      if(data.SetID == null && data.dishType =="服務"){
                          // this.APIdata.other
                          // console.log(data)
                          if(this.APIdata.serve == undefined){
                              this.APIdata.serve =[];
                          }
                          this.APIdata.serve.push(data);
                      }else{
                            // 塞A,B,C 套餐資訊
                          
                          if(!this.APIdata.sets[`set${data.SetID}`].hasOwnProperty(`dish`)){
                              this.APIdata.sets[`set${data.SetID}`][`dish`] = {};
                          }
                          // console.log(data.dishType)
                          if(!this.APIdata.sets[`set${data.SetID}`].dish.hasOwnProperty(`${data.dishType}`)){
                              this.APIdata.sets[`set${data.SetID}`].dish[`${data.dishType}`] =[];
                          }
                          this.APIdata.sets[`set${data.SetID}`].dish[`${data.dishType}`].push(data);
                      }
                      
                  })
                  
              }).catch(error=>{
                  console.log(error)
              });
          },

            // 取得單點商品資訊
          getOtherDish(){
              fetch('php/backpage/back_getOtherdish.php')
                  .then(response =>{
                      return  response.json();
                  })
                  .then( data =>{
                      const _this = this
                      // console.log(data)
                      let temp = []
                      if(this.APIdata.other == undefined){
                              this.APIdata.other =[];
                      }
                      data.forEach((data_el)=>{  
                          // console.log(data_el.price)
                          let obj={
                              id:data_el.id,
                              dishName:data_el.disName,
                              dishType:data_el.dishType,
                              price:data_el.price,
                              Condition:parseInt(data_el.Condition) 
                          }
                          temp.push(obj);
                      
                      })  
                        _this.APIdata.other = temp
                      
                  }).catch(err=>{
                      console.log(err)
                  })
          },
          // 取的食物種類編號,insert 資料會需要
          getDishTypeInfo(){
              const _this = this;
          
              fetch('php/backpage/back_getDishType.php')
                  .then(response =>{
                      return  response.json();
                  })
                  .then( data =>{

                      if(!_this.APIdata.hasOwnProperty('DishType')){
                          _this.APIdata.DishType = []
                      }
                      _this.APIdata.DishType.push(...data)
                          
                  }).catch(err=>{
                      console.log(err)
                  })
          },

          // 單品及服務Condition Update
          updateOrderDishCondition(item){
              // console.log(item)
              $.ajax({
                  method: "POST",
                  url: "php/backpage/updateOrderDishCondition.php",
                  data: {
                      MSG:"",
                      ID:item.id,
                      Condition:parseInt(item.Condition)
                  },
                  dataType: "text",
                  success: function (response) {
                      // console.log(response)
                  },
                  error: function (exception) {
                      alert("發生錯誤: " + exception.status);
                  }
              });
          },

          // 單品跟服務詳細更新
          updateOrderDishDetial(msg,item){
              const _this = this;
              // console.log('msg',msg)
              // console.log('item',item)
              $.ajax({
                  method: "POST",
                  url: "php/backpage/updateOrderDishCondition.php",
                  data: {
                      MSG:msg,
                      ID:item.id,
                      Name:item.dishName,
                      Condition:parseInt(item.Condition),
                      price:item.price
                  },
                  dataType: "text",
                  success: function (response) {
      
                      if(response ='sucessful'){
                          // 改變 Vue 塞回原本API資料內
                          // console.log(`aa`)
                          for(key in _this.APIdata){ 
                              if(key === "other" || key === "serve"){
                                  // console.log(key,_this.APIdata[key]);
                                  _this.APIdata[key].forEach((el)=>{
                                      if(el.id === item.id){
                                          el.dishName = item.dishName
                                          el.price =item.price
                                          el.Condition = parseInt(item.Condition) 
                                      }
                                  })
                              }
                          }
                          alert(`資料更新成功`)
                      }
                  },
                  error: function (exception) {
                      alert("發生錯誤: " + exception.status);
                  }
              });
          },
          
          updateSetDatail(filterdata){
              // console.log(updatePopDetailData)
              const _this = this;

              // 取的上傳團片的圖聘資料內容
              let files = _this.$refs.SetIMGInput.files[0];

              // 傳過要編輯的套餐菜品
              // console.log(filterdata)
              if(filterdata.length == 0){
                  filterdata='NoSetDishIsEditData';    
              }

                // 更新上傳圖片
                if(files !==undefined && files !== null){
                  let formData = new FormData();
                  formData.append('ProductImage',files);
                  formData.append('ID',parseInt(_this.popOnSetDetail.id));
                  
                  // console.log('update SetID: ',formData.getAll('ProducIDtImage'))
          
                  $.ajax({            
                      method: "POST",
                      url: "php/backpage/back_SetimageUpload.php",
                      data: formData,
                      // 告訴jQuery不要去處理發送的資料
                      processData : false, 
                      // 告訴jQuery不要去設定Content-Type請求頭
                      contentType : false,   
                      dataType: "text",
                      success: function (response) {
                          // console.log(response);
                          _this.popOnSetDetail.IMG = response;
                          // location.href = 'Product.html';
                      },
                      error: function(exception) {
                          alert("發生錯誤: " + exception.status);
                      }
                  });  
              }

              // 編輯修改菜單及菜品
              $.ajax({
                  method: "POST",
                  url: "php/backpage/updateSetDatail.php",
                  data: {
                      ID:parseInt(_this.popOnSetDetail.id),
                      SetName:_this.popOnSetDetail.setName,
                      SetPrice:parseInt(_this.popOnSetDetail.price),
                      DishData:filterdata
                      // IMG:updatePopDetailData.IMG
                  },
                  dataType: "text",
                  success: function (response) {
                      
                      if(response =="Sucessful"){
                          // 更新菜單資訊
                          _this.popOnSetDetail.setName = _this.$refs.setName.value;
                          _this.popOnSetDetail.price = _this.$refs.setPrice.value;
                          // 更新APIData
                          _this.APIdata.sets[`set${_this.popOnSetDetail.id}`].setName = _this.popOnSetDetail.setName;
                          _this.APIdata.sets[`set${_this.popOnSetDetail.id}`].price = _this.popOnSetDetail.price;
                          
                          for(const key in _this.popOnSetDetail.dish){
                              _this.popOnSetDetail.dish[key].forEach((el)=>{
                                  if(el.isEdit == true ){
                                      el.isEdit = false;
                                      // console.log('把原本有編輯中資料給取消',el)
                                  } 
                              })
                          }
                          alert('資料更新完成')
                          // console.log(response)
                      }else{
                          console.log(response);
                      }
                  },
                  error: function (exception) {
                      alert("發生錯誤: " + exception.status);
                  }
              });

              

          },
          // 新單多筆筆套餐餐點
          insertNewSetDatail(insertList){
              // console.log(`ajax`,insertList)
              const _this = this;
              if(insertList.length == 0 ){
                  insertList = 'NoSetDishIsUpdateSData'
              }
              // console.log(insertList)
              $.ajax({
                  method: "POST",
                  url: "php/backpage/insertNewSetDatail.php",
                  data: {
                      data:insertList
                  },
                  dataType: "text",
                  success: function (response) {     
                      _this.getSetPrice();                  
                  },
                  error: function (exception) {
                      alert("發生錯誤: " + exception.status);
                  }
              });
          },
          // 新增一筆服務或單品
          insertDish(item){
              // console.log(item.intro)
              const _this = this;
              let introStr = item.intro ==undefined ? null : item.intro.trim()
          
              $.ajax({
                  method: "POST",
                  url: "php/backpage/insertOrderDish.php",
                  data: {
                      MSG:'oneData',
                      dishName:item.dishName,
                      price:item.price,
                      Type:item.Type,
                      Introduction: introStr
                  },
                  dataType: "text",
                  success: function (response) {
                      // console.log(response);
                      if(!isNaN(response)){
                          // console.log(`新筆餐點ID為: ${response}`)
                          _this.popOnInsertMsg.id = parseInt(response);
                          
                          // 將資料料塞回APIdata
                          let temp={
                              Condition:1,
                              Introduction:introStr,
                              SetID:null,
                              dishName:item.dishName,
                              id: parseInt(response),
                              price:item.price
                          }
                          if(item.Type == 7){
                              // 單品
                              temp.dishType = "單品";
                              _this.APIdata.other.push(temp)
                              // console.log( 'other',_this.APIdata.other)
                          }else{
                              // 服務
                              temp.dishType = "服務";
                              _this.APIdata.serve.push(temp)
                              // console.log( 'serve',_this.APIdata.serve)
                          }
                          // console.log("整理好的物件",temp)
                          alert(`${item.dishName}資料更新成功`)
                          setTimeout(()=>{
                              _this.popOnInsertMsg.isAdd = false;
                          },800)
                      }
                  },
                  error: function (exception) {
                      alert("發生錯誤: " + exception.status);
                  }
              });
          },

          getNowDishMax(){
              const _this = this
              $.ajax({
                      method: "POST",
                      url: "php/backpage/back_getDishMaxPKValue.php",
                      data: {},
                      dataType: "text",
                      success: function (res) {
                      
                          if(!_this.APIdata.hasOwnProperty('nowPKnum')){
                              _this.APIdata.nowPKnum = parseInt(res) 
                              // console.log('現在最大ID為:',_this.APIdata.nowPKnum) 
                          }else{
                              _this.APIdata.nowPKnum = parseInt(res)                                
                              // console.log('第二次以後,現在最大ID為:',_this.APIdata.nowPKnum) 
                          }
                      },
                      error: function (exception) {
                          alert("發生錯誤: " + exception.status);
                      }
              });    
          },
          // api end
          
          // 單品,服務物品上下架
          changeCondtion(dish,e){
              // console.log(e);
              if(window.confirm('是否要更商品狀態?')){
                  if(dish.Condition ==1){
                      dish.Condition = 0;
                  }else{
                      dish.Condition = 1;
                  } 
                  // updata  Condition API
                  this.updateOrderDishCondition(dish);
              }else{
                  e.target.checked = parseInt(dish.Condition); 
              }
          },
          
          // 新增單品及服務
          popOnInsert(){
              // this.popOnInsertMsg={};
              this.popOnInsertMsg.dishName=""
              this.popOnInsertMsg.price = 300
  
              this.popOnInsertMsg.isAdd = true;
              
              document.querySelector('body').style.overflow = "hidden"
          },
          // 編輯單品及服務
          popOnEdit(item){
              this.popOnMsg={};
              this.popOnMsg.isEdit= true;
              
              document.querySelector('body').style.overflow = "hidden"
              
              this.popOnMsg.id = item.id;
              this.popOnMsg.dishName = item.dishName;

              this.popOnMsg.price = parseInt(item.price);
              this.popOnMsg.Condition = parseInt(item.Condition);
          },
          closePopOn(){
              if(this.popOnSetDetail.isDisplay){
                  // 清除 新增卻沒有Insert的菜品
                  for(const key in this.popOnSetDetail.dish){
                      this.popOnSetDetail.dish[key].forEach((el,idx)=>{
                          if(el.isEdit && el.id > this.APIdata.nowPKnum){
                              this.popOnSetDetail.dish[key].splice(idx, 1);
                              
                              // console.log(`upadate`,el)
                              // console.log(`el index: `,idx)
                          }
                      })                                  
                  }
              }
              
              // Reset Pop Data
              this.popOnMsg.isEdit = false;
              this.popOnInsertMsg.isAdd = false;
              this.popOnSetDetail.isDisplay = false;
              document.querySelector('body').style.overflow = "auto";   
              
              
          },
          clickSaveToInsert(){
              
              if(window.confirm('有想要更新此筆資料嗎?') ){
                  if(this.popOnInsertMsg.dishName.trim().length > 0){
                      this.insertDish(this.popOnInsertMsg);
                  }else{
                      alert('請輸入品項名,種類,價格皆不得為空值');
                  }
                  
              }else{
                  this.popOnInsertMsg.id="";
                  this.popOnInsertMsg.dishName="";
                  this.popOnInsertMsg.Type=7;
                  this.popOnInsertMsg.price =300;

              }
          },
          // 單品或服務Pop 儲存點擊
          clickSaveToUpdate(item){
              //  console.log('beforeValue',item);

              if(this.$refs.os_DishName.value.trim() !== '' &&
                  this.$refs.os_Price.value.trim() !== '' &&
                  this.$refs.os_Condtion.value.trim() !== ''){
                      if(window.confirm('有想要更新此筆資料嗎?')){

                  
                  
                      this.popOnMsg.id = item.id;

                      this.popOnMsg.dishName = this.$refs.os_DishName.value;
                      this.popOnMsg.price = parseInt(this.$refs.os_Price.value);
                      this.popOnMsg.Condition = parseInt(this.$refs.os_Condtion.value) ;


                      // Ajax 更新資料庫
                      this.updateOrderDishDetial('DishDetailUpdate',this.popOnMsg);
                      } else{
                  
                          // 不儲存就回到原來參數
                          
                          this.$refs.os_DishName.value =  item.dishName;
                          this.$refs.os_Condtion.value = parseInt(item.Condition);
                          this.$refs.os_Price.value = item.price;
                      } 
              }else{
                  alert('資料不得為空值')
              }
                                    
          },

          // 編輯套餐資訊
          popOnEditSetDatail(set){
              // console.log(`aa`)
              this.popOnSetDetail = {}
              this.popOnSetDetail.isDisplay = true;
              this.popOnSetDetail.isEdit = false;

              document.querySelector('body').style.overflow = "hidden";

              // console.log(set);
              // 把值給PopOnSet
              this.popOnSetDetail.id = set.id;
              this.popOnSetDetail.setName = set.setName;
              this.popOnSetDetail.price = set.price;
              this.popOnSetDetail.setName = set.setName;
              this.popOnSetDetail.IMG = set.IMG;
              this.popOnSetDetail.dish = set.dish;
              
              // 
              for(let type in  this.popOnSetDetail.dish){
                  this.popOnSetDetail.dish[type].forEach(_dish=>{
                      // console.log(_dish)
                      _dish.isEdit = false
                  })
              } 

              this.getNowDishMax();
              // console.log( this.popOnSetDetail)
              // isDisplay:false,
              // isEdit:false,
          },
          // 套餐按下編輯菜單
          editSet(){
              if( this.popOnSetDetail.isEdit){ 
                  // ref="setName"
                  // ref="setPrice"
                  // ref="setIMG"
                  if(window.confirm(`要儲存套餐新設定嗎?`) && 
                      this.$refs.setName.value.trim() !=='' && 
                      this.$refs.setPrice.value.trim() !=='' ){
                      
                      this.$refs.editSet.innerHTML =`編輯菜單`; 
                      this.popOnSetDetail.isEdit =false;

                      // 套資訊
                      this.popOnSetDetail.setName = this.$refs.setName.value;
                      this.popOnSetDetail.price = this.$refs.setPrice.value;

                      // 單品資訊有要更改資套餐菜品
                      let upateDishDetailList = []
                      let insertDishDetailList = []
                      let vaild = true 
                      for(const key in this.popOnSetDetail.dish){
                          this.popOnSetDetail.dish[key].forEach((el)=>{
                              if(el.isEdit && el.id <= this.APIdata.nowPKnum){
                                  // :ref="'name_' + dish.id">  品名
                                  // :ref="'condition_' + dish.id"> 上下架
                                  el.Condition = parseInt(this.$refs[`condition_${el.id}`][0].value);
                                  if(this.$refs[`name_${el.id}`][0].value.trim() ==''){
                                      vaild = false
                                  }
                                  el.dishName = this.$refs[`name_${el.id}`][0].value;

                                  // 要更新的菜單
                                  upateDishDetailList.push(el)
                              }else if(el.isEdit && el.id > this.APIdata.nowPKnum){
                                  el.Condition = parseInt(this.$refs[`condition_${el.id}`][0].value);
                                  if(this.$refs[`name_${el.id}`][0].value.trim() ==''){
                                      vaild = false
                                  }
                                  el.dishName = this.$refs[`name_${el.id}`][0].value;

                                  // 要更新的菜單 新增菜單
                                  insertDishDetailList.push(el)
                                  // console.log(`upadate`,el)
                              }
                          })                                  
                      }
                      if(!vaild){
                          alert('新增及更新套餐菜品名不得為空值')
                      }else{
                          // 新增菜品
                          this.insertNewSetDatail(insertDishDetailList);
                          // 編輯菜品
                          this.updateSetDatail(upateDishDetailList);     
                      }
                      
                      
                  }else{
                      if( this.$refs.setName.value.trim() ==='' ||
                      this.$refs.setPrice.value.trim() ==='') alert('資料不得為空值')
                      // 帶回之前的值
                      this.$refs.setName.value = this.popOnSetDetail.setName;
                      this.$refs.setPrice.value =  this.popOnSetDetail.price;

                      
                      // 帶回之前菜品的值
                      for(const key in this.popOnSetDetail.dish){
                          this.popOnSetDetail.dish[key].forEach((el)=>{
                              if(el.isEdit && el.id <= this.APIdata.nowPKnum){
                                  //    :ref="'name_' + dish.id">  品名
                                  //    :ref="'condition_' + dish.id"> 上下架
                                  this.$refs[`condition_${el.id}`][0].value = parseInt(el.Condition);
                                  this.$refs[`name_${el.id}`][0].value = el.dishName;
                              }else if(el.isEdit && el.id > this.APIdata.nowPKnum){

                                  this.$refs[`condition_${el.id}`][0].value = parseInt(el.Condition);
                                  this.$refs[`name_${el.id}`][0].value =  el.dishName;
                              }
                          })                                  
                      }
                  }
                  
              }else{
                  // console.log(`bb`)
                  if(window.confirm(`確定要編輯此套餐嗎?`)){
                      this.popOnSetDetail.isEdit =true;
                      this.$refs.editSet.innerHTML =`存檔菜單`; 
                      // console.log(`aqq`)
                  }else{
                      for(const key in this.popOnSetDetail.dish){
                          this.popOnSetDetail.dish[key].forEach((el)=>{
                              if(el.isEdit){
                                  el.isEdit = false;
                              }
                          })                                  
                      }
                  }
              }
          },
          // 點擊套餐編輯按鍵
          clickSetDishDetail(_dish){        
              // console.log(_dish)               
              if(!_dish.isEdit && this.popOnSetDetail.isEdit){
                  _dish.isEdit = true;
              }else{
                  _dish.isEdit = false;
              }
          },
          // 套餐圖片上傳整理
          updateSetIMG(e){
              // const that = this
              // var formData = new FormData();
              // let files = this.$refs.SetIMGInput.files[0];
              // let ID = this.popOnSetDetail.id;
              
              // formData.append('ProductImage',files);
              // formData.append('ID',ID);
              // // console.log(files)
              // // console.log(formData)
              // // console.log('update SetID: ',formData.getAll('ProducIDtImage'))
          

              // // 發給後端PHP
              // $.ajax({            
              //     method: "POST",
              //     url: "php/backpage/back_SetimageUpload.php",
              //     data: formData,
              //     // 告訴jQuery不要去處理發送的資料
              //     processData : false, 
              //     // 告訴jQuery不要去設定Content-Type請求頭
              //     contentType : false,   
              //     dataType: "text",
              //     success: function (response) {
              //         // console.log(response);
              //         that.popOnSetDetail.IMG = response;
              //         // location.href = 'Product.html';
              //     },
              //     error: function(exception) {
              //         alert("發生錯誤: " + exception.status);
              //     }
              // });  
          },
          // 點擊套餐菜色新增 " + " ICON圖示
          clickInsertSetDish(type,setID){
              if(this.popOnSetDetail.isEdit){
                  // console.log('this is:',type)
                  this.getNowDishMax(type,setID)
                  if(window.confirm(`想要新增一筆資料在${type}嗎?`)){
                      // console.log(`append Data in ${type},setID:${setID}`)
                      let _typeID;
                      this.APIdata.DishType.forEach((el)=>{
                          // console.log(el)
                          if(el.dishTypeName == type){
                              _typeID = el.dishTypeID
                          }
                      })

                      if(!this.APIdata.hasOwnProperty('maxPKnum')){
                          this.APIdata.maxPKnum = parseInt(this.APIdata.nowPKnum);
                      }
                      
                      let obj = {
                          Condition:0,
                          Introduction:null,
                          SetID:setID,
                          dishName:"",
                          dishType:`${type}`,
                          dishTypeID:_typeID,
                          id: parseInt(this.APIdata.maxPKnum)+ 1,
                          isEdit:true,
                          price:0,
                      };
                      this.APIdata.maxPKnum++;

                      // 新增一個空的菜品套餐裡
                      this.popOnSetDetail.dish[type].push(obj)
                  }
              }
          },
          search(){
              const _this = this;
              let search_name = this.$refs.search_name.value.trim();
              if(search_name !==''){
                  $.ajax({
                  method: "POST",
                  url: "php/backpage/back_reserveProductManger_search.php",
                  data: {
                      search_name : search_name
                  },
                  dataType: "json",
                  success: (response) => {
                      if(response == "無資料"){
                            this.APIdata.serve = [];
                            this.APIdata.other = [];
                          // return;
                      }else{
                          this.APIdata.serve = [];
                          this.APIdata.other = [];
                          // console.log(response);
                          // this.product = response ;
                          response.forEach(data=>{
                              if(data.dishType =='服務'){
                                  this.APIdata.serve.push(data)
                              }else if(data.dishType =='單品'){
                                  this.APIdata.other.push(data)
                                  
                              }
                          })
                          
                      }
                  },
                  error: function (exception) {
                      alert("數據載入失敗: " + exception.status);
                  }
              });
              }else{
                  _this.getSetPrice();
                  _this.getOtherDish();
              }
              
          }
      },

      mounted(){
          this.getSetPrice();
          this.getOtherDish();
          this.getDishTypeInfo();
          // this.getSetdishDetail();
      }
  });
app.mount("#reserve_producetManger");