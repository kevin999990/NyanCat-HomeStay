/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$('#reservationForm').validate();
$("#feedbackForm").validate({
    rules: {
        feedbackName: "required",
        feedbackMessage: "required",
        feedbackEmail: {
            required: true,
            email: true
        },
    },
    messages: {
        feedbackName: "Please enter your name",
        email: "Please enter a valid email address",
    }
});
$("#loginForm").validate({
    rules: {
        userName: "required",
        password: "required",
    },
    messages: {
        userName: "Please enter your username",
        password: "Plsese enter your password",
    }
});