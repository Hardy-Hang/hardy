<html>
<head>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript">
        var DownLoadFile = function (options) {
            var config = $.extend(true, { method: 'post' }, options);
            var $iframe = $('<iframe id="down-file-iframe" />');
            console.log(config.data);
            var $form = $('<form target="down-file-iframe" method="' + config.method + '" />');
            $form.attr('action', config.url);
            for (var key in config.data) {
                $form.append('<input type="hidden" name="' + key + '" value="' + config.data[key] + '" />');
            }
            $iframe.append($form);
            $(document.body).append($iframe);
            $form[0].submit();
            $iframe.remove();
        }

        $(document).on('click', '.click', function(){
            DownLoadFile({
                        url: 'http://localhost:8081/diace/excle/export/',
                        method: 'post',
                        data: JSON.stringify({"time_level":"MONTH_LEVEL","time_list":["2016/06"],"geo_level":"ALL_AREA","geo_list":[],"seed_level":"ALL_SEED","seed_list":[],"operate":"query","drillDim":"","excelFlag":1})
                    });
        });
    </script>
</head>

<body>
<div style="width: 100%; margin: 0 auto; text-align: center">
    <a class="click">
        <button
            style="width: 15%; height: 4.2rem; line-height: 4.2rem; border: none; background-color: #27bdfc; border-radius: 5px; font-size: 1.6rem; color: white; text-align: center; overflow: hidden"
            class="btn-icon">
            <div>download excel</div>
        </button>
    </a>
</div>
</body>

</html>
