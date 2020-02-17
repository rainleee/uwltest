<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script>
        $(function() {
            $("#datepicker").datepicker({
                dateFormat: 'yy�� mm�� dd��',
                monthNames: ['1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��', '11��', '12��'] //�޷��� �� �κ� Tooltip �ؽ�Ʈ
                    ,
                dayNamesMin: ['��', '��', 'ȭ', '��', '��', '��', '��'] //�޷��� ���� �κ� �ؽ�Ʈ
                    ,
                showMonthAfterYear: true,
                yearSuffix: "��"
            });

        });
    </script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        li {
            list-style: none;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        body {
            font-size: 16px;
            color: #333;
            font-family: 'Roboto', sans-serif;
            font-family: 'Nanum Gothic', sans-serif;
        }

        .cal_top {

            height: 70px;
            position: relative;
        }

        #cal_tab {

            height: calc(100vh - 70px);
        }

        #cal_tab table {

            width: 100%;
            height: 100%;
            border-collapse: collapse;
            text-align: center;
        }

        #cal_tab td {
            border: 1px solid #d4d4d4;
            font-size: 11px;
            color: #333;
        }

        #cal_tab tr:nth-child(7) td {
            border-bottom: none;

        }

        #cal_tab tr:nth-child(1) {

            height: 20px;
            vertical-align: bottom;

        }

        #cal_tab tr:nth-child(1) td {
            border-bottom: none;
        }

        #cal_tab tr:nth-child(2) td {
            border-top: none;
        }

        #cal_tab tr:nth-child(n + 2) {

            vertical-align: top;
            font-weight: bold;
        }

        #cal_tab tr:nth-child(n + 2) td {
            padding-top: 5px;
        }

        .cal_top>div {
            position: absolute;

            top: 50%;
            transform: translateY(-50%);
            left: 10%;
        }

        .cal_top div div {

            display: inline-block;
        }

        .cal_top div div:nth-child(1) a {
            padding: 0 10px;
            display: block;
            border: 1px solid #d4d4d4;
            border-radius: 5px;
            font-size: 14px;
            margin-right: 15px;
            transition: all 0.1s;
            line-height: 35px;
        }

        .cal_top div div:nth-child(2) a {
            display: inline-block;
            padding: 10px 15px;
            border-radius: 50%;

            font-weight: bold;
            transition: all 0.1s;
        }

        .cal_top div div a:hover {
            background-color: rgba(212, 212, 212, 0.6);
        }

        .cal_top div div:nth-child(3) {
            font-size: 19px;
            font-weight: bold;
            margin-left: 15px;
            vertical-align: -3px;
            padding: 0 5px;
            border-radius: 3px;
            transition: all 0.1s;
            line-height: 35px;
        }

        .cal_top div div:nth-child(3):hover {
            background-color: rgba(212, 212, 212, 0.3);
        }

        .addSchedule {
            font-size: 40px;
            font-weight: bold;
            border-radius: 50%;
            padding: 7px 17px;
            display: block;
            background-color: rgba(255, 255, 255, 0.5);
            box-shadow: 3px 3px 3px rgba(137, 137, 137, 0.63);
            position: absolute;
            top: 75px;
            left: 25px;
            border: 1px solid #eee;
            transition: all 0.2s;
            color: #EBAD7A;

        }

        .addSchedule:hover {
            box-shadow: 3px 3px 30px rgba(137, 137, 137, 0.63);
            background-color: lavender;
        }

        .cal_top div div:nth-child(4) a:hover {
            box-shadow: 1px 1px 10px #898989;
            background-color: lavender;
        }

        .wrap {
            background-color: #fff;
            width: 400px;
            padding: 10px 20px 15px 10px;

            border-radius: 5px;
            box-shadow: 0px 0px 20px rgba(137, 137, 137, 0.56);
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            display: none;
            z-index: 2;
        }

        .wrap div:nth-child(1) {
            text-align: right;
        }

        .wrap div:nth-child(n + 2) {


            width: 100%;
            overflow: hidden;
        }

        .wrap div:nth-child(n + 2) i {
            width: 10%;
            float: left;
            text-align: center;
            line-height: 34px;
        }

        .wrap div:nth-child(n + 2) input {
            width: 90%;
            float: right;

            border: none;
            line-height: 34px;
        }

        .wrap div:nth-child(6) {

            text-align: right;
            padding-top: 20px;
        }

        .wrap div:nth-child(2) input {

            font-size: 20px;
            border-bottom: 1px solid;
            margin-bottom: 15px;
        }

        .wrap div:nth-child(6) a {
            display: inline-block;
            background: #EBAD7A;
            padding: 7px 20px;
            border-radius: 5px;
            margin-bottom: 3px;
            transition: all 0.1s;
            color: #fff;

        }

        .wrap div:nth-child(6) a:hover {
            background-color: rgba(235, 173, 122, 0.9);
        }

        .wrap div:nth-child(3) input {
            color: #000;
            width: auto;

            border-radius: 5px;
            float: left;
            width: 125px;
            text-align: center
        }

        .wrap div:nth-child(n + 3) input {
            border-radius: 5px;
            transition: all 0.2s;
        }

        .wrap div:nth-child(n + 3) input {
            padding: 0 8px;

        }

        .wrap div:nth-child(n + 3) input:hover,
        .wrap div:nth-child(n + 3) input:focus {
            background-color: rgba(235, 173, 122, 0.3);

        }

        .wrap div:nth-child(2) {
            position: relative;
        }

        .wrap div:nth-child(2) span {
            display: block;
            background-color: #EBAD7A;
            width: 0%;
            height: 2px;
            position: absolute;
            right: 47%;
            bottom: 15px;
            transition: width 0.5s, right 0.5s;
        }


        .wrap div:nth-child(2).on span {
            width: 90%;
            right: 0;
        }

        .wrap div:nth-child(3) {
            position: relative;
        }

        .wrap div:nth-child(3) span {
            display: block;
            background-color: #EBAD7A;
            width: 0%;
            height: 2px;
            position: absolute;
            left: 26%;
            bottom: 0;
            transition: width 0.5s, left 0.5s;
        }

        .wrap div:nth-child(3).on span {
            width: 34%;
            left: 10%;
        }

        .wrap div:nth-child(4),
        .wrap div:nth-child(5) {
            position: relative;
        }

        .wrap div:nth-child(4) span,
        .wrap div:nth-child(5) span {
            display: block;
            background-color: #EBAD7A;
            width: 0%;
            height: 2px;
            position: absolute;
            right: 45%;
            bottom: 0;
            transition: width 0.5s, right 0.5s;
        }

        .wrap div:nth-child(4).on span,
        .wrap div:nth-child(5).on span {
            width: 90%;
            right: 0;
        }

        .overlay {
            width: 100%;
            height: 100vh;

            position: absolute;
            top: 0;
            left: 0;
            z-index: 1;
            display: none;

        }

        .cal-day {


            display: inline-block;
            line-height: 25px;
            border-radius: 50%;
            width: 25px;
            height: 25px;

        }



        input:focus {
            outline: none;
        }

        .wrap div:nth-child(1) a {
            display: inline-block;
            line-height: 30px;
            padding: 0 9px;
            border-radius: 50%;
            text-align: center;


        }

        .wrap div:nth-child(1) a:hover {
            background-color: rgba(235, 173, 122, 0.5);
        }

        div.cal-schedule {
            background-color: #EBAD7A;
            margin-top: 5px;
        }
    </style>


