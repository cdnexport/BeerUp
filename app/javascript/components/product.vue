<template>
    <div class="columns shopdisplay" style="margin-top: 3rem">
        <div class="column">
            <bLoading
                :active="productLoading"
                :is-full-page="false"
            />
            <div
                v-if="product != null"
            >
                <ProductTile
                    :product = "product"
                    :is-link = "false"
                />
                <ul>
                    <li>Country: {{product.country}}</li>
                    <li>Manufacturer: {{product.manufacturer}}</li>
                    <li>Type: {{product.description}}</li>
                    <li>Alcohol: {{product.alcohol}}%</li>
                    <li>Size: {{product.size}}</li>
                    <li>Price: ${{product.price}}</li>
                </ul>
            </div>
            <div
                v-else-if="product == null && productLoading">
                <p>Loading product.</p>
            </div>
            <div
                v-else>
                <p>No product found.</p>
            </div>
        </div>
        <div class="column is-one-quarter">
            <Cart />
        </div>
    </div>
</template>

<script>
import ProductsApi from "../ProductsApi.js";
import ProductTile from "./ProductTile.vue";
import Cart from "./cart.vue";
export default {
    components: {ProductTile, Cart},
    data: function() {
        return {
            product: null,
            productLoading: true,
        };
    },
    beforeCreate: async function() {
        this.product = await ProductsApi.getProduct(this.$route.params.id);
        this.productLoading = false;
    },
}
</script>
