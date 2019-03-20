<template>
<div id="products">
    <div class="screenTools">
        <b-select placeholder="Filter by Category"
            @input="getProducts(page = 1)"
            v-model="category"
            style="display: inline-block"
        >
            <option 
                v-for="(cat, index) in categories"
                :value="cat.id"
                :key="index">
                {{ cat.name }}
            </option>
        </b-select>
        <button
            v-if="category !== undefined"
            @click="backToAll"
            class="button"
            style="display: inline-block"
        >
        Remove Filter
        </button>
    </div>
    <bLoading
        :active="initialLoadOngoing || fetchOccuring"
        :is-full-page="false"
    />

    <div v-if="products.length" class="tile is-ancestor" style="flex-wrap: wrap">
        <ImageTile v-for="(product, index) in products"
            :key="index"
            :image="product.image"
            :sub_title="product.name"
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
import ProductsApi from "ProductsApi.js";
import ImageTile from "./components/ImageTile.vue";
export default {
    components: { ImageTile },
    data: function() {
        return {
            products: [],
            initialLoadOngoing: true,
            page: 1,
            fetchOccuring: false,
            noAdditionalProducts: true,
            categories: [],
            category: undefined
        };
    },
    created: async function() {
        try{
            this.products = await ProductsApi.getProducts(this.page) || [];
            this.categories = await ProductsApi.getCategories() || [];
            this.categories.shift();
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
            this.category = undefined;
            this.page=1;
            this.getProducts(this.page);
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
