def factory_new_user():

    return {
        'name': 'Clint Barton',
        'email': 'barton@shield.com',
        'password': 'Teste@123'
    }


def factory_get_user():

    return {
        'name': 'Gwen Stacy',
        'email': 'stacy@ozcorp.com',
        'password': 'Teste@123'
    }


def factory_remove_user():

    return {
        'name': 'Thaddeus Ross',
        'email': 'ross@gmail.com',
        'password': 'Teste@123'
    }


def factory_update_user():
    
    email = 'papito@gmail.com'

    return  {
        'before': {
            'name': 'Papito Fernando',
            'email': email,
            'password': 'Teste@123'

        },
        'after': {
            'name': 'Fernando Papito',
            'email': email,
            'whatsapp': '11996696891',
            'avatar': 'https://avatars.githubusercontent.com/u/11590362'
        }
    }        


def factory_user_session(target):

    name = 'Kate Bishop'
    email = 'kate@hotmail.com'
    password = 'Teste@123'

    data = {
        'signup': {
            'name' : name,
            'email': email,
            'password': password
        },
        'login': {
            'email': email,
            'password': password
        }        
    }

    return data [target]


def factory_be_geek():

    return {
        'name': 'João Lucas',
        'email': 'joao@gmail.com',
        'password': 'Teste@123',
        'geek_profile': {
            'whatsapp': '11999999999',
            'desc': 'Seu computador está lento? Reiniciando do nada? Talvez seja um vírus, ou algum hardware com defeito. Posso fazer a manutenção no seu PC, formando, reinstalando o SO, trocando algum componente físico e porque não remover o baidu ou qualquer outro malware.',
            'printer_repair': 'Sim',
            'work': 'Presencial',
            'cost': '150.99'
        }
    }

def factory_search_for_geeks():

    return {
        'user': {
            'name': 'Peter Quill',
            'email': 'quill@marvel.com',
            'password': 'Teste@123'
        },
        'geeks':[
            {
                'name': 'Riri Willians',
                'email': 'riri@marvel.com',
                'password': 'pwd123',
                'geek_profile': {
                    'whatsapp': '11999999999',
                    'desc': 'Seu computador está lento? Reiniciando do nada? Talvez seja um vírus, ou algum hardware com defeito. Posso fazer a manutenção no seu PC, formando, reinstalando o SO, trocando algum componente físico e porque não remover o baidu ou qualquer outro malware.',
                    'printer_repair': 'Não',
                    'work': 'Presencial',
                    'cost': '100'
                }
            },
            {
                'name': 'Arnim Zola',
                'email': 'zola@hidra.com',
                'password': 'pwd123',
                'geek_profile': {
                    'whatsapp': '21999999999',
                    'desc': 'Instalo Distros Ubuntu, Debian, ElementaryOS, PopOS, Linux Mint, Kurumin, Mandrake, Connectiva, Fedora, RedHat, CentOS, Slackware, Gentoo, Archlinux, Kubuntu, Xubuntu, Suze, Mandriva, Edubuntu, KateOS, Sabayon Linux, Manjaro Linux, BigLinux, ZorinOS, Unit',
                    'printer_repair': 'Não',
                    'work': 'Ambos',
                    'cost': '110'
                }
            },
            {
                'name': 'Reed Richards',
                'email': 'reed@fantastic4.com',
                'password': 'pwd123',
                'geek_profile': {
                    'whatsapp': '31999999999',
                    'desc': 'Instalado e faço manutenção em qualquer tipo de impressora, matricial padrão, matricial fiscal, a jato, a cera, a laser e até 3D. Também faço remold de fitas coloridas para Epson LX300. ',
                    'printer_repair': 'Sim',
                    'work': 'Remoto',
                    'cost': '120'
                }
            }
        ]
     }