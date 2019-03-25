<template>
<div class="field has-addons navbar-item">
    <div class="control">
        <input 
            v-model="searchData"
            class="input" type="text" placeholder="Search">
    </div>
    <div class="control">
        <categoryDropdown 
            v-bind:showRemoveButton="false"
            @category-change="categoryChange"
        />
    </div>
    <div class="control">
        <router-link
            class="button is-info"
            :to="{name: 'results', params: {category: category, searchdata: searchData}}">
        Search
        </router-link>
    </div>
</div>

</template>

<script>
import categoryDropdown from "./categoryDropdown.vue";
export default {
    components: {categoryDropdown},
    data: function () {
        return {
            category: 1,
            searchData: ''
        }
    },
    methods: {
        categoryChange: function (category) {
            this.category = category;
        }
    }
}
</script>
