* Raiz & Lar — traduções PT / EN / ES. Carregue depois de app.js. */
(() => {
  'use strict';
  const original = (window.PLANTS || []).map(p => ({...p, environment:[...p.environment], light:[...p.light]}));
  const plantNames = {
    clorofito:['Spider plant','Cinta'],jiboia:['Golden pothos','Poto'],espada:['Snake plant','Lengua de suegra'],maranta:['Prayer plant','Maranta'],lirio:['Peace lily','Lirio de la paz'],palmeira:['Parlor palm','Palmera de salón'],babosa:['Aloe vera','Sábila'],violeta:['African violet','Violeta africana'],
    costela:['Swiss cheese plant','Costilla de Adán'],samambaia:['Boston fern','Helecho de Boston'],zamioculca:['ZZ plant','Zamioculca'],peperomia:['Baby rubber plant','Peperomia'],areca:['Areca palm','Palmera areca'],ficus:['Fiddle-leaf fig','Ficus lira'],pilea:['Chinese money plant','Planta china del dinero'],anturio:['Flamingo flower','Anturio'],orquidea:['Moth orchid','Orquídea mariposa'],'cacto-natal':['Thanksgiving cactus','Cactus de Navidad'],dieffenbachia:['Dumb cane','Diefembaquia'],hoya:['Wax plant','Flor de cera']
  };
  const text = {
    en: {
      'Ir para o catálogo':'Skip to catalog','Explorar plantas':'Explore plants','Sobre o projeto':'About the project','Encontrar minha planta':'Find my plant','SEU GUIA VERDE PARA CASA':'YOUR GREEN GUIDE AT HOME','Um lar mais verde começa com a':'A greener home starts with the','planta certa.':'right plant.','Descubra espécies que combinam com seu espaço, sua rotina e seus animais de estimação. Cultivar pode ser simples.':'Discover plants that fit your space, lifestyle and pets. Growing can be simple.','Conheça o projeto':'About this project','Escolhas conscientes para você e seus pets':'Thoughtful choices for you and your pets','Um respiro de natureza':'A breath of nature','Para todos os cantos da casa.':'For every corner of your home.','Luz ideal':'Ideal light','Plantas para cada iluminação':'Plants for every light level','Seu ambiente':'Your space','Da sala ao banheiro':'From living room to bathroom','Pets primeiro':'Pets first','Informações de toxicidade':'Toxicity information','Cuidados simples':'Easy care','Rega, solo e manutenção':'Watering, soil and maintenance','SELEÇÃO BOTÂNICA':'BOTANICAL SELECTION','Uma planta para':'A plant for','cada história.':'every story.','Explore o catálogo e filtre de acordo com a sua casa.':'Browse the catalog and filter for your home.','Ambiente':'Room','Luminosidade':'Light','Segurança para pets':'Pet safety','Somente favoritas ♡':'Favorites only ♡','Limpar filtros ↺':'Clear filters ↺','Todos os ambientes':'All rooms','Sala':'Living room','Quarto':'Bedroom','Banheiro':'Bathroom','Cozinha':'Kitchen','Área externa':'Outdoor area','Qualquer luminosidade':'Any light level','Luz indireta':'Indirect light','Pouca luz':'Low light','Luz direta':'Direct light','Todas as plantas':'All plants','Não tóxicas*':'Non-toxic*','Tóxicas':'Toxic','Nenhuma planta encontrada. Experimente ajustar os filtros.':'No plants found. Try adjusting your filters.','* As informações de toxicidade são educativas e devem ser verificadas em fontes veterinárias confiáveis, como a ASPCA. Em caso de ingestão, procure orientação veterinária.':'* Toxicity information is educational. Check reliable veterinary sources such as the ASPCA. If your pet ingests a plant, contact a veterinarian.','TECNOLOGIA + NATUREZA':'TECHNOLOGY + NATURE','Conhecimento que':'Knowledge that','floresce.':'blooms.','Este projeto acadêmico de Análise e Desenvolvimento de Sistemas da UNINTER busca facilitar o acesso a informações sobre plantas domésticas, promovendo escolhas conscientes e o cultivo responsável.':'This UNINTER academic project in Systems Analysis and Development makes houseplant information more accessible and encourages responsible growing.','Alinhado aos Objetivos de Desenvolvimento Sustentável 11, 12 e 15.':'Aligned with Sustainable Development Goals 11, 12 and 15.','Projeto acadêmico • UNINTER • 2026':'Academic project • UNINTER • 2026','Voltar ao topo ↑':'Back to top ↑','Créditos das fotografias':'Photo credits','♡ Não tóxica*':'♡ Non-toxic*','⚠ Tóxica para pets':'⚠ Toxic to pets','Ver cuidados':'Care guide','☀ Iluminação':'☀ Light','💧 Rega':'💧 Watering','◈ Solo':'◈ Soil','✳ Manutenção':'✳ Maintenance','⌂ Ambientes':'⌂ Rooms','Informações educativas. Confira a identificação e a toxicidade da espécie antes de introduzi-la em casas com animais.':'Educational information. Verify the species and its toxicity before bringing it into a home with pets.','planta encontrada':'plant found','plantas encontradas':'plants found'
    },
    es: {
      'Ir para o catálogo':'Ir al catálogo','Explorar plantas':'Explorar plantas','Sobre o projeto':'Sobre el proyecto','Encontrar minha planta':'Encontrar mi planta','SEU GUIA VERDE PARA CASA':'TU GUÍA VERDE PARA EL HOGAR','Um lar mais verde começa com a':'Un hogar más verde comienza con la','planta certa.':'planta adecuada.','Descubra espécies que combinam com seu espaço, sua rotina e seus animais de estimação. Cultivar pode ser simples.':'Descubre plantas que se adapten a tu espacio, tu rutina y tus mascotas. Cultivar puede ser sencillo.','Conheça o projeto':'Conoce el proyecto','Escolhas conscientes para você e seus pets':'Elecciones conscientes para ti y tus mascotas','Um respiro de natureza':'Un respiro de naturaleza','Para todos os cantos da casa.':'Para cada rincón del hogar.','Luz ideal':'Luz ideal','Plantas para cada iluminação':'Plantas para cada tipo de luz','Seu ambiente':'Tu espacio','Da sala ao banheiro':'De la sala al baño','Pets primeiro':'Mascotas primero','Informações de toxicidade':'Información sobre toxicidad','Cuidados simples':'Cuidados sencillos','Rega, solo e manutenção':'Riego, suelo y mantenimiento','SELEÇÃO BOTÂNICA':'SELECCIÓN BOTÁNICA','Uma planta para':'Una planta para','cada história.':'cada historia.','Explore o catálogo e filtre de acordo com a sua casa.':'Explora el catálogo y filtra según tu hogar.','Ambiente':'Espacio','Luminosidade':'Iluminación','Segurança para pets':'Seguridad para mascotas','Somente favoritas ♡':'Solo favoritas ♡','Limpar filtros ↺':'Borrar filtros ↺','Todos os ambientes':'Todos los espacios','Sala':'Sala','Quarto':'Dormitorio','Banheiro':'Baño','Cozinha':'Cocina','Área externa':'Exterior','Qualquer luminosidade':'Cualquier iluminación','Luz indireta':'Luz indirecta','Pouca luz':'Poca luz','Luz direta':'Luz directa','Todas as plantas':'Todas las plantas','Não tóxicas*':'No tóxicas*','Tóxicas':'Tóxicas','Nenhuma planta encontrada. Experimente ajustar os filtros.':'No se encontraron plantas. Prueba otros filtros.','* As informações de toxicidade são educativas e devem ser verificadas em fontes veterinárias confiáveis, como a ASPCA. Em caso de ingestão, procure orientação veterinária.':'* La información sobre toxicidad es educativa. Consulta fuentes veterinarias confiables como la ASPCA. En caso de ingestión, consulta a un veterinario.','TECNOLOGIA + NATUREZA':'TECNOLOGÍA + NATURALEZA','Conhecimento que':'Conocimiento que','floresce.':'florece.','Este projeto acadêmico de Análise e Desenvolvimento de Sistemas da UNINTER busca facilitar o acesso a informações sobre plantas domésticas, promovendo escolhas conscientes e o cultivo responsável.':'Este proyecto académico de Análisis y Desarrollo de Sistemas de UNINTER facilita el acceso a información sobre plantas domésticas y fomenta el cultivo responsable.','Alinhado aos Objetivos de Desenvolvimento Sustentável 11, 12 e 15.':'Alineado con los Objetivos de Desarrollo Sostenible 11, 12 y 15.','Projeto acadêmico • UNINTER • 2026':'Proyecto académico • UNINTER • 2026','Voltar ao topo ↑':'Volver arriba ↑','Créditos das fotografias':'Créditos de las fotografías','♡ Não tóxica*':'♡ No tóxica*','⚠ Tóxica para pets':'⚠ Tóxica para mascotas','Ver cuidados':'Ver cuidados','☀ Iluminação':'☀ Iluminación','💧 Rega':'💧 Riego','◈ Solo':'◈ Suelo','✳ Manutenção':'✳ Mantenimiento','⌂ Ambientes':'⌂ Espacios','Informações educativas. Confira a identificação e a toxicidade da espécie antes de introduzi-la em casas com animais.':'Información educativa. Verifica la especie y su toxicidad antes de llevarla a una casa con mascotas.','planta encontrada':'planta encontrada','plantas encontradas':'plantas encontradas'
    }
  };
  const plantInfo = {
    clorofito:{en:['Arching, hardy foliage, ideal for hanging baskets.','Water when the top layer of soil is dry.','Lightweight, well-draining potting mix.','Avoid harsh direct sun and standing water.'],es:['Hojas arqueadas y resistentes, ideales para macetas colgantes.','Riega cuando se seque la capa superior del sustrato.','Sustrato ligero y con buen drenaje.','Evita el sol intenso y el agua estancada.']},
    jiboia:{en:['Popular climbing vine with heart-shaped leaves.','Let the top of the soil dry between waterings.','Organic-rich, well-draining soil.','Can grow as a climber or trailing plant.'],es:['Trepadora popular con hojas en forma de corazón.','Deja secar la superficie del sustrato entre riegos.','Suelo rico en materia orgánica y con buen drenaje.','Puede crecer como trepadora o planta colgante.']},
    espada:{en:['Architectural upright leaves and easy care.','Water sparingly once the soil has dried well.','Very well-draining potting mix.','Avoid overwatering to prevent root rot.'],es:['Hojas verticales y esculturales, de fácil cuidado.','Riega moderadamente cuando el suelo esté bien seco.','Sustrato con excelente drenaje.','Evita el exceso de agua para prevenir la pudrición.']},
    maranta:{en:['Decorative leaves with striking patterns.','Keep soil slightly moist but not soggy.','Rich, airy potting mix.','Prefers humidity and diffused light.'],es:['Hojas decorativas con dibujos llamativos.','Mantén el sustrato ligeramente húmedo sin encharcar.','Sustrato rico y aireado.','Prefiere humedad ambiental y luz difusa.']},
    lirio:{en:['Lush green leaves and elegant white spathes.','Water when the soil surface begins to dry.','Fertile, moist, well-draining soil.','Avoid strong direct sunlight and keep away from pets.'],es:['Hojas verdes y elegantes espatas blancas.','Riega cuando empiece a secarse la superficie.','Suelo fértil, húmedo y bien drenado.','Evita el sol directo intenso y mantenla lejos de mascotas.']},
    palmeira:{en:['Compact palm that brings a light, tropical feel indoors.','Water when the top few centimeters of soil dry.','Rich, well-draining soil.','Prefers filtered light and moderate humidity.'],es:['Palmera compacta que aporta ligereza al interior.','Riega cuando se sequen los primeros centímetros del suelo.','Suelo rico y drenado.','Prefiere luz filtrada y humedad moderada.']},
    babosa:{en:['Succulent with thick, fleshy leaves.','Water thoroughly, then let the soil dry out.','Fast-draining succulent mix.','Introduce direct sunlight gradually; avoid waterlogging.'],es:['Suculenta de hojas gruesas y carnosas.','Riega abundantemente y deja secar el sustrato.','Sustrato para suculentas con excelente drenaje.','Adáptala al sol gradualmente y evita encharcar.']},
    violeta:{en:['Small flowering plant, ideal for compact spaces.','Water without soaking the leaves.','Light, airy potting mix.','Prefers bright indirect light.'],es:['Pequeña planta con flores, ideal para espacios reducidos.','Riega sin mojar demasiado las hojas.','Sustrato ligero y aireado.','Prefiere luz indirecta brillante.']}
  };
  const ptRooms = ['Sala','Quarto','Banheiro','Cozinha','Área externa'];
  const roomMap = {en:['Living room','Bedroom','Bathroom','Kitchen','Outdoor area'],es:['Sala','Dormitorio','Baño','Cocina','Exterior']};
  const dict = (lang, value) => (text[lang] || {})[value] || value;
  const stored = (()=>{try{return localStorage.getItem('raizelar-lang')}catch{return null}})();
  let current = ['pt','en','es'].includes(stored) ? stored : 'pt';
  const translateText = (root) => {
    if (!root) return;
    const walker = document.createTreeWalker(root, NodeFilter.SHOW_TEXT);
    const nodes=[]; while(walker.nextNode()) nodes.push(walker.currentNode);
    nodes.forEach(n=>{
      if (n.parentElement?.closest('script,style,option')) return;
      const raw=n.nodeValue, trimmed=raw.trim(); if(!trimmed) return;
      const key=n.__ptText || trimmed; n.__ptText=key;
      const replacement=dict(current,key);
      if(replacement!==trimmed) n.nodeValue=raw.replace(trimmed,replacement);
    });
    root.querySelectorAll?.('option').forEach(o=>{
      const base=o.dataset.ptLabel || o.textContent;
      o.dataset.ptLabel=base;
      o.textContent=dict(current,base);
    });
    root.querySelectorAll?.('[data-i18n-placeholder]').forEach(el=>{
      el.placeholder = current==='en'?'Search plants by name...':current==='es'?'Busca plantas por nombre...':'Busque pelo nome da planta...';
    });
    const count=document.querySelector('#count');
    if(count){const m=count.textContent.match(/^(\d+) /);if(m) count.textContent=m[1]+' '+(current==='en'?(m[1]==='1'?'plant found':'plants found'):current==='es'?(m[1]==='1'?'planta encontrada':'plantas encontradas'):(m[1]==='1'?'planta encontrada':'plantas encontradas'));}
    root.querySelectorAll?.('.details-button').forEach(el=>{el.innerHTML=(current==='en'?'Care guide':current==='es'?'Ver cuidados':'Ver cuidados')+' <span aria-hidden="true">↗</span>';});
    root.querySelectorAll?.('.pet-tag').forEach(el=>{el.textContent=el.classList.contains('safe')?dict(current,'♡ Não tóxica*'):dict(current,'⚠ Tóxica para pets');});
  };
  const updatePlants=()=>{
    window.PLANTS.forEach((p,i)=>{
      const base=original[i];if(!base)return;
      p.name=current==='pt'?base.name:(plantNames[p.id]?.[current==='en'?0:1] || base.name);
      p.environment=base.environment.map(v=>{const idx=ptRooms.indexOf(v);return idx<0?v:roomMap[current]?.[idx]||v;});
      // Filters retain Portuguese option values, so environment arrays stay in Portuguese.
      p.environment=[...base.environment];
      const details=plantInfo[p.id]?.[current];
      ['description','water','soil','care'].forEach((field,k)=>p[field]=details?.[k]||base[field]);
    });
  };
  const changeLanguage=(lang)=>{
    current=lang;
    document.documentElement.lang=lang==='pt'?'pt-BR':lang;
    try{localStorage.setItem('raizelar-lang',lang)}catch{}
    updatePlants();
    // The existing app.js listens for input changes and redraws the cards.
    document.querySelector('#search')?.dispatchEvent(new Event('input',{bubbles:true}));
    translateText(document.body);
    document.querySelector('#language-selector').value=lang;
  };
  const selector=document.querySelector('#language-selector');
  if(!selector)return;
  selector.addEventListener('change',e=>changeLanguage(e.target.value));
  const search=document.querySelector('#search');if(search)search.setAttribute('data-i18n-placeholder','');
  const dialog=document.querySelector('#plant-dialog');
  if(dialog){const observer=new MutationObserver(()=>translateText(dialog));observer.observe(dialog,{childList:true,subtree:true});}
  // Update dynamic cards after search/filter interactions.
  ['search','environment','light','pets','favorites-only','clear'].forEach(id=>{
    const el=document.getElementById(id);if(!el)return;
    ['input','change','click'].forEach(evt=>el.addEventListener(evt,()=>queueMicrotask(()=>translateText(document.querySelector('#cards')))));
  });
  document.querySelector('#cards')?.addEventListener('click',()=>queueMicrotask(()=>translateText(document.querySelector('#cards'))));
  changeLanguage(current);
})();
