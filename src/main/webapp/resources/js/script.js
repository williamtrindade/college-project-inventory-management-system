window.addEventListener('load', () =>  {
    try {
        VMasker( document.querySelector('#preco')).maskMoney();
    } catch (error) {
    }

    try {
        VMasker(document.querySelector("#cpf")).maskPattern("999.999.999-40");
    } catch (error) {
    }

    try {
        VMasker(document.querySelector("#telefone")).maskPattern("(99)99999-9999");
    } catch (error) {
    }
});