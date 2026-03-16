Set-Content -Path db/schema.cds -Value 'namespace my.bookshop;

entity Books {
  key ID : Integer;
  title  : String;
  stock  : Integer;
}' -Force

md db/data -Force >$null
Set-Content -Path db/data/my.bookshop-Books.csv -Value 'ID,title,stock
1,Wuthering Heights,100
2,Jane Eyre,500' -Force

Set-Content -Path srv/cat-service.cds -Value "using my.bookshop as my from '../db/schema';

service CatalogService {
    @readonly entity Books as projection on my.Books;
}" -Force
