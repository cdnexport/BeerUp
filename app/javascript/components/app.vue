<template>
    <div>
        <navmenu />
        <router-view></router-view>
    </div>
</template>

<script>
import navmenu from './menu.vue';
import shopdisplay from './shopdisplay.vue';
export default {
    components: {navmenu, shopdisplay}
}
</script>
