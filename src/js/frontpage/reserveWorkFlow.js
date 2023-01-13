const RootComponent  = {
    data(){
        return{
            // 控制流程
            workFlow:{
                step:1,
            },
            
            // sets (( 暫時存放資料處 ))
            InputSetDetail:[],
            // cardname:'',
            cards:[
                {},
                {},
                {},
                {}
            ],
            // 使用者訂單建立
            inputData:{
                // 取得會員是否登入
                isLogin:false,

                // step 1 user Data
                // 第一階段使用者所有的資訊(已經LocalStroage 儲存完畢)
                // 以下唯接收的資料型態
                agress:true,
                sets:1,
                peoCount:5,
                date:new Date().toISOString().slice(0,10),
                orderTime:2,
                chefTeam:"A",

                
                // step 2 user Data
                // 將資料儲存於APIDATA
                setsList:[

                ],
                // step 3 user Data
                // 將資料儲存於APIDATA
                otherDish:[

                ],
                // 服務尚未儲存
                // step 4 user Data
                otherServies:[

                ],
                // 預約資料
                name:'',
                phone:'',
                email:'',
                addr:'',
                note:'',
                point:0,

                // 信用卡
                cardName:'',
                cardDate:0,
                cardCode:0,

                
            },
            APIData_in:{
                // 訂餐時間
                orderTime:[
                    {id:1,txt:'午餐',time:'11:00-14:00'},
                    {id:2,txt:'下午茶',time:'11:00-14:00'},
                    {id:3,txt:'晚餐',time:'18:00-21:00'},
                ], 
                // 套餐資料
                sets:[
                    {   
                        dish:{
                            "湯物":[],"前菜":[],"刺身":[],
                             "主食":[],"甜點":[],"飲品":[]                              
                        } 
                    },
                    {
                        dish:{
                            "湯物":[],"前菜":[],"刺身":[],
                             "主食":[],"甜點":[],"飲品":[]                              
                        } 
                    }, {
                        dish:{
                            "湯物":[],"前菜":[],"刺身":[],
                             "主食":[],"甜點":[],"飲品":[]                              
                        } 
                    },
                ],
                // 廚師團隊
                chefTeam:[],
                // 單點菜品
                otherDish:[],
                // 租借及服務
                servies:[],
                // 會員資訊 進入第 4 流程會取得此資料
                member:{
                    id:1,point:330,isLogin:true
                }, 
            },



            // Backup
            APIData:{
                // 訂餐時間
                orderTime:[
                    {id:1,txt:'午餐',time:'11:00-14:00'},
                    {id:2,txt:'下午茶',time:'11:00-14:00'},
                    {id:3,txt:'晚餐',time:'18:00-21:00'},
                ], 
                // 套餐資料
                sets:[
                    {
                        id:1,
                        setName:'名物 私套餐',
                        setprice:1800, // 每人單價
                        imgUrl:'img/reserve_img/reserve_set01.jpg',
                        dish:{
                            "湯物":[
                                {id:1,dishName:'奶香牛肝菌野菇濃湯-A',qty:0,dishType:'湯物'},
                                {id:2,dishName:'石斑海鮮清湯-A',qty:0,dishType:'湯物'},
                            ],
                            "前菜":[
                                {id:3,dishName:'燻鮭魚番茄佐優格醬-A',qty:0,dishType:'前菜'},
                                {id:4,dishName:'深海魚皮野蔬沙拉佐醋醬-A',qty:0,dishType:'前菜'},
                            ],
                            "刺身":[
                                {id:5,dishName:'大間本鮪中腹、秋鮭、貝類、牡丹蝦-A',qty:0,dishType:'刺身'},
                            ],
                            "主食":[
                                {id:6,dishName:'嫩煎干貝佐松露菲力-A',qty:0,dishType:'主食'},
                                {id:7,dishName:'日本小田和牛壽喜燒-A',qty:0,dishType:'主食'},
                                {id:8,dishName:'龍蝦佐鮑魚海鮮拼盤-A',qty:0,dishType:'主食'},
                            ],
                            "甜點":[
                                {id:9,dishName:'抹茶布丁搭配綿密金時紅豆-A',qty:0,dishType:'甜點'},
                                {id:10,dishName:'栗子羊羹-A',qty:0,dishType:'甜點'},
                                {id:11,dishName:'抹茶海鹽奶蓋-A',qty:0,dishType:'甜點'},
                            ],
                            "飲品":[
                                {id:12,dishName:'春手毬和菓子-A',qty:0,dishType:'飲品'},
                                {id:13,dishName:'烘焙曼巴咖啡-A',qty:0,dishType:'飲品'},
                                {id:14,dishName:'烘焙曼巴咖啡-A',qty:0,dishType:'飲品'},                                
                                {id:15,dishName:'高山金萱茶-A',qty:0,dishType:'飲品'},                                
                                {id:16,dishName:'檸檬海鹽氣泡飲-A',qty:0,dishType:'飲品'},
                            ]                              
                        }
                        
                    },
                    {
                        id:2,setName:'極上 會席套餐',
                        setprice:3200, // 每人單價
                        imgUrl:'img/reserve_img/reserve_set02.jpg',
                        dish:{
                            
                            '湯物':[
                                {id:17,dishName:'奶香牛肝菌野菇濃湯-B',qty:0,dishType:'湯物'},
                                {id:18,dishName:'石斑海鮮清湯-B',qty:0,dishType:'湯物'},
                            ],
                            '前菜':[
                                {id:19,dishName:'燻鮭魚番茄佐優格醬-B',qty:0,dishType:'前菜'},
                                {id:20,dishName:'深海魚皮野蔬沙拉佐醋醬-B',qty:0,dishType:'前菜'},
                            ],
                            '刺身':[
                                {id:21,dishName:'大間本鮪中腹、秋鮭、貝類、牡丹蝦-B',qty:0,dishType:'刺身'},
                            ],
                            '主食':[
                                {id:22,dishName:'嫩煎干貝佐松露菲力-B',qty:0,dishType:'主食'},
                                {id:23,dishName:'日本小田和牛壽喜燒-B',qty:0,dishType:'主食'},
                                {id:24,dishName:'龍蝦佐鮑魚海鮮拼盤-B',qty:0,dishType:'主食'},
                            ],
                            '甜點':[
                                {id:25,dishName:'抹茶布丁搭配綿密金時紅豆-B',qty:0,dishType:'甜點'},
                                {id:26,dishName:'栗子羊羹-B',qty:0,dishType:'甜點'},
                                {id:27,dishName:'抹茶海鹽奶蓋-B',qty:0,dishType:'甜點'},
                            ],
                            '飲品':[
                                {id:28,dishName:'春手毬和菓子-B',qty:0,dishType:'飲品'},
                                {id:29,dishName:'烘焙曼巴咖啡-B',qty:0,dishType:'飲品'},
                                {id:30,dishName:'烘焙曼巴咖啡-B',qty:0,dishType:'飲品'},                                
                                {id:31,dishName:'高山金萱茶-B',qty:0,dishType:'飲品'},                                
                                {id:32,dishName:'檸檬海鹽氣泡飲-B',qty:0,dishType:'飲品'},
                            ]                                       
                        }
                    },
                    {
                        id:3,setName:'苑 春堂套餐',
                        setprice:4600 , // 每人單價
                        imgUrl:'img/reserve_img/reserve_set03.jpg',
                        dish:{
                            '湯物':[
                                {id:33,dishName:'奶香牛肝菌野菇濃湯-C',qty:0,dishType:'湯物'},
                                {id:34,dishName:'石斑海鮮清湯-C',qty:0,dishType:'湯物'},
                            ],
                            
                            '前菜':[
                                {id:35,dishName:'燻鮭魚番茄佐優格醬-C',qty:0,dishType:'前菜'},
                                {id:36,dishName:'深海魚皮野蔬沙拉佐醋醬-C',qty:0,dishType:'前菜'},
                            ],

                            '刺身':[
                                {id:37,dishName:'大間本鮪中腹、秋鮭、貝類、牡丹蝦-C',qty:0,dishType:'刺身'},
                            ],

                            '主食':[
                                {id:38,dishName:'嫩煎干貝佐松露菲力-C',qty:0,dishType:'主食'},
                                {id:39,dishName:'日本小田和牛壽喜燒-C',qty:0,dishType:'主食'},
                                {id:40,dishName:'龍蝦佐鮑魚海鮮拼盤-C',qty:0,dishType:'主食'},
                            ],
                            
                            '甜點':[
                                {id:41,dishName:'抹茶布丁搭配綿密金時紅豆-C',qty:0,dishType:'甜點'},
                                {id:42,dishName:'栗子羊羹-C',qty:0,dishType:'甜點'},
                                {id:43,dishName:'抹茶海鹽奶蓋-C',qty:0,dishType:'甜點'},
                            ],

                            '飲品':[
                                {id:44,dishName:'春手毬和菓子-C',qty:0,dishType:'飲品'},
                                {id:45,dishName:'烘焙曼巴咖啡-C',qty:0,dishType:'飲品'},
                                {id:46,dishName:'烘焙曼巴咖啡-C',qty:0,dishType:'飲品'},                                
                                {id:47,dishName:'高山金萱茶-C',qty:0,dishType:'飲品'},                                
                                {id:48,dishName:'檸檬海鹽氣泡飲-C',qty:0,dishType:'飲品'}, 
                            ],                             
                        }
                    }
                ],
                // 廚師團隊
                chefTeam:[
                    {id:1,team:'A',name:'麗燕山'},
                    {id:2,team:'B',name:'吳寶劍'},
                    {id:3,team:'C',name:'陳平安'}
                ],

                // 單點菜品
                otherDish:[
                    {id:46,dishName:'黑鮪刺身',price:1000,qty:0,dishType:'單品'},
                    {id:47,dishName:'廣島牡蠣釜飯',price:750,qty:0,dishType:'單品'},
                    {id:48,dishName:'蘆筍蝦手捲',price:600,qty:0,dishType:'單品'},                                
                    {id:49,dishName:'大閘蟹握壽司',price:650,qty:0,dishType:'單品'},                                
                    {id:50,dishName:'和牛蕈菇釜飯',price:700,qty:0,dishType:'單品'}, 
                ],
                
                // 租借及服務
                servies:[
                    {id:1,title:'廚具',desc:'盤子、餐具、餐巾(必選)',checked:true,price:300},
                    {id:2,title:'炊具',desc:'鍋碗瓢盆(必選)',checked:true,price:300},
                    {id:3,title:'餐盤',desc:'餐盤&拼盤',checked:false,price:400},
                    {id:4,title:'服務人員',desc:'全程服務及售後清潔',checked:false,price:500},
                ],
                // 會員資訊 進入第 4 流程會取得此資料
                member:{
                    id:1,point:330,isLogin:true
                },
                // 套餐詳細選項(舊版Data 先備份)
                setsDetail:{
                    setA:{
                        dish:[
                            // {id:1,dishName:'奶香牛肝菌野菇濃湯-A',qut:0,dishType:'湯物'},
                            // {id:2,dishName:'石斑海鮮清湯-A',qut:0,dishType:'湯物'},
                            // {id:3,dishName:'燻鮭魚番茄佐優格醬-A',qut:0,dishType:'前菜'},
                            // {id:4,dishName:'深海魚皮野蔬沙拉佐醋醬-A',qut:0,dishType:'前菜'},
                            // {id:5,dishName:'大間本鮪中腹、秋鮭、貝類、牡丹蝦-A',qut:0,dishType:'刺身'},
                            // {id:6,dishName:'嫩煎干貝佐松露菲力-A',qut:0,dishType:'主食'},
                            // {id:7,dishName:'日本小田和牛壽喜燒-A',qut:0,dishType:'主食'},
                            // {id:8,dishName:'龍蝦佐鮑魚海鮮拼盤-A',qut:0,dishType:'主食'},
                            // {id:9,dishName:'抹茶布丁搭配綿密金時紅豆-A',qut:0,dishType:'甜點'},
                            // {id:10,dishName:'栗子羊羹-A',qut:0,dishType:'甜點'},
                            // {id:11,dishName:'抹茶海鹽奶蓋-A',qut:0,dishType:'甜點'},
                            // {id:12,dishName:'春手毬和菓子-A',qut:0,dishType:'飲品'},
                            // {id:13,dishName:'烘焙曼巴咖啡-A',qut:0,dishType:'飲品'},
                            // {id:14,dishName:'烘焙曼巴咖啡-A',qut:0,dishType:'飲品'},                                
                            // {id:15,dishName:'高山金萱茶-A',qut:0,dishType:'飲品'},                                
                            // {id:16,dishName:'檸檬海鹽氣泡飲-A',qut:0,dishType:'飲品'},                                
                        ]
                    },
                   
                },
            }
        }
    },
    methods:{
        // GET API
        getSetPrice(){
            fetch('php/reserveAPI/getSetPriceAPI.php')
            .then(response =>{
                return response.json()
            })
            .then( data =>{
                for(let i = 0;i < this.APIData_in.sets.length;i++){
                    for(let type in data[i]){
                        this.APIData_in.sets[i][`${type}`] = data[i][`${type}`]
                    } 
                } 
            }).catch(err=>{
                console.log(err)
            })
        },
        getSetdishDetail(){
            fetch('php/reserveAPI/setAPI.php')
            .then(function(response) {
                // console.log(response)
                return response.json();
            })
            .then((res)=>{
                // 塞A,B,C 套餐資訊
                res.forEach(data => {
                        let dishType = data.dishType
                        // console.log(data)
                        // 初始化數量
                        data.qty = 0;
                        for(let i =0;i<3; i++){
                            if(data.SetID == 1 && i == 0 ){
                                // if(el.dishType == dishType){
                                    this.APIData_in.sets[i].dish[dishType].push(data)
                                // }
                                // }else if(el.dishType =='前菜'){
                                //     this.APIData_in.sets[i].dish[dishType].push(el)
                                // }else if(el.dishType =='刺身'){
                                //     this.APIData_in.sets[i].dish[dishType].push(el)
                                // }else if(el.dishType =='主食'){
                                //     this.APIData_in.sets[i].dish[dishType].push(el)
                                // }else if(el.dishType =='甜點'){
                                //     this.APIData_in.sets[i].dish[dishType].push(el)
                                // }else if(el.dishType =='飲品'){
                                //     this.APIData_in.sets[i].dish[dishType].push(el)
                                // }
                                // return el
                            }else if(data.SetID == 2  && i == 1){
                                this.APIData_in.sets[i].dish[dishType].push(data)
                            }else if(data.SetID == 3  && i == 2){
                                this.APIData_in.sets[i].dish[dishType].push(data)
                            }
                        }
                    });
            
                // 物件寫法 尚未重構完成                    
                //     let c = res.map(el=>{
                //         const dish_SetID = el.SetID
                //         const dishType = el.dishType
                //         console.log(dishType)
                //         // console.log(key);
                //         // console.log(!res.hasOwnProperty(key));
                //         console.log(!this.APITest.hasOwnProperty("set"+dish_SetID))
                //         if(!this.APITest.hasOwnProperty("set"+dish_SetID)){
                //             // console.log(el)
                //             this.APITest["set"+dish_SetID] = {}
                           
                //             // console.log( this.APITest[`${el.dishType}`]);
                //         }
                //         // console.log(!this.APITest["set"+dish_SetID].hasOwnProperty(dishType));

                //         if(!this.APITest["set"+dish_SetID].hasOwnProperty(dishType)){
                //             // console.log('s');
                //             this.APITest["set"+dish_SetID][dishType]=[]
                //         }
                //         this.APITest["set"+dish_SetID][dishType].push(el)                       
                //     })
            }).catch(error=>{
                alert(error)
            });


        },
        getOtherDish(){
            fetch('php/reserveAPI/otherAPI.php')
                .then(response =>{
                    return  response.json()
                })
                .then( data =>{
                    // console.log(data)
                    data.forEach((data_el)=>{  
                        // console.log(data_el.price)
                        let obj={
                            id:data_el.id,
                            dishName:data_el.disName,
                            dishType:data_el.dishType,
                            price:data_el.price,
                            qty:0
                        }
                        this.APIData_in.otherDish.push(obj)
                    })
                }).catch(err=>{
                    console.log(err)
                })
        },
        getServier(){
            fetch('php/reserveAPI/servesAPI.php')
            .then(response =>{
                return  response.json()
            })
            .then( data =>{
                // console.log(data)
                // servies
                data.forEach((servie,idx)=>{                  
                    // init checked = false
                    if(idx >= 0 && idx <= 1 ){
                        servie.checked = true    
                    }else servie.checked = false
                    
                    this.APIData_in.servies.push(servie)
                })      
            }).catch(err=>{
                console.log(err)
            })
        },
        getTeam(){
            fetch('php/reserveAPI/getTeamAPI.php')
            .then(response =>{
                return  response.json()
            })
            .then( datalist =>{
                datalist.forEach(data=>{
                    this.APIData_in.chefTeam.push(data)
                })
            }).catch(err=>{
                console.log(err)
            })
        },


        // Vue 流程邏輯
        changeStep(val,e){                    
            // step 1 檢查套餐及套及數量
            let vaildStep = false;
            if(this.workFlow.step === 1){
                // 使用者點選餐點
                let setID = this.inputData.sets - 1
                // 訂餐人數
                const count = this.inputData.peoCount

                // 儲存種類使否有符合總人數  data = [true,true,false....]
                let checkDishTypeVail = []

                let set = this.APIData_in.sets[setID].dish
       
                for (const key in set){
                    let dishTypetotal = 0 //ex : [湯品],[菜品]..總數
                    // console.log(set[key])
                    for (let j = 0; j < set[key].length; j++) {  
                        // console.log(set[key][j])          
                        dishTypetotal += set[key][j].qty
                        // this.setsList.push(set[key])                            
                    }
                    // 若人數符合種類餐點總和
                    if(dishTypetotal === count){
                            // console.log(`${set[key]}資料OK`)
                            checkDishTypeVail.push(true)
                    }else{
                        // console.log(`${set[key]}資料不OK`)
                        checkDishTypeVail.push(false)
                    }
                }
                // console.log(checkDishTypeVail)
                checkDishTypeVail = checkDishTypeVail.find(el=>!el)
                if(checkDishTypeVail === false)return alert('請選取相對應人數的餐點')
                // 紀錄餐點
                let setDetail= this.setDetail(setID)
                console.log(setDetail)
                vaildStep = true
            }else if(this.workFlow.step == 2){
                // 最後要把客戶選的菜單塞回去
                vaildStep = true
            }else if(this.workFlow.step == 3){
                let btn = e.target
                // console.log()
                if(btn.className.includes('next_btn')){
                    // 模擬會員登錄
                    let c = confirm('你要登入嗎?')
                    if(c){
                        this.inputData.isLogin = !this.inputData 
                        vaildStep = true
                        
                        
                    }else{
                        alert('要登入才能進入下一個流程')
                    }
                }else{
                    vaildStep = true
                }
               
                
            }else if(this.workFlow.step == 4){
                // console.log(`step 4 confrim`)
                // 拿取會員資料 API 
                // 驗證格式
                let btn = e.target
                if(btn.className.includes('next_btn')){
                    // 模擬會員登錄
                    let c = confirm('是否要送出訂單')
                    if(c){
                        console.log(`檢驗格式`)
                        // vaildStep = true
                        for (const [key, value] of Object.entries(this.inputData)) {
                            console.log(key,value)
                            // console.log(this.inputData.key)
                        }
                    }else{
                        
                    }
                }else{
                    vaildStep = true
                }

            }else if(this.workFlow.step == 5){
               
            }
            
            if(vaildStep)this.workFlow.step += val;
            
        },
        changeOrederViewImg(e){
            // 小圖換大圖
            this.$refs.oderVeiwPic.src = e.IMG;
            this.inputData.sets = e.id;
            // this.resetDataInput()
        },
        setclickCount(item,stauts,setID,dishType){
            // 商品, 點擊(+ , - ),套餐編號,餐點類型
            if(stauts ==='minus'){
                // 假如點擊的是 - 商品的話
                item.qty <= 0 ?  0 : item.qty--;
            }else{
                    // 當一種類若超過人數 
                    let totalNum = this.APIData_in.sets[setID].dish[`${dishType}`]
                                        .map((el)=>el.qty).reduce((a,b)=>a+b);
                    if(totalNum >= this.inputData.peoCount ) return
                    // 若沒有超過人數，可以增加餐點
                    item.qty >= this.inputData.peoCount ?  this.inputData.peoCount: item.qty++;
            }
        },
        otherItemCount(item,stauts){
            if(stauts ==='minus'){
                // 假如點擊的是 - 商品的話
                item.qty <= 0 ?  0 : item.qty--;
            }else{
                item.qty ++;
            }
        },

        // 撈出使用者套餐項目細節
        setDetail(setID){
            let set = this.APIData.sets[setID].dish
            this.InputSetDetail = []
            this.inputData.setsList  = []
            let temp = []
            for (const key in set){
                for (let j = 0; j < set[key].length; j++){
                    // this.inputData.setsList.push({...set[key][j]})
                    console.log( set[key][j])
                    if(set[key][j].qty > 0){
                        // temp.push(set[key][j])
                        this.inputData.setsList.push(set[key][j])
                        // this.InputSetDetail.push(set[key][j])
                    }
                }
            }
            return temp
        },
        // 撈出使用者單點資料項目細節
        resetDataInput(){
            // event 當切換人數全部菜餐清除
            // console.log(`清空資料套餐及單品及服務的數量`);               
            for(let i=0; i<3; i++){
                let set = this.APIData_in.sets[i].dish
                for (const key in set){
                    for (let j = 0; j < set[key].length; j++) {
                        // 清空套餐菜品數量
                        set[key][j].qty = 0
                    }
                    
                }
            }
        },
        // 確認種類是否有符合人數
        setKind(setID,dishType){
            let totalNum = this.APIData_in.sets[setID].dish[`${dishType}`]
                                        .map((el)=>{
                                            if(el.qty === undefined){
                                               return el.qty = 0
                                            }else return el.qty
                                        }).reduce((a,b)=>a+b,0);
            return totalNum !== this.inputData.peoCount                                               
        },
        nameRule(nameStr){
            let nameRule =  new RegExp('^[\u4e00-\u9fa5]+$|^[a-zA-Z\s]+$');
           return nameRule.test(nameStr);
        },
        phoneRule(str){
            // this.inputData.phone.replace(/\D/g, "");
            let phoneRule =  new RegExp("^09\\d{8}$");
            return phoneRule.test(str)
        },
        emailRule(str){
            let emailRule =  new RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}');
            return emailRule.test(str);
        },
        creditCardRule(){
            let cardNumString = this.cards
            .map(cardStr=>cardStr.str)
            .reduce((a,b)=>a + b);
            
            return is.creditCard(cardNumString)
        },
        lengthRule(inputData,vaildlength){
            return inputData.length === vaildlength
        },
        checkMemberPoint(){
            if(this.APIData.member.point <= this.inputData.point){
                this.inputData.point = 0
                alert('您剩餘的紅利為: '+ this.APIData.member.point+ '點,請重新輸入')
            }
        },
        
   

        // 信用卡UX 程式1
        cardKDCheck(e,idx){
            // console.log(`keydown`)
            if((e.which >= 48 && e.which <= 57) || e.which == 8){
                // 0~9 keycode 48~57; 8 keycode backspace
                if((e.target.value.length == 0 && e.which == 8)){
                    if(idx=== 0)return
                    const previous_el = e.target.previousElementSibling.previousElementSibling;
                    if(previous_el == null)return
                    previous_el.focus();
                }
              }else{
                e.preventDefault();
              }
        },
        // 信用卡UX 程式2
        cardKUPheck(e,idx){
            let str = (e.target.value).replace(/\D/g, "");
            e.target.value = str;
            // console.log(e.target.value)
            // console.log(idx)
            if(str.length == 4 && idx <= 2){
              let next_el = e.target.nextElementSibling.nextElementSibling;
              if(next_el != null){
                next_el.focus();
              }
            }
        },
      
        // vaildCard(idx){
        //     if(idx !== 3) return
        //     console.log(this.$refs.ccc)
        //     console.log(`第四個欄位`)
        //     console.log(this.cards)
        //     return console.log(this.creditCardRule())
        // }

    },
    computed:{
        cardCheck(){
            return '11'
            
        },
        // 套餐內容
        // workflow step 1
        chefTeamName(){
            let orderTeamName = this.APIData_in.chefTeam.find(el=>el.team == this.inputData.chefTeam)
            console.log({...orderTeamName}.name)
            return {...orderTeamName}.name
        },
        setName(){
            let orderSetName = this.APIData_in.sets.find(el=>el.id==this.inputData.sets)
            return {...orderSetName}.setName
        },

        // 套餐加購總金額計算
        setPrice(){
            let setPrice = {...this.APIData_in.sets.find(el=>el.id==this.inputData.sets)}.price
            let setPeo = this.inputData.peoCount

            return `$ ${(setPrice * setPeo).toLocaleString()}`
        },

        // 單品加購總金額計算
        otherPrice(){
            let otherDish = this.APIData.otherDish.map(item=>{
                 if(item.qty > 0){
                    return item.qty * item.price;
                 }else return 0;
            }).reduce((a,b)=>a+b)
            
            let otherServies = this.APIData.servies.map(serve=>{
                if(serve.checked === true){
                    // console.log(serve.title)
                    return serve.price;
                }else return 0
            }).reduce((a,b)=>a+b)
            
            otherServies = otherServies * this.inputData.peoCount
            return ( otherDish + otherServies ).toLocaleString()
        },
        pointDiscount(){
            // console.log(this.inputData.point)
            let pointCovert = parseInt(this.inputData.point)
            return pointCovert.toLocaleString()
        },
        // orderview 總金額計算
        totalPrice(){
            // 訂單人數
            const count = this.inputData.peoCount
            
            // 套餐金額
            let setPrice = {...this.APIData_in.sets.find(el=>el.id===this.inputData.sets)}.price
            console.log(setPrice)
            console.log(count)
            let setTotal = count * setPrice
            
            // 單點金額
            let otherDish = 0
            let otherServies = 0

            // 紅利點數扣款
            let point = this.inputData.point || 0
            if(this.workFlow.step == 2 ||this.workFlow.step == 3){
                otherDish = this.APIData_in.otherDish.map(item=>{
                    //  console.log(item.price,item.qty)
                     if(item.qty > 0){
                        
                        return parseInt(item.qty) * parseInt(item.price);
                        
                     }else return 0;
                })
                .reduce((a,b)=>a+b,0);

                otherServies = this.APIData_in.servies.map(serve=>{
                    if(serve.checked === true){
                        // console.log(serve.title)
                        return serve.price;
                    }else return 0
                }).reduce((a,b)=>a+b)
                // console.log(otherServies)
                otherServies = otherServies * count
                // console.log(otherServies)
            }

            if(this.workFlow.step == 4){
                // console.log()
            }
            // console.log('套餐:',setTotal)
            // console.log( "單點",otherDish )
            // console.log("服務",otherServies);
            // console.log('會員點數',point)
            return `$ ${(setTotal + otherDish + otherServies - point).toLocaleString()}`;
        },

        // workFlow step 3
        displayOrederTime(){
            // let timeString = 
            // console.log(this.APIData.orderTime)
            let displayTime = this.APIData.orderTime.find((el)=>{
                if(el.id ===this.inputData.orderTime){
                    return el.time
                }
            })
            // console.log(displayTime.time)
            return displayTime.time;
        },

        // workFlow step 4
        // 格式驗證
        checkName(){
            // 姓名驗證 (中文與英文)
            if(this.inputData.name =="")return false
            return this.nameRule(this.inputData.name);
        },
        checkPhoneNum(){
            // 手機驗證格式
            return this.phoneRule(this.inputData.phone);
        },
        checkEmail(){
            // 電子信箱驗證格式
            return this.emailRule(this.inputData.email);
        },     
        checkCard(){
            // console.log(this.creditCardRule())
            return this.creditCardRule()
        },
        checkCardName(){
            // 姓名驗證 (中文與英文)
            if(this.inputData.cardName =="")return false
            return this.nameRule(this.inputData.cardName);
        }, 
        checkCardDate(){
            if(this.inputData.cardDate =="" || this.inputData.cardDate == undefined )return false
                //  return this.inputData.cardDate.length === 4
               return this.lengthRule(this.inputData.cardDate,4)
        },
        checkCardCode(){
            if(this.inputData.cardCode =="" || this.inputData.cardCode == undefined )return false
                 return this.lengthRule(this.inputData.cardCode,3)
        },
       
    },
    watch:{
        'workFlow.step'(newValue){
            // 限制控制流程1(套餐選擇),2(單品選擇),3(細項列表),4(填寫資料), 5(還沒做Sumit Form 表單)
            if(newValue < 1){
                this.workFlow.step = 1
            }else if(newValue > 5){
                this.workFlow.step = 5
            }
        },
        'inputData.point'(newValue){
            // 強制只能輸入數字
            this.$nextTick(() => {
                this.inputData.point= String(newValue).replace(/\D/g, '');
            });
          
        },
        'inputData.cardDate'(newValue){
            // 強制只能輸入數字
            this.$nextTick(() => {
                this.inputData.cardDate= String(newValue).replace(/\D/g, '');
            });
          
        },
        'inputData.cardCode'(newValue){
            // 強制只能輸入數字
            this.$nextTick(() => {
                this.inputData.cardCode= String(newValue).replace(/\D/g, '');
            });
          
        }
    },
    mounted(){
        // 把Local Stroage 給讀出來並渲染在網頁畫面上

        if(JSON.parse(localStorage.getItem('reseverOrder')) !== null){    
            this.inputData = JSON.parse(localStorage.getItem('reseverOrder'));        
        }
       
    },
    created(){
        this.$nextTick(() => {
            this.getSetdishDetail();
        });
        this.$nextTick(() => {
            this.getOtherDish();
        });
        this.$nextTick(() => {
            this.getServier();
        });
        this.$nextTick(() => {
            this.getSetPrice();
        });
        this.$nextTick(() => {
            this.getTeam();
        });
    },
   
}

const vm = Vue.createApp(RootComponent).mount('#myWorkFlow')