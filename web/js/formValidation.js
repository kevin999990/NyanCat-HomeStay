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
        feedbackPhone: {
            digits: true

        },
    },
    messages: {
        feedbackName: "Please enter your name",
        email: "Please enter a valid email address",
        feedbackPhone: {
            digits: "Only can enter digit",
        }
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
$("#guestReserveForm").validate({
    rules: {
        customerName: "required",
        email: {
            required: true,
            email: true
        },
        cardHolderName: "required",
        phoneNumber: {
            digits: true
        },
        creditCardNumber: {
            required: true,
            digits: true
        },
        cvv: {
            required: true,
            digits: true
        },
        expdate: "required",
    },
    messages: {
        customerName: "Please enter your name.",
        email: {
            required: "Please enter your email",
            email: "Please enter valid email."
        },
        phoneNumber: {
            digits: "Only can enter digit."
        },
        cardHolderName: "Please enter card holder name.",
        creditCardNumber: {
            required: "Please enter credit card number",
            digits: "Only can enter digit."
        },
        cvv: {
            required: "Please check your credit card back side.",
            digits: "Only can enter digit."
        },
        expdate: "Please enter credit card expire date.",
    }
});





$("#manageStaffForm").validate({
    rules: {
        staffName: "required",
        staffIc: "required",
        phoneNumber: {
            required: true,
            digits: true
        },
        staffAddress: "required",
        staffUsername: "required",
        staffPassword: "required",
        staffPasswordAgain: {
            required: true,
            equalTo: "#staffPassword"}
    },
    messages: {
        staffName: "Please enter your name",
        staffIc: "Please enter your ic",
        phoneNumber: {
            required: "Please enter your phone number",
            digits: "Only can enter digit"
        },
        staffAddress: "Please enter your address",
        staffUsername: "Please enter your username",
        staffPassword: "Please enter your password",
        staffPasswordAgain: {
            required: "Please confirm your password",
            equalTo: "The password must be same"}
    }
});


resetForm

$("#resetForm").validate({
    rules: {
        userName: "required",
        userIc: "required",
        password: "required",
        
        password2: {
       
            required: true,
            equalTo: "#password"}
    },
    messages: {
        userName: "Please enter your username",
        userIc: "Please enter your ic",
       
        password: "Please enter your password",
        password2: {
            required: "Please confirm your password",
            equalTo: "The password must be same"}
    }
});