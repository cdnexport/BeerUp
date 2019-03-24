<template>
    <div class="dropdown">
        <a class="dropbtn">Hover to choose store.</a>
        <div class="dropdown-content">
            <p
            v-for="(store, index) in stores"
            :key="index"
            @click="chosenStore(store)"
            >{{store.name}}</p>
        </div>
    </div>
</template>
<script>
export default {
    data: function () {
        return {
            stores: [] 
        };
    },
    created: function () {
        this.getClosestStores()
    },
    methods: {
        getClosestStores: async function () {
            let stores = await fetch(`http://localhost:3000/store/closest_by_ip`);
            this.stores = await stores.json();
        },
        chosenStore: function (store) {
            this.$emit("store-chosen", store);
        }
    } 
}
</script>
<style scoped>
    .dropbtn {
        padding: 16px;
        border: none;
    }

    .dropdown {
        position: relative;
        display: inline-block;
    }

    .dropdown-content {
        display: none;
        position: absolute;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
    }

    .dropdown-content a {
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }

    .dropdown:hover .dropdown-content {
        display: block;
    }
</style>

