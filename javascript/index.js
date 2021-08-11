function toChurch(num) {
  let res = f => x => x;
  for(let i = 0; i < num; i++) {
    res = (n => f => x => f(n(f)(x)))(res);
  }
  return res;
}

const Z = (g => (x => g(v => x(x)(v)))(x => g(v => x(x)(v))));

const isZero = n => n(x => a => b => b)(a => b => a);

const _1 = f => x => f(x);
const _2 = f => x => f(f(x));
const _0 = f => x => x;

const pred = n => f => x => n(g => h => h(g(f)))(u=>x)(u=>u);

const mult = m => n => f => x => m(n(f))(x);

const F = f => n => (isZero(n)(v => _1)(v => mult(n)(v(pred(n)))))(f);

const factLambda = Z(F)

console.log(factLambda(toChurch(5))(n => n+1)(0))
