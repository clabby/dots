--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

local headers = {
        {
                "         __         __        ",
                "        /.-'       `-.\\      ",
                "       //             \\\\    ",
                "      /j_______________j\\    ",
                "     /o.-==-. .-. .-==-.o\\   ",
                "     ||      )) ((      ||    ",
                "      \\\\____//   \\\\____// ",
                "       `-==-'     `-==-'      ",
        },
        {
                "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
                "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
                "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
                "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
                "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
                "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
                "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
                " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
                " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
                "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
                "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
        },
        {
                "     \\\\XXXXXX//",
                "      XXXXXXXX",
                "     //XXXXXX\\\\                      OOOOOOOOOOOOOOOOOOOO",
                "    ////XXXX\\\\\\\\                     OOOOOOOOOOOOOOOOOOOO",
                "   //////XX\\\\\\\\\\\\     |||||||||||||||OOOOOOOOOOOOOOOVVVVVVVVVVVVV",
                "  ////////\\\\\\\\\\\\\\\\    |!!!|||||||||||OOOOOOOOOOOOOOOOVVVVVVVVVVV'",
                " ////////  \\\\\\\\\\\\\\\\ .d88888b|||||||||OOOOOOOOOOOOOOOOOVVVVVVVVV'",
                "////////    \\\\\\\\\\\\\\d888888888b||||||||||||            'VVVVVVV'",
                "///////      \\\\\\\\\\\\88888888888||||||||||||             'VVVVV'",
                "//////        \\\\\\\\\\Y888888888Y||||||||||||              'VVV'",
                "/////          \\\\\\\\\\\\Y88888Y|||||||||||||| .             'V'",
                "////            \\\\\\\\\\\\|iii|||||||||||||||!:::.            '",
                "///              \\\\\\\\\\\\||||||||||||||||!:::::::.",
                "//                \\\\\\\\\\\\\\\\           .:::::::::::.",
                "/                  \\\\\\\\\\\\\\\\        .:::::::::::::::.",
                "                    \\\\\\\\\\\\\\\\     .:::::::::::::::::::.",
                "                     \\\\\\\\\\\\\\\\",
        },
        {
                "    .                 .-.    .  _   *     _   .",
                "          *          /   \\     ((       _/ \\       *    .",
                "        _    .   .--'\\/\\_ \\     `      /    \\  *   ___",
                "    *  / \\_    _/ ^      \\/\\'__       /\\/\\  /\\  __/   \\ *",
                "      /    \\  /    .'   _/  /  \\  *' /    \\/  \\/ .`'\\_/\\   .",
                " .   /\\/\\  /\\/ :' __  ^/  ^/    `--./.'  ^  `-.\\ _    _:\\ _",
                "    /    \\/  \\  _/  \\-' __/.' ^ _   \\_   .'\\   _/ \\ .  __/ \\",
                "  /\\  .-   `. \\/     \\ / -.   _/ \\ -. `_/   \\ /    `._/  ^  \\",
                " /  `-.__ ^   / .-'.--'    . /    `--./ .-'  `-.  `-. `.  -  `.",
                "/        `.  / /      `-.   /  .-'   / .   .'   \\    \\  \\  .-  \\%",
                "@&8jgs@@%% @)&@&(88&@.-_=_-=_-=_-=_-=_.8@% &@&&8(8%@%8)(8@%8 8%@)%",
                "@88:::&(&8&&8:::::%&`.~-_~~-~~_~-~_~-~~=.'@(&%::::%@8&8)::&#@8::::",
                -- "`::::::8%@@%:::::@%&8:`.=~~-.~~-.~~=..~'8::::::::&@8:::::&8:::::'",
                -- " `::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::.'",
        },
        {
                [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
                [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⣠⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
                [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣡⣾⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣟⠻⣿⣿⣿⣿⣿⣿⣿⣿]],
                [[⣿⣿⣿⣿⣿⣿⣿⣿⡿⢫⣷⣿⣿⣿⣿⣿⣿⣿⣾⣯⣿⡿⢧⡚⢷⣌⣽⣿⣿⣿⣿⣿⣶⡌⣿⣿⣿⣿⣿⣿]],
                [[⣿⣿⣿⣿⣿⣿⣿⣿⠇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣮⣇⣘⠿⢹⣿⣿⣿⣿⣿⣻⢿⣿⣿⣿⣿⣿]],
                [[⣿⣿⣿⣿⣿⣿⣿⣿⠀⢸⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⡟⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣻⣿⣿⣿⣿]],
                [[⣿⣿⣿⣿⣿⣿⣿⡇⠀⣬⠏⣿⡇⢻⣿⣿⣿⣿⣿⣿⣿⣷⣼⣿⣿⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⢻⣿⣿⣿⣿]],
                [[⣿⣿⣿⣿⣿⣿⣿⠀⠈⠁⠀⣿⡇⠘⡟⣿⣿⣿⣿⣿⣿⣿⣿⡏⠿⣿⣟⣿⣿⣿⣿⣿⣿⣿⣿⣇⣿⣿⣿⣿]],
                [[⣿⣿⣿⣿⣿⣿⡏⠀⠀⠐⠀⢻⣇⠀⠀⠹⣿⣿⣿⣿⣿⣿⣩⡶⠼⠟⠻⠞⣿⡈⠻⣟⢻⣿⣿⣿⣿⣿⣿⣿]],
                [[⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⢿⠀⡆⠀⠘⢿⢻⡿⣿⣧⣷⢣⣶⡃⢀⣾⡆⡋⣧⠙⢿⣿⣿⣟⣿⣿⣿⣿]],
                [[⣿⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⡥⠂⡐⠀⠁⠑⣾⣿⣿⣾⣿⣿⣿⡿⣷⣷⣿⣧⣾⣿⣿⣿⣿⣿⣿⣿]],
                [[⣿⣿⡿⣿⣍⡴⠆⠀⠀⠀⠀⠀⠀⠀⠀⣼⣄⣀⣷⡄⣙⢿⣿⣿⣿⣿⣯⣶⣿⣿⢟⣾⣿⣿⢡⣿⣿⣿⣿⣿]],
                [[⣿⡏⣾⣿⣿⣿⣷⣦⠀⠀⠀⢀⡀⠀⠀⠠⣭⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⣡⣾⣿⣿⢏⣾⣿⣿⣿⣿⣿]],
                [[⣿⣿⣿⣿⣿⣿⣿⣿⡴⠀⠀⠀⠀⠀⠠⠀⠰⣿⣿⣿⣷⣿⠿⠿⣿⣿⣭⡶⣫⠔⢻⢿⢇⣾⣿⣿⣿⣿⣿⣿]],
                [[⣿⣿⣿⡿⢫⣽⠟⣋⠀⠀⠀⠀⣶⣦⠀⠀⠀⠈⠻⣿⣿⣿⣾⣿⣿⣿⣿⡿⣣⣿⣿⢸⣾⣿⣿⣿⣿⣿⣿⣿]],
                [[⡿⠛⣹⣶⣶⣶⣾⣿⣷⣦⣤⣤⣀⣀⠀⠀⠀⠀⠀⠀⠉⠛⠻⢿⣿⡿⠫⠾⠿⠋⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
                [[⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣀⡆⣠⢀⣴⣏⡀⠀⠀⠀⠉⠀⠀⢀⣠⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
                [[⠿⠛⠛⠛⠛⠛⠛⠻⢿⣿⣿⣿⣿⣯⣟⠷⢷⣿⡿⠋⠀⠀⠀⠀⣵⡀⢠⡿⠋⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⢿⣿⣿⠂⠀⠀⠀⠀⠀⢀⣽⣿⣿⣿⣿⣿⣿⣿⣍⠛⠿⣿⣿⣿⣿⣿⣿]],
        },
        {
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⡄⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⢐⠨⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⡂⠅⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠤⣄⣄⣂⢄⠀⠀⠀⠀⠀⡀⢔⠨⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠠⣼⣿⣿⣿⣿⣿⣯⣀⠠⡀⠅⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣺⡿⠿⢿⣿⣿⣿⣿⣿⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢘⣿⣧⣀⣘⣿⣿⢿⣻⣿⣿⣝⢧⣲⣄⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣡⠱⠿⣟⡈⠐⠁⣸⢉⣷⠻⣌⠻⡔⢮⡙⢶⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠠⠳⣶⣯⡴⡺⣿⠺⣎⠳⣍⡳⣙⢮⡙⢧⣶⣠⠕⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⢻⠴⣫⠕⣎⣳⣜⣹⣦⣷⣭⣶⡽⠶⠫⠫⣴⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠴⣏⠿⣌⢧⡛⡴⣋⠞⣥⢋⣯⡿⠟⠋⢳⣜⠻⢿⣿⡆⡀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣘⡗⣫⠳⡜⢦⣙⠶⡩⠟⠲⣇⠈⣥⣤⣤⣾⣿⣿⣿⣿⠏⠐⠄⡎⢂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡿⣜⣥⣛⣼⡗⠊⠉⠀⠀⣠⣽⣿⡷⣩⢎⡽⣟⠿⣿⣹⠀⠀⠀⠐⠀⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡰⢷⡾⡿⠿⠿⢄⣠⣠⣴⣿⣿⣿⣿⣷⢳⢫⠵⣩⣾⠗⣾⢠⠀⠀⠀⠀⠀⠐⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⢨⠳⠃⠁⠀⠀⣠⣧⣿⣿⣿⣿⣿⣿⣿⣭⢣⢏⣾⡝⢏⡗⣛⠈⣇⠀⠀⠀⠀⠀⠡⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⢀⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⢿⡟⡴⣋⢞⣎⡞⢨⢂⡱⡥⣿⣦⡀⠀⠀⠀⠀⠡⠀⠀⠀⠀⠀⠀⠀⠀ ]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⡿⢿⣿⠿⠿⢿⣿⢿⣻⣭⡟⡼⡱⣍⣾⣾⡟⣹⠢⠔⡩⢺⢿⣷⡄⠀⠀⠀⠀⠡⠀⠀⠀⠀⠀⠀⠀ ]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠉⠀⠀⠀⣀⣤⡶⣟⣵⡻⣼⢳⣏⡖⣳⣼⢩⠘⠤⡙⡜⢨⠑⡌⢣⣼⠿⠆⠀⠀⠀⠀⠠⡀⠀⠀⠀⠀⠀ ]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣶⢻⡽⣳⢯⢷⣺⢽⣳⢿⡷⢺⠿⠟⠛⠛⠐⠁⠼⠬⠯⠽⠟⠁⠀⠀⠀⠀⡀⠀⠀⠐⡀⠀⠀⠀⠀ ]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢔⣿⣽⢳⢯⡽⣞⢯⣞⣳⠯⠚⣻⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠂⠀⠀⢀⡀⠀⠀⠀ ]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠄⠂⢘⣿⣽⣫⣟⣼⡏⠷⠋⠀⠀⠀⠘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⡟⠉⠓⠀⠀⠀ ]],
                [[⠀⠀⠀⠀⠀⠀⡠⣠⡾⠖⠁⠀⠀⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⣀⣠⣐⣠⣤⣄⣈⠀⠀ ]],
                [[⠀⠀⠀⠀⡠⣚⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠄⣒⠁⢹⠶⠝⠅⡢⠄⢆⢤⢉⣫⡇ ]],
                [[⠀⢀⡠⡌⢤⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠀⢽⣦ ]],
                [[⠰⡭⠥⠥⢿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠿⠼⣿ ]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠠⠀⠄⠠⠀⠄⠠⠀⠄⠠⠀⠄⠛ ]],
        },
}
math.randomseed(os.time())

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {

        -- Configure AstroNvim updates
        updater = {
                remote = "origin", -- remote to use
                channel = "nightly", -- "stable" or "nightly"
                version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
                branch = "main", -- branch name (NIGHTLY ONLY)
                commit = nil, -- commit hash (NIGHTLY ONLY)
                pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
                skip_prompts = false, -- skip prompts about breaking changes
                show_changelog = true, -- show the changelog after performing an update
                auto_reload = false, -- automatically reload and sync packer after a successful update
                auto_quit = false, -- automatically quit the current session after a successful update
                -- remotes = { -- easily add new remotes to track
                --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
                --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
                --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
                -- },
        },

        -- Set colorscheme to use
        colorscheme = "catppuccin",

        -- Add highlight groups in any theme
        highlights = {
                -- init = { -- this table overrides highlights in all themes
                --   Normal = { bg = "#000000" },
                -- }
                -- duskfox = { -- a table of overrides/changes to the duskfox theme
                --   Normal = { bg = "#000000" },
                -- },
        },

        -- set vim options here (vim.<first_key>.<second_key> =  value)
        options = {
                opt = {
                        -- set to true or false etc.
                        relativenumber = true, -- sets vim.opt.relativenumber
                        number = true, -- sets vim.opt.number
                        spell = false, -- sets vim.opt.spell
                        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
                        wrap = false, -- sets vim.opt.wrap
                },
                g = {
                        mapleader = " ", -- sets vim.g.mapleader
                        cmp_enabled = true, -- enable completion at start
                        autopairs_enabled = true, -- enable autopairs at start
                        diagnostics_enabled = true, -- enable diagnostics at start
                        status_diagnostics_enabled = true, -- enable diagnostics in statusline
                },
        },
        -- If you need more control, you can use the function()...end notation
        -- options = function(local_vim)
        --   local_vim.opt.relativenumber = true
        --   local_vim.g.mapleader = " "
        --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
        --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
        --
        --   return local_vim
        -- end,

        -- Set dashboard header
        header = headers[math.random(#headers)],

        -- Default theme configuration
        default_theme = {
                -- Modify the color palette for the default theme
                colors = function(C)
                        C.telescope_green = C.green
                        C.telescope_red = C.red
                        C.telescope_fg = C.fg
                        C.telescope_bg = C.black_1
                        C.telescope_bg_alt = C.bg_1
                        return C
                end,
                highlights = function(hl)
                        local C = require "default_theme.colors"
                        hl.TelescopeBorder = { fg = C.telescope_bg_alt, bg = C.telescope_bg }
                        hl.TelescopeNormal = { bg = C.telescope_bg }
                        hl.TelescopePreviewBorder = { fg = C.telescope_bg, bg = C.telescope_bg }
                        hl.TelescopePreviewNormal = { bg = C.telescope_bg }
                        hl.TelescopePreviewTitle = { fg = C.telescope_bg, bg = C.telescope_green }
                        hl.TelescopePromptBorder = { fg = C.telescope_bg_alt, bg = C.telescope_bg_alt }
                        hl.TelescopePromptNormal = { fg = C.telescope_fg, bg = C.telescope_bg_alt }
                        hl.TelescopePromptPrefix = { fg = C.telescope_red, bg = C.telescope_bg_alt }
                        hl.TelescopePromptTitle = { fg = C.telescope_bg, bg = C.telescope_red }
                        hl.TelescopeResultsBorder = { fg = C.telescope_bg, bg = C.telescope_bg }
                        hl.TelescopeResultsNormal = { bg = C.telescope_bg }
                        hl.TelescopeResultsTitle = { fg = C.telescope_bg, bg = C.telescope_bg }
                        return hl
                end,
                -- enable or disable highlighting for extra plugins
                plugins = {
                        aerial = true,
                        beacon = false,
                        bufferline = true,
                        dashboard = true,
                        highlighturl = true,
                        hop = false,
                        indent_blankline = true,
                        lightspeed = false,
                        ["neo-tree"] = true,
                        notify = true,
                        ["nvim-tree"] = false,
                        ["nvim-web-devicons"] = true,
                        rainbow = true,
                        symbols_outline = false,
                        telescope = true,
                        vimwiki = false,
                        ["which-key"] = true,
                },
        },

        -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
        diagnostics = {
                virtual_text = true,
                virtual_lines = false,
                underline = true,
        },

        -- Extend LSP configuration
        lsp = {
                -- enable servers that you already have installed without mason
                servers = {
                        -- "pyright"
                },
                formatting = {
                        format_on_save = true, -- enable or disable auto formatting on save
                        disabled = { -- disable formatting capabilities for the listed clients
                                -- "sumneko_lua",
                        },
                        -- filter = function(client) -- fully override the default formatting function
                        --   return true
                        -- end
                },
                -- easily add or disable built in mappings added during LSP attaching
                mappings = {
                        n = {
                                -- ["<leader>lf"] = false -- disable formatting keymap
                        },
                },
                -- add to the global LSP on_attach function
                -- on_attach = function(client, bufnr)
                -- end,

                -- override the mason server-registration function
                -- server_registration = function(server, opts)
                --   require("lspconfig")[server].setup(opts)
                -- end,

                -- Add overrides for LSP server settings, the keys are the name of the server
                ["server-settings"] = {
                        -- example for addings schemas to yamlls
                        -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
                        --   settings = {
                        --     yaml = {
                        --       schemas = {
                        --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
                        --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                        --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
                        --       },
                        --     },
                        --   },
                        -- },
                },
        },

        -- Mapping data with "desc" stored directly by vim.keymap.set().
        --
        -- Please use this mappings table to set keyboard mapping since this is the
        -- lower level configuration and more robust one. (which-key will
        -- automatically pick-up stored data by this setting.)
        mappings = {
                -- first key is the mode
                n = {
                        -- second key is the lefthand side of the map
                        -- mappings seen under group name "Buffer"
                        -- ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
                        -- ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
                        -- ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
                        -- ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
                        -- ["<C-\\>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle floating terminal" },
                        ["<Leader>jr"] = { ":!cargo +nightly fmt<cr> | bufdo e" },
                        ["<Leader>js"] = { ":!forge fmt<cr> | bufdo e" },
                        ["<Leader>bo"] = { "bufdo e" },
                        -- quick save
                        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
                },
                t = {
                        -- setting a mapping to false will disable it
                        -- ["<esc>"] = false,
                },
        },

        icons = {
                VimIcon = "",
        },
        -- modify variables used by heirline but not defined in the setup call directly
        heirline = {
                -- define the separators between each section
                separators = {
                        left = { "", " " }, -- separator for the left side of the statusline
                        right = { " ", "" }, -- separator for the right side of the statusline,
                        left_arrow = { "", "" },
                },
                -- add new colors that can be used by heirline
                colors = {
                        blank_bg = "#5c6370",
                        file_info_bg = "#3e4452",
                        nav_icon_bg = "#89b06d",
                        folder_icon_bg = "#ec5f67",
                        emoji_bg = "#4c7475",
                        a = "#FAE8E0",
                        b = "#E4B7A0",
                        c = "#C38370",
                        d = "#A45C40",
                },
        },

        -- Configure plugins
        plugins = {
                init = {
                        -- lsp_lines (more in-depth diagnostics)
                        ["https://git.sr.ht/~whynothugo/lsp_lines.nvim"] = {
                                after = "mason-lspconfig.nvim",
                                module = "lsp_lines",
                                config = function() require("lsp_lines").setup() end,
                        },

                        -- noice (cmd bar, notify, etc.)
                        ["folke/noice.nvim"] = {
                                after = "nui.nvim",
                                event = "VimEnter",
                                config = function()
                                        require("noice").setup {
                                                notify = {
                                                        -- Noice can be used as `vim.notify` so you can route any notification like other messages
                                                        -- Notification messages have their level and other properties set.
                                                        -- event is always "notify" and kind can be any log level as a string
                                                        -- The default routes will forward notifications to nvim-notify
                                                        -- Benefit of using Noice for this is the routing and consistent history view
                                                        enabled = false,
                                                },
                                        }
                                end,
                        },

                        -- Leap
                        ["ggandor/leap.nvim"] = {
                                config = function()
                                        local leap = require "leap"
                                        leap.setup {
                                                highlight_unlabeled_phase_one_targets = false,
                                        }
                                        leap.add_default_mappings()
                                end,
                        },

                        -- CodeWindow.nvim
                        ["gorbit99/codewindow.nvim"] = {
                                config = function()
                                        local codewindow = require "codewindow"
                                        codewindow.setup()
                                        codewindow.apply_default_keybinds()
                                end,
                        },

                        -- Huff Language support
                        ["wuwe1/vim-huff"] = {},

                        -- Lua copilot
                        -- ["zbirenbaum/copilot.lua"] = {
                        --         after = { "heirline" },
                        --         event = "InsertEnter",
                        --         config = function()
                        --                 vim.defer_fn(function() require("copilot").setup({
                        --                                 panel = {
                        --                                         enabled = true,
                        --                                         auto_refresh = true,
                        --                                         ---@type table<'accept'|'next'|'prev'|'dismiss', false|string>
                        --                                         keymap = {
                        --                                                 jump_prev = "[[",
                        --                                                 jump_next = "]]",
                        --                                                 accept = "<CR>",
                        --                                                 refresh = "gr",
                        --                                                 open = "<M-CR>",
                        --                                         },
                        --                                 },
                        --                                 suggestion = {
                        --                                         enabled = true,
                        --                                         auto_trigger = true,
                        --                                         debounce = 50,
                        --                                         keymap = {
                        --                                                 accept = "<M-l>",
                        --                                                 next = "<M-]>",
                        --                                                 prev = "<M-[>",
                        --                                                 dismiss = "<C-]>",
                        --                                         },
                        --                                 },
                        --                         })
                        --                 end, 100)
                        --         end,
                        -- },

                        -- Copilot CMP
                        -- ["zbirenbaum/copilot-cmp"] = {
                        --         after = { "copilot.lua", "nvim-cmp" },
                        --         config = function()
                        --                 require("copilot_cmp").setup {
                        --                         formatters = {
                        --                                 label = require("copilot_cmp.format").format_label_text,
                        --                                 insert_text = require("copilot_cmp.format").format_insert_text,
                        --                                 preview = require("copilot_cmp.format").deindent,
                        --                         },
                        --                         plugin_manager_path = "/home/ben/.local/share/nvim/site/pack/packer",
                        --                 }
                        --         end,
                        -- },

                        --
                        -- Themes
                        --

                        -- Tokyo Night
                        -- ["folke/tokyonight.nvim"] = {},

                        -- Nightfox
                        -- ["EdenEast/nightfox.nvim"] = {},

                        -- Catppuccin
                        ["catppuccin/nvim"] = {
                                opt = false,
                                as = "catppuccin",
                                config = function()
                                        -- latte, frappe, macchiato, mocha
                                        vim.g.catppuccin_flavour = "mocha"
                                        -- local colors = require("catppuccin.palettes").get_palette()
                                        require("catppuccin").setup {
                                                transparent_background = true,
                                                term_colors = true,
                                                styles = {
                                                        comments = { "italic" },
                                                        functions = { "italic", "bold" },
                                                        keywords = { "italic" },
                                                },
                                        }
                                end,
                        },
                },
                -- All other entries override the require("<key>").setup({...}) call for default plugins
                ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
                        -- config variable is the default configuration table for the setup functino call
                        -- local null_ls = require "null-ls"

                        -- Check supported formatters and linters
                        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
                        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
                        config.sources = {
                                -- Set a formatter
                                -- null_ls.builtins.formatting.stylua,
                                -- null_ls.builtins.formatting.prettier,
                        }
                        return config -- return final config table
                end,
                treesitter = { -- overrides `require("treesitter").setup(...)`
                        -- ensure_installed = { "lua" },
                },
                -- use mason-lspconfig to configure LSP installations
                ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
                        -- ensure_installed = { "sumneko_lua" },
                },
                -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
                ["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
                        -- ensure_installed = { "prettier", "stylua" },
                },
                -- override the heirline setup call
                heirline = function(config)
                        -- the first element of the configuration table is the statusline
                        config[1] = {
                                -- default highlight for the entire statusline
                                hl = { fg = "fg", bg = "bg" },
                                -- each element following is a component in astronvim.status module

                                -- add the vim mode component
                                astronvim.status.component.mode {
                                        -- enable mode text with padding as well as an icon before it
                                        mode_text = { icon = { kind = "VimIcon", padding = { right = 1, left = 1 } } },
                                        -- define the highlight color for the text
                                        hl = { fg = "bg" },
                                        -- add padding
                                        padding = { right = 1 },
                                        -- surround the component with a separators
                                        surround = {
                                                -- it's a left element, so use the left separator
                                                separator = "left",
                                                -- set the color of the surrounding based on the current mode using astronvim.status module
                                                color = function()
                                                        return {
                                                                main = astronvim.status.hl.mode_bg(),
                                                                right = "file_info_bg",
                                                        }
                                                end,
                                        },
                                },
                                -- add a section for the currently opened file information
                                astronvim.status.component.file_info {
                                        -- enable the file_icon and enable the highlighting based on filetype
                                        file_icon = { highlight = true, padding = { left = 0 } },
                                        -- add padding
                                        padding = { right = 1 },
                                        -- define the section separator
                                        surround = { separator = "left", condition = false },
                                },
                                -- add a component for the current git branch if it exists and use no separator for the sections
                                astronvim.status.component.git_branch { surround = { separator = "none" } },
                                -- add a component for the current git diff if it exists and use no separator for the sections
                                astronvim.status.component.git_diff {
                                        padding = { left = 1 },
                                        surround = { separator = "none" },
                                },
                                -- fill the rest of the statusline
                                -- the elements after this will appear in the middle of the statusline
                                astronvim.status.component.fill(),
                                -- fill the rest of the statusline
                                -- the elements after this will appear on the right of the statusline
                                astronvim.status.component.fill(),
                                -- add a component for the current diagnostics if it exists and use the right separator for the section
                                astronvim.status.component.diagnostics { surround = { separator = "right" } },
                                -- add a component to display LSP clients, show LSP progress, and use the right separator
                                astronvim.status.component.lsp {
                                        lsp_progress = true,
                                        surround = { separator = "right", color = "file_info_bg" },
                                        color = "file_info_bg",
                                },
                                -- NvChad has some nice icons to go along with information, so we can create a parent component to do this
                                -- all of the children of this table will be treated together as a single component
                                {
                                        -- define a simple component where the provider is just a folder icon
                                        astronvim.status.component.builder {
                                                -- astronvim.get_icon gets the user interface icon for a closed folder with a space after it
                                                { provider = astronvim.get_icon "FolderClosed" },
                                                -- add padding after icon
                                                -- set the foreground color to be used for the icon
                                                -- use the right separator and define the background color
                                                surround = {
                                                        separator = "right",
                                                        color = { main = "blank_bg", left = "file_info_bg" },
                                                },
                                        },
                                        -- add a file information component and only show the current working directory name
                                        astronvim.status.component.file_info {
                                                -- we only want filename to be used and we can change the fname
                                                -- function to get the current working directory name
                                                filename = {
                                                        fname = function() return vim.fn.getcwd() end,
                                                        padding = { left = 1 },
                                                },
                                                -- disable all other elements of the file_info component
                                                file_icon = false,
                                                file_modified = false,
                                                file_read_only = false,
                                                -- use no separator for this part but define a background color
                                                surround = { separator = "none", color = "blank_bg" },
                                        },
                                },
                                -- the final component of the NvChad statusline is the navigation section
                                -- this is very similar to the previous current working directory section with the icon
                                { -- make nav section with icon border
                                        -- define a custom component with just a file icon
                                        astronvim.status.component.builder {
                                                { provider = astronvim.get_icon "DefaultFile" },
                                                -- set the icon foreground
                                                hl = { fg = "bg" },
                                                -- use the right separator and define the background color
                                                -- as well as the color to the left of the separator
                                                surround = {
                                                        separator = "right",
                                                        color = function()
                                                                return {
                                                                        main = astronvim.status.hl.mode_bg(),
                                                                        left = "blank_bg",
                                                                }
                                                        end,
                                                },
                                        },
                                        -- add a navigation component and just display the percentage of progress in the file
                                        astronvim.status.component.nav {
                                                -- add some padding for the percentage provider
                                                percentage = false,
                                                -- disable all other providers
                                                ruler = {
                                                        padding = { left = 1, right = 1 },
                                                        hl = function()
                                                                return {
                                                                        fg = "bg",
                                                                        bg = astronvim.status.hl.mode_bg(),
                                                                }
                                                        end,
                                                },
                                                update = { "ModeChanged" },
                                                scrollbar = false,
                                                -- use no separator and define the background color
                                                surround = {
                                                        separator = "none",
                                                        color = { right = "file_info_bg" },
                                                },
                                        },
                                },
                                -- ✨ Right side decorator 🌈
                                {
                                        astronvim.status.component.builder {
                                                { provider = "" },
                                                -- use the right separator and define the background color
                                                -- as well as the color to the left of the separator
                                                surround = {
                                                        separator = "left_arrow",
                                                        color = function()
                                                                return {
                                                                        left = astronvim.status.hl.mode_bg(),
                                                                        main = "d",
                                                                }
                                                        end,
                                                },
                                        },
                                        astronvim.status.component.builder {
                                                { provider = "" },
                                                -- use the right separator and define the background color
                                                -- as well as the color to the left of the separator
                                                surround = { separator = "left_arrow", color = { main = "c", left = "d" } },
                                        },
                                        astronvim.status.component.builder {
                                                { provider = "" },
                                                -- use the right separator and define the background color
                                                -- as well as the color to the left of the separator
                                                surround = { separator = "left_arrow", color = { main = "b", left = "c" } },
                                        },
                                        astronvim.status.component.builder {
                                                { provider = "🍊🌴🍍" }, -- 🍊🌴🍍
                                                hl = { fg = "#1b1b1b" },
                                                -- add padding to the right to center the emojis
                                                padding = { left = 1, right = 1 },
                                                -- use the right separator and define the background color
                                                -- as well as the color to the left of the separator
                                                surround = { separator = "left_arrow", color = { main = "a", left = "b" } },
                                        },
                                },
                        }

                        -- a second element in the heirline setup would override the winbar
                        -- by only providing a single element we will only override the statusline
                        -- and use the default winbar in AstroNvim

                        -- return the final confiuration table
                        return config
                end,
        },

        -- LuaSnip Options
        luasnip = {
                -- Add paths for including more VS Code style snippets in luasnip
                vscode_snippet_paths = {},
                -- Extend filetypes
                filetype_extend = {
                        -- javascript = { "javascriptreact" },
                },
        },

        -- CMP Source Priorities
        -- modify here the priorities of default cmp sources
        -- higher value == higher priority
        -- The value can also be set to a boolean for disabling default sources:
        -- false == disabled
        -- true == 1000
        cmp = {
                source_priority = {
                        nvim_lsp = 1000,
                        luasnip = 750,
                        buffer = 500,
                        path = 250,
                        -- copilot = 500,
                },
        },

        -- Modify which-key registration (Use this with mappings table in the above.)
        ["which-key"] = {
                -- Add bindings which show up as group name
                register = {
                        -- first key is the mode, n == normal mode
                        n = {
                                -- second key is the prefix, <leader> prefixes
                                -- ["<leader>"] = {
                                --   -- third key is the key to bring up next level and its displayed
                                --   -- group name in which-key top level menu
                                --   ["b"] = { name = "Buffer" },
                                -- },
                        },
                },
        },
        -- This function is run last and is a good place to configuring
        -- augroups/autocommands and custom filetypes also this just pure lua so
        -- anything that doesn't fit in the normal config locations above can go here
        polish = function()
                -- Set up custom filetypes
                -- vim.filetype.add {
                --   extension = {
                --     foo = "fooscript",
                --   },
                --   filename = {
                --     ["Foofile"] = "fooscript",
                --   },
                --   pattern = {
                --     ["~/%.config/foo/.*"] = "fooscript",
                --   },
                -- }

                -- Toggle LSP Lines
                vim.keymap.set("", "<Leader>1", function()
                        require("lsp_lines").toggle()
                        local virtual_lines_enabled = vim.diagnostic.config().virtual_lines
                        vim.diagnostic.config { virtual_text = not virtual_lines_enabled }
                end, { desc = "Toggle lsp_lines" })

                -- Grep in file
                vim.keymap.set(
                        "",
                        "<Leader>fv",
                        function() require("telescope.builtin").live_grep { search_dirs = { vim.fn.expand "%:p" } } end,
                        { desc = "Search words in file" }
                )

                -- Telescope tabs
                vim.keymap.set(
                        "",
                        "<Leader>ft",
                        function() require("telescope-tabs").list_tabs() end,
                        { desc = "Search open tabs" }
                )

                require("notify").setup({
                        background_colour = "#000000",
                })

                -- Remap Ctrl+D / Ctrl+U
                vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
                vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })

                -- Unmap Shift+} and Shift+{
                vim.api.nvim_set_keymap("n", "<S-}>", "<Nop>", { noremap = true, silent = true })
                vim.api.nvim_set_keymap("n", "<S-{>", "<Nop>", { noremap = true, silent = true })

                -- Copilot
                vim.keymap.set("i", "<M-tab>", function()
                        require("copilot.suggestion").accept()
                end, {
                        desc = "[copilot] accept suggestion",
                        silent = true,
                })
                -- vim.keymap.set("i", "<C-[>", function()
                --         require("copilot.suggestion").prev()
                -- end, {
                --         desc = "[copilot] prev suggestion",
                --         silent = true,
                -- })
                -- vim.keymap.set("i", "<C-]>", function()
                --         require("copilot.suggestion").next()
                -- end, {
                --         desc = "[copilot] next suggestion",
                --         silent = true,
                -- })
                -- vim.keymap.set("i", "<C-x>", function()
                --         require("copilot.suggestion").dismiss()
                -- end, {
                --         desc = "[copilot] dismiss suggestion",
                --         silent = true,
                -- })

                -- vim.cmd [[ hi Normal guibg=NONE ctermbg=NONE ]]
                -- vim.cmd [[ hi NormalNC guibg=NONE ctermbg=NONE ]]
                -- vim.cmd [[ hi NonText guibg=NONE ctermbg=NONE ]]
        end,
}

-- Return the configuration table

return config
