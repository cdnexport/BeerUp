<template>
    <div>
        <p v-on:add-to-cart="logIt">CART HERE</p>
    </div>
</template>

<script>
import ProductList from './products.vue';
import Cart from './cart.vue';
export default {
    methods: {
        logIt: function(e) {
            console.log(e);
        }
    }
}
</script>
