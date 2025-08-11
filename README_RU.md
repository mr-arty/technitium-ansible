## Ansible роль для установки DNS сервера Technitium

### Предварительные требования:

* Ansible должен быть установлен
* Коллекция `community.general` должна быть установлена
* `ansible-galaxy collection install community.general`

В корневой директории находится файл inventory `hosts`. Здесь файл hosts в качестве примера. Нужно подставить реальные значения для IP адреса и SSH ключа. Файл ёinstall-technitium.ymlё в корневой директории содержит playbook для запуска этой роли. Вам нужно отредактировать его и указать пользователя для подключения, если это не `root`.Файл ansible.cfg содержит переменные, установленные по умолчанию. Папка roles/prepare/files должна содержать файл `authorized_keys`, в котором находятся SSH-ключи для копирования на target машину. Вы можете отредактировать его, чтобы добавить любые SSH-ключи, которые нужно скопировать на сервер. Для этого необходимо установить configure_ssh: "true" в файле roles/prepare/defaults/main.yml. Эта настройка также отключает авторизацию по паролю, поэтому будтье осторожны и указывайте настоящий ключ SSH, чтобы не потерять доступ к серверу.

--

Использование:
`ansible-playbook install-technitium.yml` запускает роли **prepare** и **install-technitium** без тасков для certbot.

`ansible-playbook install-technitium.yml --tags prepare,technitium,certbot,acme-companion` запускает роль **install-technitium** с тасками для настройки сертификатов с использованием acme-companion. Для этого в файле defaults/main.yml нужно указать значение переменной dns_hostname: "sub.hostname.com", а также раскомментировать соответствующий блок в `files/docker-compose.certbot.yaml` Например, workload2 или workload3.

--

Затем нужно авторизоваться на сервере technitium и сменить пароль администратора. После этого нужно получить API ключ для последующих действий.

#### Если создаете API ключ вручную через UI Technitium, создайте ключ и укажите его в переменной api_token: "<API_KEY>", поставьте get_api_token: "false".

Запустите плейбук следующим образом:
`ansible-playbook install-technitium.yml --tags api,close-admin-port`


#### Если автоматически, поставьте get_api_token: "false".

Запустите плейбук следующим образом:
`ansible-playbook install-technitium.yml --tags api,close-admin-port -e "admin_password=realPassword"`  <-- Здесь будет новый пароль, который вы установили

Роль **install-technitium**, запущенная с тегами **api,close-admin-port** выполнит следующие действия через API:
- Включит DoH (DNS over HTTPS)
- Включит админку через HTTPS
- Закроет порт админки - обычный HTTP(5380)
