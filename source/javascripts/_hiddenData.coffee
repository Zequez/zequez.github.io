links = document.querySelectorAll('[hiddenlink]')
for link in links
  href = link.getAttribute('hiddenlink')
  text = link.innerText
  console.log(href, btoa(href))
  # console.log(text, btoa(text))
  link.href = atob(href.slice(0, -1))
  link.innerText = atob(text)
