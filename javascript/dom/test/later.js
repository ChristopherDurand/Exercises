document.addEventListener('DOMContentLoaded', () => {
  document.addEventListener('click', event => {
    if (event.target.tagName === 'A') {
      event.preventDefault();
    }
  });
});