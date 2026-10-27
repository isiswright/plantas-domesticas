const photos = {
  clorofito: 'images/clorofito.jpg',
  jiboia: 'images/jiboia.jpg',
  espada: 'images/espada.jpg',
  maranta: 'images/maranta.jpg',
  lirio: 'images/lirio.jpg',
  palmeira: 'images/palmeira.jpg',
  babosa: 'images/babosa.jpg',
  violeta: 'images/violeta.jpg',
  bromelia: 'images/bromelia.jpg',
  'rabo-burro': 'images/rabo-burro.jpg',
  echeveria: 'images/echeveria.jpg',
  'palmeira-rabo-peixe': 'images/palmeira-rabo-peixe.jpg',
  'palmeira-rabo-cavalo': 'images/palmeira-rabo-cavalo.jpg',
  gloxinia: 'images/gloxinia.jpg',
  fitonia: 'images/fitonia.jpg',
  'polka-dot': 'images/polka-dot.jpg',
  'cacto-natal': 'images/cacto-natal.jpg',
  rosa: 'images/rosa.jpg'
};
const $ = (selector) => document.querySelector(selector);
const cards = $('#cards');
const dialog = $('#plant-dialog');
const fields = ['#search','#environment','#light','#pets','#favorites-only'];
let favorites = new Set();
try { favorites = new Set(JSON.parse(localStorage.getItem('raizelar-favorites') || '[]')); } catch (_) { favorites = new Set(); }
const saveFavorites = () => { try { localStorage.setItem('raizelar-favorites',JSON.stringify([...favorites])); } catch (_) {} };
const escapeHtml = (s) => String(s).replace(/[&<>"']/g, (c) => ({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
const petLabel = (pet) => pet === 'safe' ? '♡ Não tóxica*' : '⚠ Tóxica para pets';
const lightLabel = (light) => ({indireta:'Luz indireta',baixa:'Pouca luz',direta:'Luz direta'}[light]);
function render(){
  const query = $('#search').value.trim().toLocaleLowerCase('pt-BR');
  const env = $('#environment').value;
  const light = $('#light').value;
  const pet = $('#pets').value;
  const onlyFavorites = $('#favorites-only').checked;
  const results = window.PLANTS.filter(p => (!query || `${p.name} ${p.scientific}`.toLocaleLowerCase('pt-BR').includes(query)) && (!env || p.environment.includes(env)) && (!light || p.light.includes(light)) && (!pet || p.pets === pet) && (!onlyFavorites || favorites.has(p.id)));
  $('#count').textContent = `${results.length} ${results.length===1?'planta encontrada':'plantas encontradas'}`;
  $('#empty').hidden = results.length > 0;
  cards.innerHTML = results.map(p => `<article class="plant-card"><div class="card-art" style="--plant-bg:${p.color}"><img class="plant-photo" src="${photos[p.id]}" alt="Fotografia botânica decorativa" loading="lazy" onerror="this.style.display='none';this.nextElementSibling.style.display='block'"/><span class="plant-emoji" style="display:none" aria-hidden="true">${p.emoji}</span><button class="heart ${favorites.has(p.id)?'active':''}" data-favorite="${p.id}" aria-label="${favorites.has(p.id)?'Remover dos':'Adicionar aos'} favoritos: ${escapeHtml(p.name)}" aria-pressed="${favorites.has(p.id)}">${favorites.has(p.id)?'♥':'♡'}</button></div><div class="card-body"><span class="pet-tag ${p.pets}">${petLabel(p.pets)}</span><h3>${escapeHtml(p.name)}</h3><p class="scientific">${escapeHtml(p.scientific)}</p><p class="card-description">${escapeHtml(p.description)}</p><div class="card-meta"><span>☀ ${lightLabel(p.light[0])}</span><span>⌂ ${escapeHtml(p.environment[0])}</span></div><button class="details-button" data-detail="${p.id}">Ver cuidados <span aria-hidden="true">↗</span></button></div></article>`).join('');
}
function showDetails(id){
  const p = window.PLANTS.find(p=>p.id===id); if(!p) return;
  $('#dialog-body').innerHTML = `<div class="dialog-art" style="--plant-bg:${p.color}"><img class="dialog-photo" src="${photos[p.id]}" alt="Fotografia botânica decorativa" onerror="this.style.display='none';this.nextElementSibling.style.display='block'"/><span style="display:none" aria-hidden="true">${p.emoji}</span></div><div class="dialog-text"><span class="pet-tag ${p.pets}">${petLabel(p.pets)}</span><h2 id="dialog-title">${escapeHtml(p.name)}</h2><p class="scientific">${escapeHtml(p.scientific)}</p><p>${escapeHtml(p.description)}</p><div class="detail-list"><div><strong>☀ Iluminação</strong><p>${p.light.map(lightLabel).join(' ou ')}</p></div><div><strong>💧 Rega</strong><p>${escapeHtml(p.water)}</p></div><div><strong>◈ Solo</strong><p>${escapeHtml(p.soil)}</p></div><div><strong>✳ Manutenção</strong><p>${escapeHtml(p.care)}</p></div><div><strong>⌂ Ambientes</strong><p>${escapeHtml(p.environment.join(', '))}</p></div></div><p class="modal-note">Informações educativas. Confira a identificação e a toxicidade da espécie antes de introduzi-la em casas com animais.</p></div>`;
  if(typeof dialog.showModal==='function') dialog.showModal();
}
fields.forEach(selector => $(selector).addEventListener(selector==='#search'?'input':'change',render));
$('#clear').addEventListener('click',()=>{ $('#search').value=''; $('#environment').value=''; $('#light').value=''; $('#pets').value=''; $('#favorites-only').checked=false; render(); });
cards.addEventListener('click',(event)=>{
  const favorite = event.target.closest('[data-favorite]');
  if(favorite){ const id=favorite.dataset.favorite; favorites.has(id)?favorites.delete(id):favorites.add(id);saveFavorites();render();return; }
  const detail = event.target.closest('[data-detail]'); if(detail) showDetails(detail.dataset.detail);
});
$('#close-dialog').addEventListener('click',()=>dialog.close());
dialog.addEventListener('click',(event)=>{ if(event.target===dialog) dialog.close(); });
render();
