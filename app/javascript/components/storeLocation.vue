<template>
    <div class="navbar-item">
        <p v-if="store !== null">
            {{store.name}} - {{store.address}}, {{store.city}}
        </p>
        <p v-else-if="storeLoading">
            Fetching store.
        </p>
        <div v-else>
            <storeSelect 
                @store-chosen="chosenStore"
            />
        </div>
    </div>
</template>

<script>
import storeSelect from "./storeSelect.vue";
export default {
    components: {storeSelect},
    data: function() {
        return {
            position: null,
            store: null,
            storeLoading: true
        };
    },
    created: function () {
        this.getLocation();
    },
    methods: {
        getLocation: function () {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(async (position) => {
                    this.storeLoading = true;
                    this.position = position.coords;
                    let tempStore = await fetch(`http://localhost:3000/store/closest_store?latitude=${position.coords.latitude}&longitude=${position.coords.longitude}`);
                    this.store = (await tempStore.json())[0];
                    this.storeLoading = false;
                 },
                 (error) => {
                     if (error.code == error.PERMISSION_DENIED) {
                         console.log("Permission Denied");
                     }
                     this.storeLoading = false;
                 });
            } else {
                console.log("Geolocation is not supported");
            }
        },
        chosenStore: function (store) {
            this.store = store;
        }
    }
}
</script>
