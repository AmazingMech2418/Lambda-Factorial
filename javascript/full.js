function toChurch(num) {
  let res = f => x => x;
  for(let i = 0; i < num; i++) {
    res = (n => f => x => f(n(f)(x)))(res);
  }
  return res;
}

const factLambda = (g => (x => g(v => x(x)(v)))(x => g(v => x(x)(v))))(f => n => ((i => i(x => a => b => b)(a => b => a))(n)(v=>(a => b => a(b)))(v=>(m => a => b => x => m(a(b))(x))(n)(v((a => b => x => a(g => h => h(g(b)))(u=>x)(u=>u))(n)))))(f))
const factNums = n => factLambda(toChurch(n))(v => v + 1)(0)


console.log(factNums(5))
