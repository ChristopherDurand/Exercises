document.addEventListener('DOMContentLoaded', () => {
function rewrite() {
  let headline = document.createElement('h1');
  let headlineContent = document.createTextNode("The Day's News")
  headline.appendChild(headlineContent);
  let oldHeadline = document.querySelector('h2');
  document.body.replaceChild(headline, oldHeadline);

  let article = document.createElement('article');
  article.classList.add("breaking");

  let p1 = document.createElement('p');
  let p1Content = document.createTextNode('Fire breaks out at the old factory')
  p1.appendChild(p1Content);

  let p2 = document.createElement('p');
  let readMore = document.createElement('a');
  readMore.setAttribute('href', '/stories/15');
  let anchorText = document.createTextNode("Read More");
  readMore.appendChild(anchorText);
  p2.appendChild(readMore);

  article.appendChild(p1);
  article.appendChild(p2);

  let frontPage = document.querySelector('.front-page');
  frontPage.insertAdjacentElement("afterbegin", article);
}

  rewrite();
  document.addEventListener('click', event => {
    if (event.target.tagName === 'A') {
      console.log('nope');
      event.preventDefault();
    }
  });
});
