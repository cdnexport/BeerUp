<template>
<div class="field has-addons navbar-item">
    <div class="control">
        <input 
            v-model="searchData"
            @keyup="keyup"
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
            id="searchButton"
            v-on:click.native="search"
            :to="{name: 'results', params: {category: category, searchdata: searchData}}">
        Search
        </router-link>
    </div>
</div>

</template>

<script>
import categoryDropdown from "./categoryDropdown.vue";
import eventBus from "../packs/eventBus.js";
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
        },
        keyup: function (e) {
            if (e.keyCode !== 13) return;
            this.search();
        },
        search: function () {
            eventBus.$emit("new-search", {data: this.searchData, category: this.category});
        }
    }
}
</script>
