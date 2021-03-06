﻿namespace TokenShop.Common
{
    public class LanguageManagment
    {
        public static string lang = "fa";
        public static string Translate(string key)
        {
            if (lang == "fa")
            {
                switch (key)
                {
                    case "row_per_page":
                        return TokenShop.fa.row_per_page;
                    case "all":
                        return TokenShop.fa.all;
                    case "refresh":
                        return TokenShop.fa.refresh;
                    case "search":
                        return TokenShop.fa.search;
                    case "no_found":
                        return TokenShop.fa.no_found;
                    case "copyright":
                        return TokenShop.fa.copyright;
                    case "remember_me":
                        return TokenShop.fa.remember_me;
                    case "repassword":
                        return TokenShop.fa.repassword;
                    case "news":
                        return TokenShop.fa.news;
                    case "contact_us":
                        return TokenShop.fa.contact_us;
                    case "sign_in":
                        return TokenShop.fa.sign_in;
                    case "sign_up":
                        return TokenShop.fa.sign_up;
                    case "welcome":
                        return TokenShop.fa.welcome;
                    case "return_price":
                        return TokenShop.fa.return_price;
                    case "menu":
                        return TokenShop.fa.menu;
                    case "request_date":
                        return TokenShop.fa.request_date;
                    case "deposit_date":
                        return TokenShop.fa.deposit_date;
                    case "new_request":
                        return TokenShop.fa.new_request;
                    case "profile_me":
                        return TokenShop.fa.profile_me;
                    case "signout":
                        return TokenShop.fa.signout;
                    case "error":
                        return TokenShop.fa.error;
                    case "warning":
                        return TokenShop.fa.warning;
                    case "attention":
                        return TokenShop.fa.attention;
                    case "success":
                        return TokenShop.fa.success;
                    case "about_us":
                        return TokenShop.fa.about_us;
                    case "home":
                        return TokenShop.fa.home;
                    case "faq":
                        return TokenShop.fa.faq;
                    case "dashboard":
                        return TokenShop.fa.dashboard;
                    case "token_buy":
                        return TokenShop.fa.token_buy;                        
                    case "token_transfer":
                        return TokenShop.fa.token_transfer;
                    case "token_transfer_success":
                        return TokenShop.fa.token_transfer_success;
                    case "token_transfer_reciption_name":
                        return TokenShop.fa.token_transfer_reciption_name;
                    case "increase":
                        return TokenShop.fa.increase;
                    case "token_transfer_reciption_id":
                        return TokenShop.fa.token_transfer_reciption_id;
                    case "transfer":
                        return TokenShop.fa.transfer;
                    case "decrease":
                        return TokenShop.fa.decrease;
                    case "type":
                        return TokenShop.fa.type;
                    case "token_transactions":
                        return TokenShop.fa.token_transactions;
                    case "token_buy_request":
                        return TokenShop.fa.token_buy_request;
                    case "token_buy_request_success":
                        return TokenShop.fa.token_buy_request_success;
                    case "please_fill_field":
                        return TokenShop.fa.please_fill_field;
                    case "next_step":
                        return TokenShop.fa.next_step;
                    case "send":
                        return TokenShop.fa.send;
                    case "release_empty":
                        return TokenShop.fa.release_empty;
                    case "pick_price":
                        return TokenShop.fa.pick_price;
                    case "content":
                        return TokenShop.fa.content;
                    case "periority":
                        return TokenShop.fa.periority;
                    case "urgent":
                        return TokenShop.fa.urgent;
                    case "subject":
                        return TokenShop.fa.subject;
                    case "ticket_send":
                        return TokenShop.fa.ticket_send;
                    case "open_tickets":
                        return TokenShop.fa.open_tickets;
                    case "balance":
                        return TokenShop.fa.balance;
                    case "send_replay":
                        return TokenShop.fa.send_replay;
                    case "address":
                        return TokenShop.fa.address;
                    case "email":
                        return TokenShop.fa.email;
                    case "website":
                        return TokenShop.fa.website;
                    case "phone":
                        return TokenShop.fa.phone;
                    case "mobile":
                        return TokenShop.fa.mobile;
                    case "city":
                        return TokenShop.fa.city;
                    case "national_code":
                        return TokenShop.fa.national_code;
                    case "password":
                        return TokenShop.fa.password;
                    case "username":
                        return TokenShop.fa.username;
                    case "first_name":
                        return TokenShop.fa.first_name;
                    case "last_name":
                        return TokenShop.fa.last_name;
                    case "profile":
                        return TokenShop.fa.profile;
                    case "tickets":
                        return TokenShop.fa.tickets;
                    case "account_number":
                        return TokenShop.fa.account_number;
                    case "cart_number":
                        return TokenShop.fa.cart_number;
                    case "sheba":
                        return TokenShop.fa.sheba;
                    case "edit":
                        return TokenShop.fa.edit;
                    case "new_record":
                        return TokenShop.fa.new_record;
                    case "bank_accounts":
                        return TokenShop.fa.bank_accounts;
                    case "draft":
                        return TokenShop.fa.draft;
                    case "valid":
                        return TokenShop.fa.valid;
                    case "invalid":
                        return TokenShop.fa.invalid;
                    case "token_count":
                        return TokenShop.fa.token_count;
                    case "attachment":
                        return TokenShop.fa.attachment;
                    case "save":
                        return TokenShop.fa.save;
                    case "view":
                        return TokenShop.fa.view;
                    case "id":
                        return TokenShop.fa.id;
                    case "resean":
                        return TokenShop.fa.resean;
                    case "bank":
                        return TokenShop.fa.bank;
                    case "number":
                        return TokenShop.fa.number;
                    case "date":
                        return TokenShop.fa.date;
                    case "amount":
                        return TokenShop.fa.amount;
                    case "description":
                        return TokenShop.fa.description;
                    case "status":
                        return TokenShop.fa.status;
                    case "bank_receiptions":
                        return TokenShop.fa.bank_receiptions;
                    case "":
                        return "";
                }
                return "";
            }
            if (lang == "en")
            {
                switch (key)
                {
                    case "row_per_page":
                        return TokenShop.en.row_per_page;
                    case "all":
                        return TokenShop.en.all;
                    case "refresh":
                        return TokenShop.en.refresh;
                    case "search":
                        return TokenShop.en.search;
                    case "no_found":
                        return TokenShop.en.no_found;
                    case "copyright":
                        return TokenShop.en.copyright;
                    case "remember_me":
                        return TokenShop.en.remember_me;
                    case "repassword":
                        return TokenShop.en.repassword;
                    case "news":
                        return TokenShop.en.news;
                    case "contact_us":
                        return TokenShop.en.contact_us;
                    case "sign_in":
                        return TokenShop.en.sign_in;
                    case "sign_up":
                        return TokenShop.en.sign_up;
                    case "welcome":
                        return TokenShop.en.welcome;
                    case "return_price":
                        return TokenShop.en.return_price;
                    case "menu":
                        return TokenShop.en.menu;
                    case "request_date":
                        return TokenShop.en.request_date;
                    case "deposit_date":
                        return TokenShop.en.deposit_date;
                    case "new_request":
                        return TokenShop.en.new_request;
                    case "profile_me":
                        return TokenShop.en.profile_me;
                    case "signout":
                        return TokenShop.en.signout;
                    case "error":
                        return TokenShop.en.error;
                    case "warning":
                        return TokenShop.en.warning;
                    case "attention":
                        return TokenShop.en.attention;
                    case "success":
                        return TokenShop.en.success;
                    case "about_us":
                        return TokenShop.en.about_us;
                    case "home":
                        return TokenShop.en.home;
                    case "faq":
                        return TokenShop.en.faq;
                    case "dashboard":
                        return TokenShop.en.dashboard;
                    case "token_buy":
                        return TokenShop.en.token_buy;
                    case "token_transfer":
                        return TokenShop.en.token_transfer;
                    case "token_transfer_success":
                        return TokenShop.en.token_transfer_success;
                    case "token_transfer_reciption_name":
                        return TokenShop.en.token_transfer_reciption_name;
                    case "increase":
                        return TokenShop.en.increase;
                    case "token_transfer_reciption_id":
                        return TokenShop.en.token_transfer_reciption_id;
                    case "transfer":
                        return TokenShop.en.transfer;
                    case "decrease":
                        return TokenShop.en.decrease;
                    case "type":
                        return TokenShop.en.type;
                    case "token_transactions":
                        return TokenShop.en.token_transactions;
                    case "token_buy_request":
                        return TokenShop.en.token_buy_request;
                    case "token_buy_request_success":
                        return TokenShop.en.token_buy_request_success;
                    case "please_fill_field":
                        return TokenShop.en.please_fill_field;
                    case "next_step":
                        return TokenShop.en.next_step;
                    case "send":
                        return TokenShop.en.send;
                    case "release_empty":
                        return TokenShop.en.release_empty;
                    case "pick_price":
                        return TokenShop.en.pick_price;
                    case "content":
                        return TokenShop.en.content;
                    case "periority":
                        return TokenShop.en.periority;
                    case "urgent":
                        return TokenShop.en.urgent;
                    case "subject":
                        return TokenShop.en.subject;
                    case "ticket_send":
                        return TokenShop.en.ticket_send;
                    case "open_tickets":
                        return TokenShop.en.open_tickets;
                    case "balance":
                        return TokenShop.en.balance;
                    case "send_replay":
                        return TokenShop.en.send_replay;
                    case "address":
                        return TokenShop.en.address;
                    case "email":
                        return TokenShop.en.email;
                    case "website":
                        return TokenShop.en.website;
                    case "phone":
                        return TokenShop.en.phone;
                    case "mobile":
                        return TokenShop.en.mobile;
                    case "city":
                        return TokenShop.en.city;
                    case "national_code":
                        return TokenShop.en.national_code;
                    case "password":
                        return TokenShop.en.password;
                    case "username":
                        return TokenShop.en.username;
                    case "first_name":
                        return TokenShop.en.first_name;
                    case "last_name":
                        return TokenShop.en.last_name;
                    case "profile":
                        return TokenShop.en.profile;
                    case "tickets":
                        return TokenShop.en.tickets;
                    case "account_number":
                        return TokenShop.en.account_number;
                    case "cart_number":
                        return TokenShop.en.cart_number;
                    case "sheba":
                        return TokenShop.en.sheba;
                    case "edit":
                        return TokenShop.en.edit;
                    case "new_record":
                        return TokenShop.en.new_record;
                    case "bank_accounts":
                        return TokenShop.en.bank_accounts;
                    case "draft":
                        return TokenShop.en.draft;
                    case "valid":
                        return TokenShop.en.valid;
                    case "invalid":
                        return TokenShop.en.invalid;
                    case "token_count":
                        return TokenShop.en.token_count;
                    case "attachment":
                        return TokenShop.en.attachment;
                    case "save":
                        return TokenShop.en.save;
                    case "view":
                        return TokenShop.en.view;
                    case "id":
                        return TokenShop.en.id;
                    case "resean":
                        return TokenShop.en.resean;
                    case "bank":
                        return TokenShop.en.bank;
                    case "number":
                        return TokenShop.en.number;
                    case "date":
                        return TokenShop.en.date;
                    case "amount":
                        return TokenShop.en.amount;
                    case "description":
                        return TokenShop.en.description;
                    case "status":
                        return TokenShop.en.status;
                    case "bank_receiptions":
                        return TokenShop.en.bank_receiptions;
                    case "":
                        return "";
                }
                return "";
            }
            return "";
        }
    }
}