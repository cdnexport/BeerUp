<template>
    <div>
        <navmenu />
        <router-view></router-view>
    </div>
</template>

<script>
import navmenu from './menu.vue';
export default {
    components: {navmenu}
}
</script>
