<template>
    <div class="tile is-parent is-3">
        <div class="tile is-child box">
            <img v-bind:src="image">
            <div class="text is-offset-5">
                <p class="sub-title">{{ sub_title }}</p>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        props: ['image', 'sub_title']
    }
</script>

