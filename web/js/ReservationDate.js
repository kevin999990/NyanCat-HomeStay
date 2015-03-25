/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


//referrence : http://www.eyecon.ro/bootstrap-datepicker/
//referrence : http://jqueryvalidation.org/
var nowTemp = new Date();
var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

var checkin = $('#checkinDate').datepicker({
    format: 'dd/mm/yyyy',
    onRender: function (date) {
        return date.valueOf() < now.valueOf() ? 'disabled' : '';
    }
}).on('changeDate', function (ev) {
    if (ev.date.valueOf() > checkout.date.valueOf()) {
        var newDate = new Date(ev.date)
        newDate.setDate(newDate.getDate() + 1);
        checkout.setValue(newDate);
    }
    checkin.hide();
    $('#checkoutDate')[0].focus();
}).data('datepicker');
var checkout = $('#checkoutDate').datepicker({
    format: 'dd/mm/yyyy',
    onRender: function (date) {
        return date.valueOf() <= checkin.date.valueOf() ? 'disabled' : '';
    }
}).on('changeDate', function (ev) {
    checkout.hide();
}).data('datepicker');


         $("#checkoutDate").on('hide', function () {

                from = $("#checkinDate").val().split("/");
                f = new Date(from[2], from[1] - 1, from[0]);
                to = $("#checkoutDate").val().split("/");
                t = new Date(to[2], to[1] - 1, to[0]);

                var checkinDate = new Date(f);
                var checkoutDate = new Date(t);
                var timeDiff = Math.abs(checkoutDate.getTime() - checkinDate.getTime());
                var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));

                document.getElementById('numberOfNight').value = diffDays;
            })