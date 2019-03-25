<template>
<div class="field has-addons navbar-item">
    <div class="control">
        <input class="input" type="text" placeholder="Search">
    </div>
    <div class="control">
        <categoryDropdown 
            v-bind:showRemoveButton="false"
            @category-change="categoryChange"
        />
    </div>
    <div class="control">
        <a class="button is-info">
            Search
        </a>
    </div>
</div>

</template>

<script>
import categoryDropdown from "./categoryDropdown.vue";
export default {
    components: {categoryDropdown},
    data: function () {
        return {
            category: 1
        }
    },
    methods: {
        categoryChange: function (category) {
            this.category = category;
        }
    }
}
</script>
