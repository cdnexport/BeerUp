<template>
<div id="products">
    <bLoading
        :active.sync="initialLoadOngoing"
        :is-full-page="false"
    />
    <bLoading
        :active.sync="fetchOccuring"
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
            @click="backProducts"
            class="button is-info"
            :disabled="page == 1"
        >Back</button>
        <button
            v-bind:class="{ 'is-loading': fetchOccuring }"
            @click="moreProducts"
            class="button is-info"
            :disabled="noAdditionalProducts"
        >More</button>
    </div>
    <p v-else>No products.</p>
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
            noAdditionalProducts: true
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
        moreProducts: async function () {
            this.fetchOccuring = true;
            this.page = this.page + 1;
            try {
                this.products = await ProductsApi.getProducts(this.page);
            } catch (error) {
                console.log(error);
            }
            this.fetchOccuring = false;
            window.scrollTo(0,0);
        },
        backProducts: async function () {
            this.fetchOccuring = true;
            this.page = this.page - 1;
            try {
                this.products = await ProductsApi.getProducts(this.page);
            } catch (error) {
                console.log(error);
            }
            this.fetchOccuring = false;
            window.scrollTo(0,0);
        },
    },
    watch: {
        async products() {
            try {
                var additionalProducts = await ProductsApi.getProducts(this.page + 1);
                this.noAdditionalProducts = additionalProducts.length == 0;
            } catch (error) {
                console.log(error);
                this.noAdditionalProducts = true;
            }    
        }
    }
}
</script>
