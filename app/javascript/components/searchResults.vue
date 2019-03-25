<template>
<div class="results">
    <bLoading
        :active="fetchOccuring"
        :is-full-page="false"
    />
    <div class="columns">
        <div class="column">
            <p class="title">Your search returned {{products.length}} result(s).</p>

            <div v-if="products.length" class="tile is-ancestor" style="flex-wrap: wrap">
                <br />
                <ProductTile v-for="(product, index) in products"
                    :key="index"
                    :product="product"
                />
            </div>
            <p v-else-if="!products.length">No products.</p>
        </div>
        <div class="column is-one-quarter">
            <Cart />
        </div>
    </div>
</div>
</template>

<script>
import searchApi from '../SearchApi.js';
import ProductTile from './ProductTile.vue';
import Cart from './cart.vue';
export default {
    props: ["searchdata", "category"],
    components: {ProductTile, Cart},
    data: function () {
        return {
            fetchOccuring: true,
            products: []
        };
    },
    created: async function () {
        this.fetchOccuring = true;
        this.products = await searchApi.search(this.searchdata, this.category);
        this.fetchOccuring = false;
    }
}
</script>
<style scoped>
    .results {
        margin-top: 4rem;
    }
</style>
