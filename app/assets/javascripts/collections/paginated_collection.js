// includes bindings for fetching/fetched

PaginatedCollection = Backbone.Collection.extend({
    initialize: function() {
        _.bindAll(this, 'parse', 'url', 'pageInfo', 'nextPage',
            'previousPage', 'filterByLetter', 'filterByQuery');
        typeof(options) != 'undefined' || (options = {});
        this.page = 1;
        typeof(this.perPage) != 'undefined' || (this.perPage = 10);
    },
    fetch: function(options) {
        typeof(options) != 'undefined' || (options = {});
        typeof(options.data) != 'undefined' || (options.data = {});
        options.data.page= this.page;
        options.data.letter= this.letter;
        options.data.q= this.q;
    
        this.trigger("fetching");
        var self = this;
        var success = options.success;
        options.success = function(resp) {
            self.trigger("fetched");
            if(success) {
                success(self, resp);
            }
        };
        return Backbone.Collection.prototype.fetch.call(this, options);
    },
    parse: function(resp) {
        this.page = parseInt(resp.page);
        this.perPage = parseInt(resp.perPage);
        this.total = parseInt(resp.total);
        return resp.models;
    },
    url: function() {
        return this.baseUrl + '?' + $.param({
            page: this.page, 
            letter: this.letter, 
            q: this.q
        });
    },
    pageInfo: function() {
        var info = {
            total: this.total,
            page: this.page,
            perPage: this.perPage,
            pages: Math.ceil(this.total / this.perPage),
            prev: false,
            next: false
        };

        var max = Math.min(this.total, this.page * this.perPage);

        if (this.total == this.pages * this.perPage) {
            max = this.total;
        }

        info.range = [(this.page - 1) * this.perPage + 1, max];

        if (this.page > 1) {
            info.prev = this.page - 1;
        }

        if (this.page < info.pages) {
            info.next = this.page + 1;
        }

        return info;
    },
    filterByLetter: function(letter){
        if (letter != 'undefined' && letter != "") {
            this.filterByQuery("")
        }
        this.letter= letter;
        return this;
    },
    filterByQuery: function(q){
        if (q != 'undefined' && q != "") {
            this.filterByLetter("")
        }
        this.q= q;
        return this;
    },
    nextPage: function() {
        if (!this.pageInfo().next) {
            return false;
        }
        this.page = this.page + 1;
        return this.fetch();
    },
    previousPage: function() {
        if (!this.pageInfo().prev) {
            return false;
        }
        this.page = this.page - 1;
        return this.fetch();
    }

});