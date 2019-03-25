<template>
    <div style="margin-top: 4rem;">
        <p class="title">
            {{title}}
        </p>
        <p>
            {{content}}
        </p>
    </div>
</template>

<script>
export default {
    data: function () {
        return {
            title: '',
            content: ''
        };
    },
    created: async function () {
        let page = await fetch("http://localhost:3000/pages/contact");
        page = await page.json();
        this.title = page.title;
        this.content = page.content;
    }
}
</script>
