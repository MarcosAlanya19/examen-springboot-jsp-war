<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %> <%@ page
import="com.examen.forge.config.AppConfig" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Examen - Inicio</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
      crossorigin="anonymous"
    />
  </head>
  <body>
    <div class="container mt-5">
      <div class="d-flex justify-content-between align-items-center mb-4">
        <a href="/${AppConfig.ROUTE_LOGOUT_USER}" class="btn btn-outline-primary">Logout</a>
        <h1 class="h2 mb-0">Bienvenido, <c:out value="${user.name}" /></h1>
        <a href="/${AppConfig.ROUTE_ADD_SONG}" class="btn btn-primary">Nueva canción</a>
        <img
          src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAANwAAADlCAMAAAAP8WnWAAABelBMVEX///9vcHR/gIR8fYF5en7s7e38//9tcHRsbXFhZGiGhoiBgoNpam7+/v98fX/9//28vb6TlJXCw8Sfn6J0d3qurrD9vwCNjpHV1tbKysv+//n4+Pjm5+fP0NG0tbf6ox/0jQD6pgD6swD6ugD9/vP7tAD5miL3nQD668/9++z78dqmp6jzfwDweAD3kiD65cb2lQD3jSL505b3qQD89dv9+ub5zEz667TxuY7zcAD34Mv337j1yY/32K70oz777+H1fh/0tEDztGb43qn3sjn78dH37sTwvaD1ciP65J75wjT52Xr534v21bzwx6rwsIDtkkvvnF7wizrwtY3wkkTwq2/vn1XxiCnvjSvwpFLzp3DtgznyvXzpvpLxrYHzq1/yu3T0pUP1sVfzxX30oi7llmj1yYPtiFPraBLyu4X2vlz4w3D2zp/wXADvfDz31ZrumTv1u0f1tS32x2P1vWD50Wj76Kr3wUD21WzroHTwpWT02oD2wU/3ykFRur/9AAAbPklEQVR4nO1biV8aSdNuOVpQYTxQYEBFHYEBFFRQAQkoQjzQaBKP7OobD5aNyq6Jboxv1vzvX1XPwSG62Q0e737z/H5JYGZ6up+uqqeqZgghGjRo0KBBgwYNGjRo0KBBgwYNGjRo0KBBgwYNGjRo0KBBgwYNGjRoeCYQ04m19fW19FOvo7mgvH/91UZmLLMxu5bm+adeTrPAEcInXm5m4vGxjdnEv4KWRf3Er716PQbYXE/z9AlX1BRwHOXXEpz8LfFqB5m93k/LRyjFS4R0wO9PhP2JQFrgOThG/wd4I4P0m800ZVTE9bdjY5mxna2EfJoX0qn9re3diZACIB7a2X4FgSg83aq/G+k3mTcssGh6dmcskwnt7kvaKARSJ9u7wGcCoZCb2NnZmQCK8fjO5uya+IwNaCHcy6VMguAKxZOdUGYitFsWKKxYTG199HgmJsbHJzyA8Xdb+6m1RDotiqIgCGIaM8TsT293NtafbZagiZ/jmwJQo+JsKARWe10GI3Lp8jskBPB4vO/2Un6RkEYWonDp2v5+gucanHxacET4Tzw+y4E48OUdcD60Glgw9V4iNu7xLpQlXrwYCwRAUQJ++EdEJ5bcUSIlPEfjgdnG1tmHDaQWOgEigZOPssmKJ2GgygeS5YP3hy+83gi6pyfi9e5+fPf+JJV4jowUUH4/HodwI1R4hZoReh8gxL+ARvN6PC/m/OCqyblDIAV8qjAuGRXicffrflh8fg6J4DfjY6/T4FyJ18wjU4waMANvPAgT3j93GKnwijB4FIzLFEMT2/vPsIZJ/xzPvAbP4mdR6UN7IgksjDNqL8rwGZmptLyHR3tz5VQyzJBMlef23r/wMpLozW9fhZ9TJWMhiUxm7C3YTdxGbrtJIuyNg8t5I4dJnk8deiMSL29xoRyGspnjYwF/OJkEfv6AAK5IOT4dLh+8GMd0EQrtnjyjCFyLZ8Y2gFt4F7h53osk5fUAuchRkohzRYmZ7/AgGYPA82f3joo+XyTii8jwvlg4ARnlQEYFf/n9LkvuG2vPxD3X45nMW5GSFJYenjKJLXiQzgukNojUfL6jOT9PxHDpaNDn8w1WoeKs7/aSAUx/QmJ/G+m93hefgXeuQ5GFWrKPLjkels3mLfN8Ga0WiRTnApAEs38UFV6+CiTbyRS9h6CqqLzpMvAb25kVn46VC/saKnPjT9Al34n8AZrNeyDSZDGCPI6S0CYk/5CJAZ/i4cLxJOqJ3496Mrd3dFj0yQwjHi/YGC2W3oeiOzQrPJH1eNbXrAG3jJ/yW8htgQ+886BHhkl6wecFKgeY4M5f+CRig0fHKb+UzCgPdaUYEwWMLSGQnFsoSgTHPe9AYImF8omtUPz1+pOkPuEXHqtJoDYWZtzGPSck7EUhORBoajACZM4gk4ulQZ/E7CAJpRaqRnLy7PRwsVgsDg7CX4dHx5PJAA/VS3mB+Sikxr0ATsGlT0LxjXRV5/tI4H/HciS9A9zWKf8VuZVJCve+CJngAD3yKAdWY9TAF8/8WEMHsmeLQ0O+oaGhalVh0TdfSgpECB+AAbFkWfBLW7i/E599bOHkf/0Fp34N3E4Ix+yWInPokkdpGgA39BVTHOHPkdrQ0GkSHE0Il+aHJFpDKqrEEz4eTQaQnxdrFs97md4sKw8eDxbyywf0lp+gz97myYnE7QS1cU+gSVzpMZTJ4XlGjRktWlqsUJqaPz0rlSYBpdLZ6WIlP/h8hxBwYvkFo3fAnJOkX0kF+WPhzW8vwSlfgpjsiKSM3JJkD+1WJuQczRaGLT+WqEUpqOWpSus4m4tV6it8fMJBr3B+VhxkDCEhLIQpF37nQec8YQ8faGDjp8fTlbXffgdjoJiEwmRtQvJJjLckJXPA7Qy80L8IDgjUQFKyzGhTU59K4RiM5kV/MjtZOgaUSufZcIDpDBdInbFMCJkRqjbK6m7PxzWObcT65mO5Znrpt3VoOSHgQrM0PcG0pAzc0F7IbQ4WdI6hNZ8EuwC1qampoU/noIgkliydLk5JUL10cf7sHGhDbRo+LkZ8ULYAPUr876GUDm1hJudo+tWjsLNwv374Hf59BU65zfMfgdscSYFPFv2Um4O1ASPhzAceOQlOlfuELKaOcxzhcpOfphpAYjh4eg6FDBWSRz70gchhmNLwoWc8tJtktuMf5fEKffnbhzVwSuA2kYZIG/fskTCuJ0DpOYg+iFwMZXE+Cks9RqstnguUy5Uu4OOwwujiYn7+06f5+cVFmR1shm9xMgBGDxyzYtuzECBcatczEXol5YK06+HJpT8s/cpTfgOyQJmmgNsRl36BPklpyud7ARSjEG5DJYHSPHrkRVYARbkcnhqWcHFZyuaiosAkguPFWDScLf1xIWeGoxQ+eGG9RMRb5oi4B+w2JNnkHjyb8798iIPhZscyoW1O3B0f/yhy72ElYULDg75DCJ0o6gf4Jl9CE4FvcjNfJF5Tw5fZKKtScvlkFpHMR6H4B7/jo9mzKR9okK84B0fEEjpn5B00CthI7aw9NC0GuvYbGI6k0SkDBBTNG8DkHUlRGiv6jkQL9YODLaJInoLZzmKUy19IRrtYzUNej16tfmE8JbrooTelbAxrOZKbnEfrDSK92AGrpMscFU6gA5p9jFzA/770YZ3Qr6iUJOzBJOCPeCNzxMLP+16IlAYghE5B4XIQTBdJyN6XEo3LGYGIM5crw6MShitAhotnyRjEG+8vLWJKhygl4aMIRh7cKwkd7NYjPHx4+dvSEs/UZFcQPkIVQflDb2SB40jJVwQnioFPnsLK8rDgyxjlz3H1o8OfcxCBny8UZhVuUwo7wGlWhKyOegmVShI+TSK7Qwi49NdQaPvB3ybwS0vxN4RsguGSpOwZ/yhg9n6Bu+sb9BNOAL/6A1aB3JaB6g0sfnT0c5QKV6rNRlYuC9mZfC4ajeby+ez56pcLmd7Q1FkO3c9/BvT+AKaBQw/0GeDy3Elo7PVDt+YvPyx9SNMEqglJj497wzQNkQHJW1z0gQ/yZ1BvAbckuCT0BPkLpHaTJ0ANWQFuCnmsUgQxFgByMel5sxDNlj7JOe80j6+0/NDdFlGUsPDxlMEx1nbGHriAhohb+onjvgK5BD3xePYohR5sDs4cRyaphZyjTzK7XYCkLKNHji7zNP9lhOHzVQyEML98Pb2yIh25+HKzepXHIgTk8lKhB1+5MDhniac0CabzzEEWSOw+LDu6/mEJ8gAa7iuNecaLPKrJIey+P3IG5UUOUjc4UxTKSJFwBYi14ZsoiX1mPFYKMUiBy9PwsU9iNjI6IgfgzXIO9ULM3rCU/gekb8JlByNHMck1PQdgO3HjQT2T/3Vp6WeebI1lJvxQm0ArQI68Xj9MeLSIHds8ywGxi6kbkfCrwG20wJMZidoViOXV9EifjBGFnyIwF4UohlvgmKXzSXTX2FkEylUqHCA7OCB8Hdt4OFVJfEA5EUKZ0BYVxj0LHA1HIsdwIuXzQ3tXGpqC6OMvmd2A2+hIlvIFRm1ZoLHCisKs79vnP5evZhBXhdXLFdgFlM/LPLYAsUmkN5/DCVODPlBNDmu8Ld5C+K345gO94OLIf4BcAp93hfy07IH0TRYiRTRZsQTnwSknodooTV2A8xQg3C7yRGQuuRoj/LJCbHo5L5VesofhK6388g1LCZ/y+GhILKFvTmK5FTuKpOAK0GXPCTbJW/Gtxi/3fpgc9wG8kpK3KJX8R6iXIdSwPSWpRdhWMj90Cr1JXtaS0dEVCLcV8MOVGcrNyFb7DKmcCNGZAmgKM+H0amEmir7G5wtQuUzd5ECXaAxUF8od/HHAXKQM/0ANGzpBUlvx2QegBkjEl+DWiRC2qAmPN83RvQhoCuUXwRtJdugCRF64GIbdnwFHW4nSKGhi32eRiKuSMy6DWMZmrivuKUffyucZVp6wzqHERCM8D02CH99HpmD/LMjOg/vI/xR/kDqTolemsWR+y5MTcBMqYk1JaBKUkgiLQ1m4qDR1DiXXMGTqHI0hC5CU3DckgZLC5T/33QZTlhu0Kejlp6kLTAVEKPmwNYRp/d4UQdtNTOAeQjvyEAkBk9zPhAevLKNXiripL1DVsJQEw53C37nhS3DfL6AlOSogpyswI2NwxRNhWbXZysr05+vrz9PT31YUeqMjBUzvJHc5VWINXA6qzHNwUhKDdG5h7LD14X/eeABNQa18RQKhzG4aSmaIOHLEIi4wSdBwUwFUymFY4DJwmyH8Nax6hhKmJNdQZl7J1KYLM7nKWwAhCkn9m5QWhpGehcud3uB5KkIVdo7XiEf4mK/smXiL1k1n3jSf3EvUSrI+FtoidM4DVGJelEpyLoIEZIfOCJYm4JpRSF4FoDhS4TYDQjPNmF3P4MMSLpafuVouFArLM/kolFs8S+6Q7i6u0Cpc8saPusKfo+2Q3YJIOQKtzxaSTsTTTRfMX5aWdkQO6vMEpcUFgl6JhRePgUE+TcUg+j9dwqyXUE7ylhzzSYrcpmNEKDCbzUB7LuQL07UxN13I47Oj5ZVRqaSBaoTP5ljbDf3vOaqKOAd6zB2EQhh+ZP3nJj+Epq7fl+KbRJjI7EIl5MHYPogEgEsarZcbYpluGLJAHtQkR3ggUKAs3lYFGkU619D2iDPXDRQFYnAV+AkzN1irXEm/rZLWHy36GB8RtpATtkMTaSjM6H9fNpccPjuJr0MiCEE2TRYxXRWP8DhbSmkqBjt9iQxhgcvMYtPAVpLLPFKMQtEpFymgJgzT1UlhGtSUz99A0bZabZfYoi+M6TwtorRMhLbZa6Ff000VFboeXxqDkAuFQInnMKH6IynlpDCFERdFNclB9hZIDBiAM35D89ErWHmOkhykgek/r/IxgZdqKI7jIZ8vK04KRRp0AfkvkMljVROLRz721YIvz8Oh0D4uJvHfZnIj5E08syPQrRAkOfIONTkbUTUvPJQDsT4Hw1Got2YIWUUx4cAFl0FZoEaBTS98hrqr4Z0hCr/J9CDF8csjw1jkVLFbrIzbD2UwFsibxK3b/Ag2lzKbhLwOzUIpwfzxYEHVrNI8/MXfYEswMvKFGe6aw4ArcKCaq7AJXDR2550tWHytSukOrw1c1rErHigfOf5r6CuanW9uOvgday9+ArSSpDG9cYeqV/LzWYqPgjjMcSNXUDb39UWJuNJ3TchV38z33T9WkEoxaAf47PBFrErtMYsrECfGWP2VSDTxKSYfxz41EHoNLuJHrxR8ahkUmGI1CvgUdzMCEQe0INH92Tct0BnIA9+7CsgXmMqhqCHRLxfVb/sDxUqXujb2Gt9jkmb6ZTqeGUuTNZZGA5h0AoeqqCWx8iIFgXllgRVcIomi9aKFv9N/0egq1ikQpxbx7FO1ZiYXlE8WujWGmkJcTXy6ngBykD5DZWUhyQP1XAmLJA7WhG03uNU0prhVEBYu/3cVO7+C9Q2M4s6PSdXgcsUx0zuZZvfja/HMBiGzocDt6bg/8KAIrOjq6DeOin19MTDcNQX15v4mOypeQx4voN8lk1VjuTnVkJCUmt3TrcfHXhHyakLdtHOVJn+JB6P4HGB6hJUlICSFvn/4ExnuSvJM8P5qA4nhisJsN7vrWY9DfUK2ttUp5tSpxTM8yCqHkRFQleu+PBGwaP5H4EhuZXR4Bn2yxuqBSgwGmm26l3GU4O1ZZck0W5nrXPkUHemDGmoFBPNq+p9PRWNfRoejtw5XRJe+yghNLb+AHPjCttrjc2H1VE79mB+d5iDa/qRkOvePZ8K2/mb4k3BPBkk3+fcNUH1BEG2rzs5VQiqnRt/VyCowBNeM/fljHZdwM1W47w6zP//Q7evxMo6582ujRiqnHlweYbWkQGbuLra+D8DutmNWIGaaWluuxzfBX/YbuXplFcujWDRPQyX5w/MJNzf3nZ796YdnqMJ6HG8XbnSqotgFTOGfC02ZULy4T2+FTLqJteVaHNIcaeSVXEWyCyNRwn/7zkr5r5C7vO9hwn/Wm/gcJRHf/+uLlkeiVFj50XiTYKHhhn4igUtvNmUWCen4d6jvcl+Mit+a9OtdCwncd/o/TaxS+PjaX/vBFZCLXTfr0ZTl3kSdaOZj9Z3vEN88Wu7PJk56D/hmPgHb/A5y0b4oFZebOOl9WG/iw8vZ7yAn9OWoePVIvyhPNzHovue/rvPf8lT42w3qP0UTyX3Xf9pbvSL8j1cn34lH/lU+vSo8xo/rnghR6MEfe0cfDXzTktxzROEJ/3PRgyOXf+oVPCD4JrUEzxI0928Oun+rVGrQoEGDBg3/szA2wK230kaHs7Oz0+kw/tXwu1o+l9vRDXfo7ncb7xt+x/T/GG2tt9DRXXOFI2htNXcgzCZr0F073FAz0mbo6r7Nz9jZZuuQ79DRou/pr6xeZ2ow/UDzyJla6lFDzmE1d6iXtJo6zO2OGnK1w02mjg5n7QQOe9UN8BKg2KXco/327C0dnY9EztVlrj9vMvdU+Y3h9nBzZectxNhz6waMoPHpybltHbcnb+mwVXyzAbkWc7962tHwBgDXY5IzdVRgVsi5TercJoT6xayyM9QMr1s6cVSZDS+p3KOWnMlcjWbHnMneXQV56cYWk7ound1u13UowWNqUURPImfqcQMcwY7avXcr17eazLa2nmCwx64zSRFYQ87U46iG+9Yif4xcR/DOU3DS2s24uIydipd12C3V5BSBc0qnTXb2zaVX9gIURGbjMjp6QaJqyTVRH7+XXLdZJtJbUXcuKB9UXLeWnOIHVrb2AWUnbHW2cPeYagTl8cm5bNK+m2vju1Necav0tY5cj0TOgORcyua03c7Krie2nFNaW0dX3fEuiZ2czurI2SVy7WjrbnkbbLfrGhVPRa5LMlxH/dLcNXFVS84hb0gPfrHLN+gmd+NRyJnszipgiLhkka43nLpoSRNkcr0ugFtxWTMWIJZW6Qa2+2aXU0F7VxV6mk3udp5zy0a4nVFlCh3uCjk23GxWBIRtiFE+c+9alTxXhQ5r08lVgzlSv0zBcWuEo/pMgwqlg8mJ4r5VXmlxVlKps4ZcNUz6hycnpyzz7Ywq29R8BzlTj6VmDyp1tMVmVp2j7UnJyZYzN7Cc+T7LqZZy3yJHrK0qA3stuYd1y5rqrrOKgvPWCGejmDOrfU2rXDa7ZbGsUkLDXeSs9irclrAfJGfqqW+FXR135YgeWTeq1BJqS4ezTc4RsicratlWRc7UmNzj5zmZta2+vHC1VC+6Os/JdbMi/kqeU6PWAm7Z+jzIKYpfnwsGalSwJonLdOS6s7sm2yPQKbpMz4GcUd7kOr10KMlMsmgNOaNZNh3TS7W27K0eLzn1U5NTi3pTtWD2KyuWDVpbfsmOaXbW3KDmucQzIWdRq4+gUl+6e2RupnZ5vbXkFNO1S6ZTBKTD1infweVoexZuidla9swOU1uvs9850GZSjKmqRF1XIFfb8lMUOZ3g9aa2noGBoN0mJ4w6ckGjuxqPQQ7iy6SuDh88Kk9AWiupvY6c0jK04xdL9TMUVrzekQpaOmqeodxbajeNHHFUHgpVwVQVhXXkVMGUd9/R0vjpl7mrhlzt7ZtXotxLjhjbza11c7ea26v8pp6cXLWpnZLR3uC5pcnce/ejvdZHIwfZylazug6zrab5lCqqKrWXS6xK6na0d9Q/ce5STz6w5aySn9/TdfV3qdW82dbVX/suoFUaXiHXLQdOVYXoDrZ3qHdosXdW9fYGcwM0L+aUevK+a1xu50Bvb2+n0337/U/9cM4tHaiRPIvR0d3wDg3f8ty7Fg1PjV67vf+vr/rfhNFg6Pq3/jiVBG2G5hUizw2OYPNeVP0/RWeviqCDuOEfRYld8BnrrGBvVRYbGMB2pl8e0dnvqrtXjUi4O4M9wU63elJN/46Bnp5gtzKRMVg5Q3oHBm4/k/qn6DLoFdicpN9mMKjkbAYbMmnV29T6xW4wYLrvtEkjDAZbsJKVQCQMlbabuO02vLfBZnfjf7rtkoYitTYDnLAaWuQizN2qtynPoSytBlvzHLZLr9MZJLQgOZ1eJWfQGXDOFrigW71az8gZpEE4Vq9uNB6tvK3qtll1enaN3uCoDIUeVj1haGNzuW06nVUZZ9MZmknOqrxVBQe6g5y0vBpyBhzRq0OW8rosduSquLDToLPaerr7O7tg6Xp3hVw3fLcFnf2dbQadnr3dQnJ6nethyFXVlXeQ0+mtxjpycgE4AANkV3TYdG3ATlqkEa0h7YjTamirkAMmep20Hb0wQVAmp9N3PRk5ndXemBwJ6nU2h/zJ4MQ/0herTrE26Qy6KkN7rBUXhM9odkZOsfnjk7Pq5blvk3NBADG9cdnaba5+m7VLHmtV+wILqQw1wk3V5s9oZbdlMQe+6nwScvpeCCfWx90mB9sv+aXTBjdy6azMLuCitrrSURoKoVhVmvTocSyQs3YCPyZGTSan07UjdO13kjN0GnFnHQ3JDRh0TBbserwA/BINAxzq3/JLQ+Hq9kpu7GTfgJzBAduht7qIpenkrFY95h0kZ2hIboCxhrkbkMMEAMt1SxwdBn2bRSLnqp8Ih/bqdW2VgrkbvNeI5GBfBtCTLU13SxkKOWXHIZoq5CBvo6DdbbkBg55FZRuzcP/3WW5AsRyO6TFgBD5gzDEPUT4bpM8SOSZtvQ3IwSG7hbja9PpgJ8CuU3Sj7kW/NLS/agJ2rIso5FwssA0PR85lq4gZzMN+ZSGTc9lBF626enJuWzsqnsOgY2UH1B1WdMg2nVV9dyX96ERWS0VcpbHs1jI54obAtrY/HDkMQdltXG1QQJAKOVwXJts6crjdbtQ9uFrX1gakmM2cVbs00O5UydUkQNgurGQVcqCx7ZjwHowcLMrahfZydcnqr5JDfa8n54b14XgoSBQ37GLyTrqsOhsrjF0DBitW3jI5o17JaMYua7sN76ySw8B+SHKWLpAUa3AgCHnbanfVkGNzK+SsQYDdBlehnHRW1FHWEmM7mKUdbtSON6yqLXGLDPbegR6snFmir5AjQcNDkgNvhIVbDcz9paRQIYdzq10BU9h2nY3Zuc2q3sUFp1A33XgjvcEKHFktqXYF/QZ9O5tBb5PebVWRQ1FpIjm7zVb7QJYbsLIGyBqUTWEytKgFU5d0dadN7pKsbawOcbQYWlQNDMJJyR+t7DLrgKt2ImPQwE60KT8NaK2MNtqa2c85+vvrO1+Xo7uz26FmI2d/v5qyjNLV7n4Gh/JbfPyupmajs99prLqR5fZERjjhVG/qghnUltddNZsGDRo0aNCgQYMGDRo0aNCgQYMGDRo0aNCgQYMGDRo0aNCgQYMGDRp+AP8HcObBXMpoQk8AAAAASUVORK5CYII="
          alt="Logo"
          width="50"
        />
      </div>

      <c:if test="${empty songs}">
        <p class="lead">No hay canciones registradas.</p>
      </c:if>

      <c:if test="${not empty songs}">
        <table class="table table-hover">
          <thead>
            <tr>
              <th scope="col">Nombre</th>
              <th scope="col">Género</th>
              <th scope="col">Contribuciones</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${songs}" var="song">
              <tr>
                <td>
                  <a href="/${AppConfig.ROUTE_INDEX_SONG}/${song.id}/detail">
                    <c:out value="${song.title.toUpperCase()}" />
                  </a>
                </td>
                <td><c:out value="${song.genre}" /></td>
                <td><c:out value="${song.count}" /></td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </c:if>
    </div>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
