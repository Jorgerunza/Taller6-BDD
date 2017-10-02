var { defineSupportCode } = require('cucumber');
var { expect } = require('chai');

defineSupportCode(({Given, When, Then}) => {
    Given('I go to losestudiantes home screen', () => {
        browser.url('/');
        if(browser.isVisible('button=Cerrar')) {
            browser.click('button=Cerrar');
        }
    });

    When('I open the login screen', () => {
        browser.waitForVisible('button=Ingresar', 5000);
        browser.click('button=Ingresar');
    });

    When(/^I fill with (.*), (.*), (.*), selected a (.*), fill my (.*) and check the (.*)$/, 
        (name, lastname, email, idDepartamento, password, acepta) => {
            var cajaSignUp = browser.element('.cajaSignUp');
            cajaSignUp.element('input[name="nombre"]').click().keys(name);
            cajaSignUp.element('input[name="apellido"]').click().keys(lastname);
            cajaSignUp.element('input[name="correo"]').click().keys(email);
            cajaSignUp.element('input[name="password"]').click().keys(password);
            if(idDepartamento !== "")
               var selectBox2 = browser.element('select[name="idDepartamento"]');
               selectBox2.selectByValue('3');
            if(acepta !== "")
                cajaSignUp.element('input[name="acepta"]').click();
    });

    When('I try to register', () => {
        var cajaSignUp = browser.element('.cajaSignUp');
        cajaSignUp.element('button=Registrarse').click();
    });

    Then(/^I expect to see (.*)$/, error => {
        if(error !== "") {
            browser.waitForVisible('.aviso.alert.alert-danger', 5000);
            var alertText = browser.element('.aviso.alert.alert-danger').getText();
            expect(alertText).to.include(error);
        }
    });



});
