function search() {

  // 検索ボタンの装飾
  const baseBefore = document.getElementById("base-before-btn")
  const baseAfter = document.getElementById("base-after-btn")
  const sodaBefore = document.getElementById("soda-before-btn")
  const sodaAfter = document.getElementById("soda-after-btn")
  const followBefore = document.getElementById("follow-before-btn")
  const followAfter = document.getElementById("follow-after-btn")
  const favoriteBefore = document.getElementById("favorite-before-btn")
  const favoriteAfter = document.getElementById("favorite-after-btn")

  baseBefore.addEventListener('mouseover', function(){
    this.setAttribute("style", "z-index:-1;")
  })
  baseAfter.addEventListener('mouseout', function(){
    baseBefore.removeAttribute("style")
  })

  sodaBefore.addEventListener('mouseover', function(){
    this.setAttribute("style", "z-index:-1;")
  })
  sodaAfter.addEventListener('mouseout', function(){
    sodaBefore.removeAttribute("style")
  })

  followBefore.addEventListener('mouseover', function(){
    this.setAttribute("style", "z-index:-1;")
  })
  followAfter.addEventListener('mouseout', function(){
    followBefore.removeAttribute("style")
  })

  favoriteBefore.addEventListener('mouseover', function(){
    this.setAttribute("style", "z-index:-1;")
  })
  favoriteAfter.addEventListener('mouseout', function(){
    favoriteBefore.removeAttribute("style")
  })

}

window.addEventListener('load', search)