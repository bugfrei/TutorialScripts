using my.bookshop as my from '../db/schema';

service CatalogService @(requires: 'user') {
    @readonly entity Books as projection on my.Books;
}

service AdminService @(requires: 'admin') {
    @odata.draft.enabled
    entity Books as projection on my.Books;
}
