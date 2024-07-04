document.addEventListener("DOMContentLoaded", function() {
    const lang = new URLSearchParams(window.location.search).get('lang') || 'en';
    loadLanguage(lang);
});

function loadLanguage(lang) {
    fetch(`lang/${lang}.json`)
        .then(response => response.json())
        .then(data => {
            document.querySelectorAll("[data-i18n]").forEach(el => {
                const key = el.getAttribute("data-i18n");
                el.textContent = data[key];
            });
        });
}
