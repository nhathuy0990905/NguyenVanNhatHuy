<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat box</title>

    <link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- JQuery  -->
    <script src="jquery-3.5.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="assets/css/chatbox.css">
</head>

<body>
    


    <!---------------- CHAT BOX  -------------------------------->
    <div id="body">

        <!--button-->
        <div id="chat-circle" class="btn btn-raised" style="margin-right: 50px; display: block; z-index: 3000000000;">
            <div id="chat-overlay"></div>
            <img class="chat-circle_robot" src="admin/lib/images/chatbox.png">
        </div>

        <!--chat-bot-->
        <div class="chat-box" style="right:80px">
            <div class="chat-box-body">
                <div class="chat-box-welcome__header">
                    <div class="chat-box__header-text">
                        <p3 class="chat-box-welcome__company-name">Chat</p3>
                        <span class="chat-box-toggle"><i class="material-icons">cancel</i></span>
                    </div>

                    <div id="chat-box-welcome__ava">
                        <img class="chat-box-welcome_robot" src="admin/lib/images/tuvanvien.png">
                    </div>
                    <div class="chat-box-welcome__welcome-text">
                        <p>Chào mừng bạn đến với Nhat Huy Bakery !</p>
                        <p>Bạn cần chúng tôi tư vấn gì không ạ ?</p>
                    </div>
                    
                </div>


                <!--chat-bot after welcome was toggled-->
                <div id="chat-box__wraper">
                    <div class="chat-box-header">
                        Chat
                        <span class="chat-box-toggle"><i class="material-icons">cancel</i></span>
                    </div>



                    <div class="chat-box-overlay">
                    </div>
                    <div class="chat-logs">
                        <div id="cm-msg-0" class="chat-msg bot">
                            <span class="msg-avatar">
                                <img class="chat-box-overlay_robot" src="admin/lib/images/tuvanvien.png">
                            </span>
                            <div class="cm-msg-text">
                                Xin chào quý khách, tôi có thể giúp gì được cho bạn?
                            </div>
                        </div>

                        <div class="spin-container">
                            <div class="spiner">
                                <div aria-hidden="true"></div>
                                <div aria-hidden="true"></div>
                                <div aria-hidden="true"></div>
                            </div>
                        </div>



                    </div>
                    <!--chat-log-->
                </div>

            </div>
            <div class="chat-input-box" id="chatLog">
                <form class="chat-input__form">
                    <input type="text" class="chat-input__text" id="chat-input__text" autocomplete="off" placeholder="Gửi tin nhắn..." />
                    <button type="submit" class="chat-submit" id="chat-submit">
                        <i class="material-icons">send</i>
                    </button>
                </form>
                <p6 class="chat-box__sign">Nhat Huy Bakery</p6>
            </div>
        </div>
    </div>


    <!-- JavaScript  -->
    <script>
        //------- CHAT BOX ----------
        var botController = (function () {

        })();

        var uiController = (function () {

        })();


        var controller = (function (botCntr, uiCntr) {
            var $chatCircle,
                $chatBox,
                $chatBoxClose,
                $chatBoxWelcome,
                $chatWraper,
                $submitBtn,
                $chatInput,
                $msg;

            /*toggle*/
            function hideCircle(evt) {
                evt.preventDefault();
                $chatCircle.hide('scale');
                $chatBox.show('scale');
                $chatBoxWelcome.show('scale');
            }

            function chatBoxCl(evt) {
                evt.preventDefault();
                $chatCircle.show('scale');
                $chatBox.hide('scale');
                $chatBoxWelcome.hide('scale');
                $chatWraper.hide('scale');
            }

            function chatOpenMessage(evt) {
                evt.preventDefault();
                $chatBoxWelcome.hide();
                $chatWraper.show();
            }

            //generate messages on submit click
            function submitMsg(evt) {
                evt.preventDefault();

                //1. get input message data
                msg = $chatSubmitBtn.val();

                //2.if there is no string button send shoudn't work
                if (msg.trim() == '') {
                    return false;
                }
                //3. add message to bot controller
                callbot(msg);
                //4. display message to ui controller
                generate_message(msg, 'self');

            }

            function chatSbmBtn(evt) {
                if (evt.keyCode === 13 || evt.which === 13) {
                    console.log("btn pushed");
                }
            }
            

            function init() {
                $chatCircle = $("#chat-circle");
                $chatBox = $(".chat-box");
                $chatBoxClose = $(".chat-box-toggle");
                $chatBoxWelcome = $(".chat-box-welcome__header");
                $chatWraper = $("#chat-box__wraper");
                $chatInput = $("#chat-input__text");
                $submitBtn = $("#chat-submit");

                //1. call toggle 
                $chatCircle.on("click", hideCircle);
                $chatBoxClose.on("click", chatBoxCl);
                $chatInput.on("click", chatOpenMessage);

                //2. call wait message from CRM-human

                $submitBtn.on("click", chatSbmBtn);
                $chatInput.on("keypress", chatSbmBtn);


                //6. get message from bot controller-back end
                //7. display bot message to ui controller
            }

            return {
                init: init
            };

        })(botController, uiController);



        $('.chat-input__form').on('submit', function (e) {
            e.preventDefault();
            msg = $('.chat-input__text').val();

            $('.chat-logs').append('<div id="cm-msg-0" class="chat-msg background-warning push-right bot"><div class="cm-msg-text">' + msg + '</div><span class="msg-avatar"><img class="chat-box-overlay_robot" src="admin/lib/images/khachhang.png"></span></div>');
            $('.chat-input__text').val('');
        });


        $(document).ready(controller.init);

        know = {
            "hello": "hi",
            "how are you?": "good",
            "ok": ":)"
        };
        function talk() {
            var user = document.getElementById("userBox").value;
            document.getElementById("userBox").value = "";
            document.getElementById("chatLog").innerHTML += user + "<br>";
            if (user in know) {
                document.getElementById("chatLog").innerHTML += know[user] + "<br>";
            }
            else {
                document.getElementById("chatLog").innerHTML += "I don't understand...<br>";
            }
        }
    </script>

    
</body>

</html>