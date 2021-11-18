$(function () {

    /* Morris Area Chart */

    window.mA = Morris.Donut({
        element: 'graph',
        data: [
            {value: 70, label: 'foo'},
            {value: 15, label: 'bar'},
            {value: 10, label: 'baz'},
            {value: 5, label: 'A really really long label'}
        ],
        formatter: function (x) {
            return x + "%"
        }
    }).on('click', function (i, row) {
        console.log(i, row);
    });

    /* Morris Line Chart */

    window.mL = Morris.Line({
        element: 'morrisLine',
        data: [
            {y: '2015', a: 100, b: 30},
            {y: '2016', a: 20, b: 60},
            {y: '2017', a: 90, b: 120},
            {y: '2018', a: 50, b: 80},
            {y: '2019', a: 120, b: 150},
        ],
        xkey: 'y',
        ykeys: ['a', 'b'],
        labels: ['Doctors', 'Patients'],
        lineColors: ['#1b5a90', '#ff9d00'],
        lineWidth: 1,
        gridTextSize: 10,
        hideHover: 'auto',
        resize: true,
        redraw: true
    });
    $(window).on("resize", function () {
        mA.redraw();
        mL.redraw();
    });

});