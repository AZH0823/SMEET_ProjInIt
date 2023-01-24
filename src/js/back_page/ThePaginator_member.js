export default{
    props:["totalItems", "itemsPerPage", "currentPage"],
    data(){
        return {};
    },
    template: `
        <div class="page" id="pagination_block">
            <ul class="page_ul">
                <li v-if="currentPage !=1"><a>&lt;</a></li>
                <li v-for="i in totalPages" :key="i"><a :class="{'-on': i == currentPage }" >{{i}}</a></li>
                <li v-if="currentPage != totalPages"><a >&gt;</a></li>
            </ul>
        </div>
    `,
    computed:{
        totalPages(){
            return Math.ceil(this.$props.totalItems / this.$props.itemsPerPage); 
        }
    }

}
