window.addEventListener('message', function(event) {
    if (event.data.show == true) {
        if (event.data.pages) {
            $.each(event.data.pages, function(_, page) {
                const imgSrc = page.source === 'local' ? 'img/' + event.data.book + '/' + page.pageName + '.png' : page.pageName;
                
                $('#inner').append(
                    `<div${page.type === 'hard' ? ' class="hard"' : ''}><img src="${imgSrc}" width=${event.data.size.width} height=${event.data.size.height}></div>`
                );
            });

            $('#inner').turn({
                gradients: true,
                autoCenter: true,
                width: event.data.size.width*2,
                height: event.data.size.height,
                page: 1,
                acceleration: true,
            });

            $('body').css('display', 'block');
        }
    } else if (event.data.show == false) {
        $('body').css('display', 'none');
    }

    $(document).keyup(function(e) {
        if (e.keyCode == 27) {
            $('body').css('display', 'none');
            if ($('#inner').turn('is')) {
                $('#inner').turn('page', 1);
                $('#inner').turn('destroy');
            }
            inner.style = "";
            $.post(`https://${GetParentResourceName()}/escape`, JSON.stringify({}));
        }
    });
});
