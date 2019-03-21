<template>
    <div class="columns">
        <div class="column">
            <ProductList />
        </div>
        <div class="column is-one-quarter">
            <Cart />
        </div>
    </div>
</template>

<script>
import ProductList from './products.vue';
import Cart from './cart.vue';
export default {
    components: { ProductList, Cart }
}
</script>
