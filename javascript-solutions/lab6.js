function cnst(c) { return c;}
var vars = {"x": 0, "y": 0, "z": 0};
function variable(vari) {return vars[vari];}
function add(){
    let res = 0; for (let i= 0; i < arguments.length;i++){res+=arguments[i];} return res;
    
}
function subtract(a, ...args) {return a-add(args);}
function multiply() {let res = 1; for (let i= 0; i < arguments.length;i++){res*=arguments[i];} return res;}
function divide(a, ...args) {return a/multiply(args);}
function negate(a) {return -a;}

function expr(x,y,z){
    vars["x"] = x;
    vars["y"] = y;
    vars["z"] = z;
    return add(multiply(variable("x"), variable("x")), negate(multiply(cnst(2), variable("x"))), cnst(1) );
}

function parse(str){
    
    let arr = str.split(" ")
    let st = [];
    for(let i = 0; i < arr.length; i++){
        let cur = variable(arr[i]);
        if (cur){
            st.push(cur);
            continue;
        }
        cur = arr[i];
        if (cur=="+"){
            st.push(add(st.pop(), st.pop()));
            continue;
        }
        
        if (cur=="-"){
            st.push(subtract(st.pop(), st.pop()));
            continue;
        }
        
        if (cur=="*"){
            st.push(multiply(st.pop(), st.pop()));
            continue;
        }
        
        if (cur=="/"){
            st.push(divide(st.pop(), st.pop()));
            continue;
        }
        st.push(parseInt(cur));
    }
    return st.pop();
}

console.log(parse("1 2 +"));

for (let i = 0; i < 10; i++){
    console.log(expr(i,0,0));
}