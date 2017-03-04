# README

## Ruby Version

* ruby-2.3.3

## Install
Caso seu postgresql local tenha um usuario e senha diferente de postgres, favor alterar o arquivo:
- config/database.yml

```
mkdir os-project
cd os-project/
git clone git@github.com:silviofernandesrd/os-project-backend.git
cd os-project-backend/
bundle install
bundle exec rake db:create
bundle exec rake db:migrate
``` 

## Execute server

```
rails s
```

## Testing API

Baixe um plugin do Chrome para simular as requisições rest

[Advanced REST client](https://chrome.google.com/webstore/detail/advanced-rest-client/hgmloofddffdnphfgcellkdfbfbjeloo/related)

Abra o plugin e utilize os seguintes parametros para criar:
- cliente Jose Campos
- serviço TV 42 polegadas
- valor R$100

URL
```
http://localhost:3000/service_orders
```

Method
* POST

Raw Payload
```
[service_order][client_attributes][name]=Jose Campos
&[service_order][service_attributes][name]=TV 42 polegadas
&[service_order][service_attributes][value]=100
```
