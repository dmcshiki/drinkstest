A pasta mapper serve para convertemos o tipo de data para o tipo ideal que necessitamos.
No caso, os tipos são:
* Cache to domain - Envia os arquivos armazenados no cache do dispositivo para o aplicativo.
* Remote to cache - Envia os arquivos requisitados da web para o cache do dispositivo.
* Remote to domain - Envia os arquivos requisitados da web para o aplicativo.
* Não necessitamos de uma camada Domain to porque ela é a camada final que queremos acessar.