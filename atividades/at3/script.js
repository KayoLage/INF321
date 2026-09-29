let produtos = document.querySelectorAll('.produto');
const modal = document.getElementById('modal');
const itensEl = document.getElementById('carrinho-itens');
let carrinho = [];

const brl = (v) => v.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' });

/* ---------- Carrinho ---------- */
function renderCarrinho() {
    itensEl.innerHTML = '';
    let total = 0;
    let qtd = 0;

    carrinho.forEach((item, i) => {
        const subtotal = item.preco * item.qtd;
        total += subtotal;
        qtd += item.qtd;

        const tr = document.createElement('tr');
        tr.innerHTML = `<td></td><td>${item.qtd}</td><td>${brl(subtotal)}</td>
            <td><button type="button" data-remover="${i}">Remover</button></td>`;
        tr.firstElementChild.textContent = item.nome;
        itensEl.appendChild(tr);
    });

    document.getElementById('carrinho-qtd').textContent = qtd;
    document.getElementById('carrinho-total').textContent = brl(total);
    document.getElementById('carrinho-vazio').hidden = carrinho.length > 0;
    document.getElementById('carrinho-tabela').hidden = carrinho.length === 0;
}

function adicionar(produto) {
    const nome = produto.querySelector('h3').textContent;
    const preco = parseFloat(produto.dataset.preco);
    const existente = carrinho.find((i) => i.nome === nome);
    if (existente) existente.qtd++;
    else carrinho.push({ nome, preco, qtd: 1 });
    renderCarrinho();
    modal.hidden = false;
}

function ligaCompra(p) {
    p.querySelector('.comprar').addEventListener('click', () => adicionar(p));
}
produtos.forEach(ligaCompra);

itensEl.addEventListener('click', (e) => {
    const i = e.target.dataset.remover;
    if (i === undefined) return;
    carrinho.splice(Number(i), 1);
    renderCarrinho();
});

document.getElementById('abrir-carrinho').addEventListener('click', () => (modal.hidden = false));
document.getElementById('fechar-carrinho').addEventListener('click', () => (modal.hidden = true));
modal.addEventListener('click', (e) => { if (e.target === modal) modal.hidden = true; });
document.addEventListener('keydown', (e) => { if (e.key === 'Escape') modal.hidden = true; });

/* ---------- Busca / filtro ---------- */
const busca = document.getElementById('busca');
const categoria = document.getElementById('categoria');

const normaliza = (s) => s.normalize('NFD').replace(/[̀-ͯ]/g, '').toLowerCase();

function filtrar() {
    const termo = normaliza(busca.value.trim());
    let visiveis = 0;
    produtos.forEach((p) => {
        const nome = normaliza(p.querySelector('h3').textContent);
        const ok = nome.includes(termo) && (!categoria.value || p.dataset.categoria === categoria.value);
        p.hidden = !ok;
        if (ok) visiveis++;
    });
    document.getElementById('sem-resultados').hidden = visiveis > 0;
}

busca.addEventListener('input', filtrar);
categoria.addEventListener('change', filtrar);
document.getElementById('filtros').addEventListener('submit', (e) => e.preventDefault());

/* ---------- Validação do formulário de contato ---------- */
const contato = document.getElementById('contato');

const regras = {
    'c-nome': (v) => (v.length < 3 ? 'Informe seu nome (mínimo 3 caracteres).' : ''),
    'c-email': (v) => (/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(v) ? '' : 'Informe um e-mail válido.'),
    'c-assunto': (v) => (v ? '' : 'Selecione um assunto.'),
    'c-mensagem': (v) => (v.length < 10 ? 'A mensagem deve ter ao menos 10 caracteres.' : ''),
};

function validaCampo(id) {
    const campo = document.getElementById(id);
    const msg = regras[id](campo.value.trim());
    contato.querySelector(`[data-erro="${id}"]`).textContent = msg;
    campo.classList.toggle('invalido', msg !== '');
    return msg === '';
}

Object.keys(regras).forEach((id) => {
    document.getElementById(id).addEventListener('blur', () => validaCampo(id));
});

contato.addEventListener('submit', (e) => {
    e.preventDefault();
    const valido = Object.keys(regras).map(validaCampo).every(Boolean);
    document.getElementById('contato-ok').hidden = !valido;
    if (valido) contato.reset();
});

/* ---------- Cadastro de produto ---------- */
document.getElementById('cadastro').addEventListener('submit', (e) => {
    e.preventDefault();
    const f = e.target;
    const p = document.createElement('article');
    p.className = 'produto';
    p.dataset.categoria = f.categoria.value;
    p.dataset.preco = f.preco.value;
    p.innerHTML = `<img alt=""><h3></h3><p class="preco"></p>
        <button type="button" class="comprar">Comprar</button>`;
    p.querySelector('img').src = f.foto.value.trim();
    p.querySelector('img').alt = f.nome.value;
    p.querySelector('h3').textContent = f.nome.value;
    p.querySelector('.preco').textContent = brl(parseFloat(f.preco.value));
    document.querySelector('.produtos').appendChild(p);
    ligaCompra(p);
    produtos = document.querySelectorAll('.produto');
    filtrar();
    f.reset();
});
