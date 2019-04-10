<template>
<div id="products">
    <div class="screenTools level">
        <div class="level-item">
            <categoryDropdown 
                @category-change="categoryChange"
                @category-reset="backToAll"
                v-bind:showRemoveButton="true"
            />
        </div>
    </div>
    <bLoading
        :active="initialLoadOngoing || fetchOccuring"
        :is-full-page="false"
    />

    <div v-if="products.length" class="tile is-ancestor" style="flex-wrap: wrap">
        <ProductTile v-for="(product, index) in products"
            :key="index"
            :product="product"
            :link="true"
        />
        <button
            v-bind:class="{ 'is-loading': fetchOccuring }"
            @click="getProducts(page = page - 1)"
            class="button is-info"
            :disabled="page == 1"
        >Back</button>
        <button
            v-bind:class="{ 'is-loading': fetchOccuring }"
            @click="getProducts(page = page + 1)"
            class="button is-info"
            :disabled="noAdditionalProducts"
        >More</button>
    </div>
    <p v-else-if="!products.length && !initialLoadOngoing">No products.</p>
</div>
</template>

<script>
import ProductsApi from "../ProductsApi.js";
import ProductTile from "./ProductTile.vue";
import categoryDropdown from "./categoryDropdown.vue";
export default {
    components: { ProductTile, categoryDropdown },
    data: function() {
        return {
            products: [],
            initialLoadOngoing: true,
            page: 1,
            fetchOccuring: false,
            noAdditionalProducts: true,
            category: 1
        };
    },
    created: async function() {
        try{
            this.products = await ProductsApi.getProducts(this.page) || [];
        } catch (error) {
            console.log(error);
        }
        this.initialLoadOngoing = false;
    },
    methods: {
        getProducts: async function (page) {
            this.fetchOccuring = true;
            window.scrollTo(0,0);
            try {
                this.products = await ProductsApi.getProducts(this.page, this.category);
            } catch (error) {
                console.log(error);
            }
            this.fetchOccuring = false;
        },
        backToAll: function () { 
            this.category = 1;
            this.page=1;
            this.getProducts(this.page);
        },
        categoryChange: function (category) {
            this.category = category;
            this.getProducts(this.page = 1);
        }
    },
    watch: {
        async products() {
            try {
                var additionalProducts = await ProductsApi.getProducts(this.page + 1, this.category);
                this.noAdditionalProducts = additionalProducts.length == 0;
            } catch (error) {
                console.log(error);
                this.noAdditionalProducts = true;
            }    
        }
    }
}
</script>
<style scoped>
    .screenTools {
        margin: 2em 0;
    }
</style>