</head>

<body>
    <div class="overlay">

    </div>
    <div class="wrap">

        <div>
            <a href="#"><i class="fas fa-times"></i></a>
        </div>
        <div>
            <input type="text" placeholder="���� �� �ð� �߰�">
            <span></span>
        </div>
        <div>
            <i class="far fa-clock"></i> <input id="datepicker" type="text" value="" readonly>
            <span></span>
        </div>
        <div>
            <i class="fas fa-map-marker-alt"></i> <input type="text" placeholder="��ġ �Ǵ� ȸ�� �߰�">
            <span></span>
        </div>
        <div>
            <i class="fas fa-align-left"></i> <input type="text" placeholder="���� �߰�">
            <span></span>
        </div>
        <div>
            <a href="#">����</a>
        </div>
    </div>

    <div class="cal_top">
        <div>
            <div>
                <a class="today" href="#">����</a>
            </div>

            <div>
                <a href="#" id="movePrevMonth">
                    <span id="prevMonth" class="cal_tit">
                        &lt;
                    </span>
                </a>
                <a href="#" id="moveNextMonth">
                    <span id="nextMonth" class="cal_t it">
                        &gt;
                    </span>
                </a>
            </div>

            <div>
                <span id="cal_top_year"></span><span>��</span>
                <span id="cal_top_month"></span><span>��</span>
                <i class="fas fa-caret-down"></i>
            </div>



        </div>

    </div>
    <!--<div>
        <a class="addSchedule" href="#">+</a>
    </div>-->
    <div id="cal_tab" class="cal">

    </div>


    <script type="text/javascript">
        var today = null;
        var year = null;
        var month = null;
        var firstDay = null;
        var lastDay = null;
        var $tdDay = null;
        var $tdSche = null;
        var day = null;

        $(document).ready(function() {
            drawCalendar();
            initDate();
            drawDays();
            $("#movePrevMonth").on("click", function() {
                movePrevMonth();
            });

            $("#moveNextMonth").on("click", function() {
                moveNextMonth();
            });
        });

        //calendar �׸���
        function drawCalendar() {
            var setTableHTML = "";
            setTableHTML += '<table class="calendar">';
            setTableHTML += '<tr><td>��</td><td>��</td><td>ȭ</td><td>��</td><td>��</td><td>��</td><td>��</td></tr>';
            for (var i = 0; i < 6; i++) {
                setTableHTML += '<tr>';
                for (var j = 0; j < 7; j++) {
                    setTableHTML += '<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap">';
                    setTableHTML += '    <div class="cal-day"></div>';
                    setTableHTML += '    <div class="cal-schedule"></div>';
                    setTableHTML += '</td>';

                }
                setTableHTML += '</tr>';
            }
            setTableHTML += '</table>';
            $("#cal_tab").html(setTableHTML);
        }








        //��¥ �ʱ�ȭ
        function initDate() {
            $tdDay = $("td div.cal-day")
            $tdSche = $("td div.cal-schedule")
            dayCount = 0;
            today = new Date();
            year = today.getFullYear();
            month = today.getMonth() + 1;
            month = month >= 10 ? month : '0' + month;



            firstDay = new Date(year, month - 1, 1);
            lastDay = new Date(year, month, 0);
        }

        //calendar ��¥ǥ��
        function drawDays() {
            $("#cal_top_year").text(year);
            $("#cal_top_month").text(month);


            console.log($("#cal_top_year").text());
            console.log(today.getFullYear());
            console.log($("#cal_top_month").text());

            var a1 = today.getMonth() + 1
            a1 = a1 = a1 >= 10 ? a1 : '0' + a1;
            console.log(a1);

            console.log(today.getDate());


            for (var i = firstDay.getDay(); i < firstDay.getDay() + lastDay.getDate(); i++) {



                $tdDay.eq(i).text(++dayCount);

                if ($tdDay.eq(i).text() == today.getDate()) {
                    console.log($tdDay.eq(i).text());

                }




                /*if ($('#cal_top_year').text() == today.getFullYear()) {
                    console.log('����');
                    $tdDay.eq(i).css({
                        'color': 'red'
                    });
                }*/

                /*if ($('#cal_top_month').text() == a1) {
                    console.log('����');
                    $tdDay.eq(i).css({
                        'color': 'red'
                    });
                }*/

                /*if (today.getDate() == $tdDay.eq(i).text()) {
                    console.log('����');
                    $tdDay.eq(i).css({
                        'color': 'red'
                    });
                }*/

                /*if($('#cal_top_year').text() == today.getFullYear() && $('#cal_top_month').text() == a1) {
                    console.log('����');
                    $tdDay.eq(i).css({
                        'color': 'red'
                    });
                }*/

                if ($('#cal_top_year').text() == today.getFullYear() && $('#cal_top_month').text() == a1 && today.getDate() == $tdDay.eq(i).text()) {
                    console.log('����');
                    $tdDay.eq(i).css({
                        'background': 'rgba(235, 173, 122, 0.5)'
                    });
                } else {
                    $tdDay.eq(i).css({
                        'background': 'none'
                    });
                }




            }


            for (var i = 0; i < 42; i += 7) {
                //$tdDay.eq(i).css("color", "red");
            }
            for (var i = 6; i < 42; i += 7) {
                //$tdDay.eq(i).css("color", "blue");
            }







        }


        //calendar �� �̵�
        function movePrevMonth() {
            month--;
            if (month <= 0) {
                month = 12;
                year--;
            }
            if (month < 10) {
                month = String("0" + month);
            }
            getNewInfo();

        }

        function moveNextMonth() {
            month++;
            if (month > 12) {
                month = 1;
                year++;
            }
            if (month < 10) {
                month = String("0" + month);
            }
            getNewInfo();
        }


        function getNewInfo() {
            for (var i = 0; i < 42; i++) {
                $tdDay.eq(i).text("");

            }
            dayCount = 0;
            firstDay = new Date(year, month - 1, 1);
            lastDay = new Date(year, month, 0);
            drawDays();
        }
    </script>
    <script>
        $(document).ready(function() {

            $('td').on('click', function() {

                //alert($(this).find('div.cal-day').text());
                if ($(this).find('div.cal-day').text() != '') {

                    day = $(this).find('div.cal-day').text();
                    day = day >= 10 ? day : '0' + day;

                    //alert($(this).find('div.cal-day').text());
                    $('.overlay').css({
                        'display': 'block'
                    });
                    $('.wrap').css({
                        'display': 'block'
                    });


                    $('#datepicker').val(year + '�� ' + month + '�� ' + day + '��');



                }

                setTimeout(sayHi, 10);



            });





            $(document).on('click', function(e) {
                if ($('.overlay').is(e.target)) {
                    $('.overlay').css({
                        'display': 'none'
                    });
                    $('.wrap').css({
                        'display': 'none'
                    });
                    $('.wrap div:nth-child(2)').removeClass('on');

                    $('input').val('');
                }
            });

            $('.wrap div:nth-child(1) a').on('click', function() {
                $('.overlay').css({
                    'display': 'none'
                });
                $('.wrap').css({
                    'display': 'none'
                });
                $('.wrap div:nth-child(2)').removeClass('on');

                $('input').val('');
            });

            $('.wrap div:nth-child(6) a').on('click', function() {
                $('.overlay').css({
                    'display': 'none'
                });
                $('.wrap').css({
                    'display': 'none'
                });
                $('.wrap div:nth-child(2)').removeClass('on');




            });



            $('.addSchedule').on('click', function() {

                day = today.getDate();
                day = day >= 10 ? day : '0' + day;
                $('.overlay').css({
                    'display': 'block'
                });
                $('.wrap').css({
                    'display': 'block'
                });


                $('#datepicker').val(year + '�� ' + month + '�� ' + day + '��')
            });


            $('.today').on('click', function() {
                year = today.getFullYear();
                month = today.getMonth() + 1;

                if (month < 10) {
                    month = String("0" + month);
                }
                getNewInfo();
            });




            function sayHi() {
                $('.wrap div:nth-child(2) span').css({
                    'opacity': '1'
                });
                $('.wrap div:nth-child(2)').addClass('on');
                $('.wrap div:nth-child(2)').find('input').focus();
            }

            $('.wrap div:nth-child(2)').on('click', function() {
                $('.wrap div span').css({
                    'opacity': '0'
                });
                $('.wrap div').removeClass('on');
                $('.wrap div:nth-child(2) span').css({
                    'opacity': '1'
                });
                $('.wrap div:nth-child(2)').addClass('on');

            });

            $('.wrap div:nth-child(3) input').on('click', function() {
                $('.wrap div span').css({
                    'opacity': '0'
                });
                $('.wrap div').removeClass('on');
                $('.wrap div:nth-child(3) span').css({
                    'opacity': '1'
                });
                $('.wrap div:nth-child(3)').addClass('on');
            });


            $('.wrap div:nth-child(4)').on('click', function() {
                $('.wrap div span').css({
                    'opacity': '0'
                });
                $('.wrap div').removeClass('on');
                $('.wrap div:nth-child(4) span').css({
                    'opacity': '1'
                });
                $('.wrap div:nth-child(4)').addClass('on');
            });

            $('.wrap div:nth-child(5)').on('click', function() {
                $('.wrap div span').css({
                    'opacity': '0'
                });
                $('.wrap div').removeClass('on');
                $('.wrap div:nth-child(5) span').css({
                    'opacity': '1'
                });
                $('.wrap div:nth-child(5)').addClass('on');
            });


            $('.wrap div input').focusout(function() {
                $('.wrap div span').css({
                    'opacity': '0'
                });
                $('.wrap div').removeClass('on');
            });
            //var setSchedule = '';
            //setSchedule += '<p class="schedule">������1</p>';
            //setSchedule += '<p class="schedule">������2</p>';
            //setSchedule += '<p class="schedule">������3</p>';
            //$('div.cal-schedule').html(setSchedule);



            $('td').on('click', function() {
                //alert($('#cal_top_year').text());
                //alert($('#cal_top_month').text());
                //alert($(this).find('div.cal-day').text());
                var thisday = $(this).find('div.cal-day').text();
                thisday = thisday >= 10 ? thisday : '0' + thisday;
                console.log($('#cal_top_year').text() + '�� ' + $('#cal_top_month').text() + '�� ' + thisday + '��');
            });

            $('.wrap div:nth-child(6) a').on('click', function() {
                console.log($('#datepicker').val());

                var date = $('#datepicker').val().charAt(10) + $('#datepicker').val().charAt(11);

                date = date.charAt(0) == 0 ? date.charAt(1) : date;

                console.log(date);







            });





        });
    </script>
</body></html>
