<template>
<div>
    <b-select placeholder="Filter by Category"
        @input="categoryChange"
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
        v-if="category !== 1"
        @click="categoryReset"
        class="button"
        style="display: inline-block"
    >
    Remove Filter
    </button>
</div>
</template>
<script>
import ProductsApi from "../ProductsApi.js";

export default {
    data: function () {
        return {
            categories: [],
            category: 1
        }
    },
    created: async function() {
        try{
            this.categories = await ProductsApi.getCategories() || [];
            this.categories.shift();
            this.categories = [{ id: 1, name: "All" }].concat(this.categories);
        } catch (error) {
            console.log(error);
        }
        this.initialLoadOngoing = false;
    },
    methods: {
        categoryChange: function () {
            this.$emit("category-change", this.category);
        },
        categoryReset: function () {
            this.category = 1;
            this.$emit("category-reset");
        }
    }
}
</script>
