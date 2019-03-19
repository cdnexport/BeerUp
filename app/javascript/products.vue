<template>
<div id="products">
    <bLoading
        :active.sync="initialLoadOngoing"
    />
    <div v-if="products.length" class="tile is-ancestor" style="flex-wrap: wrap">
        <ImageTile v-for="(product, index) in products"
            :key="index"
            :image="product.image"
            :sub_title="product.name"
        />
    </div>
    <p v-else>No products found.</p>
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
            initialLoadOngoing: true
        };
    },
    created: async function() {
        try{
            this.products = await ProductsApi.getProducts() || [];
        } catch (error) {
            console.log(error);
        }
        this.initialLoadOngoing = false;
    }
}
</script>
